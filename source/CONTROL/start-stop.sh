#!/bin/sh

. /usr/local/AppCentral/jackett/CONTROL/env.sh

PID=${PKG_CONF}/${PKG_PID}
CHUID="$DAEMON_USER"
DAEMON="${PKG_PATH}/bin/jackett-daemon"

start_daemon() {
	start-stop-daemon -S --background --quiet --chuid "${CHUID}" --user "${USER}" --pidfile "${PID}" --make-pidfile --exec "$DAEMON"
}

stop_daemon() {
	# Sen SIGKILL to the keep-alive daemon (force quit).
	start-stop-daemon -K --signal 9 --quiet --user "${USER}" --pidfile "${PID}"

	# Send SIGTERM to actual Jackett process, normally this is handled by the
	# keep-alive daemon, but we KILLed it, so it cannot perform it's regular
	# cleanup.
	pkill -f "${PROC_PATTERN}"
}

daemon_status() {
	start-stop-daemon -K --quiet --test --user "${USER}" --pidfile "${PID}"
	RETVAL=$?
	[ ${RETVAL} -eq 0 ] || return 1
}

wait_for_status() {
	counter=$2
	while [ "$counter" -gt 0 ]; do
		daemon_status
		[ $? -eq "$1" ] && return
		counter=$(( counter - 1 ))
		sleep 1
	done
	return 1
}

case $1 in
	start)
		if daemon_status; then
			echo "${NAME} is already running"
		else
			echo "Starting ${NAME}..."
			start_daemon
		fi
		;;

	stop)
		if daemon_status; then
			echo "Stopping ${NAME}..."
			stop_daemon
		else
			echo "${NAME} is not running"
		fi
		;;
	restart)
		if daemon_status; then
			echo "Stopping ${NAME}..."
			stop_daemon
		fi
		echo "Starting ${NAME}..."
		start_daemon
		;;
	status)
		if daemon_status; then
			echo "${NAME} is running"
			exit 0
		else
			echo "${NAME} is not running"
			exit 1
		fi
		;;
	*)
		echo "usage: $0 {start|stop|restart|status}"
		exit 1
		;;
esac

exit 0

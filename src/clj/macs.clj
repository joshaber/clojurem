(ns macs)

(defmacro selector
	[s]
	(list 'objc* (str "@selector(" s ")")))

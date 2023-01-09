Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBA7662C99
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:26:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvtf-0002e5-58; Mon, 09 Jan 2023 12:25:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+ef51117798de1fdb0eeb+7078+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pEvtR-0002Wp-Sd
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:25:06 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+ef51117798de1fdb0eeb+7078+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pEvtO-0000yT-MC
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:25:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6z7h9VIJGPN4Yh4BwQuyiTqy4L+DoCm+EYhFR3eM6Iw=; b=I3jdYbcO/vecshlkMNZs2e5Yqk
 dxKfXy72AZ7ogff8Dw21bRhQ0L9HujarNitqAP2JdMxZCpXF9BVHv3fBP5N4Z/EAR6DJzcZED0C4S
 e+9zLxTLsm6umZhpAbvWcyrp+ER8oB9XdheVkdXGQQ1Ouq2W56khKof0qI6o+/5K2hGnoQPIVYby0
 Iaipk99cTtG72eNmu978tCJHrtus5SkiyzVapACyzrA9LtMjQBJ/ABMLLmOWYLvmQ+wqDHZud+XLJ
 MTveAatKqC4ecMV11wSvvQShtvY3TcjXIckeqnHjDFygvilmxVd9EKKekdCOxPJARjDytNeYrfSwv
 2tpmpk0A==;
Received: from [2001:8b0:10b:5::bb3] (helo=u3832b3a9db3152.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pEvtM-002TR5-NY; Mon, 09 Jan 2023 17:25:00 +0000
Message-ID: <e368402653af0d81593d892ab03ad9ed8f9540de.camel@infradead.org>
Subject: Re: [RFC PATCH v5 39/52] i386/xen: add monitor commands to test
 event injection
From: David Woodhouse <dwmw2@infradead.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant
 <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>, Ankur Arora
 <ankur.a.arora@oracle.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Juan Quintela
 <quintela@redhat.com>, Claudio Fontana <cfontana@suse.de>, Julien Grall
 <julien@xen.org>
Date: Mon, 09 Jan 2023 17:24:47 +0000
In-Reply-To: <Y7cufupAAeGnaIDg@work-vm>
References: <20221230121235.1282915-1-dwmw2@infradead.org>
 <20221230121235.1282915-40-dwmw2@infradead.org> <Y7V1sdhAlhhSKp2F@work-vm>
 <10d798e3959dbeaacd67cc9cefa78b16ee524462.camel@infradead.org>
 <Y7cufupAAeGnaIDg@work-vm>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-20a3OXT4aOhZEUkaP10h"
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+ef51117798de1fdb0eeb+7078+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--=-20a3OXT4aOhZEUkaP10h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2023-01-05 at 20:09 +0000, Dr. David Alan Gilbert wrote:
>=20
> > OK... something like this?
>=20
> No; that's a bit of a mix:
> The idea is that you either:
> =C2=A0 a) Build the QMP with the data structure well defined like you've =
done
> =C2=A0=C2=A0=C2=A0=C2=A0 and then make the HMP code monitor_printf that.
>=20
> =C2=A0 b) Or you decide the data is mostly for debug and you can change i=
t
> when you like, and so the structure is unimportant; then you make the
> =C2=A0 QMP side generate the HumanReadableText and just get the HMP side
> =C2=A0 to print it.
>=20
> An example of 'b' is qmp_x_query_ramblock' - note there's no actual HMP
> code there and the qmp_x_query_ramblock is doing the HRT creation.
>=20
> An example of 'a' is 'hmp_info_mice' which calls qmp_query_mice
> and then prints it out.

Thanks. Taking option 'a' then...

=46rom bfe1273b17ea76c4f4087bd79f2b52ab6556ea80 Mon Sep 17 00:00:00 2001
From: Joao Martins <joao.m.martins@oracle.com>
Date: Tue, 21 Aug 2018 12:16:19 -0400
Subject: [PATCH 38/64] i386/xen: add monitor commands to test event
injection

Specifically add listing, injection of event channels.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hmp-commands.hx          |  29 +++++++++
 hw/i386/kvm/meson.build  |   4 ++
 hw/i386/kvm/xen-stubs.c  |  25 +++++++
 hw/i386/kvm/xen_evtchn.c | 136 +++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h |   3 +
 monitor/misc.c           |   4 ++
 qapi/misc.json           | 109 +++++++++++++++++++++++++++++++
 7 files changed, 310 insertions(+)
 create mode 100644 hw/i386/kvm/xen-stubs.c

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 673e39a697..fd77c432c0 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1815,3 +1815,32 @@ SRST
   Dump the FDT in dtb format to *filename*.
 ERST
 #endif
+
+#if defined(CONFIG_XEN_EMU)
+    {
+        .name       =3D "xen-event-inject",
+        .args_type  =3D "port:i",
+        .params     =3D "port",
+        .help       =3D "inject event channel",
+        .cmd        =3D hmp_xen_event_inject,
+    },
+
+SRST
+``xen-event-inject`` *port*
+  Notify guest via event channel on port *port*.
+ERST
+
+
+    {
+        .name       =3D "xen-event-list",
+        .args_type  =3D "",
+        .params     =3D "",
+        .help       =3D "list event channel state",
+        .cmd        =3D hmp_xen_event_list,
+    },
+
+SRST
+``xen-event-list``
+  List event channels in the guest
+ERST
+#endif
diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
index cab64df339..577eb50a18 100644
--- a/hw/i386/kvm/meson.build
+++ b/hw/i386/kvm/meson.build
@@ -10,3 +10,7 @@ i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files(
   ))
=20
 i386_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
+
+specific_ss.add(when: 'CONFIG_XEN_EMU', if_false: files(
+  'xen-stubs.c',
+))
diff --git a/hw/i386/kvm/xen-stubs.c b/hw/i386/kvm/xen-stubs.c
new file mode 100644
index 0000000000..523cb5a831
--- /dev/null
+++ b/hw/i386/kvm/xen-stubs.c
@@ -0,0 +1,25 @@
+/*
+ * QEMU Xen emulation: QMP stubs
+ *
+ * Copyright =C2=A9 2023 Amazon.com, Inc. or its affiliates. All Rights Re=
served.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-misc.h"
+
+EvtchnInfoList *qmp_xen_event_list(Error **errp)
+{
+    error_setg(errp, "Xen event channel emulation not enabled\n");
+    return NULL;
+}
+
+void qmp_xen_event_inject(uint32_t port, Error **errp)
+{
+    error_setg(errp, "Xen event channel emulation not enabled\n");
+}
diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 6b6df39978..d63ebe46df 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -14,7 +14,11 @@
 #include "qemu/module.h"
 #include "qemu/main-loop.h"
 #include "qemu/log.h"
+#include "monitor/monitor.h"
+#include "monitor/hmp.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-misc.h"
+#include "qapi/qmp/qdict.h"
 #include "qom/object.h"
 #include "exec/target_page.h"
 #include "exec/address-spaces.h"
@@ -1059,3 +1063,135 @@ int xen_evtchn_send_op(struct evtchn_send *send)
     return ret;
 }
=20
+static const char *type_names[] =3D {
+    "closed",
+    "unbound",
+    "interdomain",
+    "pirq",
+    "virq",
+    "ipi"
+};
+
+EvtchnInfoList *qmp_xen_event_list(Error **errp)
+{
+    XenEvtchnState *s =3D xen_evtchn_singleton;
+    EvtchnInfoList *head =3D NULL, **tail =3D &head;
+    void *shinfo, *pending, *mask;
+    int i;
+
+    if (!s) {
+        error_setg(errp, "Xen event channel emulation not enabled");
+        return NULL;
+    }
+
+    shinfo =3D xen_overlay_get_shinfo_ptr();
+    if (!shinfo) {
+        error_setg(errp, "Xen shared info page not allocated");
+        return NULL;
+    }
+    if (xen_is_long_mode()) {
+        pending =3D shinfo + offsetof(struct shared_info, evtchn_pending);
+        mask =3D shinfo + offsetof(struct shared_info, evtchn_mask);
+    } else {
+        pending =3D shinfo + offsetof(struct compat_shared_info, evtchn_pe=
nding);
+        mask =3D shinfo + offsetof(struct compat_shared_info, evtchn_mask)=
;
+    }
+
+    QEMU_LOCK_GUARD(&s->port_lock);
+
+    for (i =3D 0; i < s->nr_ports; i++) {
+        XenEvtchnPort *p =3D &s->port_table[i];
+        EvtchnInfo *info;
+
+        if (p->type =3D=3D EVTCHNSTAT_closed) {
+            continue;
+        }
+
+        info =3D g_new0(EvtchnInfo, 1);
+
+        info->port =3D i;
+        info->type =3D g_strdup(type_names[p->type]);
+        if (p->type =3D=3D EVTCHNSTAT_interdomain) {
+            info->remote_domain =3D g_strdup((p->type_val & PORT_INFO_TYPE=
VAL_REMOTE_QEMU) ?
+                                           "qemu" : "loopback");
+            info->target =3D p->type_val & PORT_INFO_TYPEVAL_REMOTE_PORT_M=
ASK;
+        } else {
+            info->target =3D p->type_val;
+        }
+        info->vcpu =3D p->vcpu;
+        info->pending =3D test_bit(i, pending);
+        info->masked =3D test_bit(i, mask);
+
+        QAPI_LIST_APPEND(tail, info);
+    }
+
+    return head;
+}
+
+void qmp_xen_event_inject(uint32_t port, Error **errp)
+{
+    XenEvtchnState *s =3D xen_evtchn_singleton;
+
+    if (!s) {
+        error_setg(errp, "Xen event channel emulation not enabled");
+    }
+
+    if (!valid_port(port)) {
+        error_setg(errp, "Invalid port %u", port);
+    }
+
+    QEMU_LOCK_GUARD(&s->port_lock);
+
+    if (set_port_pending(s, port)) {
+        error_setg(errp, "Failed to set port %d", port);
+    }
+}
+
+void hmp_xen_event_list(Monitor *mon, const QDict *qdict)
+{
+    EvtchnInfoList *iter, *info_list;
+    Error *err =3D NULL;
+
+    info_list =3D qmp_xen_event_list(&err);
+    if (err) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    for (iter =3D info_list; iter; iter =3D iter->next) {
+        EvtchnInfo *info =3D iter->value;
+
+        monitor_printf(mon, "port %4lu: vcpu: %ld %s", info->port, info->v=
cpu,
+                       info->type);
+        if (strcmp(info->type, "ipi")) {
+            monitor_printf(mon,  "(");
+            if (info->remote_domain) {
+                monitor_printf(mon, "%s:", info->remote_domain);
+            }
+            monitor_printf(mon, "%ld)", info->target);
+        }
+        if (info->pending) {
+            monitor_printf(mon, " PENDING");
+        }
+        if (info->masked) {
+            monitor_printf(mon, " MASKED");
+        }
+        monitor_printf(mon, "\n");
+    }
+
+    qapi_free_EvtchnInfoList(info_list);
+}
+
+void hmp_xen_event_inject(Monitor *mon, const QDict *qdict)
+{
+    int port =3D qdict_get_int(qdict, "port");
+    Error *err =3D NULL;
+
+    qmp_xen_event_inject(port, &err);
+    if (err) {
+        hmp_handle_error(mon, err);
+    } else {
+        monitor_printf(mon, "Delivered port %d\n", port);
+    }
+}
+
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 5d3e03553f..670f8b3f7d 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -16,6 +16,9 @@ void xen_evtchn_create(void);
 int xen_evtchn_soft_reset(void);
 int xen_evtchn_set_callback_param(uint64_t param);
=20
+void hmp_xen_event_inject(Monitor *mon, const QDict *qdict);
+void hmp_xen_event_list(Monitor *mon, const QDict *qdict);
+
 struct evtchn_status;
 struct evtchn_close;
 struct evtchn_unmask;
diff --git a/monitor/misc.c b/monitor/misc.c
index bf3f1c67ca..7d8c473ffb 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -82,6 +82,10 @@
 /* Make devices configuration available for use in hmp-commands*.hx templa=
tes */
 #include CONFIG_DEVICES
=20
+#ifdef CONFIG_XEN_EMU
+#include "hw/i386/kvm/xen_evtchn.h"
+#endif
+
 /* file descriptors passed via SCM_RIGHTS */
 typedef struct mon_fd_t mon_fd_t;
 struct mon_fd_t {
diff --git a/qapi/misc.json b/qapi/misc.json
index 27ef5a2b20..1c3829c008 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -584,3 +584,92 @@
 { 'event': 'VFU_CLIENT_HANGUP',
   'data': { 'vfu-id': 'str', 'vfu-qom-path': 'str',
             'dev-id': 'str', 'dev-qom-path': 'str' } }
+
+##
+# @EvtchnInfo:
+#
+# Information about a Xen event channel port
+#
+# @port: the port number
+#
+# @type: the port type
+#
+# @remote-domain: remote domain for interdomain ports
+#
+# @target: remote port ID, or virq/pirq number
+#
+# @pending: port is currently active pending delivery
+#
+# @masked: port is masked
+#
+# Since: x.xx
+##
+{ 'struct': 'EvtchnInfo',
+  'data': {'port': 'int',
+	   'type': 'str',
+	   'remote-domain': 'str',
+	   'vcpu': 'int',
+	   'target': 'int',
+	   'pending': 'bool',
+	   'masked': 'bool'}}
+
+
+##
+# @xen-event-list:
+#
+# Query the Xen event channels opened by the guest.
+#
+# Returns: list of open event channel ports.
+#
+# Since: x.xx
+#
+# Example:
+#
+# -> { "execute": "xen-event-list" }
+# <- { "return": [
+#         {
+#             "pending": false,
+#             "port": 1,
+#             "vcpu": 1,
+#             "remote-domain": "qemu",
+#             "masked": false,
+#             "type": "interdomain",
+#             "target": 1
+#         },
+#         {
+#             "pending": false,
+#             "port": 2,
+#             "vcpu": 0,
+#             "remote-domain": "",
+#             "masked": false,
+#             "type": "virq",
+#             "target": 0
+#         }
+#      ]
+#    }
+#
+##
+{ 'command': 'xen-event-list',
+  'returns': ['EvtchnInfo']
+}
+
+##
+# @xen-event-inject:
+#
+# Inject a Xen event channel port to the guest.
+#
+# @port: The port number
+#
+# Returns: - Nothing on success.
+#
+# Since: x.xx
+#
+# Example:
+#
+# -> { "execute": "xen-event-inject", "arguments": { "port": 1 } }
+# <- { "return": { } }
+#
+##
+{ 'command': 'xen-event-inject',
+  'data': { 'port': 'uint32' }
+}
--=20
2.34.1



--=-20a3OXT4aOhZEUkaP10h
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkQw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhQwggT8oAMCAQICEQDGvhmWZ0DEAx0oURL6O6l+MA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3GpC2bomUqk+91wLYBzDMcCj5C9m6
oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZHh7htyAkWYVoFsFPrwHounto8xTsy
SSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT9YgcBqKCo65pTFmOnR/VVbjJk4K2
xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNjP+qDrh0db7PAjO1D4d5ftfrsf+kd
RR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy2U+eITZ5LLE5s45mX2oPFknWqxBo
bQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3BgBEmfsYWlBXO8rVXfvPgLs32VdV
NZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/7auNVRmPB3v5SWEsH8xi4Bez2V9U
KxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmdlFYhAflWKQ03Ufiu8t3iBE3VJbc2
5oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9aelIl6vtbhMA+l0nfrsORMa4kobqQ5
C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMBAAGjggHMMIIByDAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeDMcimo0oz8o1R1Nver3ZVpSkwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGln
b1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEB
BH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50
QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29j
c3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkqhkiG9w0B
AQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQvQ/fzPXmtR9t54rpmI2TfyvcKgOXp
qa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvIlSPrzIB4Z2wyIGQpaPLlYflrrVFK
v9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9ChWFfgSXvrWDZspnU3Gjw/rMHrGnql
Htlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0whpBtXdyDjzBtQTaZJ7zTT/vlehc/
tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9IzCCBhQwggT8oAMCAQICEQDGvhmW
Z0DEAx0oURL6O6l+MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTIyMDEwNzAwMDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJ
ARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3
GpC2bomUqk+91wLYBzDMcCj5C9m6oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZH
h7htyAkWYVoFsFPrwHounto8xTsySSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT
9YgcBqKCo65pTFmOnR/VVbjJk4K2xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNj
P+qDrh0db7PAjO1D4d5ftfrsf+kdRR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy
2U+eITZ5LLE5s45mX2oPFknWqxBobQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3
BgBEmfsYWlBXO8rVXfvPgLs32VdVNZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/
7auNVRmPB3v5SWEsH8xi4Bez2V9UKxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmd
lFYhAflWKQ03Ufiu8t3iBE3VJbc25oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9ae
lIl6vtbhMA+l0nfrsORMa4kobqQ5C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMB
AAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeD
Mcimo0oz8o1R1Nver3ZVpSkwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYB
BQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
cmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1h
aWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdv
LmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAj
BggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQv
Q/fzPXmtR9t54rpmI2TfyvcKgOXpqa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvI
lSPrzIB4Z2wyIGQpaPLlYflrrVFKv9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9Ch
WFfgSXvrWDZspnU3Gjw/rMHrGnqlHtlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0w
hpBtXdyDjzBtQTaZJ7zTT/vlehc/tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9
IzGCBMcwggTDAgEBMIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVz
dGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMT
NVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA
xr4ZlmdAxAMdKFES+jupfjANBglghkgBZQMEAgEFAKCCAeswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwMTA5MTcyNDQ3WjAvBgkqhkiG9w0BCQQxIgQg3Rdw8xNX
2/tuT3Zg8mCFAFn8kxzyr6yVrbLl0CPajTAwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgCvJnwvHtRTHcc/hDGJljYmZpUIqPVqy2FA
NfE8MpaDo4DnANHjdJm0v9jX9vZk+YXnNEL8q4Dtz6q0t2UbsbopDCMYeKnoGNRM709GPL216M+u
pdqP9p5cJ3VpFgiXLxN2UuEvfWvsQ9TTpVn4OdZRapkZfNuiIybR5MHAk61rPmWfOMubCjVG7E36
9r41OU5dz2fTdP/U3GIXodehoJUOjAdhHgIMqJDXbr4G9mwjKtjGrPhV++/Gyg++dYr+RYd4++Mp
qemK/6rQGPi/4Je3ewNnyIW1mQ0Z3EhxBlouo4thyCIrO6ouXG7ZaNc12fiFzQcm05m62IGeobsL
zcCugVlIdIWfwO2btdCXn3HR2S1dIRbzYlmBOmIVui0YZwlbcX0v+QoSc+DGL1i/JLxA9tAKydzA
69xOfF3/Syzdf3WUx1E2iF/N7BaxkqH/juiyPI2CkjCo6+jTu/c3DymZjBIfmPzPz0Rxp/CW6rSf
FqsF7IKU9CUoy39A6mtoQr3NXnK9uqE3m9dOHkFS3LD0F4V4Rf6k+riH33SLxToDItQZ9UsJGZ1U
iVGlGA2DSkY9Ycp0iLSQ054mhwb2s/Jv7tDewaEA0uGxIsVhHzDIV+MvloiiDDy3lZQoZ1b4QYVK
arQUJaANP84+/qu0LRLAnFTJho7dSEoLJDyo2FrNvAAAAAAAAA==


--=-20a3OXT4aOhZEUkaP10h--


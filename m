Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AA766DC7D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 12:32:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHkBo-0000sz-Km; Tue, 17 Jan 2023 06:31:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+d80603fb936c028ea1fe+7086+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHkBh-0000sc-Om
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:31:35 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+d80603fb936c028ea1fe+7086+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHkBd-0007M1-QI
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Pyh9p8ayF54eVuc2IXK0dc0nnLsgsotbEfq6+MJEd6c=; b=sq/ajHcwjqbuidEbOvcUqZScWs
 ZfDotbb8jQazkm6CQRbmcj37vNejhvF+mU9NG+CNo2JbK2KofKNQ97LEoKiX4y8dn04n6WBJCXwcu
 uT965FacoDIJp9iswLOaZy0Oc/zwv3GnBDMrbAqJut/CrTjPBrMaYU+eGSbqQpvnbUSfNCBhDLtXn
 iq0Vl6s64U+ZbaNDv/XfvUq9GmnHFiigQfpzvX1eO9eF9nt8l+5i+6HKkrMz5OXeXz460tz9PNTyX
 dQ2GijoETZsorsc8mI/x3jN7LeySesJN4zrkWgJl6c+8nPAqcxiZkh44eJSaDm0UWbXmFtG2999Zv
 jqywBbmw==;
Received: from [2001:8b0:10b:5::bb3] (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pHkBm-009dVS-9P; Tue, 17 Jan 2023 11:31:38 +0000
Message-ID: <d952e579489289a015f9750a6ada2cca143e0724.camel@infradead.org>
Subject: Re: [PATCH v7 38/51] i386/xen: add monitor commands to test event
 injection
From: David Woodhouse <dwmw2@infradead.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant
 <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>, Ankur Arora
 <ankur.a.arora@oracle.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>
Date: Tue, 17 Jan 2023 11:31:23 +0000
In-Reply-To: <87mt6h4gnd.fsf@pond.sub.org>
References: <20230116215805.1123514-1-dwmw2@infradead.org>
 <20230116215805.1123514-39-dwmw2@infradead.org>
 <87mt6h4gnd.fsf@pond.sub.org>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-Dh30KBjATL3nF5Jj8Hyj"
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+d80603fb936c028ea1fe+7086+infradead.org+dwmw2@casper.srs.infradead.org;
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


--=-Dh30KBjATL3nF5Jj8Hyj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Incremental patch, which I think addresses everything major? Would
still be nice to make the remote-domain field optional.

I *still* assume p->type is in the valid range, but at least if that's
wrong now it'll just put a bad value in the enum instead of crashing ;)

(In fact as I squash this I'll remove xen-stubs.c entirely; that would
end up empty at the point in the series so I'll only add it later.)

---
 hw/i386/kvm/xen-stubs.c  |  13 -----
 hw/i386/kvm/xen_evtchn.c |  25 ++++-----
 hw/i386/kvm/xen_evtchn.h |   3 -
 include/monitor/hmp.h    |   2 +
 monitor/misc.c           |   4 --
 qapi/misc-target.json    | 116 +++++++++++++++++++++++++++++++++++++++
 qapi/misc.json           |  91 ------------------------------
 7 files changed, 130 insertions(+), 124 deletions(-)

diff --git a/hw/i386/kvm/xen-stubs.c b/hw/i386/kvm/xen-stubs.c
index 5660a2ccad..a95964bbac 100644
--- a/hw/i386/kvm/xen-stubs.c
+++ b/hw/i386/kvm/xen-stubs.c
@@ -10,21 +10,8 @@
  */
=20
 #include "qemu/osdep.h"
-#include "qapi/error.h"
-#include "qapi/qapi-commands-misc.h"
 #include "xen_evtchn.h"
=20
-EvtchnInfoList *qmp_xen_event_list(Error **errp)
-{
-    error_setg(errp, "Xen event channel emulation not enabled");
-    return NULL;
-}
-
-void qmp_xen_event_inject(uint32_t port, Error **errp)
-{
-    error_setg(errp, "Xen event channel emulation not enabled");
-}
-
 void xen_evtchn_snoop_msi(PCIDevice *dev, bool is_msix, unsigned int vecto=
r,
                           uint64_t addr, uint32_t data, bool is_masked)
 {
diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index be67089f82..dc91da6544 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -17,7 +17,7 @@
 #include "monitor/monitor.h"
 #include "monitor/hmp.h"
 #include "qapi/error.h"
-#include "qapi/qapi-commands-misc.h"
+#include "qapi/qapi-commands-misc-target.h"
 #include "qapi/qmp/qdict.h"
 #include "qom/object.h"
 #include "exec/target_page.h"
@@ -2200,15 +2200,6 @@ int xen_be_evtchn_get_guest_port(struct xenevtchn_ha=
ndle *xc)
     return xc->guest_port;
 }
=20
-static const char *type_names[] =3D {
-    "closed",
-    "unbound",
-    "interdomain",
-    "pirq",
-    "virq",
-    "ipi"
-};
-
 EvtchnInfoList *qmp_xen_event_list(Error **errp)
 {
     XenEvtchnState *s =3D xen_evtchn_singleton;
@@ -2226,6 +2217,7 @@ EvtchnInfoList *qmp_xen_event_list(Error **errp)
         error_setg(errp, "Xen shared info page not allocated");
         return NULL;
     }
+
     if (xen_is_long_mode()) {
         pending =3D shinfo + offsetof(struct shared_info, evtchn_pending);
         mask =3D shinfo + offsetof(struct shared_info, evtchn_mask);
@@ -2247,7 +2239,14 @@ EvtchnInfoList *qmp_xen_event_list(Error **errp)
         info =3D g_new0(EvtchnInfo, 1);
=20
         info->port =3D i;
-        info->type =3D g_strdup(type_names[p->type]);
+        qemu_build_assert(EVTCHN_PORT_TYPE_CLOSED =3D=3D EVTCHNSTAT_closed=
);
+        qemu_build_assert(EVTCHN_PORT_TYPE_UNBOUND =3D=3D EVTCHNSTAT_unbou=
nd);
+        qemu_build_assert(EVTCHN_PORT_TYPE_INTERDOMAIN =3D=3D EVTCHNSTAT_i=
nterdomain);
+        qemu_build_assert(EVTCHN_PORT_TYPE_PIRQ =3D=3D EVTCHNSTAT_pirq);
+        qemu_build_assert(EVTCHN_PORT_TYPE_VIRQ =3D=3D EVTCHNSTAT_virq);
+        qemu_build_assert(EVTCHN_PORT_TYPE_IPI =3D=3D EVTCHNSTAT_ipi);
+
+        info->type =3D p->type;
         if (p->type =3D=3D EVTCHNSTAT_interdomain) {
             info->remote_domain =3D g_strdup((p->type_val & PORT_INFO_TYPE=
VAL_REMOTE_QEMU) ?
                                            "qemu" : "loopback");
@@ -2301,8 +2300,8 @@ void hmp_xen_event_list(Monitor *mon, const QDict *qd=
ict)
         EvtchnInfo *info =3D iter->value;
=20
         monitor_printf(mon, "port %4lu: vcpu: %ld %s", info->port, info->v=
cpu,
-                       info->type);
-        if (strcmp(info->type, "ipi")) {
+                       EvtchnPortType_str(info->type));
+        if (info->type !=3D EVTCHN_PORT_TYPE_IPI) {
             monitor_printf(mon,  "(");
             if (info->remote_domain) {
                 monitor_printf(mon, "%s:", info->remote_domain);
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index fa8651040c..bfb67ac2bc 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -51,9 +51,6 @@ int xen_be_evtchn_pending(struct xenevtchn_handle *xc);
 /* Apart from this which is a local addition */
 int xen_be_evtchn_get_guest_port(struct xenevtchn_handle *xc);
=20
-void hmp_xen_event_inject(Monitor *mon, const QDict *qdict);
-void hmp_xen_event_list(Monitor *mon, const QDict *qdict);
-
 struct evtchn_status;
 struct evtchn_close;
 struct evtchn_unmask;
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 27f86399f7..ba1e6e8c2e 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -101,6 +101,8 @@ void hmp_virtio_status(Monitor *mon, const QDict *qdict=
);
 void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict);
 void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict);
 void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict);
+void hmp_xen_event_inject(Monitor *mon, const QDict *qdict);
+void hmp_xen_event_list(Monitor *mon, const QDict *qdict);
 void object_add_completion(ReadLineState *rs, int nb_args, const char *str=
);
 void object_del_completion(ReadLineState *rs, int nb_args, const char *str=
);
 void device_add_completion(ReadLineState *rs, int nb_args, const char *str=
);
diff --git a/monitor/misc.c b/monitor/misc.c
index 7d8c473ffb..bf3f1c67ca 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -82,10 +82,6 @@
 /* Make devices configuration available for use in hmp-commands*.hx templa=
tes */
 #include CONFIG_DEVICES
=20
-#ifdef CONFIG_XEN_EMU
-#include "hw/i386/kvm/xen_evtchn.h"
-#endif
-
 /* file descriptors passed via SCM_RIGHTS */
 typedef struct mon_fd_t mon_fd_t;
 struct mon_fd_t {
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 5b6a8e9185..652e6e0b37 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -380,3 +380,119 @@
 #
 ##
 { 'command': 'query-sgx-capabilities', 'returns': 'SGXInfo', 'if': 'TARGET=
_I386' }
+
+
+##
+# @EvtchnPortType:
+#
+# An enumeration of Xen event channel port types.
+#
+# @closed: The port is unused.
+#
+# @unbound: The port is allocated and ready to be bound.
+#
+# @interdomain: The port is connected as an interdomain interrupt.
+#
+# @pirq: The port is bound to a physical IRQ (PIRQ).
+#
+# @virq: The port is bound to a virtual IRQ (VIRQ).
+#
+# @ipi: The post is an inter-processor interrupt (IPI).
+#
+# Since: 8.0.0
+##
+{ 'enum': 'EvtchnPortType',
+  'data': ['closed', 'unbound', 'interdomain', 'pirq', 'virq', 'ipi'],
+  'if': 'TARGET_I386' }
+
+##
+# @EvtchnInfo:
+#
+# Information about a Xen event channel port
+#
+# @port: the port number
+#
+# @vcpu: target vCPU for this port
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
+# Since: 8.0.0
+##
+{ 'struct': 'EvtchnInfo',
+  'data': {'port': 'int',
+           'vcpu': 'int',
+           'type': 'EvtchnPortType',
+           'remote-domain': 'str',
+           'target': 'int',
+           'pending': 'bool',
+           'masked': 'bool'},
+  'if': 'TARGET_I386' }
+
+
+##
+# @xen-event-list:
+#
+# Query the Xen event channels opened by the guest.
+#
+# Returns: list of open event channel ports.
+#
+# Since: 8.0.0
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
+  'returns': ['EvtchnInfo'],
+  'if': 'TARGET_I386' }
+
+##
+# @xen-event-inject:
+#
+# Inject a Xen event channel port (interrupt) to the guest.
+#
+# @port: The port number
+#
+# Returns: - Nothing on success.
+#
+# Since: 8.0.0
+#
+# Example:
+#
+# -> { "execute": "xen-event-inject", "arguments": { "port": 1 } }
+# <- { "return": { } }
+#
+##
+{ 'command': 'xen-event-inject',
+  'data': { 'port': 'uint32' },
+  'if': 'TARGET_I386' }
diff --git a/qapi/misc.json b/qapi/misc.json
index 6284f86a5b..27ef5a2b20 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -584,94 +584,3 @@
 { 'event': 'VFU_CLIENT_HANGUP',
   'data': { 'vfu-id': 'str', 'vfu-qom-path': 'str',
             'dev-id': 'str', 'dev-qom-path': 'str' } }
-
-##
-# @EvtchnInfo:
-#
-# Information about a Xen event channel port
-#
-# @port: the port number
-#
-# @vcpu: target vCPU for this port
-#
-# @type: the port type
-#
-# @remote-domain: remote domain for interdomain ports
-#
-# @target: remote port ID, or virq/pirq number
-#
-# @pending: port is currently active pending delivery
-#
-# @masked: port is masked
-#
-# Since: x.xx
-##
-{ 'struct': 'EvtchnInfo',
-  'data': {'port': 'int',
-	   'vcpu': 'int',
-	   'type': 'str',
-	   'remote-domain': 'str',
-	   'target': 'int',
-	   'pending': 'bool',
-	   'masked': 'bool'}}
-
-
-##
-# @xen-event-list:
-#
-# Query the Xen event channels opened by the guest.
-#
-# Returns: list of open event channel ports.
-#
-# Since: x.xx
-#
-# Example:
-#
-# -> { "execute": "xen-event-list" }
-# <- { "return": [
-#         {
-#             "pending": false,
-#             "port": 1,
-#             "vcpu": 1,
-#             "remote-domain": "qemu",
-#             "masked": false,
-#             "type": "interdomain",
-#             "target": 1
-#         },
-#         {
-#             "pending": false,
-#             "port": 2,
-#             "vcpu": 0,
-#             "remote-domain": "",
-#             "masked": false,
-#             "type": "virq",
-#             "target": 0
-#         }
-#      ]
-#    }
-#
-##
-{ 'command': 'xen-event-list',
-  'returns': ['EvtchnInfo']
-}
-
-##
-# @xen-event-inject:
-#
-# Inject a Xen event channel port to the guest.
-#
-# @port: The port number
-#
-# Returns: - Nothing on success.
-#
-# Since: x.xx
-#
-# Example:
-#
-# -> { "execute": "xen-event-inject", "arguments": { "port": 1 } }
-# <- { "return": { } }
-#
-##
-{ 'command': 'xen-event-inject',
-  'data': { 'port': 'uint32' }
-}
--=20
2.34.1



--=-Dh30KBjATL3nF5Jj8Hyj
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwMTE3MTEzMTIzWjAvBgkqhkiG9w0BCQQxIgQgRpqsZiwB
HSj+SmLj5W7d3A15fDX8XSQCgb9gXHn1j38wgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgCZxNDdTu6tZBn7W9hYmqQjHG37jLSJN942
qQEUzLZENa7iMWwl+mMNvqMMMh/z0yTTYQ5uNoy6NFfYvNJURp0flH7Rhpk5iQm4Gc+huCGiTIdM
QYnRg9Fbdw651yjXnWhalRIDUqEGigEZnLARaOEUoDZ5o3jt+cpirBVLBDVeHKdfAh7jEc99smz/
xxxNu7VV6EMddQ1yogCpJ9ioV4YXMiiLRUvJYiOCwISDY68RSibbYErgHOx39fXWqHI3fltL9geb
sxsOcudyXy1/SlVWyxKKriTl+USzjRFtZxWKh6OrzfSv5aVKt8gjJS0R4dg/lnoUHPNnJ2gBYr8K
qW6eZC0ZcbQHmhro4swoLTBVpfYBk/k4ONcXR6fFaTfHwcU3CQrbOiAMtA3/ykObSRSJmWo8PJsU
sf+Qd5HMvux6PRIR7C7H2Q8KvMlOb0aasyJQFPaVraUlVVRJpaAbl++m7NZ/TI1ljTrzHUWfciU8
h0EIgs2EsAEH3Eqlyz657DctGRpWyNqeu8HaueO9KXBgYRTqK/82ajR4WiFnB2ZFMZkadT+Z0bO5
AdyjSwyMb9db2qWVZEiDIunf3Kayw0L0TGhPdb5U1/jxAyClPEyRRh3kuSkm8dKx6oWd1TUYcowO
TSr2bMqNqm+Jd8app2ejvvuP8ZpmCm186P53gAD71QAAAAAAAA==


--=-Dh30KBjATL3nF5Jj8Hyj--


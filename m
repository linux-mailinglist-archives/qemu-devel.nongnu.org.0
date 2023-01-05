Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B8265F4C2
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 20:44:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDW8s-0002r0-Mb; Thu, 05 Jan 2023 14:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fb94e007b29ef98b13f4+7074+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pDW8T-0002qj-M6
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 14:42:46 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fb94e007b29ef98b13f4+7074+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pDW8P-0004wh-R4
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 14:42:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9mGadIKmmEKBKLKcxOTFMDC1fIHw2z8Aep43u3WfncY=; b=To3aEHt2OBf3tNovcjTI4i1yJv
 jPytvCIeyzMTNLKhwhpnYXxo8ljzb0LyaF1ViL6cAB/Wa4EEO4uWjkx7+qTmZEiWhu9m77Ur1yVM4
 tYSej60BoEMqwoSEKO3F2MF89dcmoaAeLKQDn3BSdajRvLsu01Ht0vGDAyL6zvbOMDe0vI2nDyYkH
 R7UmG/uNBytEyExQ6a31RJcDLsBNKJHcRc9nJh0HvFGwS0rEUUL97SLChVpvauBYvgB3gOvSBtd4b
 CPlvRsTvRokcMZto97ZggtXx/AqoRFIpIEanup4A6S1cSmzlJQKCjWEPMVK+nAau48yPSZYK5gJPB
 zE7gulwA==;
Received: from [2001:8b0:10b:5::bb3] (helo=u3832b3a9db3152.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pDW8O-00GRS8-GM; Thu, 05 Jan 2023 19:42:40 +0000
Message-ID: <10d798e3959dbeaacd67cc9cefa78b16ee524462.camel@infradead.org>
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
Date: Thu, 05 Jan 2023 19:42:27 +0000
In-Reply-To: <Y7V1sdhAlhhSKp2F@work-vm>
References: <20221230121235.1282915-1-dwmw2@infradead.org>
 <20221230121235.1282915-40-dwmw2@infradead.org> <Y7V1sdhAlhhSKp2F@work-vm>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-UdpSX93maHXTkxZRJ2eO"
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+fb94e007b29ef98b13f4+7074+infradead.org+dwmw2@casper.srs.infradead.org;
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


--=-UdpSX93maHXTkxZRJ2eO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-01-04 at 12:48 +0000, Dr. David Alan Gilbert wrote:
> * David Woodhouse (dwmw2@infradead.org) wrote:
> > From: Joao Martins <joao.m.martins@oracle.com>
> >=20
> > Specifically add listing, injection of event channels.
>=20
> These are all for debug only aren't they?

Mostly. Injecting VIRQ_DEBUG into a guest is useful for debugging the
guest too. Slightly inclined just to drop it as there's plenty of more
useful things to implement, but let's have a go...

> Even so, see docs/devel/writing-monitor-commands.rst, people like
> commands to be built around qmp if possible now; there's a thing for
> dumping text through it anyway for debug.

OK... something like this?

=46rom ef1d7d08ee544921c056cc8f8c38bdd691cf71b4 Mon Sep 17 00:00:00 2001
From: David Woodhouse <dwmw@amazon.co.uk>
Date: Thu, 5 Jan 2023 19:34:15 +0000
Subject: [PATCH] Convert xen-event-list to qmp

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hmp-commands.hx          |  2 +-
 hw/i386/kvm/xen_evtchn.c | 70 +++++++++++++++++++++++++++++++++++-----
 hw/i386/kvm/xen_evtchn.h |  4 ++-
 qapi/misc.json           | 68 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 134 insertions(+), 10 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index fd77c432c0..eac182307c 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1836,7 +1836,7 @@ ERST
         .args_type  =3D "",
         .params     =3D "",
         .help       =3D "list event channel state",
-        .cmd        =3D hmp_xen_event_list,
+        .cmd_info_hrt =3D hmp_xen_event_list,
     },
=20
 SRST
diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index c58237cdd2..ee50839804 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -15,6 +15,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-misc.h"
 #include "qom/object.h"
 #include "exec/target_page.h"
 #include "exec/address-spaces.h"
@@ -1539,21 +1540,22 @@ static const char *type_names[] =3D {
     "ipi"
 };
=20
-void hmp_xen_event_list(Monitor *mon, const QDict *qdict)
+EvtchnInfoList *qmp_xen_event_list(Error **errp)
 {
     XenEvtchnState *s =3D xen_evtchn_singleton;
+    EvtchnInfoList *head =3D NULL, **tail =3D &head;
     void *shinfo, *pending, *mask;
     int i;
=20
     if (!s) {
-        monitor_printf(mon, "Xen event channel emulation not enabled\n");
-        return;
+        error_setg(errp, "Xen event channel emulation not enabled\n");
+        return NULL;
     }
=20
     shinfo =3D xen_overlay_get_shinfo_ptr();
     if (!shinfo) {
-        monitor_printf(mon, "Xen shared info page not allocated\n");
-        return;
+        error_setg(errp, "Xen shared info page not allocated\n");
+        return NULL;
     }
     if (xen_is_long_mode()) {
         pending =3D shinfo + offsetof(struct shared_info, evtchn_pending);
@@ -1567,17 +1569,69 @@ void hmp_xen_event_list(Monitor *mon, const QDict *=
qdict)
=20
     for (i =3D 0; i < s->nr_ports; i++) {
         XenEvtchnPort *p =3D &s->port_table[i];
+        EvtchnInfo *info;
=20
         if (p->type =3D=3D EVTCHNSTAT_closed) {
             continue;
         }
=20
-        monitor_printf(mon, "port %4u %s/%d vcpu:%d pending:%d mask:%d\n",=
 i,
-                       type_names[p->type], p->type_val, p->vcpu,
-                       test_bit(i, pending), test_bit(i, mask));
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
     }
=20
     qemu_mutex_unlock(&s->port_lock);
+
+    return head;
+}
+
+HumanReadableText *hmp_xen_event_list(Error **errp)
+{
+    EvtchnInfoList *iter, *info_list;
+    g_autoptr(GString) buf =3D g_string_new("");
+
+
+    info_list =3D qmp_xen_event_list(errp);
+    if (*errp) {
+        return NULL;
+    }
+
+    for (iter =3D info_list; iter; iter =3D iter->next) {
+        EvtchnInfo *info =3D iter->value;
+
+        g_string_append_printf(buf, "port %4lu: %s", info->port, info->typ=
e);
+        if (strcmp(info->type, "ipi")) {
+            g_string_append_printf(buf,  "(");
+            if (info->remote_domain) {
+                g_string_append_printf(buf, "%s:", info->remote_domain);
+            }
+            g_string_append_printf(buf, "%ld)", info->target);
+        }
+        g_string_append_printf(buf, " vcpu:%ld", info->vcpu);
+        if (info->pending) {
+            g_string_append_printf(buf, " PENDING");
+        }
+        if (info->masked) {
+            g_string_append_printf(buf, " MASKED");
+        }
+        g_string_append_printf(buf, "\n");
+    }
+
+    qapi_free_EvtchnInfoList(info_list);
+    return human_readable_text_from_str(buf);
 }
=20
 void hmp_xen_event_inject(Monitor *mon, const QDict *qdict)
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 146c504773..1d1ca64e6f 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -12,6 +12,8 @@
 #ifndef QEMU_XEN_EVTCHN_H
 #define QEMU_XEN_EVTCHN_H
=20
+#include "qapi/type-helpers.h"
+
 #include "hw/sysbus.h"
=20
 typedef uint32_t evtchn_port_t;
@@ -42,8 +44,8 @@ int xen_be_evtchn_pending(struct xenevtchn_handle *xc);
 /* Apart from this which is a local addition */
 int xen_be_evtchn_get_guest_port(struct xenevtchn_handle *xc);
=20
-void hmp_xen_event_list(Monitor *mon, const QDict *qdict);
 void hmp_xen_event_inject(Monitor *mon, const QDict *qdict);
+HumanReadableText *hmp_xen_event_list(Error **errp);
=20
 struct evtchn_status;
 struct evtchn_close;
diff --git a/qapi/misc.json b/qapi/misc.json
index 27ef5a2b20..5c0f53cbc7 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -584,3 +584,70 @@
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
+# Returns: list of open event channel ports
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
+  'returns': ['EvtchnInfo'] }
--=20
2.34.1



--=-UdpSX93maHXTkxZRJ2eO
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwMTA1MTk0MjI3WjAvBgkqhkiG9w0BCQQxIgQgJRQ3yBNi
hCYYWooxm/bVA+fLb9KyFV61Vt/xGMMaTKMwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgAGxBr4gcZRwTcs2gjj3xVf0pUfRNum4Eo+
8thoSVQ5RMjRf6c0Vx/zyTRA8p4OxDgNPuKqyMno4fRxohxfJmzPUfLjamrctFbZoSMdfog8myty
WTrrbUFu/gtZpFk+p39Ig4Bti2WXVmnbZH9NlcEfxa4rcw90NLwcl+O5og/j9G+RbtupXX/UW4ov
LjpzYc5N32jasqzemC82exy1YdwgogwE9T85YA/nxoLEF0y1f8Xry4A9JNMMvSeIT5v/XUVxxvCK
Bin4WsFFdA/gisBCyoHD/lCJRTjf8v95seEmw8yADgMmoRaI4oPd/NKezqnRLCYA+qcmfwf007nJ
IWE8V/8BnAGuBBKYU+eXj8EuASwkhPQyl8Uy7h8LAC9gSZxZ8BZT2hgz3GQgUad4MiXqHKq8tTLr
X72bVyV18cPTANhTLlTD1S/EwmPwwjkDVDC9xfVCshSGIUuzRwPy6WH2ONouCwweBbOYMb7HAdM5
lccuoy1deYiMmbM/gFNg0o1qgwc9MmLAJJzxrz8DXf+KWMgQOK0DiVVkk9kTMnroZGSH3bnpTFQE
ZG2TGotENdSRAzNP+EMhH69VzENcN2jWOWGONhyNYbuf/yr9kFFxDBRKVZXVlNwrJOR8RrgAe005
9pBZr84n+7W5rpZPivdfhIH6G7U5F+KTNYbpGTU+bQAAAAAAAA==


--=-UdpSX93maHXTkxZRJ2eO--


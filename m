Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 628766998FA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 16:35:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgGn-0004zw-8W; Thu, 16 Feb 2023 10:34:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pSgGk-0004vY-2z
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 10:33:58 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pSgGh-0001xE-Kf
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 10:33:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fBDumBiDX4g9zaaX0skqHvm2yZdpid10/HOpuHZ+uaQ=; b=udukDpx2bxKLEDIvYSXO76r5cM
 uSPIkz9mzXKVxD3fnuF1gIMc2PdLjpzwGOmUX2ob6Zn8ArSBbZ7IN1byzMwUSEzOUENItUY2RuYi/
 XjthxyVy2dwh1irJ4+NWsoefOLYafFEVczW8kmMxBtxaianUfq4vRk9w6qZDMLpSHpwDETR46OJxv
 D3tSSK95KkJ1e/hWEiLjS2mbScnyA8mGm0Cz3ZoDROsMVVRjG8FhZtYsgRtURyg8jt7MwZDxP+7Tt
 FpYrk6EdEmz61dJP8GUR4IiMOKAOwyODwW2qj1oePrEzZcFj9FOwXyKglhYsw0XokDAvl8qleutvr
 1a2WdWGA==;
Received: from [2001:871:43:561d:25d2:1b3e:6f19:aa40]
 (helo=dynamic-pd01.res.v6.highway.a1.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pSgGY-008W7C-2x; Thu, 16 Feb 2023 15:33:46 +0000
Message-ID: <eb1af3963f85749ed3337a2301c73392f8be1482.camel@infradead.org>
Subject: Re: [RFC PATCH v11bis 00/26] Emulated XenStore and PV backend support
From: David Woodhouse <dwmw2@infradead.org>
To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, Joao Martins
 <joao.m.martins@oracle.com>,  Ankur Arora <ankur.a.arora@oracle.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,  Thomas Huth
 <thuth@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  armbru@redhat.com, Stefano Stabellini
 <sstabellini@kernel.org>,  vikram.garhwal@amd.com
Date: Thu, 16 Feb 2023 16:33:44 +0100
In-Reply-To: <871qmpk8s9.fsf@secure.mitica>
References: <20230216094436.2144978-1-dwmw2@infradead.org>
 <87sff5khqo.fsf@secure.mitica>
 <ca90895e752c860d4e7251d52bac6ee572b3874c.camel@infradead.org>
 <871qmpk8s9.fsf@secure.mitica>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-FfBMUX/iQF4ixDMk6AhA"
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org;
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


--=-FfBMUX/iQF4ixDMk6AhA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2023-02-16 at 15:02 +0100, Juan Quintela wrote:
> David Woodhouse <dwmw2@infradead.org> wrote:
> > --=3D-jDk4SYxkcOAZoZa6DCVr
> > Content-Type: text/plain; charset=3D"UTF-8"
> > Content-Transfer-Encoding: quoted-printable
> >=20
> > On Thu, 2023-02-16 at 11:49 +0100, Juan Quintela wrote:
> > > David Woodhouse <dwmw2@infradead.org> wrote:
> > > > The non-RFC patch submisson=3DC2=3DB9 is just the basic platform su=
pport fo=3D
> > r Xen
> > > > on KVM. This RFC series is phase 2, adding an internal XenStore and
> > > > hooking up the PV back end drivers to that and the emulated grant t=
able=3D
> > s
> > > > and event channels.
> > > > =3D20
> > > > With this, we can boot a Xen guest with PV disk, under KVM. Full su=
ppor=3D
> > t
> > > > for migration isn't there yet because it's actually missing in the =
PV
> > > > back end drivers in the first place (perhaps because upstream Xen d=
oesn=3D
> > 't
> > > > yet have guest transparent live migration support anyway). I'm assu=
ming
> > > > that when the first round is merged and we drop the [RFC] from this=
 set=3D
> > ,
> > > > that won't be a showstopper for now?
> > > > =3D20
> > > > I'd be particularly interested in opinions on the way I implemented
> > > > serialization for the XenStore, by creating a GByteArray and then d=
umpi=3D
> > ng
> > > > it with VMSTATE_VARRAY_UINT32_ALLOC().
> > > =3D20
> > > And I was wondering why I was CC'd in the whole series O:-)
> > > =3D20
> >=20
> > Indeed, Philippe M-D added you to Cc when discussing migrations on the
> > first RFC submission back in December, and you've been included ever
> > since.
> >=20
> >=20
> > > How big is the xenstore?
> > > I mean typical size and maximun size.
> > > =3D20
> >=20
> > Booting a simple instance with a single disk:
> >=20
> > $ scripts/analyze-migration.py -f foo | grep impl_state_size
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "impl_state_size": "0x000006=
34",
> >=20
> > Theoretical maximum is about 1000 nodes @2KiB, so around 2MiB.
> >=20
> > > If it is suficientely small (i.e. in the single unit megabytes), you =
can
> > > send it as a normal device at the end of migration.
> > > =3D20
> >=20
> > Right now it's part of the xen_xenstore device. Most of that is fairly
> > simple and it's just the impl_state that's slightly different.
> >=20
> >=20
> > > If it is bigger, I think that you are going to have to enter Migratio=
n
> > > iteration stage, and have some kind of dirty bitmap to know what entr=
ies
> > > are on the target and what not.
> > > =3D20
> >=20
> > We have COW and transactions; that isn't an impossibility; I think we
> > can avoid that complexity though.
>=20
> It is relatively small.=C2=A0 I will go with migrating at the end of
> migration for now.=C2=A0 Later we can measure if we need to improve
> performance there.

Yeah, that much I was relatively OK with. The bit I thought might
attract heckling is how I actually store the byte stream, in
https://git.infradead.org/users/dwmw2/qemu.git/commitdiff/45e7e645080#patch=
1

--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -66,6 +66,9 @@ struct XenXenstoreState {
     evtchn_port_t guest_port;
     evtchn_port_t be_port;
     struct xenevtchn_handle *eh;
+
+    uint8_t *impl_state;
+    uint32_t impl_state_size;
 };
=20
 struct XenXenstoreState *xen_xenstore_singleton;
@@ -109,16 +112,26 @@ static bool xen_xenstore_is_needed(void *opaque)
 static int xen_xenstore_pre_save(void *opaque)
 {
     XenXenstoreState *s =3D opaque;
+    GByteArray *save;
=20
     if (s->eh) {
         s->guest_port =3D xen_be_evtchn_get_guest_port(s->eh);
     }
+
+    g_free(s->impl_state);
+    save =3D xs_impl_serialize(s->impl);
+    s->impl_state =3D save->data;
+    s->impl_state_size =3D save->len;
+    g_byte_array_free(save, false);
+
     return 0;
 }
=20
 static int xen_xenstore_post_load(void *opaque, int ver)
 {
     XenXenstoreState *s =3D opaque;
+    GByteArray *save;
+    int ret;
=20
     /*
      * As qemu/dom0, rebind to the guest's port. The Windows drivers may
@@ -134,7 +147,13 @@ static int xen_xenstore_post_load(void *opaque, int ve=
r)
         }
         s->be_port =3D be_port;
     }
-    return 0;
+
+    save =3D g_byte_array_new_take(s->impl_state, s->impl_state_size);
+    s->impl_state =3D NULL;
+    s->impl_state_size =3D 0;
+
+    ret =3D xs_impl_deserialize(s->impl, save, xen_domid, fire_watch_cb, s=
);
+    return ret;
 }
=20
 static const VMStateDescription xen_xenstore_vmstate =3D {
@@ -152,6 +171,10 @@ static const VMStateDescription xen_xenstore_vmstate =
=3D {
         VMSTATE_BOOL(rsp_pending, XenXenstoreState),
         VMSTATE_UINT32(guest_port, XenXenstoreState),
         VMSTATE_BOOL(fatal_error, XenXenstoreState),
+        VMSTATE_UINT32(impl_state_size, XenXenstoreState),
+        VMSTATE_VARRAY_UINT32_ALLOC(impl_state, XenXenstoreState,
+                                    impl_state_size, 0,
+                                    vmstate_info_uint8, uint8_t),
         VMSTATE_END_OF_LIST()
     }
 };

--=-FfBMUX/iQF4ixDMk6AhA
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwMjE2MTUzMzQ0WjAvBgkqhkiG9w0BCQQxIgQg9IO8V8bJ
3VzqgRWgxzlIe1+5MRFeHUM9dDlacRoZqdEwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgCf/M8FB7YLFmFxupfh6iW1B/nE0mBJcFbh
KvNK6qaBuwB5+syuXtI+HRm1aa2W62fq8uNjzJ7nWtkqEv12yzUmbm9gIJ5FZHcdr/BAHWFK+6Kk
R5alTe3svpc9Zy94WSgqnfD9TMog7yD4xSI6LHXso4ghdEEVzNeVlqzngJALlziIH3sYZX6bC6GN
vlTCs0Q7ZXueoU/40OulRqbdf9a9RKzhCuMcqSLRLZR82W/pEbmBmYvE8KwpYHmTNzuJ7edxa3Ew
YxMnkqDcj/7+VPBhSicuSJXcj2yYO7aRxxzJbQrPlGjuZhN6bkp7fUG+CuyIkYWaiRdUsLo7Od8L
8e6gejh7NZDdf0vAl7oG/ikre+LbMvqJpQi+AhIDO9mhZm7mUH19hkCTM2dpP8qm7FqfMfu6amVL
hoB32sjNNaQiYbPEShHAkg9aTmQOIXwHq7O9+gKIUtNjTmWPmWYjZZG4eUfDxS3u+S8CRSzew8BU
9I/7HH1yhrqLxB5HOlACms3tBoL3w7P+fMd855Sj2svas7+nRy9J8gV+2wbqWxgwfVwz8/8dn947
Sqc+/gkV6I0LlTJb8ImU3sdtPBTfGJAAALwJ4rsUmUMIDmtObrmI4yW3Bi3s1bwGlY4zm4L8QlNP
fxuiSHeeH1xVOBqjDn13XWInvbTzBQkBBtuaEYjh8wAAAAAAAA==


--=-FfBMUX/iQF4ixDMk6AhA--


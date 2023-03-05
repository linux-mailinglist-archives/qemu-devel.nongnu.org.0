Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DF16AB1BE
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 19:45:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYtLC-0003Vt-Nc; Sun, 05 Mar 2023 13:44:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+e20be4a7818aaa59185d+7133+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pYtL8-0003VJ-WD
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 13:44:11 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+e20be4a7818aaa59185d+7133+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pYtL6-0003jL-Hf
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 13:44:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:Date:Cc:To:
 From:Subject:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=CF5C4ZtUSD5Y/IXkIav0qhADmeikeZNNaXEzQnCg/U8=; b=BeR0wr+2E87ROAMq+ZUkoPhxbe
 8CHlV2vThxwPr/7mYHbhI9KwysK1v1wqhM4utnNNVNPoscm4/pD2x4fuRJRB/T++MmA1eMMmksRgy
 g47J/fobtumS4hxOyQKZvuZmCwT95FsLld4yu/BbjEX3beQKbW2TYt6xQuhJ8+A8KNupNGooHxt2X
 gOJe1damULgEh5TwlD2GD7JFCvSPnTgv5d7YyuBd1zK1/0vYupHNB9mRa2lNWFDFZt18JT1Tuuv2V
 TtwmtZzC2bzlOPoGTu5/Uy63Ly1EOFxghA8Kczdy6a1uUiwqluHpjgPRHzpXR4pFcttj/NEhHVtjx
 EYIaxzaw==;
Received: from [2001:8b0:10b:5:4950:406a:71e1:41ec]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pYtKk-004g0b-FM; Sun, 05 Mar 2023 18:43:47 +0000
Message-ID: <e1b97564a7728a5106134bc7063a8c62f134a45e.camel@infradead.org>
Subject: [PATCH] hw/intc/ioapic: Update KVM routes before redelivering IRQ,
 on RTE update
From: David Woodhouse <dwmw2@infradead.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>,  Peter Xu <peterx@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Date: Sun, 05 Mar 2023 18:43:42 +0000
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-JYw9M97jH/FlCEdQ0KaP"
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+e20be4a7818aaa59185d+7133+infradead.org+dwmw2@casper.srs.infradead.org;
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


--=-JYw9M97jH/FlCEdQ0KaP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: David Woodhouse <dwmw@amazon.co.uk>

A Linux guest will perform IRQ migration after the IRQ has happened,
updating the RTE to point to the new destination CPU and then unmasking
the interrupt.

However, when the guest updates the RTE, ioapic_mem_write() calls
ioapic_service(), which redelivers the pending level interrupt via
kvm_set_irq(), *before* calling ioapic_update_kvm_routes() which sets
the new target CPU.

Thus, the IRQ which is supposed to go to the new target CPU is instead
misdelivered to the previous target. An example where the guest kernel
is attempting to migrate from CPU#2 to CPU#0 shows:

xenstore_read tx 0 path control/platform-feature-xs_reset_watches
ioapic_set_irq vector: 11 level: 1
ioapic_set_remote_irr set remote irr for pin 11
ioapic_service: trigger KVM IRQ 11
[    0.523627] The affinity mask was 0-3 and the handler is on 2
ioapic_mem_write ioapic mem write addr 0x0 regsel: 0x27 size 0x4 val 0x26
ioapic_update_kvm_routes: update KVM route for IRQ 11: fee02000 8021
ioapic_mem_write ioapic mem write addr 0x10 regsel: 0x26 size 0x4 val 0x180=
21
xenstore_reset_watches
ioapic_set_irq vector: 11 level: 1
ioapic_mem_read ioapic mem read addr 0x10 regsel: 0x26 size 0x4 retval 0x1c=
021
[    0.524569] ioapic_ack_level IRQ 11 moveit =3D 1
ioapic_eoi_broadcast EOI broadcast for vector 33
ioapic_clear_remote_irr clear remote irr for pin 11 vector 33
ioapic_mem_write ioapic mem write addr 0x0 regsel: 0x26 size 0x4 val 0x26
ioapic_mem_read ioapic mem read addr 0x10 regsel: 0x26 size 0x4 retval 0x18=
021
[    0.525235] ioapic_finish_move IRQ 11 calls irq_move_masked_irq()
[    0.526147] irq_do_set_affinity for IRQ 11, 0
[    0.526732] ioapic_set_affinity for IRQ 11, 0
[    0.527330] ioapic_setup_msg_from_msi for IRQ11 target 0
ioapic_mem_write ioapic mem write addr 0x0 regsel: 0x26 size 0x4 val 0x27
ioapic_mem_write ioapic mem write addr 0x10 regsel: 0x27 size 0x4 val 0x0
ioapic_mem_write ioapic mem write addr 0x0 regsel: 0x27 size 0x4 val 0x26
ioapic_mem_write ioapic mem write addr 0x10 regsel: 0x26 size 0x4 val 0x180=
21
[    0.527623] ioapic_set_affinity returns 0
[    0.527623] ioapic_finish_move IRQ 11 calls unmask_ioapic_irq()
ioapic_mem_write ioapic mem write addr 0x0 regsel: 0x26 size 0x4 val 0x26
ioapic_mem_write ioapic mem write addr 0x10 regsel: 0x26 size 0x4 val 0x802=
1
ioapic_set_remote_irr set remote irr for pin 11
ioapic_service: trigger KVM IRQ 11
ioapic_update_kvm_routes: update KVM route for IRQ 11: fee00000 8021
[    0.529571] The affinity mask was 0 and the handler is on 2
[    xenstore_watch path memory/target token FFFFFFFF92847D40

There are no other code paths in ioapic_mem_write() which need the KVM
IRQ routing table to be updated, so just shift the call from the end
of the function to happen right before the call to ioapic_service()
and thus deliver the re-enabled IRQ to the right place.

Fixes: 15eafc2e602f "kvm: x86: add support for KVM_CAP_SPLIT_IRQCHIP"
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
Alternative fixes might have been just to remove the part in
ioapic_service() which delivers the IRQ via kvm_set_irq() because
surely delivering as MSI ought to work just fine anyway in all cases?
That code lacks a comment justifying its existence.

Or maybe in the specific case shown in the above log, it would have
sufficed for ioapic_update_kvm_routes() to update the route *even*
when the IRQ is masked. It's not like it's actually going to get
triggered unless QEMU deliberately does so, anyway? But that only
works because the target CPU happens to be in the high word of the
RTE; if something in the *low* word (vector, perhaps) was changed
at the same time as the unmask, we'd still trigger with stale data.

 hw/intc/ioapic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
index 6364ecab1b..716ffc8bbb 100644
--- a/hw/intc/ioapic.c
+++ b/hw/intc/ioapic.c
@@ -405,6 +405,7 @@ ioapic_mem_write(void *opaque, hwaddr addr, uint64_t va=
l,
                 s->ioredtbl[index] |=3D ro_bits;
                 s->irq_eoi[index] =3D 0;
                 ioapic_fix_edge_remote_irr(&s->ioredtbl[index]);
+                ioapic_update_kvm_routes(s);
                 ioapic_service(s);
             }
         }
@@ -417,8 +418,6 @@ ioapic_mem_write(void *opaque, hwaddr addr, uint64_t va=
l,
         ioapic_eoi_broadcast(val);
         break;
     }
-
-    ioapic_update_kvm_routes(s);
 }
=20
 static const MemoryRegionOps ioapic_io_ops =3D {
--=20
2.39.0



--=-JYw9M97jH/FlCEdQ0KaP
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwMzA1MTg0MzQyWjAvBgkqhkiG9w0BCQQxIgQg2gRQ+8lM
hSRZhnW8izAf7OiaenIhFBvZ03XRYuDvP6kwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgAgNAweaYvSyYHI+hBxwjFYHmVmGOiF8teD
TfcrI1nWPN9WEOGFabM1F4klLm4AiUGx7g6AXa8D0hBeyBvzXKzLii+TXIVsdXU1Yw3yz4ES456p
j1tCi0alXpU+BBkE3wYA94n1o7DL6TbdbZ788hs2xrtQX1820pSnfGYRNMN8NqpZDM3d9LhO/HR+
vYqUDZ9ADoanSaV5KQbtCQWXFLMrRId9x2ehrt931qA8ZdkP30pxUzgAitZCtvHftKnpmmS70x6p
EnrRJ6kDj/SD4ax1T/1cQwjcHIxwpsJwuijths89iaOo8K6YkoO0dp7zT3Lzwoai2AAy6jSEt56b
3/Q7EnUDv7oke4Dn3/xPm9RSswelGKZlcYn5AhdHvMNcBiqPCwZh+FGRHKShvp7X1ktQGIEI5dlv
FzofhvwSlXVhLbsP1Q8wKrZnje9PNEqZ0nxLQloIKuViA10v+MSV2BZi98EFywCDSWY8niifw/9c
aVQ/CFwPL/PNhjb9T1KLXqEY6W41vDnErB5MnR2YLxJmyIvMHeR52zwoRkIY+zkKFOsHFn4QfCQX
kjRsfCRGzEwsmn2QVzylGbwC/8PJ2qOAzLp43hFX9i58668ht6xETRXri3yACthRAZpAwQ0mHPNb
Jy6vcFXvF4PA0MzIhMCd8oHgXlHWtkR+9gClTrozMQAAAAAAAA==


--=-JYw9M97jH/FlCEdQ0KaP--


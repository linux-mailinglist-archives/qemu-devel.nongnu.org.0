Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6086B2E01
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 20:57:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMNC-0006bx-KM; Thu, 09 Mar 2023 14:56:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1e8d8dc6e835cf614345+7137+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1paMN8-0006bj-Qh
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 14:56:19 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1e8d8dc6e835cf614345+7137+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1paMN4-0007Py-3t
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 14:56:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0G187/ZkFD+Rb+nvmPARX8rtVDUH1X3V13D44O3Sgnc=; b=K3+mdBQql0s77zFoB8fWjLzOGC
 fMjEkR763Rg9pIPVjo3ZlS4NeKLt24wjPyIUEgdjrmyDHHvjuV7II6sDBmY517wnJKtWG71jXyumY
 /QQABWXoXby2UK64y3lzcA6SmphYDY0WJGyAjQampKFeKcAv+a6tvQxJcRwSDt8et0qY+i6/4/elX
 c/pzpN2Oix2KZ51Rxl9wu85J8jmDSQzUTta/bizp8wUBrYMN/eSz63sIHSGwgBclZP2OICNZDQ4JJ
 kal68UQSmeWHeHsx2df5T6H8MpwC7iIOocK+w7fih4b8YfrskhaPx2cHg2MT69DDtA+ItCXJ/tzce
 koMuXizw==;
Received: from [2001:8b0:10b:5:e62f:87cb:46b1:1399]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1paMMz-008k2j-0y; Thu, 09 Mar 2023 19:56:09 +0000
Message-ID: <07ae19e96bd77a1bcbb0f90d2de4964f618fdc63.camel@infradead.org>
Subject: Re: [PATCH] hw/intc/ioapic: Update KVM routes before redelivering
 IRQ, on RTE update
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Xu <peterx@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>,  qemu-devel <qemu-devel@nongnu.org>
Date: Thu, 09 Mar 2023 19:56:08 +0000
In-Reply-To: <ZAoPlRMlcO4fm5rJ@x1n>
References: <e1b97564a7728a5106134bc7063a8c62f134a45e.camel@infradead.org>
 <ZAUZYkChWfwCcfSn@x1n> <6E7EA2EE-382C-4345-9A2A-D61E0139FB65@infradead.org>
 <34f494519d1921e8b62a6f3e709511a9467df54d.camel@infradead.org>
 <ZAYXUKUtU9ipksUq@x1n>
 <55bab93ee00619ac5b5b7416c17aee175ada8a8b.camel@infradead.org>
 <ZAkVwunxmEfXu4+H@x1n>
 <0754a758a46549dccde7878282721fe3835dc4b3.camel@infradead.org>
 <ZAoPlRMlcO4fm5rJ@x1n>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-lZLmaiLSApKEq4WKVRyx"
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+1e8d8dc6e835cf614345+7137+infradead.org+dwmw2@casper.srs.infradead.org;
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


--=-lZLmaiLSApKEq4WKVRyx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2023-03-09 at 11:55 -0500, Peter Xu wrote:
> On Thu, Mar 09, 2023 at 09:16:08AM +0000, David Woodhouse wrote:
> > The only IRQs that are handled fully in the kernel are events arriving
> > on some eventfd which is bound as an IRQFD to some IRQ in the KVM
> > routing table. (Mostly MSIs coming from VFIO).
> >=20
> > If we want to "pause" one of those, all we have to do is unbind the
> > IRQFD and then we can handle that eventfd in userspace instead. Which
> > is what we do *anyway* in the case where IRQFD support isn't available.
> >=20
> > In
> > https://lore.kernel.org/kvm/20201027143944.648769-1-dwmw2@infradead.org=
/
> > I *optimised* that dance, so userspace doesn't have to stop listening
> > on the eventfd when the IRQFD is bound; the IRQFD code consumes the
> > event first. But we can live without that in older kernels.
> >=20
> > Basically, it's just treating the IRQFD support as an *optimisation*,
> > and retaining the 'slow path' of handling the event in userspace and
> > injecting the resulting MSI.
> >=20
> > It's just that in that slow path, as we're translating and injecting
> > the MSI, we *also* update the IRQ routing table and reattach the IRQFD
> > for the next time that interrupt fires. Like a cache.
> >=20
> > And we stash an invalidation cookie (for Intel-IOMMU the IRTE index)
> > for each routing table entry, so that when asked to invalidate a
> > *range* of cookies (that's how the Intel IOMMU invalidate works), we
> > can just detach the IRQFD from those ones, letting them get handled in
> > userspace next time and retranslated (with associated fault report, as
> > appropriate).
>=20
> We can maintain a cookie per entry in the routing table in userspace, I
> think, and ignore those when applying to KVM (perhaps need to regenerate
> another table when applying?=C2=A0 As KVM won't recognize the cookies). B=
esides
> that, do we need other infrastructures to link this entry / GSI back to
> which device registers with it?=C2=A0 Since I assume we need to tear down=
 irqfds
> if there is, and rehook the event to an userspace handler here too.
>=20

KVM doesn't need to recognise the cookies. Only the userspace code
which handles the core IRQ routing table and the IRQFD assignment.

I *have* just abused some S390-based fields for the cookie and a
'stale' bit...

/* 64-bit cookie for IOMMU to use for invalidation choices */
#define ire_ir_cookie(ire) ((ire)->u.adapter.ind_offset)

/* Flags, to indicate a stale entry that needs retranslating */
#define ire_user_flags(ire) ((ire)->u.adapter.summary_offset)
#define IRE_USER_FLAG_STALE		1

... but it could be done in a separate data structure just as well.

Given a range of cookies to invalidate, the core code just detaches the
IRQFD for any entry in the KVM IRQ routing table that has a cookie
within that range.

> There're four devices that can hook onto this, IIUC.=C2=A0 Besides IOAPIC=
 and
> VFIO, there's also ivshmem and vhost.=C2=A0 IIUC we'll need to change all=
 the
> four devices to implement this.
>=20
> Besides the changeset (which seems to be still non-trivial to me.. withou=
t
> yet evaluating whether that'll be worth the effort), one concern I have
> right now is whether delaying the 1st irq would regress in any case.

It's fine. In QEMU you don't *have* to delay the first IRQ; you *can*
prepopulate the cache at the moment the guest programs a device's MSI
table, for example.

In a certain other implementation, we don't prepopulate so that first
IRQ does get handled in userspace every time, because we want to keep
track of whether a given MSI has *ever* fired or not. And there's been
absolutely no issue with that latency.

> I think you may have better knowledge here than me on how guest behaves i=
n
> IRQ subsystem.=C2=A0 For example, is there any case where IRQs can be mod=
ified /
> invalidated frequently (perhaps mask / unmask?)

Mask/unmask shouldn't invalidate the cache.=20

>  so there can be a lot of IRQs delivered slower than before? Because
> after this change the IRQ setup / cache overhead will be applied to
> the 1st IRQ being triggered rather than when IRQ was established /
> unmasked.

We've launched... a lot... of guests with this model and not seen any
issues :)

I'll knock up a prototype in QEMU and we can reason about it far more
coherently. I think it ends up actually being a simplification and
leading to easier-to-understand code.

> This also reminded me (just out of curiosity) on what will happen if
> without IR at all: say, what if a device setup a wrong MSI (with a messed
> up MSI data register) on bare metal?=C2=A0 Then, does QEMU properly emula=
te that
> too so far?

For the most past, MSI isn't special; it's *just* a memory write
transaction. Traditionally, we ask the device to write to some address
in the 0xFEExxxxx range, which happens not to be actual memory, but is
the APIC.

But if you want to just pin a data structure in memory, and give the
device the address of some 32-bit field in that data structure, then
*poll* for completion to see when the device wrote there... that's just
fine.

That would *generally* work in QEMU too, since we mostly raise MSI from
devices by doing that actual stl_le_phys() call.

The caveat is the "special" KVM way of encoding APIC IDs > 255, by
putting the high bits into the high bits of the 64-bit MSI target
address. That means that if handled as an actual memory transaction, it
would *miss* the APIC at 0x00000000FEExxxxx and really go to memory.

Which is why in some (post-translation) cases we have to treat it
"specially" as an MSI instead of just a memory write. Which I think is
actually the reason for that explicit kvm_set_irq() in ioapic_service()
which I mentioned at the start of this thread.

You'll note that when I added basically the same special case to
pci_msi_trigger() in commit 6096cf7877 I felt it warranted at least 5
lines of comment to explain itself :)






--=-lZLmaiLSApKEq4WKVRyx
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwMzA5MTk1NjA4WjAvBgkqhkiG9w0BCQQxIgQg6jop9HjQ
+VGBvRIgdmBqFGTjVGG4x3DGKG4308wim1gwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgAlUfY5Hio3AfoPgKk1pS0R+0N5BInhxyxy
EavDWbYlMXtkGoRs5cdwrI9vvC263y/DIlyq17U+UJiHX4pgMdTAbZlWO+RfMuCJC6H4RBFK5gA1
9sW58QiN3fvARxwx3eDViIsldisuB9HWDMjTzsHMI5atlobB8KdhbM3M2hzLNRf8YgaXhjRk8CmB
nBqEsCUr1zWdrJQ3k9xjHd6CyScpfnmbMfhoxCQ/D1RVuvMiFdZj2ZrMJMXnBAQGa/1SeuwWrvER
iKcBXZ0Nx/xRz+w8XpZm6H6bUjQrx722xa3OdgVauIyk/7Ssfc4p2QxdXfhNA57rxWBQ7UDVgymA
vplnartCGtdErolHjVsUR/P9SrrI20yJBOfTnSJj14EIYLMmuYHh4pjpNfw38i2zaqudRU70YInD
2AqRZ8HrJb6oyA/heMEOWW6ol2cNo/KxinYQLI+8YjiJ7KrOmCGzRetOzr/LZnt9LBgrZMfPyHXD
UWrOdiD/ZMPtCr9/N5kDUJRYb1XT6dfg/PL9gssVGJ7QwxNWnjeJMcCyexM4VxOevbaQOLVE9vtm
5zL92IJbcempjqo+KUFXceibIUUpVcDwjuaNB0zXkwB99JOBcml5Qmtxxs9PE3TIJH8gzCXFY9Dq
hFv1mvSNNNJElIqiE1wYp+HwdrpxxBdBroDgtjBQkgAAAAAAAA==


--=-lZLmaiLSApKEq4WKVRyx--


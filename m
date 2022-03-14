Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31CE4D8716
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:41:26 +0100 (CET)
Received: from localhost ([::1]:35206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTlsz-0000RD-Aq
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:41:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a709675fe440e0b94d32+6777+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1nTlZu-0007u1-3f
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:21:42 -0400
Received: from [2001:8b0:10b:1236::1] (port=41652 helo=casper.infradead.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a709675fe440e0b94d32+6777+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1nTlZq-0001Tg-TZ
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:21:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Tq2SPE0sk2iBj6KBASZcJlKjDfjC7JnhaUAAOnIJ5IM=; b=TVN6NdEsORThOMLC4Uw9EXZg5h
 HwD7OheUtCmJeqyX9xeNzO+x0K3ruo10cAs3L0WCp9Ej+hDJgQeEaEla6Z4aui9y78ZXa6XMpzcOl
 rvZIZEtSYbibg4K9pLK3Um1KP/hGCpZVt4LT/+odaxlmTo3UrhasGq4+0LeMOfrtQWLMTQL2u7iO/
 ZrWJkCEWaL2Z2SpPojG0Peh6xLRqWht93lqp7nlq5wif8EKOFTbGXwMxMpoyuNArK5owJWVu3l+Uo
 VCikwBgh4aOUFals+fzzJiOyPjGGjblbFtezVXmnnLSZ2K/EtfIgWOoEv+xt29JH0sin/N+mzzqiZ
 MjijlN1g==;
Received: from [2001:8b0:10b:1::3ae] (helo=u3832b3a9db3152.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTlZX-0047NS-Bm; Mon, 14 Mar 2022 14:21:19 +0000
Message-ID: <c7615d1093dac6367f33beda16b354e98737b269.camel@infradead.org>
Subject: Re: [PATCH] x86: q35: require split irqchip for large CPU count
From: David Woodhouse <dwmw2@infradead.org>
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Date: Mon, 14 Mar 2022 14:21:18 +0000
In-Reply-To: <Yi9BTkZIM3iZsvdK@redhat.com>
References: <20220311143901.96481-1-imammedo@redhat.com>
 <8d4912d595bcaca36013e22060c22c1bfe3c44c1.camel@infradead.org>
 <20220314113532.10518837@redhat.com>
 <0d0f10cf1e593be0fb4546749cd7ee11765accb5.camel@infradead.org>
 <Yi9BTkZIM3iZsvdK@redhat.com>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-wKnYQ9DdSjNWiM2RAuqx"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:8b0:10b:1236::1
 (failed)
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+a709675fe440e0b94d32+6777+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--=-wKnYQ9DdSjNWiM2RAuqx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2022-03-14 at 13:21 +0000, Daniel P. Berrang=C3=A9 wrote:
> On Mon, Mar 14, 2022 at 12:59:38PM +0000, David Woodhouse wrote:
> > On Mon, 2022-03-14 at 11:35 +0100, Igor Mammedov wrote:
> > > On Fri, 11 Mar 2022 14:58:41 +0000
> > > David Woodhouse <
> > > dwmw2@infradead.org
> > >=20
> > > > wrote:
> > > > On Fri, 2022-03-11 at 09:39 -0500, Igor Mammedov wrote:
> > > > > if VM is started with:
> > > > >=20
> > > > >    -enable-kvm -smp 256
> > > > >=20
> > > > > without specifying 'split' irqchip, VM might eventually boot
> > > > > but no more than 255 CPUs will be operational and following
> > > > > error messages in guest could be observed:
> > > > >    ...
> > > > >    smpboot: native_cpu_up: bad cpu 256
> > > > >    ...
> > > > > It's a regression introduced by [1], which removed dependency
> > > > > on intremap=3Don that were implicitly requiring 'split' irqchip
> > > > > and forgot to check for 'split' irqchip.
> > > > > Instead of letting VM boot a broken VM, error out and tell
> > > > > user how to fix CLI. =20
> > > >=20
> > > > Hm, wasn't that already fixed in the patches I posted in December?
> > >=20
> > > It might be, could you point to the commit/series that fixed it.
> >=20
> > https://lore.kernel.org/all/20211209220840.14889-1-dwmw2@infradead.org/
> >=20
> > is the patch I was thinking of, but although that moves the check to a
> > more useful place and fixes the X2APIC check, it *doesn't* include the
> > fix you're making; it's still using kvm_irqchip_in_kernel().
> >=20
> > I can change that and repost the series, which is still sitting (with
> > fixed Reviewed-By/Acked-By attributions that I screwed up last time) in
> > https://git.infradead.org/users/dwmw2/qemu.git
> >=20
> >=20
> > > Regardless of that, fixing it in recent kernels doesn't help
> > > as still supported kernels are still affected by it.
> > >=20
> > > If there is a way to detect that fix, I can add to q35 a compat
> > > property and an extra logic to enable kernel-irqchip if fix is presen=
t.
> > > Otherwise the fix does not exist until minimum supported kernel
> > > version reaches version where it was fixed.
> >=20
> > Hm, I'm not sure I follow here. Do you mean recent versions of *qemu*
> > when you say 'kernels'?=20
> >=20
> > I'm not even sure I agree with the observation that qemu should error
> > out here. The guest boots fine and the guest can even *use* all the
> > CPUs. IPIs etc. will all work fine. The only thing that doesn't work is
> > delivering *external* interrupts to CPUs above 254.
> >=20
> > Ultimately, this is the *guest's* problem. Some operating systems can
> > cope; some can't.
> >=20
> > The fact that *Linux* has a fundamental assumption that *all* CPUs can
> > receive all interrupts and that affinity can't be limited in hardware,
> > is a Linux problem. I tried to fix it once but it was distinctly non-
> > trivial and eventually I gave up and took a different approach.
> > https://lore.kernel.org/linux-iommu/87lfgj59mp.fsf@nanos.tec.linutronix=
.de/T/
> >=20
> >=20
> > But even if we 'fix' the check as you suggest to bail out and refuse to
> > boot a certain configuration because Linux guest wouldn't be able to
> > fully utilize it... Even if we boot with the split IRQ chip and the 15-
> > bit MSI enlightenment, we're still in the same position. Some guests
> > will be able to use it; some won't.
> >=20
> > In fact, there are operating systems that don't even know about X2APIC.
> >=20
> > Why should qemu refuse to even start up?
>=20
> We've generally said QEMU should not reject / block startup of valid
> hardware configurations, based on existance of bugs in certain guest
> OS, if the config would be valid for other guest.

Right, so I think the patches I sent in December are sufficient to fix
the existing bugs there. I'll repost them shortly.

In particular, I just rechecked that we aren't advertising the
KVM_FEATURE_MSI_EXT_DEST_ID feature unless we have the *split* irq
chip, which is correct. So we'll expose vCPUs with higher APIC IDs to
guests without any way to target *external* interrupts at them, and
that *might* mean that some guests refuse to use those vCPUs at all,
but that's just fine, and we don't advertise anything that isn't
working correctly.







--=-wKnYQ9DdSjNWiM2RAuqx
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjIwMzE0MTQyMTE4WjAvBgkqhkiG9w0BCQQxIgQgDDlwlF5N
JjPO1+4VIQ26ntlmAFR8rw9WPp1YWaRMGQwwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgCW81MkRI4psKRxOuQgM3u9H70oUzZ3Bpgv
f/TqQnkCfDldziXPKtHJu0/a+EtXQK4SlTX3GOmw9fVAufDt8XK+v3d2f/j+dBfxTikK9OW2D23n
tXqMH37n69N+cF1YGZRPPTY9WU/1ULRRx9C6kmlz8ZXGRu85noWzUPWJIddhhfuCXNm4x+NQlPou
5uLXOlh/FYO5UsU77BUloOFi0cG2TjYY+dLisHvs2bkreEL5X2VVlOFtbjht2mjIc2jq1Xtcfvqx
MJ5yowmSaBxL7F+C8KMlppAXTjbKU78MrLIlDC4vcfhmzfK/g6RjkqPeax5WNot2kXCQb4d9IWDg
8lckJkunOPPU2pZEeNePVi6stC0V6DiwV7kNkChLWKTiSRvAPh26NiOf8GF5v88Ibjo8S2wZAnKr
/mpk84oOQBXM7B4uV9msUE6i4TkKrJRJHuGHu/htgZlRaZU9ha0YIuKHOx5ABoAFWFc/GJZh1PzD
egumH0Pg3f7jyeMm1wUs7MJ2ST2WVRsMJElqeWJzeWK6JJUR32zTiJZTQW7P7QLiH8avcPjQXtwd
+kAoS9Ef9s8jh1flsMKPavnShePkKV2T7VG9PYNH7MIwFkx30OveOuHJ5XvzAiZISgKZ/s3ruJBE
X+Ie5esdCkZR8K/3c3hvHVvhm/69qfbxNFYSiJ7glAAAAAAAAA==


--=-wKnYQ9DdSjNWiM2RAuqx--



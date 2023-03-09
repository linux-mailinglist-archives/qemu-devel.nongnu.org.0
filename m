Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0096B1EC5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 09:52:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paBzw-00089M-Re; Thu, 09 Mar 2023 03:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1e8d8dc6e835cf614345+7137+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1paBzu-000895-4A
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:51:38 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1e8d8dc6e835cf614345+7137+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1paBzr-00029V-3x
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:51:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=BczBGrW9FtZm7UMHWziccKT1ChDSv/tlXb/p0af78Bs=; b=k0obpc88CAKKXcLGnwJnyYB80M
 UYMoodLkPZd8Cd8Qafd+OpaSPxu30fghmgI3ielIOlgyQoLlcnkyxWSO8njGIOU89nXqdgJPVoeTn
 QgKeeVwP1B4gXX7O3wHBJlY9lV9SRYylRIjAhWwTL7jJ1PMJxJadQU1uhSDFVkpMn0fdq7osxgnfI
 WRxl649xtgzYGjMibOWScr10otFsezAoJIrdifWEPd9IuQg0KUvsbWg6qJc7+7SObA68HzeM4VAZf
 vtO4zH9cX5wMbbZaltpNaqV83xeUmFOf43P7cfywENbNI2z4K5H2NYMj5vyhGEsRRc2cIIEdUSaKZ
 /g3PoKWw==;
Received: from [2001:8b0:10b:5:e62f:87cb:46b1:1399]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1paBzT-008FcS-Nh; Thu, 09 Mar 2023 08:51:12 +0000
Message-ID: <0d64ec92287c268727f6bdc7b5723d57a397e1bb.camel@infradead.org>
Subject: Re: [PATCH v2 2/3] tests/avocado: Add Fedora 34 distro, including
 kernel/initrd checksums
From: David Woodhouse <dwmw2@infradead.org>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Cleber Rosa <crosa@redhat.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>,  Beraldo Leal <bleal@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,  "Michael S.
 Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org
Date: Thu, 09 Mar 2023 08:51:10 +0000
In-Reply-To: <c9959d02928c14a3e93f9419099a08102887b887.camel@infradead.org>
References: <20230308111952.2728440-1-dwmw2@infradead.org>
 <20230308111952.2728440-3-dwmw2@infradead.org> <87pm9jnnmo.fsf@linaro.org>
 <c9959d02928c14a3e93f9419099a08102887b887.camel@infradead.org>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-8z/RI4jUBftMtDVTahht"
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


--=-8z/RI4jUBftMtDVTahht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-03-08 at 19:20 +0000, David Woodhouse wrote:
> On Wed, 2023-03-08 at 17:42 +0000, Alex Benn=C3=A9e wrote:
> > Why slightly newer rather than current release?
> >
> > Our existing Fedora guest builds cause all sorts of timeout issues
> > running under TCG and seem particularly heavyweight considering the
> > coverage we manage to get.
>
> Yeah, I spent a happy afternoon playing with this; I think you may have
> observed some of it on IRC. Although I kept some of the naughtier words
> to my side of the keyboard. From memory...

So...

            '34': {
                'x86_64':
                {'checksum': ('b9b621b26725ba95442d9a56cbaa0547'
                              '84e0779a9522ec6eafff07c6e6f717ea'),
                 'pxeboot_url': ('https://archives.fedoraproject.org/'
                                 'pub/archive/fedora/linux/releases/34/'
                                 'Everything/x86_64/os/images/pxeboot/'),
                 'kernel_hash': ('085fc6e47f2e3a271b591f3e56739ca9'
                                 '4c16718837a5f431ab95468e1e95f9eb'),
                 'initrd_hash': ('d6cd2e03e8188eed6c896fd65ff05f81'
                                 '2c4c1c8777d630b5909e9a1a4627e337'),
                 'kernel_params': ('root=3DUUID=3D386769a3-cfa5-47c8-8797-'
                                   'd5ec58c9cb6c ro no_timer_check '
                                   'net.ifnames=3D0 console=3Dtty1 '
                                   'console=3DttyS0,115200n8'),
                },
            },
            '36': {
                'x86_64':
                {'checksum': ('ca9e514cc2f4a7a0188e7c68af60eb4e'
                              '573d2e6850cc65b464697223f46b4605'),
                 'pxeboot_url': ('https://archives.fedoraproject.org/'
                                 'pub/archive/fedora/linux/releases/36/'
                                 'Everything/x86_64/os/images/pxeboot/'),
                 'kernel_hash': ('f5d8162b1e086f1a9d09d3d2c6decdbe'
                                 'c84d7020cde4b6f32a98f21eacc8cf3b'),
                 'initrd_hash': ('2c8a9d3f0b607f86422a0df8227106c0'
                                 '847eb4a4f15bade77b1abbc3228533c6'),
                 'kernel_params': ('root=3DUUID=3D737459fa-eab9-4d8f-9a14-'
                                   'c8c32d403c08 ro rootflags=3Dsubvol=3Dro=
ot '
                                   'no_timer_check net.ifnames=3D0 '
                                   'console=3Dtty1 console=3DttyS0,115200n8=
'),
                },
            },
            '37': {
                'x86_64':
                {'checksum': ('b5b9bec91eee65489a5745f6ee620573'
                              'b23337cbb1eb4501ce200b157a01f3a0'),
                 'pxeboot_url': ('https://archives.fedoraproject.org/'
                                 'pub/fedora/linux/releases/37/'
                                 'Everything/x86_64/os/images/pxeboot/'),
                 'kernel_hash': ('2bd5f834349313d10a9dbeb41d9f71d9'
                                 '85f7b9c4f7e2ba750a1dd6558f082ba9'),
                 'initrd_hash': ('8b7e91d6f14353217ed44a98802b0fef'
                                 'b190ab1ce38a96166da87d629ab39bef'),
                 'kernel_params': ('root=3DUUID=3D3975d5e5-e66a-44c3-90f7-'
                                   'dc2d1c7859d1 ro rootflags=3Dsubvol=3Dro=
ot '
                                   'no_timer_check net.ifnames=3D0 '
                                   'console=3Dtty1 console=3DttyS0,115200n8=
'),
                },
            },
        }

Fedora 36 does work (since I'm not actually trying to install anything
inside the guest any more, and I'm sure that *would* be a surmountable
problem if we bothered to investigate and fix up the repo config). It's
about 10 seconds slower per test than Fedora 34 was.

Fedora 37 fails thus:

2023-03-09 08:25:17,072 datadrainer      L0193 DEBUG| -----END SSH HOST KEY=
 KEYS-----
2023-03-09 08:25:17,081 datadrainer      L0193 DEBUG| [   49.036621] cloud-=
init[1550]: 2023-03-09 08:25:16,989 - util.py[WARNING]: Running module phon=
e-home (<module 'cloudinit.config.cc_phone_home' from '/usr/lib/python3.11/=
site-packages/cloudinit/config/cc_phone_home.py'>) failed
2023-03-09 08:25:17,101 datadrainer      L0193 DEBUG| [   49.055528] cloud-=
init[1550]: Cloud-init v. 22.2 finished at Thu, 09 Mar 2023 08:25:16 +0000.=
 Datasource DataSourceNoCloud [seed=3D/dev/sda][dsmode=3Dnet].  Up 49.04 se=
conds
2023-03-09 08:25:17,203 datadrainer      L0193 DEBUG| [FAILED] Failed to st=
art cloud-fina=E2=80=A6 Execute cloud user/final scripts.

Full log at http://david.woodhou.se/job-2023-03-09T08.20-d57f30d.log

I've made the other changes (mostly xen_guest =E2=86=92 kvm_xen_guest) and
pushed to my branch at=20
https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv


--=-8z/RI4jUBftMtDVTahht
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwMzA5MDg1MTEwWjAvBgkqhkiG9w0BCQQxIgQgp70GPggd
g8TwGf8KHXd4N34pD4OokMItzVh80+cNm4cwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgCrDR8PahRrc6pK1pvvfLR1Dn8zHwqm+9A3
47FMur4ftbBOffGAjjWJYYXxjtZ8NkKgnQ7WQkjVUrKmregB9WKdd8KN+S5IrZmloFRf//LfEenc
rVJwXH7pF7v+Jfn0XPYI8rxO1sUyTZtSN8IKzkTYwEapgS1OKEQny2qfrQTlA2zy2wrqzUuaBtiL
mCailcDhu+2IJK1u3QvmCFaM5qvKf2FUtSwk4/E+QfMhA3J0IvAqylp86Wknl8/J7Tn6cQHp3BCw
BgPw8apCmJjjEx8mWuzVebh00vsTAkmtQhejHur+MDR/3LStW9jn4aaPkbihG3IEItH4EYYZNA3I
0/9kBY90moAOsih1neCPS6Byiqk79cwbpBWNn2Iz5guzyaXogIe97jP9IMXUmx8kiLa1d3R/O6Wo
4osATfLkLFx5QFvDmuAWPTYW38l0GiDz3wNhqtL1t76PfrlXjG0z5zdt/sRQl7APACgwr1jfQz+8
O4L3JYkFAK1xDfol8NHmPw5EvuWphhZkTdX7/iWEEexUsUSzhO2mPdJAXWduCvNYZM44juWXFsm+
5C9zqHHlmjF911bRy4aHvAe3XW+GeyHpnlnBTixkSxiKqrt3Ut4xXJ7Ch49sCaBqD8MeOS8zQ+Vv
PhbWBXkXT+Cl0YWeKJAVlssRw2eN+iRH62tB97TbNgAAAAAAAA==


--=-8z/RI4jUBftMtDVTahht--


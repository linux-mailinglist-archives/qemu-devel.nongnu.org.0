Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D886A0B5B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:58:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVC79-0006Dt-9W; Thu, 23 Feb 2023 08:58:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+add43774a78fc16fb9e5+7123+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pVC77-0006Dc-Af
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:58:25 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+add43774a78fc16fb9e5+7123+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pVC75-0003sY-BG
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:58:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=KIvkkcopIQpve3Wxx4oRyGY0Zco+B+tfs+JhNe9e15Q=; b=e5vR6qEbYnx9MpZah8x/1fZkx/
 fozNbRWzPqyII+bqp9/GMr8wNPIWmZ3LLtv3sL7YLOPYN3D7+mqKu1ft35eL1C1C5d9g6AOU84A11
 VDT14+AsfojMPzo9jthUoYH7PALtZIkUcuZqrI0zofprN4p1RXjvxtQ2P574qLl9CVnMSZHKf73TK
 8E6QYFAKQUrBY0GOlA4WTY1N5C86drWpBCCfvoNwZJe+AJ/lNXVmsf/NGX/Dj0aEbigpUZd4KJ225
 4pZwC/iuYWid2L6NXpXdoP3xpmbig2VHL40R9VcBGByMZBYpcOMkechCQFkPBlAkbP3Lm7E1zT6AO
 DgUFltJA==;
Received: from [2001:8b0:10b:5::bb3] (helo=u3832b3a9db3152.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pVC73-00EPcv-FW; Thu, 23 Feb 2023 13:58:22 +0000
Message-ID: <b165dad29e723e7538c3bacd9c782ac62b3e40aa.camel@infradead.org>
Subject: Re: [PATCH v2 1/5] build: deprecate --enable-gprof builds and
 remove from CI
From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, Alex
 =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Stefan
 Hajnoczi <stefanha@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Fabiano Rosas <farosas@suse.de>, "Daniel P
 ." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Date: Thu, 23 Feb 2023 13:58:21 +0000
In-Reply-To: <20230207201447.566661-2-thuth@redhat.com>
References: <20230207201447.566661-1-thuth@redhat.com>
 <20230207201447.566661-2-thuth@redhat.com>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-O3VqErdPt7TyxPoa+AFP"
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+add43774a78fc16fb9e5+7123+infradead.org+dwmw2@casper.srs.infradead.org;
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


--=-O3VqErdPt7TyxPoa+AFP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2023-02-07 at 21:14 +0100, Thomas Huth wrote:
> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>=20
> As gprof relies on instrumentation you rarely get useful data compared
> to a real optimised build. Lets deprecate the build option and
> simplify the CI configuration as a result.
>=20
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1338
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20230131094224.861621-1-alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
> =C2=A0docs/about/deprecated.rst=C2=A0 | 14 ++++++++++++++
> =C2=A0meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 ++++++-
> =C2=A0.gitlab-ci.d/buildtest.yml | 19 ++++---------------
> =C2=A0meson_options.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 3 ++-
> =C2=A04 files changed, 26 insertions(+), 17 deletions(-)
>=20
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index da2e6fe63d..9317046177 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -20,6 +20,20 @@ they were first deprecated in the 2.10.0 release.
> =C2=A0What follows is a list of all features currently marked as
> =C2=A0deprecated.
> =C2=A0
> +Build options
> +-------------
> +
> +``gprof`` builds (since 8.0)
> +''''''''''''''''''''''''''''
> +
> +The ``--enable-gprof`` configure setting relies on compiler
> +instrumentation to gather its data which can distort the generated
> +profile. As other non-instrumenting tools are available that give a
> +more holistic view of the system with non-instrumented binaries we are
> +deprecating the build option and no longer defend it in CI. The

I'm not sure I understand the verb 'defend' in that sentence?

> +``--enable-gcov`` build option remains for analysis test case
> +coverage.
> +
> =C2=A0System emulator command line arguments
> =C2=A0--------------------------------------
> =C2=A0
> diff --git a/meson.build b/meson.build
> index 4ba3bf3431..bc60bf3c4c 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3784,7 +3784,12 @@ summary_info +=3D {'mutex debugging':=C2=A0=C2=A0 =
get_option('debug_mutex')}
> =C2=A0summary_info +=3D {'memory allocator':=C2=A0 get_option('malloc')}
> =C2=A0summary_info +=3D {'avx2 optimization': config_host_data.get('CONFI=
G_AVX2_OPT')}
> =C2=A0summary_info +=3D {'avx512f optimization': config_host_data.get('CO=
NFIG_AVX512F_OPT')}
> -summary_info +=3D {'gprof enabled':=C2=A0=C2=A0=C2=A0=C2=A0 get_option('=
gprof')}
> +if get_option('gprof')
> +=C2=A0 gprof_info =3D 'YES (deprecated)'
> +else
> +=C2=A0 gprof_info =3D get_option('gprof')
> +endif
> +summary_info +=3D {'gprof':=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 gprof_info}
> =C2=A0summary_info +=3D {'gcov':=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_option('b_coverage')}
> =C2=A0summary_info +=3D {'thread sanitizer':=C2=A0 config_host.has_key('C=
ONFIG_TSAN')}
> =C2=A0summary_info +=3D {'CFI support':=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 get_option('cfi')}
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 0aa149a352..8f332fc36f 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -467,27 +467,16 @@ tsan-build:
> =C2=A0=C2=A0=C2=A0=C2=A0 TARGETS: x86_64-softmmu ppc64-softmmu riscv64-so=
ftmmu x86_64-linux-user
> =C2=A0=C2=A0=C2=A0=C2=A0 MAKE_CHECK_ARGS: bench V=3D1
> =C2=A0
> -# gprof/gcov are GCC features
> -build-gprof-gcov:
> +# gcov is a GCC features

Nit: "is a GCC feature". Other than that, FWIW,

Reviewed-by: David Woodhouse <dwmw2@infradead.org>


> +gcov:
> =C2=A0=C2=A0 extends: .native_build_job_template
> =C2=A0=C2=A0 needs:
> =C2=A0=C2=A0=C2=A0=C2=A0 job: amd64-ubuntu2004-container
> +=C2=A0 timeout: 80m
> =C2=A0=C2=A0 variables:
> =C2=A0=C2=A0=C2=A0=C2=A0 IMAGE: ubuntu2004
> -=C2=A0=C2=A0=C2=A0 CONFIGURE_ARGS: --enable-gprof --enable-gcov
> +=C2=A0=C2=A0=C2=A0 CONFIGURE_ARGS: --enable-gcov
> =C2=A0=C2=A0=C2=A0=C2=A0 TARGETS: aarch64-softmmu ppc64-softmmu s390x-sof=
tmmu x86_64-softmmu
> -=C2=A0 artifacts:
> -=C2=A0=C2=A0=C2=A0 expire_in: 1 days
> -=C2=A0=C2=A0=C2=A0 paths:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - build
> -
> -check-gprof-gcov:
> -=C2=A0 extends: .native_test_job_template
> -=C2=A0 needs:
> -=C2=A0=C2=A0=C2=A0 - job: build-gprof-gcov
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 artifacts: true
> -=C2=A0 variables:
> -=C2=A0=C2=A0=C2=A0 IMAGE: ubuntu2004
> =C2=A0=C2=A0=C2=A0=C2=A0 MAKE_CHECK_ARGS: check
> =C2=A0=C2=A0 after_script:
> =C2=A0=C2=A0=C2=A0=C2=A0 - cd build
> diff --git a/meson_options.txt b/meson_options.txt
> index 559a571b6b..53459c15fc 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -316,7 +316,8 @@ option('debug_stack_usage', type: 'boolean', value: f=
alse,
> =C2=A0option('qom_cast_debug', type: 'boolean', value: false,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: 'cast debugging s=
upport')
> =C2=A0option('gprof', type: 'boolean', value: false,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: 'QEMU profiling with g=
prof')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: 'QEMU profiling with g=
prof',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 deprecated: true)
> =C2=A0option('profiler', type: 'boolean', value: false,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: 'profiler support=
')
> =C2=A0option('slirp_smbd', type : 'feature', value : 'auto',


--=-O3VqErdPt7TyxPoa+AFP
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwMjIzMTM1ODIxWjAvBgkqhkiG9w0BCQQxIgQgH70i50S9
tAQRTDqT8O4ukhypNtZWNlb47EGXiCap4iAwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgAZvTpdHTvzw0tuTdktKZMqXMhyJHRx1mmd
6ApMFhw7J0cYqGf9PSS/WrZiiWKKm+Th7H6KcVhjSSJYv8d0gSBnO4CXGqy28zJnpX/I2XLNqaeO
v/sPUQADNt2aAhE3nGElECf39GM1Q2rZxTMJpxKnIARgssog0K/dyyrlwJdskuaMrVWZdmyxOW+R
aJfAysgyKgbCIPvT8R+q3IV4HCxNBLq3KsGVTQnfRHOaMfo677+ioL5sRuElCwYhrXeKJfNqtuQn
PCzoFJaIeQjykYmpQI1P8BtN2+EFRU3oW/8jpAdkdjmQudWjeVK8u10bRRYne36y8FkYCK9biHMN
D5A9mvLIfMrFtz1EIUzNgboWsikBfYwwf3oKzajWLiEAAyjfVZrnCJ7FgJPHvEMPJEvfuLFMXWCm
0BVg1159mr6dYzL4XWbXjFwDRFxsl+V8hT0YK+7d5zbw0PmbZCDhj3Ku1kMy8EsjH6S2MBgq96GF
LzbyhUPYTdiIlyOHwPXRBgtZ5JaLG5eUflPJxOMQ5J8hakQThsncbkHumOZRDYo3G39wDkvTMKTB
rFEoDtoPWpb17yJ2RipMrt4WQbzl8t7mM7w4RfEuSUnOD8ZLcC2/c0aad2LzImJLhclVjnunZmM0
kJlgbi4SQG6zjyFCD9jtx2kyVyo2EhZqw5ibYFn3XAAAAAAAAA==


--=-O3VqErdPt7TyxPoa+AFP--


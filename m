Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E0D427834
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 10:55:15 +0200 (CEST)
Received: from localhost ([::1]:45502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZ88P-0003nP-Vc
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 04:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mZ865-00025Z-KT
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 04:52:49 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mZ863-000480-P0
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 04:52:49 -0400
Received: by mail-wr1-x430.google.com with SMTP id m22so37116068wrb.0
 for <qemu-devel@nongnu.org>; Sat, 09 Oct 2021 01:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xsV6bRt3GeylI8HAMSi63UItARmV41b4t9endUe9eJ4=;
 b=G382moG4EKE+wNVzYwruNTlyNClNB2jkOl3r6iUWpjH+I/d6XAVkcRbdJTOCHAf93b
 QMIBbZtN8u6Cdv2hg1qJHSXTnjOdR7eLLLDAST0BW9gRXMUux0ZelLihfnYmhO1CPBkp
 T8336YYXPym5CHj9+gTsIO+TG8Qp4I03sZG1UZ8NROWs5LhLN8GUe3JkmhFD4K6Xot9O
 o0FHqUoxTb3TXoIbgRNieSrItDhRMWgka/o5AS5/lPl0AyD5ukK/28SAra00+0X22qgG
 iPVQiHx0gkfdefoY+zazBvhtEEq7v0I2NeDEgIT+aWyMSF7J2X6c1fxSdVjI2jW5J0Zd
 uI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xsV6bRt3GeylI8HAMSi63UItARmV41b4t9endUe9eJ4=;
 b=ERWxYPUMr7GnUB5rt7PxCKQI0z2vSzyijRhDxXnODuwPjxMwwvt/Tj/L1Q+3qh45yk
 YIVLDthXQErc3l9dk/0mFUmEVdmrnzILbc+qCJZEK0YJwH4ATDc4gkmt18NU3VmNaryq
 UZEtBZGekFYKXTpo86EGahtRQmV2xSQw8avhwTlaLMeI5lLusStQOQpB7I0ESIgGLrXt
 uryRg1fzH1FTlnw2LA9DNNbQ8UCHQYBmYqkDgSe7bNgXuVaA0av7tR6moGT0LV4TTUz9
 0qZxWY0izinOBmXRe1hUwDvCIgAkIGERwEsJ6ryFAGuIuZzYCJOuZMUrnvzRuFfVhXnR
 BmAw==
X-Gm-Message-State: AOAM531hXIGmnpu/2v8cs6SSups/hDhEb1GP72s5Z6kfH5NpRuURbCtr
 dIWvb676+QDzVn+HEfQtiA41qjf2GqxpA1fB5dTOFvRo
X-Google-Smtp-Source: ABdhPJw2VZftsEdF+ZrIITODg2AAKjagxyvo6l6pa+lGZPBEAnCyxyMYo/rG1GmKGDKTpQDExnz4zWzNdbiEOICf6IY=
X-Received: by 2002:a1c:3b44:: with SMTP id i65mr8696004wma.129.1633769565219; 
 Sat, 09 Oct 2021 01:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211008220620.1488179-1-marcandre.lureau@redhat.com>
 <20211008220620.1488179-5-marcandre.lureau@redhat.com>
In-Reply-To: <20211008220620.1488179-5-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sat, 9 Oct 2021 12:52:33 +0400
Message-ID: <CAJ+F1CKTBb40=skwiPdcXNB75tNTnzOOOxiqre6N9DaZtma3Dg@mail.gmail.com>
Subject: Re: [PATCH 4/6] meson: remove explicit extensions dependency file list
To: QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000946f5f05cde79eb6"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000946f5f05cde79eb6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sat, Oct 9, 2021 at 2:09 AM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> This is now generated automatically by depfile.py.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  docs/meson.build              | 10 ----------
>  tests/qapi-schema/meson.build |  5 ++++-
>  2 files changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/docs/meson.build b/docs/meson.build
> index be4dc30f39..6177c967ff 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -37,15 +37,6 @@ endif
>  if build_docs
>    SPHINX_ARGS +=3D ['-Dversion=3D' + meson.project_version(), '-Drelease=
=3D' +
> config_host['PKGVERSION']]
>
> -  sphinx_extn_depends =3D [ meson.current_source_dir() /
> 'sphinx/depfile.py',
> -                          meson.current_source_dir() / 'sphinx/hxtool.py=
',
> -                          meson.current_source_dir() /
> 'sphinx/kerneldoc.py',
> -                          meson.current_source_dir() /
> 'sphinx/kernellog.py',
> -                          meson.current_source_dir() /
> 'sphinx/qapidoc.py',
> -                          meson.current_source_dir() /
> 'sphinx/qmp_lexer.py',
> -                          qapi_gen_depends ]
> -  sphinx_template_files =3D [ meson.project_source_root() /
> 'docs/_templates/footer.html' ]
> -
>    have_ga =3D have_tools and config_host.has_key('CONFIG_GUEST_AGENT')
>
>    man_pages =3D {
> @@ -77,7 +68,6 @@ if build_docs
>                  output: 'docs.stamp',
>                  input: files('conf.py'),
>                  depfile: 'docs.d',
> -                depend_files: [ sphinx_extn_depends,
> sphinx_template_files ],
>                  command: [SPHINX_ARGS, '-Ddepfile=3D@DEPFILE@',
>                            '-Ddepfile_stamp=3D@OUTPUT0@',
>                            '-b', 'html', '-d', private_dir,
> diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.buil=
d
> index df5acfd08b..a5eae6253f 100644
> --- a/tests/qapi-schema/meson.build
> +++ b/tests/qapi-schema/meson.build
> @@ -241,7 +241,8 @@ if build_docs
>                                 output: ['doc-good.txt'],
>                                 input: files('doc-good.json',
> 'doc-good.rst'),
>                                 build_by_default: true,
> -                               depend_files: sphinx_extn_depends,
> +                               output: 'docs.stamp',
>

This line should be removed (it breaks the test)

+                               depfile: 'docs.d',
>                                 # We use -E to suppress Sphinx's caching,
> because
>                                 # we want it to always really run the QAP=
I
> doc
>                                 # generation code. It also means we don't
> @@ -250,6 +251,8 @@ if build_docs
>                                           '-b', 'text', '-E',
>                                           '-c',
> meson.project_source_root() / 'docs',
>                                           '-D', 'master_doc=3Ddoc-good',
> +                                         '-Ddepfile=3D@DEPFILE@',
> +                                         '-Ddepfile_stamp=3D@OUTPUT0@',
>                                           meson.current_source_dir(),
>                                           meson.current_build_dir()])
>
> --
> 2.33.0.721.g106298f7f9
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000946f5f05cde79eb6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGk8YnI+PC9kaXY+PGJyPjxkaXYgY2xhc3M9
ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gU2F0LCBP
Y3QgOSwgMjAyMSBhdCAyOjA5IEFNICZsdDs8YSBocmVmPSJtYWlsdG86bWFyY2FuZHJlLmx1cmVh
dUByZWRoYXQuY29tIj5tYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb208L2E+Jmd0OyB3cm90ZTo8
YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBw
eCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3Bh
ZGRpbmctbGVmdDoxZXgiPkZyb206IE1hcmMtQW5kcsOpIEx1cmVhdSAmbHQ7PGEgaHJlZj0ibWFp
bHRvOm1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPm1hcmNhbmRy
ZS5sdXJlYXVAcmVkaGF0LmNvbTwvYT4mZ3Q7PGJyPg0KPGJyPg0KVGhpcyBpcyBub3cgZ2VuZXJh
dGVkIGF1dG9tYXRpY2FsbHkgYnkgZGVwZmlsZS5weS48YnI+DQo8YnI+DQpTaWduZWQtb2ZmLWJ5
OiBNYXJjLUFuZHLDqSBMdXJlYXUgJmx0OzxhIGhyZWY9Im1haWx0bzptYXJjYW5kcmUubHVyZWF1
QHJlZGhhdC5jb20iIHRhcmdldD0iX2JsYW5rIj5tYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb208
L2E+Jmd0Ozxicj4NCi0tLTxicj4NCsKgZG9jcy9tZXNvbi5idWlsZMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHwgMTAgLS0tLS0tLS0tLTxicj4NCsKgdGVzdHMvcWFwaS1zY2hlbWEvbWVzb24uYnVpbGQg
fMKgIDUgKysrKy08YnI+DQrCoDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxMSBk
ZWxldGlvbnMoLSk8YnI+DQo8YnI+DQpkaWZmIC0tZ2l0IGEvZG9jcy9tZXNvbi5idWlsZCBiL2Rv
Y3MvbWVzb24uYnVpbGQ8YnI+DQppbmRleCBiZTRkYzMwZjM5Li42MTc3Yzk2N2ZmIDEwMDY0NDxi
cj4NCi0tLSBhL2RvY3MvbWVzb24uYnVpbGQ8YnI+DQorKysgYi9kb2NzL21lc29uLmJ1aWxkPGJy
Pg0KQEAgLTM3LDE1ICszNyw2IEBAIGVuZGlmPGJyPg0KwqBpZiBidWlsZF9kb2NzPGJyPg0KwqAg
wqBTUEhJTlhfQVJHUyArPSBbJiMzOTstRHZlcnNpb249JiMzOTsgKyBtZXNvbi5wcm9qZWN0X3Zl
cnNpb24oKSwgJiMzOTstRHJlbGVhc2U9JiMzOTsgKyBjb25maWdfaG9zdFsmIzM5O1BLR1ZFUlNJ
T04mIzM5O11dPGJyPg0KPGJyPg0KLcKgIHNwaGlueF9leHRuX2RlcGVuZHMgPSBbIG1lc29uLmN1
cnJlbnRfc291cmNlX2RpcigpIC8gJiMzOTtzcGhpbngvZGVwZmlsZS5weSYjMzk7LDxicj4NCi3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBtZXNvbi5jdXJyZW50X3NvdXJj
ZV9kaXIoKSAvICYjMzk7c3BoaW54L2h4dG9vbC5weSYjMzk7LDxicj4NCi3CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBtZXNvbi5jdXJyZW50X3NvdXJjZV9kaXIoKSAvICYj
Mzk7c3BoaW54L2tlcm5lbGRvYy5weSYjMzk7LDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBtZXNvbi5jdXJyZW50X3NvdXJjZV9kaXIoKSAvICYjMzk7c3BoaW54
L2tlcm5lbGxvZy5weSYjMzk7LDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBtZXNvbi5jdXJyZW50X3NvdXJjZV9kaXIoKSAvICYjMzk7c3BoaW54L3FhcGlkb2Mu
cHkmIzM5Oyw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbWVz
b24uY3VycmVudF9zb3VyY2VfZGlyKCkgLyAmIzM5O3NwaGlueC9xbXBfbGV4ZXIucHkmIzM5Oyw8
YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcWFwaV9nZW5fZGVw
ZW5kcyBdPGJyPg0KLcKgIHNwaGlueF90ZW1wbGF0ZV9maWxlcyA9IFsgbWVzb24ucHJvamVjdF9z
b3VyY2Vfcm9vdCgpIC8gJiMzOTtkb2NzL190ZW1wbGF0ZXMvZm9vdGVyLmh0bWwmIzM5OyBdPGJy
Pg0KLTxicj4NCsKgIMKgaGF2ZV9nYSA9IGhhdmVfdG9vbHMgYW5kIGNvbmZpZ19ob3N0Lmhhc19r
ZXkoJiMzOTtDT05GSUdfR1VFU1RfQUdFTlQmIzM5Oyk8YnI+DQo8YnI+DQrCoCDCoG1hbl9wYWdl
cyA9IHs8YnI+DQpAQCAtNzcsNyArNjgsNiBAQCBpZiBidWlsZF9kb2NzPGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBvdXRwdXQ6ICYjMzk7ZG9jcy5zdGFtcCYjMzk7LDxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgaW5wdXQ6IGZpbGVzKCYjMzk7Y29uZi5weSYjMzk7KSw8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRlcGZpbGU6ICYjMzk7ZG9jcy5kJiMzOTssPGJy
Pg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGRlcGVuZF9maWxlczogWyBzcGhpbnhfZXh0bl9k
ZXBlbmRzLCBzcGhpbnhfdGVtcGxhdGVfZmlsZXMgXSw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGNvbW1hbmQ6IFtTUEhJTlhfQVJHUywgJiMzOTstRGRlcGZpbGU9QERFUEZJTEVAJiMz
OTssPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmIzM5Oy1E
ZGVwZmlsZV9zdGFtcD1AT1VUUFVUMEAmIzM5Oyw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCYjMzk7LWImIzM5OywgJiMzOTtodG1sJiMzOTssICYjMzk7LWQm
IzM5OywgcHJpdmF0ZV9kaXIsPGJyPg0KZGlmZiAtLWdpdCBhL3Rlc3RzL3FhcGktc2NoZW1hL21l
c29uLmJ1aWxkIGIvdGVzdHMvcWFwaS1zY2hlbWEvbWVzb24uYnVpbGQ8YnI+DQppbmRleCBkZjVh
Y2ZkMDhiLi5hNWVhZTYyNTNmIDEwMDY0NDxicj4NCi0tLSBhL3Rlc3RzL3FhcGktc2NoZW1hL21l
c29uLmJ1aWxkPGJyPg0KKysrIGIvdGVzdHMvcWFwaS1zY2hlbWEvbWVzb24uYnVpbGQ8YnI+DQpA
QCAtMjQxLDcgKzI0MSw4IEBAIGlmIGJ1aWxkX2RvY3M8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBvdXRwdXQ6IFsmIzM5O2RvYy1nb29kLnR4dCYj
Mzk7XSw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBpbnB1dDogZmlsZXMoJiMzOTtkb2MtZ29vZC5qc29uJiMzOTssICYjMzk7ZG9jLWdvb2QucnN0
JiMzOTspLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIGJ1aWxkX2J5X2RlZmF1bHQ6IHRydWUsPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGVwZW5kX2ZpbGVzOiBzcGhpbnhfZXh0bl9kZXBlbmRz
LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG91
dHB1dDogJiMzOTtkb2NzLnN0YW1wJiMzOTssPGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rp
dj48ZGl2PlRoaXMgbGluZSBzaG91bGQgYmUgcmVtb3ZlZCAoaXQgYnJlYWtzIHRoZSB0ZXN0KTwv
ZGl2PjxkaXY+IDxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxl
PSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQs
MjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBkZXBmaWxlOiAmIzM5O2RvY3MuZCYjMzk7LDxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICMgV2UgdXNlIC1FIHRv
IHN1cHByZXNzIFNwaGlueCYjMzk7cyBjYWNoaW5nLCBiZWNhdXNlPGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgIyB3ZSB3YW50IGl0IHRvIGFsd2F5
cyByZWFsbHkgcnVuIHRoZSBRQVBJIGRvYzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgICMgZ2VuZXJhdGlvbiBjb2RlLiBJdCBhbHNvIG1lYW5zIHdl
IGRvbiYjMzk7dDxicj4NCkBAIC0yNTAsNiArMjUxLDggQEAgaWYgYnVpbGRfZG9jczxicj4NCsKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgICYjMzk7LWImIzM5OywgJiMzOTt0ZXh0JiMzOTssICYjMzk7LUUmIzM5Oyw8YnI+DQrCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmIzM5Oy1jJiMzOTssIG1lc29uLnByb2plY3Rfc291cmNlX3Jvb3QoKSAvICYjMzk7ZG9jcyYj
Mzk7LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgICYjMzk7LUQmIzM5OywgJiMzOTttYXN0ZXJfZG9jPWRvYy1nb29kJiMz
OTssPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgJiMzOTstRGRlcGZpbGU9QERFUEZJTEVAJiMzOTssPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
JiMzOTstRGRlcGZpbGVfc3RhbXA9QE9VVFBVVDBAJiMzOTssPGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbWVzb24uY3Vy
cmVudF9zb3VyY2VfZGlyKCksPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbWVzb24uY3VycmVudF9idWlsZF9kaXIoKV0p
PGJyPg0KPGJyPg0KLS0gPGJyPg0KMi4zMy4wLjcyMS5nMTA2Mjk4ZjdmOTxicj4NCjxicj4NCjxi
cj4NCjwvYmxvY2txdW90ZT48L2Rpdj48YnIgY2xlYXI9ImFsbCI+PGJyPi0tIDxicj48ZGl2IGRp
cj0ibHRyIiBjbGFzcz0iZ21haWxfc2lnbmF0dXJlIj5NYXJjLUFuZHLDqSBMdXJlYXU8YnI+PC9k
aXY+PC9kaXY+DQo=
--000000000000946f5f05cde79eb6--


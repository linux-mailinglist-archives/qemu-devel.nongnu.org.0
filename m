Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1264E5E6BDA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 21:40:15 +0200 (CEST)
Received: from localhost ([::1]:34316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obS3S-00078T-4H
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 15:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obRyR-0007Tv-5b
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:35:04 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:37646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obRyN-0003B5-FN
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:35:01 -0400
Received: by mail-lf1-x12a.google.com with SMTP id k10so16374505lfm.4
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 12:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=WQS2JjbaOA90Knfr3zXHSClgoEG0hhHFfnBbIcQZ6Ws=;
 b=O5OFutGWgh8EUdEQ90PMCjEerk04xfcke0UI5mmNCxwdiQ2mUamAc3Dq9ihY6WXbhK
 AuJI6icmj/ncFG52HWGqypdYKwukzT6f53Tknv0Eg7G2Ur2XKjVJGL0mdW+9Fbo7QLGT
 amht6fKeplkXXO+lwYl5So4QKctKEIZe6GKh9DqRzIaBrohS2Nhxuqan1GF2sn3tqh54
 SmrDw1/6HtgpvDTvK4CfMRQsl47YkXC0JGN92Piz4HblQvssPUysPqBeIXXXAPb76wn6
 u+4yNsssdYAm9x80b1n/Sy91sg9RQt4hGVrHKDR7syGFY16GphPyOHW0LbYhw5u2N30z
 6gcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=WQS2JjbaOA90Knfr3zXHSClgoEG0hhHFfnBbIcQZ6Ws=;
 b=KmlBg1CR2bhTv84KPpxg3M2e7TVSN0bl2WlKT+7DOx9POl/ckx9RGwfc+I30X8ZpOK
 slEXEPracRAqRr36U9/0gUmyjnUm6zkRnTOyH1UcTx+HdiOG+ZpV2lqH+ZrnzeZ9jv44
 wyFL3VOAREic9S/ssoUGurLjDHKuFH124YLs358HB0zDjpa8R3JJONaTfCtax9NvOA2f
 F+TuOSNX6230dyeFklPB9DIEbgOaBeqjXNum2PBodmr19Z5z5IysEsTBkeRW0e09SUpl
 7fihx25DmKTIzyfj6vY9T+Tbp1cZF4cIgtRlS72TCNV9/9SEaPSfhz82mA/y1EX52LWr
 OZ+Q==
X-Gm-Message-State: ACrzQf2McHZ6ZRM43VVEy0qHPYeF0oT1wEpIsY3MOwJUGEWBlyjPpFoB
 fvecZQ1AWpS6uiqw9HMpDUE/6qbG/9ADyncqft8=
X-Google-Smtp-Source: AMsMyM72XhU2y53T3iQLdkDuDL65oenfzOux6LpSW+NTb2Oi+lJ6MQCRSY+lFCsnjG7Et376koToM8Qwse10ybk3A3Q=
X-Received: by 2002:a05:6512:6c9:b0:49a:51d4:d517 with SMTP id
 u9-20020a05651206c900b0049a51d4d517mr1938955lff.329.1663875296466; Thu, 22
 Sep 2022 12:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-3-bmeng.cn@gmail.com>
In-Reply-To: <20220920103159.1865256-3-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 22 Sep 2022 21:34:44 +0200
Message-ID: <CAJ+F1CKeLpJReJ3VrowY2=QVDPCHSAJGGzzVKiA7V_U_uKy=WQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/39] tests/qtest: i440fx-test: Rewrite
 create_blob_file() to be portable
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ff1d2905e9492708"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ff1d2905e9492708
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Sep 20, 2022 at 12:56 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Previously request_{bios, pflash} cases were skipped on win32, mainly
> due to create_blob_file() calling mmap() which does not exist on win32.
> This rewirtes create_blob_file() to be portable, so that we can enable
> these cases on Windows.
>
> Suggested-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v2:
> - new patch: "tests/qtest: i440fx-test: Rewrite create_blob_file() to be
> portable"
>
>  tests/qtest/i440fx-test.c | 53 +++++++++++----------------------------
>  1 file changed, 14 insertions(+), 39 deletions(-)
>
> diff --git a/tests/qtest/i440fx-test.c b/tests/qtest/i440fx-test.c
> index 3890f1237c..202bc6022c 100644
> --- a/tests/qtest/i440fx-test.c
> +++ b/tests/qtest/i440fx-test.c
> @@ -278,8 +278,6 @@ static void test_i440fx_pam(gconstpointer opaque)
>      qtest_end();
>  }
>
> -#ifndef _WIN32
> -
>  #define BLOB_SIZE ((size_t)65536)
>  #define ISA_BIOS_MAXSZ ((size_t)(128 * 1024))
>
> @@ -290,44 +288,25 @@ static void test_i440fx_pam(gconstpointer opaque)
>   */
>  static char *create_blob_file(void)
>  {
> -    int ret, fd;
> +    int i, fd;
>      char *pathname;
> -    GError *error =3D NULL;
> +    GError *error;
>

Bad change, please keep "error =3D NULL".

+    g_autofree uint8_t *buf =3D g_malloc(BLOB_SIZE);
>
> -    ret =3D -1;
> +    error =3D NULL;
>

Not necessary then


>      fd =3D g_file_open_tmp("blob_XXXXXX", &pathname, &error);
> -    if (fd =3D=3D -1) {
> -        fprintf(stderr, "unable to create blob file: %s\n",
> error->message);
> -        g_error_free(error);
> -    } else {
> -        if (ftruncate(fd, BLOB_SIZE) =3D=3D -1) {
> -            fprintf(stderr, "ftruncate(\"%s\", %zu): %s\n", pathname,
> -                    BLOB_SIZE, strerror(errno));
> -        } else {
> -            void *buf;
> -
> -            buf =3D mmap(NULL, BLOB_SIZE, PROT_WRITE, MAP_SHARED, fd, 0)=
;
> -            if (buf =3D=3D MAP_FAILED) {
> -                fprintf(stderr, "mmap(\"%s\", %zu): %s\n", pathname,
> BLOB_SIZE,
> -                        strerror(errno));
> -            } else {
> -                size_t i;
> -
> -                for (i =3D 0; i < BLOB_SIZE; ++i) {
> -                    ((uint8_t *)buf)[i] =3D i;
> -                }
> -                munmap(buf, BLOB_SIZE);
> -                ret =3D 0;
> -            }
> -        }
> -        close(fd);
> -        if (ret =3D=3D -1) {
> -            unlink(pathname);
> -            g_free(pathname);
> -        }
> +    g_assert_no_error(error);
> +    close(fd);
> +
> +    for (i =3D 0; i < BLOB_SIZE; i++) {
> +        buf[i] =3D i;
>      }
>
> -    return ret =3D=3D -1 ? NULL : pathname;
> +    error =3D NULL;
>

Not necessary either.


> +    g_file_set_contents(pathname, (char *)buf, BLOB_SIZE, &error);
> +    g_assert_no_error(error);
> +
> +    return pathname;
>  }
>
>  static void test_i440fx_firmware(FirmwareTestFixture *fixture,
> @@ -398,8 +377,6 @@ static void request_pflash(FirmwareTestFixture
> *fixture,
>      fixture->is_bios =3D false;
>  }
>
> -#endif /* _WIN32 */
> -
>  int main(int argc, char **argv)
>  {
>      TestData data;
> @@ -410,10 +387,8 @@ int main(int argc, char **argv)
>
>      qtest_add_data_func("i440fx/defaults", &data, test_i440fx_defaults);
>      qtest_add_data_func("i440fx/pam", &data, test_i440fx_pam);
> -#ifndef _WIN32
>      add_firmware_test("i440fx/firmware/bios", request_bios);
>      add_firmware_test("i440fx/firmware/pflash", request_pflash);
> -#endif
>
>      return g_test_run();
>  }
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ff1d2905e9492708
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 20, 2022 at 12:56 =
PM Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fro=
m: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank"=
>bin.meng@windriver.com</a>&gt;<br>
<br>
Previously request_{bios, pflash} cases were skipped on win32, mainly<br>
due to create_blob_file() calling mmap() which does not exist on win32.<br>
This rewirtes create_blob_file() to be portable, so that we can enable<br>
these cases on Windows.<br>
<br>
Suggested-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau=
@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
Changes in v2:<br>
- new patch: &quot;tests/qtest: i440fx-test: Rewrite create_blob_file() to =
be portable&quot;<br>
<br>
=C2=A0tests/qtest/i440fx-test.c | 53 +++++++++++---------------------------=
-<br>
=C2=A01 file changed, 14 insertions(+), 39 deletions(-)<br>
<br>
diff --git a/tests/qtest/i440fx-test.c b/tests/qtest/i440fx-test.c<br>
index 3890f1237c..202bc6022c 100644<br>
--- a/tests/qtest/i440fx-test.c<br>
+++ b/tests/qtest/i440fx-test.c<br>
@@ -278,8 +278,6 @@ static void test_i440fx_pam(gconstpointer opaque)<br>
=C2=A0 =C2=A0 =C2=A0qtest_end();<br>
=C2=A0}<br>
<br>
-#ifndef _WIN32<br>
-<br>
=C2=A0#define BLOB_SIZE ((size_t)65536)<br>
=C2=A0#define ISA_BIOS_MAXSZ ((size_t)(128 * 1024))<br>
<br>
@@ -290,44 +288,25 @@ static void test_i440fx_pam(gconstpointer opaque)<br>
=C2=A0 */<br>
=C2=A0static char *create_blob_file(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 int ret, fd;<br>
+=C2=A0 =C2=A0 int i, fd;<br>
=C2=A0 =C2=A0 =C2=A0char *pathname;<br>
-=C2=A0 =C2=A0 GError *error =3D NULL;<br>
+=C2=A0 =C2=A0 GError *error;<br></blockquote><div><br></div><div>Bad chang=
e, please keep &quot;error =3D NULL&quot;.</div><div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 g_autofree uint8_t *buf =3D g_malloc(BLOB_SIZE);<br>
<br>
-=C2=A0 =C2=A0 ret =3D -1;<br>
+=C2=A0 =C2=A0 error =3D NULL;<br></blockquote><div><br></div><div>Not nece=
ssary then<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
=C2=A0 =C2=A0 =C2=A0fd =3D g_file_open_tmp(&quot;blob_XXXXXX&quot;, &amp;pa=
thname, &amp;error);<br>
-=C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;unable to create blob fi=
le: %s\n&quot;, error-&gt;message);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_error_free(error);<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ftruncate(fd, BLOB_SIZE) =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;ftruncate(=
\&quot;%s\&quot;, %zu): %s\n&quot;, pathname,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BLOB=
_SIZE, strerror(errno));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *buf;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D mmap(NULL, BLOB_SIZE, PR=
OT_WRITE, MAP_SHARED, fd, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (buf =3D=3D MAP_FAILED) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &q=
uot;mmap(\&quot;%s\&quot;, %zu): %s\n&quot;, pathname, BLOB_SIZE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 strerror(errno));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t i;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &l=
t; BLOB_SIZE; ++i) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((ui=
nt8_t *)buf)[i] =3D i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 munmap(buf, BLOB_S=
IZE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unlink(pathname);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(pathname);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 g_assert_no_error(error);<br>
+=C2=A0 =C2=A0 close(fd);<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; BLOB_SIZE; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf[i] =3D i;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 return ret =3D=3D -1 ? NULL : pathname;<br>
+=C2=A0 =C2=A0 error =3D NULL;<br></blockquote><div><br></div><div>Not nece=
ssary either.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
+=C2=A0 =C2=A0 g_file_set_contents(pathname, (char *)buf, BLOB_SIZE, &amp;e=
rror);<br>
+=C2=A0 =C2=A0 g_assert_no_error(error);<br>
+<br>
+=C2=A0 =C2=A0 return pathname;<br>
=C2=A0}<br>
<br>
=C2=A0static void test_i440fx_firmware(FirmwareTestFixture *fixture,<br>
@@ -398,8 +377,6 @@ static void request_pflash(FirmwareTestFixture *fixture=
,<br>
=C2=A0 =C2=A0 =C2=A0fixture-&gt;is_bios =3D false;<br>
=C2=A0}<br>
<br>
-#endif /* _WIN32 */<br>
-<br>
=C2=A0int main(int argc, char **argv)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0TestData data;<br>
@@ -410,10 +387,8 @@ int main(int argc, char **argv)<br>
<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_data_func(&quot;i440fx/defaults&quot;, &amp;d=
ata, test_i440fx_defaults);<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_data_func(&quot;i440fx/pam&quot;, &amp;data, =
test_i440fx_pam);<br>
-#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0add_firmware_test(&quot;i440fx/firmware/bios&quot;, req=
uest_bios);<br>
=C2=A0 =C2=A0 =C2=A0add_firmware_test(&quot;i440fx/firmware/pflash&quot;, r=
equest_pflash);<br>
-#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0return g_test_run();<br>
=C2=A0}<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"></div><br><div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div></div>

--000000000000ff1d2905e9492708--


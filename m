Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCF25E6CB3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 22:08:12 +0200 (CEST)
Received: from localhost ([::1]:58302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obSUV-0008Vr-Ln
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 16:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obSPW-0003uO-CB; Thu, 22 Sep 2022 16:03:02 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:34760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obSPU-0005Xb-BO; Thu, 22 Sep 2022 16:03:02 -0400
Received: by mail-lj1-x22f.google.com with SMTP id h3so12332855lja.1;
 Thu, 22 Sep 2022 13:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=tBoZpW8vBjIUBlFVj7owvoMZqn6AqeCHW+4bEjOdvvI=;
 b=E9McbJP0FMixCBEPr6SXho3stf86J81CY/UW0gGRvYf0k+vMLJN5Ykr0186qqiTSjC
 TfBXDNX/lmEYcDLP8fd0nzhNILm/mE+BB12RmY2gaiHD19wk05lSH7XKtgt/IY4vqxQP
 /2BNYG6L1ewDLnPzgMX8iwOp7YTIEYSGB/fCqLFDrdmdQO6S5krBvdeLOzr003kuVHBn
 btXcxQst4E/QWaQNr4rXTnH9uSpt+PgsemGkU4PqgmwpaGjD1ByGZBeUr0XsoBFWiRbY
 aN8xpojGLyiPUSe0CtnMAvye8RPO7etqYIfPWxxRBMmKhAR5dkm118GR8TOD2jnOmSVv
 MUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=tBoZpW8vBjIUBlFVj7owvoMZqn6AqeCHW+4bEjOdvvI=;
 b=MF2tlDENs+d4Vgmce3OIaImx/pyva/fQqoanFYqnlMJQHhoaapUFYh4VqAgtksSgje
 bBWnIlbh5BsFthXCHEln7EIl4fnwlvK7G6HwkkrjRYnWONAtYMLpNVVmsA6en2jFXoZR
 0cMD1TA7wdkeevfQsXKAoUT6c8UwaT3KHs1otS877p/CplaaTq+6lGldBOmSW9g7IKSX
 PdRlXEipb0n4QQrXFwtB0b/hUUMyQlVNHG5d3Ideb1+cQ65GzqwVbhaiBQybR1Xx/wEo
 q0+mk5TD5rmuCSmcuNKU2nyPgquQ230C70MiGrXEJ+hfXavpVQvJv1SprFOacSwaXI7T
 /7/Q==
X-Gm-Message-State: ACrzQf2bOgPXSKq1nalyaj7XL1vY7mM3Dj6z1LVkasbG6bAjLBwbT4Z3
 hxOkRdhSfDkO0Wk4fzNlvKLZfHuGnrR21DyhEng=
X-Google-Smtp-Source: AMsMyM6QHbNyu+Ypdjx9M73xW3INxsdLV7norRlj1dXmXpE5jytSQCLLUNckVkqecMJbQwssLRBNKGGhj2ZO8ioofqI=
X-Received: by 2002:a2e:a607:0:b0:26c:42c8:13af with SMTP id
 v7-20020a2ea607000000b0026c42c813afmr1611578ljp.267.1663876978195; Thu, 22
 Sep 2022 13:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-21-bmeng.cn@gmail.com>
In-Reply-To: <20220920103159.1865256-21-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 22 Sep 2022 22:02:46 +0200
Message-ID: <CAJ+F1CJADsVjhEyLZUkU5HaNma13xOo7Fy8MUtesmRxMsWgK3A@mail.gmail.com>
Subject: Re: [PATCH v2 20/39] tests/qtest: {ahci, ide}-test: Use relative path
 for temporary files for win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000003c41c205e9498cca"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22f.google.com
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

--0000000000003c41c205e9498cca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Sep 20, 2022 at 1:50 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> These test cases uses "blkdebug:path/to/config:path/to/image" for
> testing. On Windows, absolute file paths contain the delimiter ':'
> which causes the blkdebug filename parser fail to parse filenames.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

I don't have a much better solution to propose at this point (to actually
use a temp directory), so:
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
> (no changes since v1)
>
>  tests/qtest/ahci-test.c | 21 ++++++++++++++++++---
>  tests/qtest/ide-test.c  | 20 ++++++++++++++++++--
>  2 files changed, 36 insertions(+), 5 deletions(-)
>
> diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
> index 00524f14c6..c57576b08c 100644
> --- a/tests/qtest/ahci-test.c
> +++ b/tests/qtest/ahci-test.c
> @@ -1833,7 +1833,7 @@ static void create_ahci_io_test(enum IOMode type,
> enum AddrMode addr,
>
>  int main(int argc, char **argv)
>  {
> -    const char *arch;
> +    const char *arch, *base;
>      int ret;
>      int fd;
>      int c;
> @@ -1871,8 +1871,22 @@ int main(int argc, char **argv)
>          return 0;
>      }
>
> +    /*
> +     * "base" stores the starting point where we create temporary files.
> +     *
> +     * On Windows, this is set to the relative path of current working
> +     * directory, because the absolute path causes the blkdebug filename
> +     * parser fail to parse "blkdebug:path/to/config:path/to/image".
> +     */
> +#ifndef _WIN32
> +    base =3D g_get_tmp_dir();
> +#else
> +    base =3D ".";
> +#endif
> +
>      /* Create a temporary image */
> -    fd =3D g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
> +    tmp_path =3D g_strdup_printf("%s/qtest.XXXXXX", base);
> +    fd =3D g_mkstemp(tmp_path);
>      g_assert(fd >=3D 0);
>      if (have_qemu_img()) {
>          imgfmt =3D "qcow2";
> @@ -1889,7 +1903,8 @@ int main(int argc, char **argv)
>      close(fd);
>
>      /* Create temporary blkdebug instructions */
> -    fd =3D g_file_open_tmp("qtest-blkdebug.XXXXXX", &debug_path, NULL);
> +    debug_path =3D g_strdup_printf("%s/qtest-blkdebug.XXXXXX", base);
> +    fd =3D g_mkstemp(debug_path);
>      g_assert(fd >=3D 0);
>      close(fd);
>
> diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
> index 25302be6dc..5e3e28aea2 100644
> --- a/tests/qtest/ide-test.c
> +++ b/tests/qtest/ide-test.c
> @@ -1011,16 +1011,32 @@ static void test_cdrom_dma(void)
>
>  int main(int argc, char **argv)
>  {
> +    const char *base;
>      int fd;
>      int ret;
>
> +    /*
> +     * "base" stores the starting point where we create temporary files.
> +     *
> +     * On Windows, this is set to the relative path of current working
> +     * directory, because the absolute path causes the blkdebug filename
> +     * parser fail to parse "blkdebug:path/to/config:path/to/image".
> +     */
> +#ifndef _WIN32
> +    base =3D g_get_tmp_dir();
> +#else
> +    base =3D ".";
> +#endif
> +
>      /* Create temporary blkdebug instructions */
> -    fd =3D g_file_open_tmp("qtest-blkdebug.XXXXXX", &debug_path, NULL);
> +    debug_path =3D g_strdup_printf("%s/qtest-blkdebug.XXXXXX", base);
> +    fd =3D g_mkstemp(debug_path);
>      g_assert(fd >=3D 0);
>      close(fd);
>
>      /* Create a temporary raw image */
> -    fd =3D g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
> +    tmp_path =3D g_strdup_printf("%s/qtest.XXXXXX", base);
> +    fd =3D g_mkstemp(tmp_path);
>      g_assert(fd >=3D 0);
>      ret =3D ftruncate(fd, TEST_IMAGE_SIZE);
>      g_assert(ret =3D=3D 0);
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000003c41c205e9498cca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 20, 2022 at 1:50 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.m=
eng@windriver.com</a>&gt;<br>
<br>
These test cases uses &quot;blkdebug:path/to/config:path/to/image&quot; for=
<br>
testing. On Windows, absolute file paths contain the delimiter &#39;:&#39;<=
br>
which causes the blkdebug filename parser fail to parse filenames.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>I don&#39;t have a much better solution to propose at this point (to a=
ctually use a temp directory), so:<br></div><div>Reviewed-by: Marc-Andr=C3=
=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lur=
eau@redhat.com</a>&gt;</div><div>=C2=A0<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
---<br>
<br>
(no changes since v1)<br>
<br>
=C2=A0tests/qtest/ahci-test.c | 21 ++++++++++++++++++---<br>
=C2=A0tests/qtest/ide-test.c=C2=A0 | 20 ++++++++++++++++++--<br>
=C2=A02 files changed, 36 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c<br>
index 00524f14c6..c57576b08c 100644<br>
--- a/tests/qtest/ahci-test.c<br>
+++ b/tests/qtest/ahci-test.c<br>
@@ -1833,7 +1833,7 @@ static void create_ahci_io_test(enum IOMode type, enu=
m AddrMode addr,<br>
<br>
=C2=A0int main(int argc, char **argv)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 const char *arch;<br>
+=C2=A0 =C2=A0 const char *arch, *base;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
=C2=A0 =C2=A0 =C2=A0int fd;<br>
=C2=A0 =C2=A0 =C2=A0int c;<br>
@@ -1871,8 +1871,22 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* &quot;base&quot; stores the starting point where we =
create temporary files.<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* On Windows, this is set to the relative path of curr=
ent working<br>
+=C2=A0 =C2=A0 =C2=A0* directory, because the absolute path causes the blkd=
ebug filename<br>
+=C2=A0 =C2=A0 =C2=A0* parser fail to parse &quot;blkdebug:path/to/config:p=
ath/to/image&quot;.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+#ifndef _WIN32<br>
+=C2=A0 =C2=A0 base =3D g_get_tmp_dir();<br>
+#else<br>
+=C2=A0 =C2=A0 base =3D &quot;.&quot;;<br>
+#endif<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Create a temporary image */<br>
-=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;tmp_pa=
th, NULL);<br>
+=C2=A0 =C2=A0 tmp_path =3D g_strdup_printf(&quot;%s/qtest.XXXXXX&quot;, ba=
se);<br>
+=C2=A0 =C2=A0 fd =3D g_mkstemp(tmp_path);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0if (have_qemu_img()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imgfmt =3D &quot;qcow2&quot;;<br>
@@ -1889,7 +1903,8 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Create temporary blkdebug instructions */<br>
-=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest-blkdebug.XXXXXX&quot;, &a=
mp;debug_path, NULL);<br>
+=C2=A0 =C2=A0 debug_path =3D g_strdup_printf(&quot;%s/qtest-blkdebug.XXXXX=
X&quot;, base);<br>
+=C2=A0 =C2=A0 fd =3D g_mkstemp(debug_path);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
<br>
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c<br>
index 25302be6dc..5e3e28aea2 100644<br>
--- a/tests/qtest/ide-test.c<br>
+++ b/tests/qtest/ide-test.c<br>
@@ -1011,16 +1011,32 @@ static void test_cdrom_dma(void)<br>
<br>
=C2=A0int main(int argc, char **argv)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 const char *base;<br>
=C2=A0 =C2=A0 =C2=A0int fd;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* &quot;base&quot; stores the starting point where we =
create temporary files.<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* On Windows, this is set to the relative path of curr=
ent working<br>
+=C2=A0 =C2=A0 =C2=A0* directory, because the absolute path causes the blkd=
ebug filename<br>
+=C2=A0 =C2=A0 =C2=A0* parser fail to parse &quot;blkdebug:path/to/config:p=
ath/to/image&quot;.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+#ifndef _WIN32<br>
+=C2=A0 =C2=A0 base =3D g_get_tmp_dir();<br>
+#else<br>
+=C2=A0 =C2=A0 base =3D &quot;.&quot;;<br>
+#endif<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Create temporary blkdebug instructions */<br>
-=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest-blkdebug.XXXXXX&quot;, &a=
mp;debug_path, NULL);<br>
+=C2=A0 =C2=A0 debug_path =3D g_strdup_printf(&quot;%s/qtest-blkdebug.XXXXX=
X&quot;, base);<br>
+=C2=A0 =C2=A0 fd =3D g_mkstemp(debug_path);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Create a temporary raw image */<br>
-=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;tmp_pa=
th, NULL);<br>
+=C2=A0 =C2=A0 tmp_path =3D g_strdup_printf(&quot;%s/qtest.XXXXXX&quot;, ba=
se);<br>
+=C2=A0 =C2=A0 fd =3D g_mkstemp(tmp_path);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0ret =3D ftruncate(fd, TEST_IMAGE_SIZE);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(ret =3D=3D 0);<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000003c41c205e9498cca--


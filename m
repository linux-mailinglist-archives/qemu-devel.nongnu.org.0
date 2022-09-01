Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC0E5A9398
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 11:51:01 +0200 (CEST)
Received: from localhost ([::1]:40708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTgqg-0004St-ML
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 05:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTg2D-0008KT-FE; Thu, 01 Sep 2022 04:58:50 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:37809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTg2B-0004tq-8s; Thu, 01 Sep 2022 04:58:49 -0400
Received: by mail-lj1-x230.google.com with SMTP id x10so17156505ljq.4;
 Thu, 01 Sep 2022 01:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=I3VjSvHY4x7IrA8cHRrPTOfZ8KZ23PgLHjjX/0GNjNs=;
 b=QYviNA39L7z91NVXMxVREczbXXve6U9yGdq/tGWXnho2SyIDcT64NPNtO5rdFLKOrs
 CS1zotG5keXni99lnqymMbxiXranc3KcCZeStTC7TTJ0wbrI85RWDSjaid+YsNrD3CPO
 zJ3W6qv3tQOPTkVSntbbCk4t2O7j4zQaKcvRELDIA0+4wmzbJVdzENsnDHWKQxGV9vmP
 6SKmSJN6ORu5gxH4RnaiO7MsZs5A/4MmAzQQiiRMbMlt2ApHbfLQ+w2OCOPbNQ6aVkr4
 Q3GE2C0ju9Alx15KkIc16laKc8Z8/9ySUeGpAjqBRi2C2yoYx/hVk7Gq6NdlzQ9gAO1A
 D08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=I3VjSvHY4x7IrA8cHRrPTOfZ8KZ23PgLHjjX/0GNjNs=;
 b=vDQ1iapQTkE+5N8zbr/JEm+wOTyJywGswAwnMK2llSgvQ4Zj6JBbLK8V4mrvv4wz01
 +o8m0H4ZnAJSWOH6Bun0h8GzsutRMVkTTYISOFxx4Kuft94B64oOhncTmfRTrTG35Snn
 HEqV+9biV5steiBTjz6Lc8SWnYR5UjJJ0/aLGYS+d7Xh/colSuaMXEogNuBpLpN0THA9
 TssmETb0uHhpnDnNev0dql1rgKOD/YAXdR1cPSvZ2CjirTV+Pd9Tjq72DteRtq7o5Cvd
 GM7AwnprVDK8qPT+AFQS3xRY2GN7vf4DOlizpQZL8/LSV2Cw0PcIpBU3USJqjp8xTIqP
 tUYA==
X-Gm-Message-State: ACgBeo2XRWwS9N1fTuow2KTie2QqcAdWm12N3X8jdV4taGattG4Ex+Sn
 oPWI7em4ay8kqzh5QyFyle75WG4Mc+mtFya+xKI=
X-Google-Smtp-Source: AA6agR7TKLEOwt3crJR1llhejizz/eTbwyfokLdRlLz3UomNJpEEi82cEymvind6GROHPrE4YdRp3RurDZyPhtvHG1I=
X-Received: by 2002:a2e:a789:0:b0:267:917b:401b with SMTP id
 c9-20020a2ea789000000b00267917b401bmr3400990ljf.452.1662022725192; Thu, 01
 Sep 2022 01:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-34-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-34-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 1 Sep 2022 12:58:33 +0400
Message-ID: <CAJ+F1CKLkBXFXToPZ_DtQShA+EYHCKWUsWcZ3zwx_v5o2-o+JQ@mail.gmail.com>
Subject: Re: [PATCH 33/51] tests/qtest: {ahci, ide}-test: Use relative path
 for temporary files
To: Bin Meng <bmeng.cn@gmail.com>, Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000024d08c05e799d203"
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000024d08c05e799d203
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 2:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> These test cases uses "blkdebug:path/to/config:path/to/image" for
> testing. On Windows, absolute file paths contain the delimiter ':'
> which causes the blkdebug filename parser fail to parse filenames.
>
>
hmm.. maybe it should learn to escape paths..


Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  tests/qtest/ahci-test.c | 19 ++++++++++++++++---
>  tests/qtest/ide-test.c  | 18 ++++++++++++++++--
>  2 files changed, 32 insertions(+), 5 deletions(-)
>
> diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
> index 0e88cd0eef..bce9ff770c 100644
> --- a/tests/qtest/ahci-test.c
> +++ b/tests/qtest/ahci-test.c
> @@ -1848,7 +1848,7 @@ static void create_ahci_io_test(enum IOMode type,
> enum AddrMode addr,
>
>  int main(int argc, char **argv)
>  {
> -    const char *arch;
> +    const char *arch, *base;
>      int ret;
>      int fd;
>      int c;
> @@ -1886,8 +1886,21 @@ int main(int argc, char **argv)
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
>

Meanwhile, that seems reasonable. Perhaps chdir() to the temporary
directory first? (assuming other paths are absolute)


> +
>      /* Create a temporary image */
> -    tmp_path =3D g_strdup_printf("%s/qtest.XXXXXX", g_get_tmp_dir());
> +    tmp_path =3D g_strdup_printf("%s/qtest.XXXXXX", base);
>      fd =3D mkstemp(tmp_path);
>      g_assert(fd >=3D 0);
>      if (have_qemu_img()) {
> @@ -1905,7 +1918,7 @@ int main(int argc, char **argv)
>      close(fd);
>
>      /* Create temporary blkdebug instructions */
> -    debug_path =3D g_strdup_printf("%s/qtest-blkdebug.XXXXXX",
> g_get_tmp_dir());
> +    debug_path =3D g_strdup_printf("%s/qtest-blkdebug.XXXXXX", base);
>      fd =3D mkstemp(debug_path);
>      g_assert(fd >=3D 0);
>      close(fd);
> diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
> index ebbf8e0126..c5cad6c0be 100644
> --- a/tests/qtest/ide-test.c
> +++ b/tests/qtest/ide-test.c
> @@ -1011,17 +1011,31 @@ static void test_cdrom_dma(void)
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
> -    debug_path =3D g_strdup_printf("%s/qtest-blkdebug.XXXXXX",
> g_get_tmp_dir());
> +    debug_path =3D g_strdup_printf("%s/qtest-blkdebug.XXXXXX", base);
>      fd =3D mkstemp(debug_path);
>      g_assert(fd >=3D 0);
>      close(fd);
>
>      /* Create a temporary raw image */
> -    tmp_path =3D g_strdup_printf("%s/qtest.XXXXXX", g_get_tmp_dir());
> +    tmp_path =3D g_strdup_printf("%s/qtest.XXXXXX", base);
>      fd =3D mkstemp(tmp_path);
>      g_assert(fd >=3D 0);
>      ret =3D ftruncate(fd, TEST_IMAGE_SIZE);
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000024d08c05e799d203
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 2:55 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
These test cases uses &quot;blkdebug:path/to/config:path/to/image&quot; for=
<br>
testing. On Windows, absolute file paths contain the delimiter &#39;:&#39;<=
br>
which causes the blkdebug filename parser fail to parse filenames.<br>
<br></blockquote><div><br></div><div>hmm.. maybe it should learn to escape =
paths..</div><div><br></div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
=C2=A0tests/qtest/ahci-test.c | 19 ++++++++++++++++---<br>
=C2=A0tests/qtest/ide-test.c=C2=A0 | 18 ++++++++++++++++--<br>
=C2=A02 files changed, 32 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c<br>
index 0e88cd0eef..bce9ff770c 100644<br>
--- a/tests/qtest/ahci-test.c<br>
+++ b/tests/qtest/ahci-test.c<br>
@@ -1848,7 +1848,7 @@ static void create_ahci_io_test(enum IOMode type, enu=
m AddrMode addr,<br>
<br>
=C2=A0int main(int argc, char **argv)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 const char *arch;<br>
+=C2=A0 =C2=A0 const char *arch, *base;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
=C2=A0 =C2=A0 =C2=A0int fd;<br>
=C2=A0 =C2=A0 =C2=A0int c;<br>
@@ -1886,8 +1886,21 @@ int main(int argc, char **argv)<br>
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
+#endif<br></blockquote><div><br></div><div>Meanwhile, that seems reasonabl=
e. Perhaps chdir() to the temporary directory first? (assuming other paths =
are absolute)</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
+<br>
=C2=A0 =C2=A0 =C2=A0/* Create a temporary image */<br>
-=C2=A0 =C2=A0 tmp_path =3D g_strdup_printf(&quot;%s/qtest.XXXXXX&quot;, g_=
get_tmp_dir());<br>
+=C2=A0 =C2=A0 tmp_path =3D g_strdup_printf(&quot;%s/qtest.XXXXXX&quot;, ba=
se);<br>
=C2=A0 =C2=A0 =C2=A0fd =3D mkstemp(tmp_path);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0if (have_qemu_img()) {<br>
@@ -1905,7 +1918,7 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Create temporary blkdebug instructions */<br>
-=C2=A0 =C2=A0 debug_path =3D g_strdup_printf(&quot;%s/qtest-blkdebug.XXXXX=
X&quot;, g_get_tmp_dir());<br>
+=C2=A0 =C2=A0 debug_path =3D g_strdup_printf(&quot;%s/qtest-blkdebug.XXXXX=
X&quot;, base);<br>
=C2=A0 =C2=A0 =C2=A0fd =3D mkstemp(debug_path);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c<br>
index ebbf8e0126..c5cad6c0be 100644<br>
--- a/tests/qtest/ide-test.c<br>
+++ b/tests/qtest/ide-test.c<br>
@@ -1011,17 +1011,31 @@ static void test_cdrom_dma(void)<br>
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
-=C2=A0 =C2=A0 debug_path =3D g_strdup_printf(&quot;%s/qtest-blkdebug.XXXXX=
X&quot;, g_get_tmp_dir());<br>
+=C2=A0 =C2=A0 debug_path =3D g_strdup_printf(&quot;%s/qtest-blkdebug.XXXXX=
X&quot;, base);<br>
=C2=A0 =C2=A0 =C2=A0fd =3D mkstemp(debug_path);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Create a temporary raw image */<br>
-=C2=A0 =C2=A0 tmp_path =3D g_strdup_printf(&quot;%s/qtest.XXXXXX&quot;, g_=
get_tmp_dir());<br>
+=C2=A0 =C2=A0 tmp_path =3D g_strdup_printf(&quot;%s/qtest.XXXXXX&quot;, ba=
se);<br>
=C2=A0 =C2=A0 =C2=A0fd =3D mkstemp(tmp_path);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0ret =3D ftruncate(fd, TEST_IMAGE_SIZE);<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000024d08c05e799d203--


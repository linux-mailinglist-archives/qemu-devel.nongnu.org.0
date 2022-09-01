Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA8B5A93B3
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 11:56:33 +0200 (CEST)
Received: from localhost ([::1]:38426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTgw4-00031b-B9
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 05:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTgBR-00075m-Mk; Thu, 01 Sep 2022 05:08:21 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:37767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTgBO-0006V2-L2; Thu, 01 Sep 2022 05:08:21 -0400
Received: by mail-lf1-x12a.google.com with SMTP id j14so13126538lfu.4;
 Thu, 01 Sep 2022 02:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=2vsFsK7UeTCyKE3pXF3tlNLs2MunbFtO6UB3cfTuNa8=;
 b=O3UdmOpMIEYCC7Hnjs9q6fg4Z3N8lguQDvKSEHEtRsjHlCmmoXGhWgvaGWpGVTOjeC
 w/Nr0CAn6ElB79Bxt2ry//MQbCby95zuxgyyJ2qvGrhCgY0pOsQu/FsDblD92B/QqhJM
 RMSJgm4V+LEkVeuqv5EE8WKpfPxgDnDX5m1rdt8X84gCNl2TWAv+oYlF8QbIV+jx/xIe
 AnpV/sWf96x00IOU+7pqSzhGIZT5mLz9Y86SSvQSJ6HSP8L7lo/lJz5onilodeCItSgC
 8YCyxgUP1nQLNFzuVtD68qAj92ly1dnb8KTtzn/BMi0nJu2nKJc+3QVmEkUbPbD9JH0F
 QUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=2vsFsK7UeTCyKE3pXF3tlNLs2MunbFtO6UB3cfTuNa8=;
 b=2fqGhejQ0IFDPD27LjUbd7dOyMMFaINMEHOScWb7ngCyu263YEq1f3eq0rPiTsoOt2
 buibq1b165aeZlZvtnj4X7LqeUuJzctDJo+tefkvn8Zzai/v8n+k9Mxn2W4DLCKdVmxH
 IZ65rkf/56L2WD/SyKNwf/Y4tHLSoBkV7QsjdABDR7IsjHWLDPfKEmjRziTfjzJK+wip
 iWV+Mzu3WMLiNTjMRAdUJQSotpTIQ6EsnGqlnDgvUDf0lxDIehTdKRePW0ARfVzB6QZz
 qTjmQbuicLHGtvO6sBBkjwtz8Na4fR0Ctfu6McwAttuH6h5MEZSd5E1YvQIda7Ab/0T7
 ZRRA==
X-Gm-Message-State: ACgBeo2JL4U/YoNldG+xBU5MnohmUEvsOvKhiEgFv54tFcyaWX5XWXAg
 x8QSPNqsUjrsk4CxcEP0CubfIQFNJaaPAKxX2ws=
X-Google-Smtp-Source: AA6agR6lyVgXUdJSxR6YNm4Rrrcm7aKDVgb3zDCKnAY3Imzgh5eJZe1Ro1/jbyM8fkzycXe5KVvKauP4DN3n+VeSBX4=
X-Received: by 2002:a19:2d08:0:b0:494:62f3:fcc3 with SMTP id
 k8-20020a192d08000000b0049462f3fcc3mr6860668lfj.362.1662023291528; Thu, 01
 Sep 2022 02:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-39-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-39-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 1 Sep 2022 13:08:00 +0400
Message-ID: <CAJ+F1CLQ3xwAe_TxQECty6xf2qbGDH32+LSF2XWD+DPH2F5dWQ@mail.gmail.com>
Subject: Re: [PATCH 38/51] tests/qtest: {ahci,
 ide}-test: Open file in binary mode
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, John Snow <jsnow@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e6699405e799f354"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12a.google.com
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

--000000000000e6699405e799f354
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 24, 2022 at 3:08 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> By default Windows opens file in text mode, while a POSIX compliant
> implementation treats text files and binary files the same.
>
> The fopen() 'mode' string can include the letter 'b' to indicate
> binary mode shall be used. POSIX spec says the character 'b' shall
> have no effect, but is allowed for ISO C standard conformance.
> Let's add the letter 'b' which works on both POSIX and Windows.
>
> Similar situation applies to the open() 'flags' where O_BINARY is
> used for binary mode.
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  tests/qtest/ahci-test.c | 2 +-
>  tests/qtest/ide-test.c  | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
> index bce9ff770c..be11508c75 100644
> --- a/tests/qtest/ahci-test.c
> +++ b/tests/qtest/ahci-test.c
> @@ -1453,7 +1453,7 @@ static int prepare_iso(size_t size, unsigned char
> **buf, char **name)
>       * Close the file and reopen it.
>       */
>      close(fd);
> -    fd =3D open(cdrom_path, O_WRONLY);
> +    fd =3D open(cdrom_path, O_WRONLY | O_BINARY);
>      g_assert(fd !=3D -1);
>

that should be gone in next iteration, with g_mkstemp() usage.


>  #endif
>
> diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
> index c5cad6c0be..ee03dea4fa 100644
> --- a/tests/qtest/ide-test.c
> +++ b/tests/qtest/ide-test.c
> @@ -892,7 +892,7 @@ static void cdrom_pio_impl(int nblocks)
>
>      /* Prepopulate the CDROM with an interesting pattern */
>      generate_pattern(pattern, patt_len, ATAPI_BLOCK_SIZE);
> -    fh =3D fopen(tmp_path, "w+");
> +    fh =3D fopen(tmp_path, "wb+");
>      ret =3D fwrite(pattern, ATAPI_BLOCK_SIZE, patt_blocks, fh);
>      g_assert_cmpint(ret, =3D=3D, patt_blocks);
>      fclose(fh);
> @@ -993,7 +993,7 @@ static void test_cdrom_dma(void)
>      prdt[0].size =3D cpu_to_le32(len | PRDT_EOT);
>
>      generate_pattern(pattern, ATAPI_BLOCK_SIZE * 16, ATAPI_BLOCK_SIZE);
> -    fh =3D fopen(tmp_path, "w+");
> +    fh =3D fopen(tmp_path, "wb+");
>      ret =3D fwrite(pattern, ATAPI_BLOCK_SIZE, 16, fh);
>      g_assert_cmpint(ret, =3D=3D, 16);
>      fclose(fh);
> --
> 2.34.1
>
>
>
ack this part,
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


--=20
Marc-Andr=C3=A9 Lureau

--000000000000e6699405e799f354
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 3:08 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Xuz=
hou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.com" target=3D"_blan=
k">xuzhou.cheng@windriver.com</a>&gt;<br>
<br>
By default Windows opens file in text mode, while a POSIX compliant<br>
implementation treats text files and binary files the same.<br>
<br>
The fopen() &#39;mode&#39; string can include the letter &#39;b&#39; to ind=
icate<br>
binary mode shall be used. POSIX spec says the character &#39;b&#39; shall<=
br>
have no effect, but is allowed for ISO C standard conformance.<br>
Let&#39;s add the letter &#39;b&#39; which works on both POSIX and Windows.=
<br>
<br>
Similar situation applies to the open() &#39;flags&#39; where O_BINARY is<b=
r>
used for binary mode.<br>
<br>
Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.co=
m" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
=C2=A0tests/qtest/ahci-test.c | 2 +-<br>
=C2=A0tests/qtest/ide-test.c=C2=A0 | 4 ++--<br>
=C2=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c<br>
index bce9ff770c..be11508c75 100644<br>
--- a/tests/qtest/ahci-test.c<br>
+++ b/tests/qtest/ahci-test.c<br>
@@ -1453,7 +1453,7 @@ static int prepare_iso(size_t size, unsigned char **b=
uf, char **name)<br>
=C2=A0 =C2=A0 =C2=A0 * Close the file and reopen it.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
-=C2=A0 =C2=A0 fd =3D open(cdrom_path, O_WRONLY);<br>
+=C2=A0 =C2=A0 fd =3D open(cdrom_path, O_WRONLY | O_BINARY);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd !=3D -1);<br></blockquote><div><br></div><d=
iv>that should be gone in next iteration, with g_mkstemp() usage.</div><div=
>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0#endif<br>
<br>
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c<br>
index c5cad6c0be..ee03dea4fa 100644<br>
--- a/tests/qtest/ide-test.c<br>
+++ b/tests/qtest/ide-test.c<br>
@@ -892,7 +892,7 @@ static void cdrom_pio_impl(int nblocks)<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Prepopulate the CDROM with an interesting pattern */=
<br>
=C2=A0 =C2=A0 =C2=A0generate_pattern(pattern, patt_len, ATAPI_BLOCK_SIZE);<=
br>
-=C2=A0 =C2=A0 fh =3D fopen(tmp_path, &quot;w+&quot;);<br>
+=C2=A0 =C2=A0 fh =3D fopen(tmp_path, &quot;wb+&quot;);<br>
=C2=A0 =C2=A0 =C2=A0ret =3D fwrite(pattern, ATAPI_BLOCK_SIZE, patt_blocks, =
fh);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(ret, =3D=3D, patt_blocks);<br>
=C2=A0 =C2=A0 =C2=A0fclose(fh);<br>
@@ -993,7 +993,7 @@ static void test_cdrom_dma(void)<br>
=C2=A0 =C2=A0 =C2=A0prdt[0].size =3D cpu_to_le32(len | PRDT_EOT);<br>
<br>
=C2=A0 =C2=A0 =C2=A0generate_pattern(pattern, ATAPI_BLOCK_SIZE * 16, ATAPI_=
BLOCK_SIZE);<br>
-=C2=A0 =C2=A0 fh =3D fopen(tmp_path, &quot;w+&quot;);<br>
+=C2=A0 =C2=A0 fh =3D fopen(tmp_path, &quot;wb+&quot;);<br>
=C2=A0 =C2=A0 =C2=A0ret =3D fwrite(pattern, ATAPI_BLOCK_SIZE, 16, fh);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpint(ret, =3D=3D, 16);<br>
=C2=A0 =C2=A0 =C2=A0fclose(fh);<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><div><br></div><div>ack this part,</div><div>Reviewed-by=
: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com"=
>marcandre.lureau@redhat.com</a>&gt;<br></div><div><br></div><br>-- <br><di=
v dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></d=
iv>

--000000000000e6699405e799f354--


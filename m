Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE8A5EA72D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:28:51 +0200 (CEST)
Received: from localhost ([::1]:50768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocoAF-0008Q8-35
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ocnuV-0007kU-Uf; Mon, 26 Sep 2022 09:12:36 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:38592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ocnuM-0001i6-4T; Mon, 26 Sep 2022 09:12:35 -0400
Received: by mail-lj1-x236.google.com with SMTP id s10so7394289ljp.5;
 Mon, 26 Sep 2022 06:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=k1IwZaH2sI3cDLy3/NDLmm1xkP0hD1vyQTlQ0G1iSp0=;
 b=DyPdzvDEQbxGrBcDPToEfXx83UShpzZRJ0MB/0Hm4hNMdF9Sa3xydtvR9QXEV3OBBp
 Duzs+JMDhcs383tC0MUnMuvaF4p/ISlkOh3LJf7ul+mCux+QIPHqEXV6Yz/qF/t8Uf6F
 xrEPjKBvb1qAW9BvCjEZvLUiEpcj+WdAl4OOW3rPs77eZRskPPdgA7oSsQeG+AT5crS7
 al4v1fcu/4vSqvqsfxMhH5F7b4KJQIuFjFspiWo9xuJ+cANH6l7amWfg5kWVhlOk5Fhk
 c7KiR7qCa8RtAiY1FUhSyGX/WUBx0d5J0gq1+WdNJNxfKHZOOUmm7c8aQ5DpyJnhiof8
 1o/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=k1IwZaH2sI3cDLy3/NDLmm1xkP0hD1vyQTlQ0G1iSp0=;
 b=yCz1iNtIP+Dp11hs52pRfqc0eGlMivougWz37LPpbAijI/mM6uR7AoSUtjbUmGwwsf
 rwByjecXoDguBs7Kw+u5bwTPR7wcIomGFfUppsSzamRZUhwLX254VXYh6Tsd2MWdHCCB
 pnwZGuQpzMkLYZDy5JumU9gos1EM2mWXFh8xKD88uj6h6wOn6EUEpeqcwjum7qh+iGzY
 WqBBd4dhdV9zbtmJbwAosVHWvWPcLGABBsAKKu5webd8qywO/EcfwUinrTal2h4Wy3pR
 BSIf//r4RQ9d8U5on1MWvuP4HIfIHulgT6loYHWToJ+6BsItpltf8zQZ4xlu5n8fJa1c
 jl/A==
X-Gm-Message-State: ACrzQf0bD//gdR8AjvKevZ7EMDFGZM1l5XuQAn1ZGIbZHLn+YjgU5xA9
 AA0Exrs5vYKv256r003FhUyqTDgeIhpz3Fwp+BM=
X-Google-Smtp-Source: AMsMyM6n8prMSrBi4pYBS9mADD2hiS/q9TDjC5RaqgEvZB1iCCcDJ4g5olwV50XvaCA5Fdyma8Rtu6Vdv0gJ5zu1LWU=
X-Received: by 2002:a2e:a607:0:b0:26c:42c8:13af with SMTP id
 v7-20020a2ea607000000b0026c42c813afmr7353507ljp.267.1664197944053; Mon, 26
 Sep 2022 06:12:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-14-bmeng.cn@gmail.com>
In-Reply-To: <20220925113032.1949844-14-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 26 Sep 2022 17:12:12 +0400
Message-ID: <CAJ+F1CKdMXfZSr=dmkvpMpK+kC99QOG-gA6xph-2QAE57M1_Bw@mail.gmail.com>
Subject: Re: [PATCH v3 13/54] tests/qtest: ide-test: Avoid using hardcoded /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000004a979305e9944740"
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x236.google.com
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

--0000000000004a979305e9944740
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 25, 2022 at 3:56 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> This case was written to use hardcoded /tmp directory for temporary
> files. Update to use g_file_open_tmp() for a portable implementation.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>
> Changes in v3:
> - Split to a separate patch
>
>  tests/qtest/ide-test.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
> index 5bcb75a7e5..25302be6dc 100644
> --- a/tests/qtest/ide-test.c
> +++ b/tests/qtest/ide-test.c
> @@ -121,8 +121,8 @@ enum {
>  static QPCIBus *pcibus =3D NULL;
>  static QGuestAllocator guest_malloc;
>
> -static char tmp_path[] =3D "/tmp/qtest.XXXXXX";
> -static char debug_path[] =3D "/tmp/qtest-blkdebug.XXXXXX";
> +static char *tmp_path;
> +static char *debug_path;
>
>  static QTestState *ide_test_start(const char *cmdline_fmt, ...)
>  {
> @@ -1015,12 +1015,12 @@ int main(int argc, char **argv)
>      int ret;
>
>      /* Create temporary blkdebug instructions */
> -    fd =3D mkstemp(debug_path);
> +    fd =3D g_file_open_tmp("qtest-blkdebug.XXXXXX", &debug_path, NULL);
>      g_assert(fd >=3D 0);
>      close(fd);
>
>      /* Create a temporary raw image */
> -    fd =3D mkstemp(tmp_path);
> +    fd =3D g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
>      g_assert(fd >=3D 0);
>      ret =3D ftruncate(fd, TEST_IMAGE_SIZE);
>      g_assert(ret =3D=3D 0);
> @@ -1049,7 +1049,9 @@ int main(int argc, char **argv)
>
>      /* Cleanup */
>      unlink(tmp_path);
> +    g_free(tmp_path);
>      unlink(debug_path);
> +    g_free(debug_path);
>
>      return ret;
>  }
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000004a979305e9944740
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 25, 2022 at 3:56 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
This case was written to use hardcoded /tmp directory for temporary<br>
files. Update to use g_file_open_tmp() for a portable implementation.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div><br></d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
Changes in v3:<br>
- Split to a separate patch<br>
<br>
=C2=A0tests/qtest/ide-test.c | 10 ++++++----<br>
=C2=A01 file changed, 6 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c<br>
index 5bcb75a7e5..25302be6dc 100644<br>
--- a/tests/qtest/ide-test.c<br>
+++ b/tests/qtest/ide-test.c<br>
@@ -121,8 +121,8 @@ enum {<br>
=C2=A0static QPCIBus *pcibus =3D NULL;<br>
=C2=A0static QGuestAllocator guest_malloc;<br>
<br>
-static char tmp_path[] =3D &quot;/tmp/qtest.XXXXXX&quot;;<br>
-static char debug_path[] =3D &quot;/tmp/qtest-blkdebug.XXXXXX&quot;;<br>
+static char *tmp_path;<br>
+static char *debug_path;<br>
<br>
=C2=A0static QTestState *ide_test_start(const char *cmdline_fmt, ...)<br>
=C2=A0{<br>
@@ -1015,12 +1015,12 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Create temporary blkdebug instructions */<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(debug_path);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest-blkdebug.XXXXXX&quot;, &a=
mp;debug_path, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0close(fd);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Create a temporary raw image */<br>
-=C2=A0 =C2=A0 fd =3D mkstemp(tmp_path);<br>
+=C2=A0 =C2=A0 fd =3D g_file_open_tmp(&quot;qtest.XXXXXX&quot;, &amp;tmp_pa=
th, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd &gt;=3D 0);<br>
=C2=A0 =C2=A0 =C2=A0ret =3D ftruncate(fd, TEST_IMAGE_SIZE);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(ret =3D=3D 0);<br>
@@ -1049,7 +1049,9 @@ int main(int argc, char **argv)<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Cleanup */<br>
=C2=A0 =C2=A0 =C2=A0unlink(tmp_path);<br>
+=C2=A0 =C2=A0 g_free(tmp_path);<br>
=C2=A0 =C2=A0 =C2=A0unlink(debug_path);<br>
+=C2=A0 =C2=A0 g_free(debug_path);<br>
<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000004a979305e9944740--


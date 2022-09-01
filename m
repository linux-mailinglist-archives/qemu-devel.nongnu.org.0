Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9DE5A92E0
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 11:15:35 +0200 (CEST)
Received: from localhost ([::1]:43472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTgIQ-0006Xk-Em
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 05:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTfmE-00057S-2F; Thu, 01 Sep 2022 04:42:18 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:35826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTfmC-0002hX-6r; Thu, 01 Sep 2022 04:42:17 -0400
Received: by mail-lf1-x12d.google.com with SMTP id z25so23403961lfr.2;
 Thu, 01 Sep 2022 01:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=qbDtQ4m156li/kQR9DUBrjHPQ45lFW88NHXHCr5wgO8=;
 b=MYkm575vSNzYc+Zwd0MBPXRX2uxu4PoBEOtOR+fk+ndtfxNr478Oqtlz/VyBESsNoV
 lU1FR7piJotfw+4dKk9HPScFEc9/ZrZ470g1CvkILDUvjsRIt+8kWnawIkkwI/FrzuNK
 Piw5czCvJET+3Ajf9PMF2SJIfX2DizWDzSP47EagKmuPd9Va+B8j4F6LFrOIXXbUrp4w
 +G7f3yk6G3eILVV4qq/CKgyCY69gv+ioe0eM1G1oc5UyAS4pFLL8kA0UVpsv+XrtFMSD
 GyYkOkfmwYByq9wKi+QPKGO73VZXBCMDDDXqergpIISTYO6ZJ1VIZkmilrWVSva3Qmid
 SfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=qbDtQ4m156li/kQR9DUBrjHPQ45lFW88NHXHCr5wgO8=;
 b=5u2N2cetIYWBDmk+FBKWd9Xu0DDhRl+n/aIG6reB/PihWG7oQIWAtoyWkh1xM0RCEm
 Y+ELrnw30/bQD165pwNGWm9rhROJaLwhEkmRRyCmqs8ny8okFIM3PSt5kXhQL7cTn+OL
 EOgfF8cehecJHVexoKgFG0f5R7wrGNRibRv/Eg7Df4CT1Sxjkv9KJ9YGtdT7bpfbBYR2
 bLrGdGcTB9hXO86kZ5yQJGFr9amL5CmQZ5Bru1svMo99CF2Bbk24RFnHIRAufxWO1AUz
 rZvI3iKcmg8tUMdX31FafHAWjoy8cp4/Xwxtxp2ngPV7xohPReqAkzz4RY38gpD22pmU
 hRAg==
X-Gm-Message-State: ACgBeo38+Kjd3wg78JPscb0yKwvpxSGrZdKIPK2p0Y9CvI44lB4bcNJN
 nSNY/VD73zPXRhidlcRWgVePdD2DjeaJ4jxAMac=
X-Google-Smtp-Source: AA6agR5F26MidYRSlQSersYC7mMIdfb0quwYU7dBpZRyvdokl2DYSIAI9owIfHgx+WX8yZ9i3+ZCR/Sco8NWEScB0oI=
X-Received: by 2002:a19:2d08:0:b0:494:62f3:fcc3 with SMTP id
 k8-20020a192d08000000b0049462f3fcc3mr6833378lfj.362.1662021732246; Thu, 01
 Sep 2022 01:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-33-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-33-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 1 Sep 2022 12:42:00 +0400
Message-ID: <CAJ+F1CKusZz5VS85zYD7gtaE0KhYSSPuam66CeVacbj863_5zg@mail.gmail.com>
Subject: Re: [PATCH 32/51] tests/qtest: Fix ERROR_SHARING_VIOLATION for win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000f5ac3b05e79996c4"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12d.google.com
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

--000000000000f5ac3b05e79996c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 24, 2022 at 2:03 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> On Windows, the MinGW provided mkstemp() API opens the file with
> exclusive access, denying other processes to read/write the file.
> Such behavior prevents the QEMU executable from opening the file,
> (e.g.: CreateFile returns ERROR_SHARING_VIOLATION).
>

g_mkstemp() doesn't have this behaviour (after running a quick test). Use
it?


>
> This can be fixed by closing the file and reopening it.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  tests/qtest/ahci-test.c        | 14 ++++++++++++++
>  tests/qtest/boot-serial-test.c | 13 +++++++++++++
>  2 files changed, 27 insertions(+)
>
> diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
> index f26cd6f86f..0e88cd0eef 100644
> --- a/tests/qtest/ahci-test.c
> +++ b/tests/qtest/ahci-test.c
> @@ -1443,6 +1443,20 @@ static int prepare_iso(size_t size, unsigned char
> **buf, char **name)
>      int fd =3D mkstemp(cdrom_path);
>
>      g_assert(fd !=3D -1);
> +#ifdef _WIN32
> +    /*
> +     * On Windows, the MinGW provided mkstemp() API opens the file with
> +     * exclusive access, denying other processes to read/write the file.
> +     * Such behavior prevents the QEMU executable from opening the file,
> +     * (e.g.: CreateFile returns ERROR_SHARING_VIOLATION).
> +     *
> +     * Close the file and reopen it.
> +     */
> +    close(fd);
> +    fd =3D open(cdrom_path, O_WRONLY);
> +    g_assert(fd !=3D -1);
> +#endif
> +
>      g_assert(buf);
>      g_assert(name);
>      patt =3D g_malloc(size);
> diff --git a/tests/qtest/boot-serial-test.c
> b/tests/qtest/boot-serial-test.c
> index 404adcfa20..fb6c81bf35 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -235,6 +235,19 @@ static void test_machine(const void *data)
>
>      ser_fd =3D mkstemp(serialtmp);
>      g_assert(ser_fd !=3D -1);
> +#ifdef _WIN32
> +    /*
> +     * On Windows, the MinGW provided mkstemp() API opens the file with
> +     * exclusive access, denying other processes to read/write the file.
> +     * Such behavior prevents the QEMU executable from opening the file,
> +     * (e.g.: CreateFile returns ERROR_SHARING_VIOLATION).
> +     *
> +     * Close the file and reopen it.
> +     */
> +    close(ser_fd);
> +    ser_fd =3D open(serialtmp, O_RDONLY);
> +    g_assert(ser_fd !=3D -1);
> +#endif
>
>      if (test->kernel) {
>          code =3D test->kernel;
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f5ac3b05e79996c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 2:03 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.m=
eng@windriver.com</a>&gt;<br>
<br>
On Windows, the MinGW provided mkstemp() API opens the file with<br>
exclusive access, denying other processes to read/write the file.<br>
Such behavior prevents the QEMU executable from opening the file,<br>
(e.g.: CreateFile returns ERROR_SHARING_VIOLATION).<br></blockquote><div><b=
r></div><div>g_mkstemp() doesn&#39;t have this behaviour (after running a q=
uick test). Use it?<br></div><div>=C2=A0<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
This can be fixed by closing the file and reopening it.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
=C2=A0tests/qtest/ahci-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14 +++++++++++++=
+<br>
=C2=A0tests/qtest/boot-serial-test.c | 13 +++++++++++++<br>
=C2=A02 files changed, 27 insertions(+)<br>
<br>
diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c<br>
index f26cd6f86f..0e88cd0eef 100644<br>
--- a/tests/qtest/ahci-test.c<br>
+++ b/tests/qtest/ahci-test.c<br>
@@ -1443,6 +1443,20 @@ static int prepare_iso(size_t size, unsigned char **=
buf, char **name)<br>
=C2=A0 =C2=A0 =C2=A0int fd =3D mkstemp(cdrom_path);<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_assert(fd !=3D -1);<br>
+#ifdef _WIN32<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* On Windows, the MinGW provided mkstemp() API opens t=
he file with<br>
+=C2=A0 =C2=A0 =C2=A0* exclusive access, denying other processes to read/wr=
ite the file.<br>
+=C2=A0 =C2=A0 =C2=A0* Such behavior prevents the QEMU executable from open=
ing the file,<br>
+=C2=A0 =C2=A0 =C2=A0* (e.g.: CreateFile returns ERROR_SHARING_VIOLATION).<=
br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* Close the file and reopen it.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 fd =3D open(cdrom_path, O_WRONLY);<br>
+=C2=A0 =C2=A0 g_assert(fd !=3D -1);<br>
+#endif<br>
+<br>
=C2=A0 =C2=A0 =C2=A0g_assert(buf);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(name);<br>
=C2=A0 =C2=A0 =C2=A0patt =3D g_malloc(size);<br>
diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.=
c<br>
index 404adcfa20..fb6c81bf35 100644<br>
--- a/tests/qtest/boot-serial-test.c<br>
+++ b/tests/qtest/boot-serial-test.c<br>
@@ -235,6 +235,19 @@ static void test_machine(const void *data)<br>
<br>
=C2=A0 =C2=A0 =C2=A0ser_fd =3D mkstemp(serialtmp);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(ser_fd !=3D -1);<br>
+#ifdef _WIN32<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* On Windows, the MinGW provided mkstemp() API opens t=
he file with<br>
+=C2=A0 =C2=A0 =C2=A0* exclusive access, denying other processes to read/wr=
ite the file.<br>
+=C2=A0 =C2=A0 =C2=A0* Such behavior prevents the QEMU executable from open=
ing the file,<br>
+=C2=A0 =C2=A0 =C2=A0* (e.g.: CreateFile returns ERROR_SHARING_VIOLATION).<=
br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* Close the file and reopen it.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 close(ser_fd);<br>
+=C2=A0 =C2=A0 ser_fd =3D open(serialtmp, O_RDONLY);<br>
+=C2=A0 =C2=A0 g_assert(ser_fd !=3D -1);<br>
+#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (test-&gt;kernel) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0code =3D test-&gt;kernel;<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f5ac3b05e79996c4--


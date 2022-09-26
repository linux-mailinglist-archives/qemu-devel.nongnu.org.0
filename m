Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 288DA5EA6ED
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:17:31 +0200 (CEST)
Received: from localhost ([::1]:47740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocnzG-00059X-79
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ocnqE-0002dF-Cz
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:08:10 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:35486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ocnqC-00012a-90
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:08:09 -0400
Received: by mail-lf1-x132.google.com with SMTP id z25so10782165lfr.2
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=mluZfEflSpirZqQULOEDWRLJid3TykshycoZgB//F/4=;
 b=PP1qi6FrfAsKCrCjKmxoWcKEnBl8+ZfhPSkcvUxON7d3qSlWL0Kb2p5ED88LhwRNdP
 twjE7KgaBq5op0Pw5SHox3UkCRvSbJ86Ry6HOEEYedKENPK7YfdaLBc1RI47Hq6dxSX7
 y35hoJvEVtDmbfANf4/+Y5EN9gHo/z18MIa5z42TcVLziaWN3zGdCnG3IBc3qr5+UsCd
 FdbGCjjW8mm7JK54KuZmfLI09iOpHQcyjyjgCA+ie/fFJKYrsAOEmxse/avje4wPbkQO
 t1/CpVc9rqRfr8Erhd62184DdGdzObczuSlj446H+i+kuDLaHJjf3SPyS8VYzi7dkUO8
 Zmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=mluZfEflSpirZqQULOEDWRLJid3TykshycoZgB//F/4=;
 b=7h6P9a9qTBMU0G94loKFnhMgSbUQrvd/tCEzIKVUELdO78NJDTD/ygSah2FbzEci+R
 j2xuAk8kFwxewHpw/cWnK5s5TfJ8yBXwtal2mzJ6tL+kUdcKzGCw2AITKMdKsmRb4RZX
 DHMaa8dOstMvHh21aQZtkxJC3MrAUelFEGf1iSh32PSBuFt/8874t6BvzoSgESPtzObG
 I6QeWZrW9c1UOag06KPCNW5RnFyWyLA1C64dP+2cWafThVyBVJxeXder91iL64lYN//O
 Yf3wi2ab0cPuAVqLf4JIdtmnzXKzoflAWfDFFifna+I1DQGwyIpUlZknCFfFDQSBvivc
 zIgA==
X-Gm-Message-State: ACrzQf09BFXtULkcjFUF3CmKepBF6aF1JDWtu17xbL5Gg7GYyePADwea
 A1TH7RRHLEb5eTTt6f4j3r/mH4P7WHCQe+EFm4U=
X-Google-Smtp-Source: AMsMyM6X26XVU64TNl4mXjs2HYwJkM5EmDC65n21uvbRVb40KnHJOBEm1ScekYoOja6I4XrV5G8UoHczLGk0009RTrA=
X-Received: by 2002:a05:6512:280d:b0:498:fd40:51d4 with SMTP id
 cf13-20020a056512280d00b00498fd4051d4mr9708950lfb.167.1664197682720; Mon, 26
 Sep 2022 06:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-9-bmeng.cn@gmail.com>
In-Reply-To: <20220925113032.1949844-9-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 26 Sep 2022 17:07:51 +0400
Message-ID: <CAJ+F1CJGWU2j4Dvxm9PSoUONgxkMzkkbC8ekE=TEdc6A-6swsw@mail.gmail.com>
Subject: Re: [PATCH v3 08/54] tests/qtest: cxl-test: Avoid using hardcoded /tmp
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b6f64e05e9943725"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x132.google.com
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

--000000000000b6f64e05e9943725
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 25, 2022 at 3:54 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> This case was written to use hardcoded /tmp directory for temporary
> files. Update to use g_dir_make_tmp() for a portable implementation.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
> Changes in v3:
> - Split to a separate patch
> - Ensure g_autofree variable is initialized
>
>  tests/qtest/cxl-test.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
> index 2e14da7dee..cbe0fb549b 100644
> --- a/tests/qtest/cxl-test.c
> +++ b/tests/qtest/cxl-test.c
> @@ -93,10 +93,9 @@ static void cxl_2root_port(void)
>  static void cxl_t3d(void)
>  {
>      g_autoptr(GString) cmdline =3D g_string_new(NULL);
> -    char template[] =3D "/tmp/cxl-test-XXXXXX";
> -    const char *tmpfs;
> +    g_autofree const char *tmpfs =3D NULL;
>
> -    tmpfs =3D g_mkdtemp(template);
> +    tmpfs =3D g_dir_make_tmp("cxl-test-XXXXXX", NULL);
>
>      g_string_printf(cmdline, QEMU_PXB_CMD QEMU_RP QEMU_T3D, tmpfs, tmpfs=
);
>
> @@ -107,10 +106,9 @@ static void cxl_t3d(void)
>  static void cxl_1pxb_2rp_2t3d(void)
>  {
>      g_autoptr(GString) cmdline =3D g_string_new(NULL);
> -    char template[] =3D "/tmp/cxl-test-XXXXXX";
> -    const char *tmpfs;
> +    g_autofree const char *tmpfs =3D NULL;
>
> -    tmpfs =3D g_mkdtemp(template);
> +    tmpfs =3D g_dir_make_tmp("cxl-test-XXXXXX", NULL);
>
>      g_string_printf(cmdline, QEMU_PXB_CMD QEMU_2RP QEMU_2T3D,
>                      tmpfs, tmpfs, tmpfs, tmpfs);
> @@ -122,10 +120,9 @@ static void cxl_1pxb_2rp_2t3d(void)
>  static void cxl_2pxb_4rp_4t3d(void)
>  {
>      g_autoptr(GString) cmdline =3D g_string_new(NULL);
> -    char template[] =3D "/tmp/cxl-test-XXXXXX";
> -    const char *tmpfs;
> +    g_autofree const char *tmpfs =3D NULL;
>
> -    tmpfs =3D g_mkdtemp(template);
> +    tmpfs =3D g_dir_make_tmp("cxl-test-XXXXXX", NULL);
>
>      g_string_printf(cmdline, QEMU_2PXB_CMD QEMU_4RP QEMU_4T3D,
>                      tmpfs, tmpfs, tmpfs, tmpfs, tmpfs, tmpfs,
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000b6f64e05e9943725
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 25, 2022 at 3:54 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
This case was written to use hardcoded /tmp directory for temporary<br>
files. Update to use g_dir_make_tmp() for a portable implementation.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
Changes in v3:<br>
- Split to a separate patch<br>
- Ensure g_autofree variable is initialized<br>
<br>
=C2=A0tests/qtest/cxl-test.c | 15 ++++++---------<br>
=C2=A01 file changed, 6 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c<br>
index 2e14da7dee..cbe0fb549b 100644<br>
--- a/tests/qtest/cxl-test.c<br>
+++ b/tests/qtest/cxl-test.c<br>
@@ -93,10 +93,9 @@ static void cxl_2root_port(void)<br>
=C2=A0static void cxl_t3d(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0g_autoptr(GString) cmdline =3D g_string_new(NULL);<br>
-=C2=A0 =C2=A0 char template[] =3D &quot;/tmp/cxl-test-XXXXXX&quot;;<br>
-=C2=A0 =C2=A0 const char *tmpfs;<br>
+=C2=A0 =C2=A0 g_autofree const char *tmpfs =3D NULL;<br>
<br>
-=C2=A0 =C2=A0 tmpfs =3D g_mkdtemp(template);<br>
+=C2=A0 =C2=A0 tmpfs =3D g_dir_make_tmp(&quot;cxl-test-XXXXXX&quot;, NULL);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_string_printf(cmdline, QEMU_PXB_CMD QEMU_RP QEMU_T3D,=
 tmpfs, tmpfs);<br>
<br>
@@ -107,10 +106,9 @@ static void cxl_t3d(void)<br>
=C2=A0static void cxl_1pxb_2rp_2t3d(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0g_autoptr(GString) cmdline =3D g_string_new(NULL);<br>
-=C2=A0 =C2=A0 char template[] =3D &quot;/tmp/cxl-test-XXXXXX&quot;;<br>
-=C2=A0 =C2=A0 const char *tmpfs;<br>
+=C2=A0 =C2=A0 g_autofree const char *tmpfs =3D NULL;<br>
<br>
-=C2=A0 =C2=A0 tmpfs =3D g_mkdtemp(template);<br>
+=C2=A0 =C2=A0 tmpfs =3D g_dir_make_tmp(&quot;cxl-test-XXXXXX&quot;, NULL);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_string_printf(cmdline, QEMU_PXB_CMD QEMU_2RP QEMU_2T3=
D,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0tmpfs, tmpfs, tmpfs, tmpfs);<br>
@@ -122,10 +120,9 @@ static void cxl_1pxb_2rp_2t3d(void)<br>
=C2=A0static void cxl_2pxb_4rp_4t3d(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0g_autoptr(GString) cmdline =3D g_string_new(NULL);<br>
-=C2=A0 =C2=A0 char template[] =3D &quot;/tmp/cxl-test-XXXXXX&quot;;<br>
-=C2=A0 =C2=A0 const char *tmpfs;<br>
+=C2=A0 =C2=A0 g_autofree const char *tmpfs =3D NULL;<br>
<br>
-=C2=A0 =C2=A0 tmpfs =3D g_mkdtemp(template);<br>
+=C2=A0 =C2=A0 tmpfs =3D g_dir_make_tmp(&quot;cxl-test-XXXXXX&quot;, NULL);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_string_printf(cmdline, QEMU_2PXB_CMD QEMU_4RP QEMU_4T=
3D,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0tmpfs, tmpfs, tmpfs, tmpfs, tmpfs, tmpfs,<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000b6f64e05e9943725--


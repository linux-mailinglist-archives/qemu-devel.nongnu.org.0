Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233ED5E55A7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 23:57:06 +0200 (CEST)
Received: from localhost ([::1]:44940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob7iK-0002bk-OE
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 17:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ob7fn-00010F-6J
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 17:54:27 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:36744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ob7fl-0006ga-6X
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 17:54:26 -0400
Received: by mail-lf1-x134.google.com with SMTP id f9so11502761lfr.3
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 14:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=fSDleOigfXnJxu7SC7BRt/6s1XUUcUQkzskIkkTf7mU=;
 b=acrMljO7U6/iJx3iNZWYIxTkrq1XmBAINqeJwM8dvLzqhLibxgjC7Li1z56UB88a3W
 JfBUBjZuiC/ZO4brUZ7wu+Eaw8fgulEiCCDmsoDERvTKHUK/dSVOGhYdsbuEVTMW56Dc
 utsjExHTii9BLPOEQkYpYTTAwhEwYln/hU2fsi2h7f0DKo7pFwouG2InoYRx6u6sG9XG
 Mnw/b84FNX162l7Nphr9qKqii8BbCAmY3TvAlci62Yn42eT+IeE8lij2hEaZjg7jjLq3
 FIpK8LO0Dp/epW9lBw83Oem2lAiucJdeLIva+B/YtKIcbjYcEuBqc8WHvGTHxP/k8nF6
 1O0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fSDleOigfXnJxu7SC7BRt/6s1XUUcUQkzskIkkTf7mU=;
 b=SplMHcNT3GqH0KJNfw1o5hchlr8yfha18DVrifI6hjpjZoBgOnSNYkx37WxWqr7/3C
 pBCOvqDb5TRswLcDyCYGgHRYgJsLEK9ZVSHx004VeH844pKQcUBIOBrNf7kkRuKfDa0g
 y6bFtYXlAe4/zpjcQiunvJnbdfABc6+nD+jvpahiiGZZslUO4hbJ91dCvaMcznCgFLsG
 9Rlk/XAwad1xb0u0gD47cm7VWz06Qq1hssqBaN9iA5EBOSU1mjp2KTP1esCEWwh88AEm
 +pa1HXSieBJJlMCLcZPQnIWtNTa112Pk2wXSkhJmR/XpshfaBokBNK5iYtmIXtD/wYNE
 EVrQ==
X-Gm-Message-State: ACrzQf2spn7ggmG27sAIsyWloxBXmJMurXVa6a8wuFwf4EWvZK9UDncZ
 6Hj8SI3bMOpHMU8MFDu2t5gaImkHCQveqfbQAA4=
X-Google-Smtp-Source: AMsMyM47wNsYMroANs8S5M+hXZtvXUH5naSsvBqDLeT5ipHG6XTO5wutPiSCAzLjXTVcGO0FN/8SacX0JuxV+uongJw=
X-Received: by 2002:a05:6512:3d18:b0:498:fafb:229f with SMTP id
 d24-20020a0565123d1800b00498fafb229fmr79041lfv.356.1663797262210; Wed, 21 Sep
 2022 14:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-27-bmeng.cn@gmail.com>
In-Reply-To: <20220920103159.1865256-27-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 21 Sep 2022 23:54:10 +0200
Message-ID: <CAJ+F1CLupcHMUSm2rfC5YPGX_JW0O+uG=UfQCdu5VCGRyma+CA@mail.gmail.com>
Subject: Re: [PATCH v2 26/39] tests/qtest: migration-test: Make sure QEMU
 process "to" exited after migration is canceled
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000cadc1905e936fc79"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x134.google.com
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

--000000000000cadc1905e936fc79
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Sep 20, 2022 at 3:18 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> Make sure QEMU process "to" exited before launching another target
> for migration in the test_multifd_tcp_cancel case.
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>

fwiw, I didn't r-b the version with a busy wait
(
https://patchew.org/QEMU/20220824094029.1634519-1-bmeng.cn@gmail.com/202208=
24094029.1634519-42-bmeng.cn@gmail.com/
)

---
>
> Changes in v2:
> - Change to a busy wait after migration is canceled
>
>  tests/qtest/migration-test.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index c87afad9e8..aedd9ddb72 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2133,6 +2133,10 @@ static void test_multifd_tcp_cancel(void)
>      wait_for_migration_pass(from);
>
>      migrate_cancel(from);
> +    /* Make sure QEMU process "to" exited */
> +    while (qtest_probe_child(to)) {
> +        ;
> +    }
>
>      args =3D (MigrateStart){
>          .only_target =3D true,
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000cadc1905e936fc79
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 20, 2022 at 3:18 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Xuz=
hou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.com" target=3D"_blan=
k">xuzhou.cheng@windriver.com</a>&gt;<br>
<br>
Make sure QEMU process &quot;to&quot; exited before launching another targe=
t<br>
for migration in the test_multifd_tcp_cancel case.<br>
<br>
Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.co=
m" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br></bloc=
kquote><div><br></div><div>fwiw, I didn&#39;t r-b the version with a busy w=
ait <br></div><div>(<a href=3D"https://patchew.org/QEMU/20220824094029.1634=
519-1-bmeng.cn@gmail.com/20220824094029.1634519-42-bmeng.cn@gmail.com/">htt=
ps://patchew.org/QEMU/20220824094029.1634519-1-bmeng.cn@gmail.com/202208240=
94029.1634519-42-bmeng.cn@gmail.com/</a>)</div><div><br> </div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
---<br>
<br>
Changes in v2:<br>
- Change to a busy wait after migration is canceled<br>
<br>
=C2=A0tests/qtest/migration-test.c | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c<br=
>
index c87afad9e8..aedd9ddb72 100644<br>
--- a/tests/qtest/migration-test.c<br>
+++ b/tests/qtest/migration-test.c<br>
@@ -2133,6 +2133,10 @@ static void test_multifd_tcp_cancel(void)<br>
=C2=A0 =C2=A0 =C2=A0wait_for_migration_pass(from);<br>
<br>
=C2=A0 =C2=A0 =C2=A0migrate_cancel(from);<br>
+=C2=A0 =C2=A0 /* Make sure QEMU process &quot;to&quot; exited */<br>
+=C2=A0 =C2=A0 while (qtest_probe_child(to)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0args =3D (MigrateStart){<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.only_target =3D true,<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000cadc1905e936fc79--


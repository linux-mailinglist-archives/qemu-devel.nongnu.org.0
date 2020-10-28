Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA9929CE63
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 07:42:30 +0100 (CET)
Received: from localhost ([::1]:33196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXfAD-0004hm-Hr
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 02:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a.tarasenko@gmail.com>)
 id 1kXf8P-0003hq-3b; Wed, 28 Oct 2020 02:40:37 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:36551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <a.tarasenko@gmail.com>)
 id 1kXf8M-00087v-6A; Wed, 28 Oct 2020 02:40:36 -0400
Received: by mail-pf1-x442.google.com with SMTP id w65so2355748pfd.3;
 Tue, 27 Oct 2020 23:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eOVki/qhtQzGI+9H+/voocknPcGuCFzb0Z5gaU2P4wI=;
 b=CTpvjjH6yfCkO65rDYMPC99pIaUqhCGbOAHnlCkNk3MlcSj9bCyxTfuYFwPZ4UfqIM
 CtNYh3Kff5YAIvXN9V4ADIXsCSYnJyEVJXvU1o2dL2zfeUIbL9CiP+k/LEglGcZFkwPm
 sJHW2ShzAIhCELovoLhw7guzSvQBlPsVY/cSvLbWedOuBt36Xs8j+i5tHq75BVxVmSOP
 eeDxNgYFyw8dc2A/5l9NncRkksdZsRse8GAuHIhr77rrhtq4m4PzSNDKHPDM+DEI28EP
 ZOmmldS81PUqYbv2b9dkcujwRpKCCc3Fq3OMkjVwxFMVYZG0VpoIzG9Fff/WPAL7x22l
 ltFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eOVki/qhtQzGI+9H+/voocknPcGuCFzb0Z5gaU2P4wI=;
 b=bkGGCRM6Cw2eEg54rG7M1K/H8WtDbfQRxzetdi4ZAHlJxQ1mRDd7qYOL7mXIvqKMsH
 P4WzjO0sJecme66CxJFEnaFUK/ViTdoy837g76acZ+1L8GM/JVz8kFA6ciGda2i4qOgz
 Spf26nYc18JjUhACKhMF+v2TH4ZdhCQGDGWBFL7v7lBJu9uifJyHFOvy7cIX5CBhAndW
 bMGbcr7Kyl+v+PQbWq7mk6S2eV/hkUUBUsqxNdnho8RrlV8E8mzyH+Y3a1L9r1Bi0r5/
 3nYOUz8ZorGCv0Gn2m5bgMuN3RnYILux83I42KDktXooTIJl9tpo0r9Lzh1eBVGKG5cp
 385w==
X-Gm-Message-State: AOAM530cQQVn596jJhCe3XPBzm80twQm9/B9i2uYAKoUJ5S4ihw2mP8Q
 W8HE7Ma2w/Rerty3SBUC0g9KnRvE6/zCdpu1K0CFbAaj
X-Google-Smtp-Source: ABdhPJzPPb6JoH262b8oRnRU51VOKrg/Eob/cMKBybKztH8n7Afa+zCd/sHtymVdKqFAX1/HiUEKM3N0yRDDxxomiY8=
X-Received: by 2002:a05:6214:18cf:: with SMTP id
 cy15mr6517000qvb.53.1603867206374; 
 Tue, 27 Oct 2020 23:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201028041819.2169003-1-kuhn.chenqun@huawei.com>
 <20201028041819.2169003-6-kuhn.chenqun@huawei.com>
In-Reply-To: <20201028041819.2169003-6-kuhn.chenqun@huawei.com>
From: Artyom Tarasenko <atar4qemu@gmail.com>
Date: Wed, 28 Oct 2020 07:39:54 +0100
Message-ID: <CAAM0arN_5_c-2A2mtO8cSPQbX161a0N0A0obPHPmZa9xburo2A@mail.gmail.com>
Subject: Re: [PATCH 5/9] target/sparc/translate: silence the compiler warnings
To: Chen Qun <kuhn.chenqun@huawei.com>
Content-Type: multipart/alternative; boundary="0000000000001bcfb505b2b56fd2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=a.tarasenko@gmail.com; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 ganqixin@huawei.com, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001bcfb505b2b56fd2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 28 =D0=BE=D0=BA=D1=82. 2020 =D0=B3., 5:19 Chen Qun <kuhn.chen=
qun@huawei.com>:

> When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed
> warning:
> target/sparc/translate.c: In function =E2=80=98gen_st_asi=E2=80=99:
> target/sparc/translate.c:2320:12: warning: this statement may fall throug=
h
> [-Wimplicit-fallthrough=3D]
>  2320 |         if (!(dc->def->features & CPU_FEATURE_HYPV)) {
>       |            ^
> target/sparc/translate.c:2329:5: note: here
>  2329 |     case GET_ASI_DIRECT:
>       |     ^~~~
>
> The "fall through" statement place is not correctly identified by the
> compiler.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
>

Reviewed-by: Artyom Tarasenko <atar4qemu@gmail.com>

---
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> ---
>  target/sparc/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/sparc/translate.c b/target/sparc/translate.c
> index 1a4efd4ed6..a3d9aaa46b 100644
> --- a/target/sparc/translate.c
> +++ b/target/sparc/translate.c
> @@ -2324,8 +2324,8 @@ static void gen_st_asi(DisasContext *dc, TCGv src,
> TCGv addr,
>          }
>          /* in OpenSPARC T1+ CPUs TWINX ASIs in store instructions
>           * are ST_BLKINIT_ ASIs */
> -        /* fall through */
>  #endif
> +        /* fall through */
>      case GET_ASI_DIRECT:
>          gen_address_mask(dc, addr);
>          tcg_gen_qemu_st_tl(src, addr, da.mem_idx, da.memop);
> --
> 2.27.0
>
>

--0000000000001bcfb505b2b56fd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">=D1=81=D1=80, 28 =D0=BE=D0=BA=D1=82. 2020 =D0=B3., 5:19 Chen Q=
un &lt;<a href=3D"mailto:kuhn.chenqun@huawei.com">kuhn.chenqun@huawei.com</=
a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">When using -Wimplicit-fallt=
hrough in our CFLAGS, the compiler showed warning:<br>
target/sparc/translate.c: In function =E2=80=98gen_st_asi=E2=80=99:<br>
target/sparc/translate.c:2320:12: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]<br>
=C2=A02320 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(dc-&gt;def-&gt;features=
 &amp; CPU_FEATURE_HYPV)) {<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
target/sparc/translate.c:2329:5: note: here<br>
=C2=A02329 |=C2=A0 =C2=A0 =C2=A0case GET_ASI_DIRECT:<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0^~~~<br>
<br>
The &quot;fall through&quot; statement place is not correctly identified by=
 the compiler.<br>
<br>
Reported-by: Euler Robot &lt;<a href=3D"mailto:euler.robot@huawei.com" targ=
et=3D"_blank" rel=3D"noreferrer">euler.robot@huawei.com</a>&gt;<br>
Signed-off-by: Chen Qun &lt;<a href=3D"mailto:kuhn.chenqun@huawei.com" targ=
et=3D"_blank" rel=3D"noreferrer">kuhn.chenqun@huawei.com</a>&gt;<br></block=
quote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Reviewed-by=
:=C2=A0<span style=3D"font-family:sans-serif">Artyom Tarasenko &lt;</span><=
a href=3D"mailto:atar4qemu@gmail.com" style=3D"font-family:sans-serif">atar=
4qemu@gmail.com</a><span style=3D"font-family:sans-serif">&gt;</span></div>=
<div dir=3D"auto"><span style=3D"font-family:sans-serif"><br></span></div><=
div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
---<br>
Cc: Mark Cave-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@ilande.co.uk" t=
arget=3D"_blank" rel=3D"noreferrer">mark.cave-ayland@ilande.co.uk</a>&gt;<b=
r>
Cc: Artyom Tarasenko &lt;<a href=3D"mailto:atar4qemu@gmail.com" target=3D"_=
blank" rel=3D"noreferrer">atar4qemu@gmail.com</a>&gt;<br>
---<br>
=C2=A0target/sparc/translate.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/target/sparc/translate.c b/target/sparc/translate.c<br>
index 1a4efd4ed6..a3d9aaa46b 100644<br>
--- a/target/sparc/translate.c<br>
+++ b/target/sparc/translate.c<br>
@@ -2324,8 +2324,8 @@ static void gen_st_asi(DisasContext *dc, TCGv src, TC=
Gv addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* in OpenSPARC T1+ CPUs TWINX ASIs in st=
ore instructions<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * are ST_BLKINIT_ ASIs */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fall through */<br>
=C2=A0#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fall through */<br>
=C2=A0 =C2=A0 =C2=A0case GET_ASI_DIRECT:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_address_mask(dc, addr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_qemu_st_tl(src, addr, da.mem_idx,=
 da.memop);<br>
-- <br>
2.27.0<br>
<br>
</blockquote></div></div></div>

--0000000000001bcfb505b2b56fd2--


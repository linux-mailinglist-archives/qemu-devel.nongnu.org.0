Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DD64ED50E
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 09:54:42 +0200 (CEST)
Received: from localhost ([::1]:42892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZpdh-0002FU-Uw
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 03:54:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZpZt-0005j4-UF
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 03:50:45 -0400
Received: from [2a00:1450:4864:20::330] (port=39516
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZpZs-0004NO-3l
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 03:50:45 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 bi13-20020a05600c3d8d00b0038c2c33d8f3so1215760wmb.4
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 00:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m0R5e22eaYw504AdbhaxozH4T2HHSVy92CY9H1acUng=;
 b=EaGX+vHL9ORQBUDbi631bPwUAfSWX1bw2U8jlX7ihG4K7U3gVENL6P13j4koR9g9Zz
 25dEbeNDLOrUO8qrYDIMES95YZF3QX82173tZVEPQfokk6+Upe4B7d0ka5/T/0VkMswI
 vHSmsM6EHkh6AX/NSMZx3M2A6pu6zE77FMxg3feZAmlM5r2y0HWm/l0LqDnFATWUEoes
 OVyyeECgwCqGmxgfXbHkkk1D69uJ9mY+N7a2ZBPg0VqrF+9yk5Ec8cxH7Nk7HLnfQVHT
 3ilmphwr18tP4pvjHF9tz4b5K1K7DRYUkUJj94Yv7qRvAK+ek7Y2zdjtWfx4Klm9DiPk
 VyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m0R5e22eaYw504AdbhaxozH4T2HHSVy92CY9H1acUng=;
 b=WSOY+QtlZQL49zD11UX27NIRd7YTRum46ufXaMJrls0OCXCIetLSWDIJvSjCx+UoUl
 pDuPXDkMQqaboX/mx+DZyVdchJaD4DqBgdOoduog+bSNmVyIjW5F79fh3OQV0kCG1478
 JhfGYsqMgWzb/ucGQ4EKPEri+kUA3I0xvcdIKWbB1CuW5nkuJBp69WLEwLAj/s1p+OPO
 ATse2ZaTuPsetf/EzE9+oOLrRfmS2w7xVcaMRxXJYzeVFHOSvnSbkMwGvWVev0q7kbka
 TuFUzf+PqDWDhD5uA5cSOvdQmBUFezXEHRvZyWo7Lnt7neuNSG56J5JaxvxZvV+GQm+o
 LfOQ==
X-Gm-Message-State: AOAM533yyJhPt5HVhFc/cZSFcrDwwyti8I6tKCjPGpI6lU3lkepCoELa
 a0Tu4ZfjDuo3/TENc3TigD/XITN0byuyqM2u+wc=
X-Google-Smtp-Source: ABdhPJybOurgtEakguoM5+77B18qdEXJpBUDlacByHgfLCAwztGEs2fwlZL5LWVPVnA5fDmtocSxyejB3bWOczyCoz4=
X-Received: by 2002:a05:600c:4fd4:b0:38c:cc3f:ac01 with SMTP id
 o20-20020a05600c4fd400b0038ccc3fac01mr3707647wmq.206.1648713041794; Thu, 31
 Mar 2022 00:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220330235723.68033-1-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220330235723.68033-1-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 31 Mar 2022 11:50:29 +0400
Message-ID: <CAJ+F1CJ3eWn1iZ1VWBRyG+pbybQ=8EEHX7movkHb6Qgs-b=kZQ@mail.gmail.com>
Subject: Re: [PATCH-for-7.1] hw/tpm/tpm_tis: Avoid eventual read overrun
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000003159d305db7eeb3e"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>, QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003159d305db7eeb3e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Mar 31, 2022 at 4:02 AM Philippe Mathieu-Daud=C3=A9 <
philippe.mathieu.daude@gmail.com> wrote:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The TPMState structure hold an array of TPM_TIS_NUM_LOCALITIES
> TPMLocality loc[], having TPM_TIS_NUM_LOCALITIES defined as '5'.
>
> tpm_tis_locality_from_addr() returns up to 3 bits, so 7.
>
> While unlikely, Coverity is right to report an overrun. Assert
> we are in range to fix:
>
>   *** CID 1487240:  Memory - illegal accesses  (OVERRUN)
>   hw/tpm/tpm_tis_common.c: 298 in tpm_tis_dump_state()
>   294         int idx;
>   295         uint8_t locty =3D tpm_tis_locality_from_addr(addr);
>   296         hwaddr base =3D addr & ~0xfff;
>   297
>   >>>     CID 1487240:  Memory - illegal accesses  (OVERRUN)
>   >>>     Overrunning array "s->loc" of 5 24-byte elements at element
> index 7 (byte offset 191) using index "locty" (which evaluates to 7).
>   298         printf("tpm_tis: active locality      : %d\n"
>   299                "tpm_tis: state of locality %d : %d\n"
>   300                "tpm_tis: register dump:\n",
>   301                s->active_locty,
>   302                locty, s->loc[locty].state);
>
> Fixes: Coverity CID 1487240
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>

Maybe that assert should be in tpm_tis_locality_from_addr(), as various
callers could produce the same report.


---
>  hw/tpm/tpm_tis_common.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/tpm/tpm_tis_common.c b/hw/tpm/tpm_tis_common.c
> index e700d82181..5b1055033e 100644
> --- a/hw/tpm/tpm_tis_common.c
> +++ b/hw/tpm/tpm_tis_common.c
> @@ -295,6 +295,7 @@ static void tpm_tis_dump_state(TPMState *s, hwaddr
> addr)
>      uint8_t locty =3D tpm_tis_locality_from_addr(addr);
>      hwaddr base =3D addr & ~0xfff;
>
> +    assert(TPM_TIS_IS_VALID_LOCTY(locty));
>      printf("tpm_tis: active locality      : %d\n"
>             "tpm_tis: state of locality %d : %d\n"
>             "tpm_tis: register dump:\n",
> --
> 2.35.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000003159d305db7eeb3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 31, 2022 at 4:02 AM Philippe M=
athieu-Daud=C3=A9 &lt;<a href=3D"mailto:philippe.mathieu.daude@gmail.com">p=
hilippe.mathieu.daude@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Philippe Mathieu-Daud=C3=A9 &lt;<a h=
ref=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br=
>
<br>
The TPMState structure hold an array of TPM_TIS_NUM_LOCALITIES<br>
TPMLocality loc[], having TPM_TIS_NUM_LOCALITIES defined as &#39;5&#39;.<br=
>
<br>
tpm_tis_locality_from_addr() returns up to 3 bits, so 7.<br>
<br>
While unlikely, Coverity is right to report an overrun. Assert<br>
we are in range to fix:<br>
<br>
=C2=A0 *** CID 1487240:=C2=A0 Memory - illegal accesses=C2=A0 (OVERRUN)<br>
=C2=A0 hw/tpm/tpm_tis_common.c: 298 in tpm_tis_dump_state()<br>
=C2=A0 294=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int idx;<br>
=C2=A0 295=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t locty =3D tpm_tis_local=
ity_from_addr(addr);<br>
=C2=A0 296=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr base =3D addr &amp; ~0xf=
ff;<br>
=C2=A0 297<br>
=C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0CID 1487240:=C2=A0 Memory - illegal =
accesses=C2=A0 (OVERRUN)<br>
=C2=A0 &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0Overrunning array &quot;s-&gt;loc&qu=
ot; of 5 24-byte elements at element index 7 (byte offset 191) using index =
&quot;locty&quot; (which evaluates to 7).<br>
=C2=A0 298=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;tpm_tis: active lo=
cality=C2=A0 =C2=A0 =C2=A0 : %d\n&quot;<br>
=C2=A0 299=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tpm=
_tis: state of locality %d : %d\n&quot;<br>
=C2=A0 300=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tpm=
_tis: register dump:\n&quot;,<br>
=C2=A0 301=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;act=
ive_locty,<br>
=C2=A0 302=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locty, s-=
&gt;loc[locty].state);<br>
<br>
Fixes: Coverity CID 1487240<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br></blockquote><div><br><=
/div><div>Maybe that assert should be in tpm_tis_locality_from_addr(), as v=
arious callers could produce the same report.<br></div><div><br></div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/tpm/tpm_tis_common.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/hw/tpm/tpm_tis_common.c b/hw/tpm/tpm_tis_common.c<br>
index e700d82181..5b1055033e 100644<br>
--- a/hw/tpm/tpm_tis_common.c<br>
+++ b/hw/tpm/tpm_tis_common.c<br>
@@ -295,6 +295,7 @@ static void tpm_tis_dump_state(TPMState *s, hwaddr addr=
)<br>
=C2=A0 =C2=A0 =C2=A0uint8_t locty =3D tpm_tis_locality_from_addr(addr);<br>
=C2=A0 =C2=A0 =C2=A0hwaddr base =3D addr &amp; ~0xfff;<br>
<br>
+=C2=A0 =C2=A0 assert(TPM_TIS_IS_VALID_LOCTY(locty));<br>
=C2=A0 =C2=A0 =C2=A0printf(&quot;tpm_tis: active locality=C2=A0 =C2=A0 =C2=
=A0 : %d\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tpm_tis: state of locality =
%d : %d\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tpm_tis: register dump:\n&q=
uot;,<br>
-- <br>
2.35.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div></div></div></div></d=
iv>

--0000000000003159d305db7eeb3e--


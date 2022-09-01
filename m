Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2545A9617
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 13:54:57 +0200 (CEST)
Received: from localhost ([::1]:36522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTime-00064N-HF
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 07:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTiZ5-00056o-W8; Thu, 01 Sep 2022 07:41:01 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:46767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTiZ3-00005f-8Q; Thu, 01 Sep 2022 07:40:54 -0400
Received: by mail-lf1-x129.google.com with SMTP id z29so15404074lfb.13;
 Thu, 01 Sep 2022 04:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=6DMXN8rl8ANn9UUBmQIWQpx+flOpBmLl9D3r+0RG1X8=;
 b=mRfOhCsMIuUWbuGnzvUxGnWJadxTv/elqtzkKMO3xVcHnY84MfEcbskrewD6ekkHAO
 Tihd3gKM1hqyD2Ig5kbaDiBKZ75kIuKNVmB426OHCeIBsWKl89pC6Y0E/yAhmSPKvQHi
 oECWY45zVI4jaEB/cMu9uMR0/N1NO25AmOuCkN/76zciVBXRvcruVb6O243366ClaPd6
 PxJbCBM/O4GuNOW517IxRSyMd6JaSOXznbMWUKQvTQMec5S++/rXbiYZK/bwqb66GFS9
 x46pEdSymYl9pXJmPr/2F3zs+hx8SN4ye9LOwSDMsi6RJpd2Lpc5q9w4dC4zDWOCp6ak
 sHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=6DMXN8rl8ANn9UUBmQIWQpx+flOpBmLl9D3r+0RG1X8=;
 b=bQ8i+WJcmE1LbatcOZWR0O0ykEWj0JlngoI/MFPlMKwAxESVCrMKS2A0tMGHI38tTo
 3TilkGwDQ08OuShnFSjaXg9PpxAE+8wNAhyxL4YKgqQbsTSdkcnGc/mfkjgc3gx5E7vM
 BDDWAcwp6sMokT6ShPmGCUGmnbilcqcmk6wQk3OMl6G111gfHPITO2hQhw+z6ClZLJ52
 QQ/yOqZttrEvG+8lM5VoAOuvHf0a/skrYcXgpqJC8PPfgJiT/8wxZho11KCIqbA7tEr6
 OhnhMBPGgqyPi5ldFzGRqC5qWsUPOp+WwYJeJ0w/uk2zMfCr885c/7uEqP6IFaxj6URP
 fDuw==
X-Gm-Message-State: ACgBeo1ZAslsOVtdkkKL7DvTtM9bN8D1msBnjXOdW6aBAWeFhO2f9LGU
 CXUxacGn2e1AXDSrqfn4aUxmQf3QDZNwYIFS7e+c+ee0Nh8=
X-Google-Smtp-Source: AA6agR7wi1SN5HNqGTRHti1lhFBDZGRgNKKsCXWXouyURkVs/u0OMdaMkWApmrJF0OQEcQ3GZM/9sUUcBvL+JtvP7tU=
X-Received: by 2002:a05:6512:1395:b0:48d:81c:5159 with SMTP id
 p21-20020a056512139500b0048d081c5159mr12007700lfa.375.1662032448787; Thu, 01
 Sep 2022 04:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-43-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-43-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 1 Sep 2022 15:40:36 +0400
Message-ID: <CAJ+F1C+cocYok8R1cfrzTzBk7Hh1OdxkyYM14JcZ1ukghOcMng@mail.gmail.com>
Subject: Re: [PATCH 42/51] hw/ppc: spapr: Use qemu_vfree() to free spapr->htab
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b71d2105e79c156f"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x129.google.com
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

--000000000000b71d2105e79c156f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 3:18 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> spapr->htab is allocated by qemu_memalign(), hence we should use
> qemu_vfree() to free it.
>
> Fixes: c5f54f3e31bf ("pseries: Move hash page table allocation to reset
> time")
> Fixes: b4db54132ffe ("target/ppc: Implement H_REGISTER_PROCESS_TABLE
> H_CALL"")
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
>  hw/ppc/spapr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index bc9ba6e6dc..4034f4d130 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1522,7 +1522,7 @@ int spapr_hpt_shift_for_ramsize(uint64_t ramsize)
>
>  void spapr_free_hpt(SpaprMachineState *spapr)
>  {
> -    g_free(spapr->htab);
> +    qemu_vfree(spapr->htab);
>      spapr->htab =3D NULL;
>      spapr->htab_shift =3D 0;
>      close_htab_fd(spapr);
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000b71d2105e79c156f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 3:18 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Xuzho=
u Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.com" target=3D"_blank"=
>xuzhou.cheng@windriver.com</a>&gt;<br>
<br>
spapr-&gt;htab is allocated by qemu_memalign(), hence we should use<br>
qemu_vfree() to free it.<br>
<br>
Fixes: c5f54f3e31bf (&quot;pseries: Move hash page table allocation to rese=
t time&quot;)<br>
Fixes: b4db54132ffe (&quot;target/ppc: Implement H_REGISTER_PROCESS_TABLE H=
_CALL&quot;&quot;)<br>
Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.co=
m" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
=C2=A0hw/ppc/spapr.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c<br>
index bc9ba6e6dc..4034f4d130 100644<br>
--- a/hw/ppc/spapr.c<br>
+++ b/hw/ppc/spapr.c<br>
@@ -1522,7 +1522,7 @@ int spapr_hpt_shift_for_ramsize(uint64_t ramsize)<br>
<br>
=C2=A0void spapr_free_hpt(SpaprMachineState *spapr)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 g_free(spapr-&gt;htab);<br>
+=C2=A0 =C2=A0 qemu_vfree(spapr-&gt;htab);<br>
=C2=A0 =C2=A0 =C2=A0spapr-&gt;htab =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0spapr-&gt;htab_shift =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0close_htab_fd(spapr);<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000b71d2105e79c156f--


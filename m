Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B425E5D37
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 10:17:24 +0200 (CEST)
Received: from localhost ([::1]:38292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obHOc-0000z0-UA
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 04:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1obHJg-0006Ng-1V
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:12:16 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b]:44788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1obHJd-0004tk-C3
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:12:14 -0400
Received: by mail-ua1-x92b.google.com with SMTP id p17so3332292uao.11
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=HLEoqaG04NdcX/RkmizrfwCh7eRWu7xGGRup7WXTCS8=;
 b=B1a4VzVFuhp+xysyHQ9f9QXJXixv7vawxoXJxuNeWvDX7ZhTNnQ2xe1kMue40a7BlI
 YFS1gOjP3TZA7ZCwNX2C8ZZKw/Sfxb8CNwhdutoHzuDmZSsUgULgaFd72UrwYW2D8Jta
 antDXkQxFsREB64YafvL3OwHI36Vv0DTUZDoPrb4YEzInNguCCOCKlgCeg8Aa6eDio8h
 Hp5Mxgaj/c0/7EoHdaZlSMUmBZySF9/GI3ouD68kFkZ4nIOAlJkK3beFTPygG+JmatM9
 MK2BKWkx+g13V7U5ND5twMzkqiissoKviUvrUAw+dqaaBn4CoHoEyPqra9ySUg/Gj+h6
 9PsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=HLEoqaG04NdcX/RkmizrfwCh7eRWu7xGGRup7WXTCS8=;
 b=YAVafS50fmdr7mLH9ditSSDiA8UU63taa7r8LhaR1pr0gI912nGgSStO7M0dvYRvrj
 w/ub/o0yJW1OvoI0AuHmUvGuzfxtM88Rkkoa6DkRkozQ1mb3LcVgdhEz/Rxzk8BEwcad
 Wm8o5wKnXE7HW8/srDX/Rm5d6XJIS/guctZNkaSECzCHpgPs3moSAeGAUSlz3X3LMGD8
 vs7X/8lhpKqyN8JNR4zo7EPX/IpOZw5mwQbBFLjkNd8AwsKZ7f5b/mywdnTrMr+ogktj
 i8ZDE5KKfSX1bJPQR/pTTxCdK4drjw+dCMevDUdDY0Xdm792wn4cltS1QQ9qMseKJTwH
 sHxg==
X-Gm-Message-State: ACrzQf1/5TgTxrRE7TcK5JnpPlka12CtgV/3VwMKHyDOcMsICmMbe+Mm
 MBBOjO/GKMjNZNqkmLE5ToMTvr7PegZjz7y+5nWfdQ==
X-Google-Smtp-Source: AMsMyM704WBoNGpf9w/qx4DYx3so+KDBQIBOZmFWoCYNAmyh1rSPLurX7dofCBb3ocwKUY3/BDmbmCFVI6Q1bsYjm3s=
X-Received: by 2002:a9f:318f:0:b0:3c4:55db:a0f3 with SMTP id
 v15-20020a9f318f000000b003c455dba0f3mr793859uad.121.1663834331278; Thu, 22
 Sep 2022 01:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220819071137.1140627-1-tommy.wu@sifive.com>
 <CAKmqyKNidxPt-Bu81-Eex=g9ZWdTJ29geBdtg+w5sMTvy4hraA@mail.gmail.com>
In-Reply-To: <CAKmqyKNidxPt-Bu81-Eex=g9ZWdTJ29geBdtg+w5sMTvy4hraA@mail.gmail.com>
From: Tommy Wu <tommy.wu@sifive.com>
Date: Thu, 22 Sep 2022 16:12:00 +0800
Message-ID: <CANj3q_nA5Gz82Re+-spcFXATsJ3YvtknzoULG4998=D5=pXhbw@mail.gmail.com>
Subject: Re: [PATCH] include/hw/riscv/sifive_e.h: Fix the type of parent_obj
 of SiFiveEState.
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="00000000000048050005e93f9e74"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=tommy.wu@sifive.com; helo=mail-ua1-x92b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--00000000000048050005e93f9e74
Content-Type: text/plain; charset="UTF-8"

To the maintainers:

Thank Alistair and Jim for the review.
Bernhard Beschow sent the same patch :
https://lists.gnu.org/archive/html/qemu-riscv/2022-09/msg00126.html

It seems that this simple patch is helpful. Could you help us to merge this
patch?
Thanks for your great help!

Regards,
Tommy Wu



On Mon, Aug 22, 2022 at 11:33 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Fri, Aug 19, 2022 at 5:12 PM Tommy Wu <tommy.wu@sifive.com> wrote:
> >
> > Fix the type of parent_obj of SiFiveEState from 'SysBusDevice'
> > to 'MachineState'. Because the parent of SiFiveEState is 'MachineState'.
> >
> > Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Alistair
>
> > ---
> >  include/hw/riscv/sifive_e.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> > index 83604da805..24359f9fe5 100644
> > --- a/include/hw/riscv/sifive_e.h
> > +++ b/include/hw/riscv/sifive_e.h
> > @@ -41,7 +41,7 @@ typedef struct SiFiveESoCState {
> >
> >  typedef struct SiFiveEState {
> >      /*< private >*/
> > -    SysBusDevice parent_obj;
> > +    MachineState parent_obj;
> >
> >      /*< public >*/
> >      SiFiveESoCState soc;
> > --
> > 2.27.0
> >
> >
>

--00000000000048050005e93f9e74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>To the maintainers:<br></div><div><br></div>Thank Ali=
stair and Jim for the review.<div>Bernhard Beschow sent the same patch :=C2=
=A0<a href=3D"https://lists.gnu.org/archive/html/qemu-riscv/2022-09/msg0012=
6.html">https://lists.gnu.org/archive/html/qemu-riscv/2022-09/msg00126.html=
</a></div><div><br></div><div>It seems that this simple patch is helpful. C=
ould you help us to merge this patch?<br>Thanks for your great help!</div><=
div><br></div><div>Regards,</div><div>Tommy Wu</div><div><br></div><div><br=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Aug 22, 2022 at 11:33 AM Alistair Francis &lt;<a href=3D"mai=
lto:alistair23@gmail.com">alistair23@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Aug 19, 2022 at 5:12 =
PM Tommy Wu &lt;<a href=3D"mailto:tommy.wu@sifive.com" target=3D"_blank">to=
mmy.wu@sifive.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Fix the type of parent_obj of SiFiveEState from &#39;SysBusDevice&#39;=
<br>
&gt; to &#39;MachineState&#39;. Because the parent of SiFiveEState is &#39;=
MachineState&#39;.<br>
&gt;<br>
&gt; Signed-off-by: Tommy Wu &lt;<a href=3D"mailto:tommy.wu@sifive.com" tar=
get=3D"_blank">tommy.wu@sifive.com</a>&gt;<br>
<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
<br>
Alistair<br>
<br>
&gt; ---<br>
&gt;=C2=A0 include/hw/riscv/sifive_e.h | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h=
<br>
&gt; index 83604da805..24359f9fe5 100644<br>
&gt; --- a/include/hw/riscv/sifive_e.h<br>
&gt; +++ b/include/hw/riscv/sifive_e.h<br>
&gt; @@ -41,7 +41,7 @@ typedef struct SiFiveESoCState {<br>
&gt;<br>
&gt;=C2=A0 typedef struct SiFiveEState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
&gt; -=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
&gt; +=C2=A0 =C2=A0 MachineState parent_obj;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SiFiveESoCState soc;<br>
&gt; --<br>
&gt; 2.27.0<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--00000000000048050005e93f9e74--


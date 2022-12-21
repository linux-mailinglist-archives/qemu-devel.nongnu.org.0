Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45955652AC1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 02:09:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7nXM-0002Ab-Uy; Tue, 20 Dec 2022 20:04:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1p7nX7-000254-4i
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:04:33 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1p7nX4-0003io-Mf
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:04:32 -0500
Received: by mail-ej1-x62c.google.com with SMTP id n20so33408384ejh.0
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 17:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eMktvyyZF/2OAZT4q3Ou76Fxkafg9dfOQFvbQnyUG/M=;
 b=MAckEt7qs1O7BO0lqVL15TqYayQ8MyGstjsDF1eh8iP97BIpAZrxyuLPfFWy8EGo/6
 cdcQ3FhEGRTNH8XcO3sDNG3Qz5uTYzw5cfx4OO9YIsCPD8ts3CZRfkmUwEOCP5vk4iaM
 5jJI6remb6QNiB/ezHMenf5UDp8CKZHVELPJ8Z4eyzsH4t8wVDRujwFzDS0RNVr+1VAy
 laBsuwBVHFdtQ2Sn1KWZSsT+SrTUqtTTts7nE69GzVrU1w6ssYZjO80H74hIQvl1UMqY
 2cJK+Gv04H2jSrV46vCn9Vd2FDMzAC7fpZQs7pcrZjhfxrSCQ0C9JJ06JixgOUEd6lxW
 S12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eMktvyyZF/2OAZT4q3Ou76Fxkafg9dfOQFvbQnyUG/M=;
 b=2qoUfluaFaCWZOc1RGPAJjtFUGBwyPzIHfkte7xXYzR+dkGVbsjD/A6FWGxJc3D1tD
 5rz6JydUrrAt/id5VHgEn+14Q3EZVpeTB88/Alrk1ho143HXELKGRaiGi6UvXJH6oOd0
 FzC/720RQGrCGRwhXf8eEPZcI6y3PhMqU1ExkQ9RwaR3JQETSdliyJNEMcIgrdDXP8o7
 Vmu3b7rfLmucJz+iiJBhaWn0v0GKmSbaOIs9wCdEbIYxbDoX2uo1vuHsfT+MTWEBpWpP
 BatA7N4JcMvhKg2pMHKMUxqGvDxxmiAuxPV/lyGyIOID3/weYfChMS4gS11xQ6zqUBsx
 pZdw==
X-Gm-Message-State: ANoB5pl+kOvY3t9oI/dtVWUD2CmstiOBm8x47AFdckn0/b5oiWHkEq9U
 gPTTvmvZIVRd6IURBHAxv6ppp0CCupUWG7xGPWZrfA==
X-Google-Smtp-Source: AA0mqf5ABv1QLZI9flBN9NRIqoCThhgLxmjLkNjF3wcLTTKpr9aHG2ctjMP6+uv5FlLY0UId6KHWG98fQn7wAypI2Y0=
X-Received: by 2002:a17:906:29c3:b0:7c0:e0db:f136 with SMTP id
 y3-20020a17090629c300b007c0e0dbf136mr19867447eje.333.1671584668715; Tue, 20
 Dec 2022 17:04:28 -0800 (PST)
MIME-Version: 1.0
References: <20221217184823.3606676-1-richard.henderson@linaro.org>
 <CANCZdfpVabse8tnRaAE7f=E62e07ErqvuneDpg5V9UKDYOdoLQ@mail.gmail.com>
 <0e52d0aa-74b6-6eb6-4e41-f904f51969ea@linaro.org>
In-Reply-To: <0e52d0aa-74b6-6eb6-4e41-f904f51969ea@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 20 Dec 2022 18:04:17 -0700
Message-ID: <CANCZdfrDDPVyZ5JfoikpSS2hLbTT69WYY4YiZ6jEbFSRh9J55w@mail.gmail.com>
Subject: Re: [PATCH] accel/tcg: Drop PAGE_RESERVED for CONFIG_BSD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
Content-Type: multipart/alternative; boundary="00000000000064278705f04c229b"
Received-SPF: none client-ip=2a00:1450:4864:20::62c;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000064278705f04c229b
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 20, 2022 at 4:22 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 12/20/22 14:09, Warner Losh wrote:
> >
> >
> > On Sat, Dec 17, 2022 at 11:48 AM Richard Henderson <
> richard.henderson@linaro.org
> > <mailto:richard.henderson@linaro.org>> wrote:
> >
> >     Make bsd-user match linux-user in not marking host pages
> >     as reserved.  This isn't especially effective anyway, as
> >     it doesn't take into account any heap memory that qemu
> >     may allocate after startup.
> >
> >     Cc: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
> >     Signed-off-by: Richard Henderson <richard.henderson@linaro.org
> >     <mailto:richard.henderson@linaro.org>>
> >     ---
> >
> >     I started to simply fix up this code to match my user-only
> interval-tree
> >     patch set, as L1_MAP_ADDR_SPACE_BITS gets removed from
> translate-all.c,
> >     but then I decided to remove it all.
> >
> >
> > I think this is fine. We already do a translation for addresses so
> marking this as 'reserved'
> > doesn't help that much. We need to map memory into a contiguous
> guess-address-space,
> > but the underlying host memory needn't be contiguous at all.
> >
> > I've not yet tested this, but would like to. What's your timeline on
> getting this done?
>
> ASAP.  I want to remove...
>
> >     -                    if (h2g_valid(endaddr)) {
> >     -                        endaddr = h2g(endaddr);
> >     -                        page_set_flags(startaddr, endaddr,
> PAGE_RESERVED);
> >     -                    } else {
> >     -#if TARGET_ABI_BITS <= L1_MAP_ADDR_SPACE_BITS
>
> L1_MAP_ADDR_SPACE_BITS.
>

OK. I've tested this with both 32-bit and 64-bit binaries on a 64-bit host.
It works both with the
incomplete upstream as well as our 'blitz' branch which is basically
complete. I've not run our
full regression tests, though, but I suspect they will produce similar
results before/after. My test
machine is missing a few things due to an incomplete package upgrade that I
don't have the time
to sort out this evening.

And looking at things, I agree with the analysis: It's a pesky nop. At
worst, if it does change something,
it's likely to change it for the better. And if not, I'll deal with that
when I do my next round of upstreaming
after the first of the year.

So:

Reviewed-by: Warner Losh <imp@bsdimp.com>
Tested-by: Warner Losh <imp@bsdimp.com>

Warner

--00000000000064278705f04c229b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 20, 2022 at 4:22 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 12/20/22 14:09, Warner Losh wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Sat, Dec 17, 2022 at 11:48 AM Richard Henderson &lt;<a href=3D"mail=
to:richard.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro=
.org</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_=
blank">richard.henderson@linaro.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Make bsd-user match linux-user in not marking host =
pages<br>
&gt;=C2=A0 =C2=A0 =C2=A0as reserved.=C2=A0 This isn&#39;t especially effect=
ive anyway, as<br>
&gt;=C2=A0 =C2=A0 =C2=A0it doesn&#39;t take into account any heap memory th=
at qemu<br>
&gt;=C2=A0 =C2=A0 =C2=A0may allocate after startup.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Cc: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.co=
m" target=3D"_blank">imp@bsdimp.com</a> &lt;mailto:<a href=3D"mailto:imp@bs=
dimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Richard Henderson &lt;<a href=3D"mai=
lto:richard.henderson@linaro.org" target=3D"_blank">richard.henderson@linar=
o.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I started to simply fix up this code to match my us=
er-only interval-tree<br>
&gt;=C2=A0 =C2=A0 =C2=A0patch set, as L1_MAP_ADDR_SPACE_BITS gets removed f=
rom translate-all.c,<br>
&gt;=C2=A0 =C2=A0 =C2=A0but then I decided to remove it all.<br>
&gt; <br>
&gt; <br>
&gt; I think this is fine. We already do a translation for addresses so mar=
king this as &#39;reserved&#39;<br>
&gt; doesn&#39;t help that much. We need to map memory into a contiguous gu=
ess-address-space,<br>
&gt; but the underlying host memory needn&#39;t be contiguous at all.<br>
&gt; <br>
&gt; I&#39;ve not yet tested this, but would like to. What&#39;s your timel=
ine on getting this done?<br>
<br>
ASAP.=C2=A0 I want to remove...<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if (h2g_valid(endaddr)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endaddr =3D h2g(endaddr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page_set_flags(startaddr, endaddr, PAGE_=
RESERVED);<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-#if TARGET_ABI_BITS &lt;=3D L1_MAP_ADDR_SPACE_BITS=
<br>
<br>
L1_MAP_ADDR_SPACE_BITS.<br></blockquote><div><br></div><div>OK. I&#39;ve te=
sted this with both 32-bit and 64-bit binaries on a 64-bit host. It works b=
oth with the</div><div>incomplete upstream as well as our &#39;blitz&#39; b=
ranch which is basically complete. I&#39;ve not run our</div><div>full regr=
ession tests, though, but I suspect they will produce similar results befor=
e/after. My test</div><div>machine is missing a few things due to an incomp=
lete package upgrade that I don&#39;t have the time</div><div>to sort out t=
his evening.</div><div><br></div><div>And looking at things, I agree with t=
he analysis: It&#39;s a pesky nop. At worst, if it does change something,</=
div><div>it&#39;s likely to change it for the better. And if not, I&#39;ll =
deal with that when I do my next round of upstreaming</div><div>after the f=
irst of the year.</div><div><br></div><div>So:</div><div><br></div><div>Rev=
iewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com<=
/a>&gt;</div><div>Tested-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.c=
om">imp@bsdimp.com</a>&gt;</div><div><br></div><div>Warner</div></div></div=
>

--00000000000064278705f04c229b--


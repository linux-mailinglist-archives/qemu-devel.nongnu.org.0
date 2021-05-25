Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5C038F80A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:22:05 +0200 (CEST)
Received: from localhost ([::1]:47384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMho-0001eM-KO
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1llMaL-0004mw-RB
 for qemu-devel@nongnu.org; Mon, 24 May 2021 22:14:21 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:40758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1llMaK-0007ww-1O
 for qemu-devel@nongnu.org; Mon, 24 May 2021 22:14:21 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 80-20020a9d08560000b0290333e9d2b247so16602320oty.7
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 19:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tRdupmYsQzIeY2HHVoYX0T08hhLSzqt3U9JZdyCWf7o=;
 b=N3x7+R42XBywKU+XErEnIPTZppYiFMPj7kYBVIWyMxSRQYrheePVFqDV5PPmJI1UOx
 gQNyiLteWkvkps07CXjHW6kf5qvT5WN6Bb8Tc9DXry4YgJV0lXgy0gT+uegXqrtywqcr
 QaYLtYdGAQJFMkZ+NewUHiLIB1W43cXYDt91ig7ZUDxH8LUleureBA0FBQpJD2SMcAgb
 UNHrXjck4Z31Vhs/wXET3c6iFig1Ye/7L4gnnY6EOMnQbZVhfrbhwSsjt4KrgsnokZBp
 A1p6Q7OmxMou3guqNoPgxoR8ozWTLD8a4osGPPz0/K7s54GT57TjMcJOIbmll3ms7sRB
 J0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tRdupmYsQzIeY2HHVoYX0T08hhLSzqt3U9JZdyCWf7o=;
 b=gmnfcVwOm2cwSBStOcwW7XAQREwYKWWJLjYo3mmLjPudOcKddotPk0ywOQheEk+yJY
 Sr8QXEsFlfZb3UBCFZENIJ4yVs7M5Dyk1F1h/qXnwq3pK9fKk9r2v65fxO3nRIGIqd9P
 wWRSimzyPGsnlZ8oLoYm2LelM7VX893Vw55gtX7v4J+0C5Q7E0PgleR6idN5VHRojVA8
 YtPpDrWhmsCjYFW4s76kSRjrqTChsopNl8O1fFPQg1UlAhZk5CjLjNfssBxYLmV6zQqa
 wTokKNda8qq7EeUdw5tm93AxjFK57yWZRelPIjmBZh9IOW0IYaid6rRQtdU7DI9nRDl1
 emyg==
X-Gm-Message-State: AOAM532Te8ExAXANGolUcEvrspbWiI1A52LCZn83nvWBPBz1dX2nhfgh
 8QI03W+HDoHmEp+02dLcOv4jaTsuWYAkZao+XT0=
X-Google-Smtp-Source: ABdhPJz7laZ3EdRYcbNw5gGyMw+CRakubNxo7A1Az5jF5Saln+F6PlRBYYPjxCKHQESFNMYzK4y1EoCpgrkRk3c9iQQ=
X-Received: by 2002:a05:6830:2684:: with SMTP id
 l4mr20026451otu.294.1621908858486; 
 Mon, 24 May 2021 19:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210524225608.3191809-1-swethajoshi139@gmail.com>
 <8fbdab13-ed0e-047a-7a67-2e30471a46b1@linaro.org>
In-Reply-To: <8fbdab13-ed0e-047a-7a67-2e30471a46b1@linaro.org>
From: Swetha Joshi <swethajoshi139@gmail.com>
Date: Mon, 24 May 2021 19:14:08 -0700
Message-ID: <CALf2nmJV=K6nh67sc9K+xbnhoBrm_2qn6LttBdhVDqG4_pv1gQ@mail.gmail.com>
Subject: Re: [PATCH] Adding ifdefs to call the respective routines only when
 their configs are enabled
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005e439205c31e15a7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=swethajoshi139@gmail.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Swetha <swjoshi@microsoft.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005e439205c31e15a7
Content-Type: text/plain; charset="UTF-8"

Hey Richard,

I think I submitted the wrong patch, sorry about that. I will go ahead and
submit the correct commit id now. What I was trying to do was, when kvm is
enabled and if we don't want to include CONFIG_ARM_VIRT or
CONFIG_ACPI_APEI, compilation fails as virt_is_acpi_enabled() routine is
defined in virt.h and acpi_ghes_record_errors() is defined in ghes.h.

~ Swetha

On Mon, May 24, 2021 at 6:53 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 5/24/21 3:56 PM, Swetha Joshi wrote:
> > From: Swetha <swjoshi@microsoft.com>
> >
> > Signed-off-by: Swetha <swjoshi@microsoft.com>
>
> What are you trying to accomplish?
> That's what belongs in the commit message that you omitted.
>
> > +    bool acpi_enabled = false;
> > +#ifdef CONFIG_ARM_VIRT
> >       bool acpi_enabled = virt_is_acpi_enabled(vms);
>
> Of course this doesn't compile, having declared acpi_enabled twice.  So
> you
> have clearly not tested this patch sufficiently.
>
> The cc to qemu-trivial is unwarranted.
>
>
> r~
>


-- 
Regards

Swetha Joshi.

--0000000000005e439205c31e15a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey Richard,=C2=A0<div><br></div><div>I think I submitted=
=C2=A0the wrong patch, sorry about that. I will go ahead and submit the cor=
rect commit id now. What I was trying to do was, when kvm is enabled=C2=A0a=
nd if we don&#39;t want to include=C2=A0<span style=3D"color:rgb(80,0,80)">=
CONFIG_ARM_VIRT or CONFIG_ACPI_APEI, compilation fails as virt_is_acpi_enab=
led() routine is defined in virt.h and acpi_ghes_record_errors() is defined=
 in ghes.h.</span></div><div><span style=3D"color:rgb(80,0,80)"><br></span>=
</div><div><span style=3D"color:rgb(80,0,80)">~ Swetha</span></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, =
May 24, 2021 at 6:53 PM Richard Henderson &lt;<a href=3D"mailto:richard.hen=
derson@linaro.org">richard.henderson@linaro.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On 5/24/21 3:56 PM, Swetha J=
oshi wrote:<br>
&gt; From: Swetha &lt;<a href=3D"mailto:swjoshi@microsoft.com" target=3D"_b=
lank">swjoshi@microsoft.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Swetha &lt;<a href=3D"mailto:swjoshi@microsoft.com" tar=
get=3D"_blank">swjoshi@microsoft.com</a>&gt;<br>
<br>
What are you trying to accomplish?<br>
That&#39;s what belongs in the commit message that you omitted.<br>
<br>
&gt; +=C2=A0 =C2=A0 bool acpi_enabled =3D false;<br>
&gt; +#ifdef CONFIG_ARM_VIRT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool acpi_enabled =3D virt_is_acpi_enabled(v=
ms);<br>
<br>
Of course this doesn&#39;t compile, having declared acpi_enabled twice.=C2=
=A0 So you <br>
have clearly not tested this patch sufficiently.<br>
<br>
The cc to qemu-trivial is unwarranted.<br>
<br>
<br>
r~<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Regards<div><br></div><div>Swet=
ha Joshi.</div></div></div>

--0000000000005e439205c31e15a7--


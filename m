Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955BC49E7F2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 17:46:44 +0100 (CET)
Received: from localhost ([::1]:55866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD7v1-0006Qm-Ep
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 11:46:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nD6st-0006IK-W2
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:40:28 -0500
Received: from [2607:f8b0:4864:20::929] (port=37442
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nD6ss-0007JP-By
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:40:27 -0500
Received: by mail-ua1-x929.google.com with SMTP id b16so5456996uaq.4
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3udEl6Xiz2hlWouas8aLf4C3RQLf4zX4il2OAbsMkDo=;
 b=Tl0wVBW5EQtGVn/a7rGj53xS4nwfmhFhcsdXuqQwrCXj4BFpJws+A11D3u0kNAYBmf
 BAcZ2J18ZmisIVzQDkk0eKY3HOnlkfvy7/CjzoQua6lSZ+NxLhKAv2kIN3aLNiw0u+dk
 YXD4xzFG2tKrFbapiSSdIQcHn66YLJws2dh5CS0cceFNV7pPK+WPNx3bgrCehSKa7/ub
 PsAvWhBBVyDywPdf1rYg+CNpjx0JrPBm/ybhekinhYGyvKJ2l8loHDBRzGbq5wkkTAc8
 NrG2bPd02diXkv/NKHJJoZf+8SaaWbd9lvfYhbBZVoV7rjlcHSPnYqO3cGn/F+5uKjNi
 XWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3udEl6Xiz2hlWouas8aLf4C3RQLf4zX4il2OAbsMkDo=;
 b=NxO6cZklu77UrhOKsFCxIcbE9TPRMYpdBPnqzvDhrHYFtZqJd61HWsDAjD8S4LkDkx
 TpQZXQVjBVYLNl8FdoVBRiITZqOv2TT5MIjtSesOVrh+3HQcr0ojXvKCD6O5clJ7DgSc
 eQlPT7JpeF+gmtheQ343E4teIZcVIHeEjMqBgiD72KJHRIKCJPq5XdSGmOc93hAf+qSo
 jN0KnoAjEfDWwbq1YP5Mw52Sr8hFW6jzR3jpoNnasxZxnwRxKWqwicAR7NcsH4F0j3HW
 jW1y8yrVwNyXvRDMc85JQsFoffH3seelEGwMYWwbmaecmncXhMm09veHfq2uK24Oqece
 sf3A==
X-Gm-Message-State: AOAM531F8MMgt56XxvxrvS12a9C02UQFk/vmA2b4NDfGf5/HvJ77h69b
 HUacRscDm4kN/2VWwF2huQZx4hPEdaVBqeZOxdhQfA==
X-Google-Smtp-Source: ABdhPJwIQ+9l+PTtm5ADwKIyGMqZ+3/DuesTwFJS2V+90Vj5lTcd7ljwZ/Y8d3vWdnRkjkpTe9QtsPZGQnHh2bUqb3I=
X-Received: by 2002:a67:33c9:: with SMTP id z192mr1883447vsz.42.1643298025242; 
 Thu, 27 Jan 2022 07:40:25 -0800 (PST)
MIME-Version: 1.0
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-15-imp@bsdimp.com>
 <8d876840-8743-0e8b-c477-ca8a6e067d8c@linaro.org>
In-Reply-To: <8d876840-8743-0e8b-c477-ca8a6e067d8c@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 27 Jan 2022 08:40:14 -0700
Message-ID: <CANCZdfrViur=kLPYpZQPpAKjHLvohZXe35q1v+T1AFSFZjSiMw@mail.gmail.com>
Subject: Re: [PATCH v2 14/40] bsd-user/arm/target_arch_cpu.h: Use
 force_sig_fault for EXCP_UDEF
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000000e1b4605d69223fa"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::929;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Konrad Witaszczyk <def@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Kyle Evans <kevans@freebsd.org>, Jessica Clarke <jrtc27@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000e1b4605d69223fa
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 26, 2022 at 11:27 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 1/25/22 12:29, Warner Losh wrote:
> > +        case EXCP_NOCP:
> > +        case EXCP_INVSTATE:
> > +            /*
> > +             * See arm/arm/undefined.c undefinedinstruction();
> > +             *
> > +             * A number of details aren't emulated (they likely don't
> matter):
> > +             * o Misaligned PC generates ILL_ILLADR
>
> As I mentioned, misaligned pc will not come here for qemu.
> In the Arm ARM, see aarch32/functions/registers/BXWritePC:
>
> // For branches to an unaligned PC counter in A32 state, the processor
> takes the branch
> // and does one of:
> // * Forces the address to be aligned
> // * Leaves the PC unaligned, meaning the target generates a PC Alignment
> fault.
>
> The hardware will either refuse to allow bit 1 to be set when bit 0 is
> clear, OR it will
> generate a PREFETCH_DATA_ABORT for Alignment.
>
> QEMU will do the latter.
>

Ah, right. I'd meant to update the comments and it slipped my mind. I'll
note
that this can't happen in qemu.


>
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

Thanks for this (and all the other) review and feedback.

Warner




> r~
>

--0000000000000e1b4605d69223fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 26, 2022 at 11:27 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 1/25/22 12:29, Warner Losh wrote:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case EXCP_NOCP:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case EXCP_INVSTATE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* See arm/arm/undefin=
ed.c undefinedinstruction();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* A number of details=
 aren&#39;t emulated (they likely don&#39;t matter):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* o Misaligned PC gen=
erates ILL_ILLADR<br>
<br>
As I mentioned, misaligned pc will not come here for qemu.<br>
In the Arm ARM, see aarch32/functions/registers/BXWritePC:<br>
<br>
// For branches to an unaligned PC counter in A32 state, the processor take=
s the branch<br>
// and does one of:<br>
// * Forces the address to be aligned<br>
// * Leaves the PC unaligned, meaning the target generates a PC Alignment f=
ault.<br>
<br>
The hardware will either refuse to allow bit 1 to be set when bit 0 is clea=
r, OR it will <br>
generate a PREFETCH_DATA_ABORT for Alignment.<br>
<br>
QEMU will do the latter.<br></blockquote><div><br></div><div>Ah, right. I&#=
39;d meant to update the comments and it slipped my mind. I&#39;ll note</di=
v><div>that this can&#39;t happen in qemu.</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
Otherwise,<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockqu=
ote><div><br></div><div>Thanks for this (and all the other) review and feed=
back.</div><div><br></div><div>Warner</div><div><br></div><div><br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
r~<br>
</blockquote></div></div>

--0000000000000e1b4605d69223fa--


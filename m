Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9384A79AD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 21:44:09 +0100 (CET)
Received: from localhost ([::1]:57204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFMU3-0001c2-Tw
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 15:44:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nFLhk-0004gS-9X
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:54:12 -0500
Received: from [2607:f8b0:4864:20::92d] (port=39488
 helo=mail-ua1-x92d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nFLha-0002VY-Ew
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:54:04 -0500
Received: by mail-ua1-x92d.google.com with SMTP id p7so1207059uao.6
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 11:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cX2blC5KhRCYRUM2x9po4Ja4u0c/2I/cGmVPTsdOfrU=;
 b=UBEeHYVxNZcIZHjS80qVaWQtD0pfByoIp3/7q1pRay1DZjZcmsQlc6KUYq9+mBwDbS
 G2qLb90xchp4W1P+36j7yC0MYTRdVGQ3w8JGEuiZzv4JV/W3u7egma7KIzkLNDDUsdoy
 crycDSRFbgj20CaysAzGmhBw2rbBqGm+jeOzeOZYq4TjUNSzW7xMSxWGQuZRcwYmnWCY
 aBk2e9rWQ2XX33EKamZIiBk8jvuvhSxZK64PyUZ52q6RW4hR0Cwb1Hv71OcHfwP156Li
 1xdih+rnDGp9V/N023Kxk0UdsCPhFrwZY0h0q3x7CtWSFnsvYFTIpUwfkMR/zDjE78rQ
 UAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cX2blC5KhRCYRUM2x9po4Ja4u0c/2I/cGmVPTsdOfrU=;
 b=Py4O6p30LgO774LEim537o0clV37svMWVhVYqhK4uRqHmyxSXPiXtYMi/uPpUBi8z2
 6WnMSHkmAA6U8QAt+HJSs7YAgT2Li08cUiCbshX0B5RYmoc/TFD1P5YFVzxigFSs9cuZ
 3cAIgoXlHJ0AN4laMvuVDq2qdB9ZNw1Jby6BhPSVgCDb108vff/07smd+j0uV4ylyP0O
 96o/RotsqCLDzUhQsP3TyqQQeas1ko0BDzba9gb0BlIfFrMoLWagZoXP6MsK9vraVT6L
 rZibQd25wCArAZF5D+6Yef0yH1iBd5uV2s/GgFG34vwBLJpIQ12R05peX3DIt6r4rFJ6
 YdMA==
X-Gm-Message-State: AOAM533zBw/fIHL9lWNz275OFVZNjLM8IC494ibFxEeZYREKMlDhPxbC
 RHtwrDXhkIw/upVY85k+sFMvQprPV/ktV7vHO/q6og==
X-Google-Smtp-Source: ABdhPJxl16NuT9+WgCWke0mZYTpcXL4UkR1BuH6JaKYJ2kw1H0utqaHjv93D74Zpwnst8T4gldHGqyPMLVV7JEr7mLg=
X-Received: by 2002:a67:6ec5:: with SMTP id j188mr718740vsc.36.1643831641261; 
 Wed, 02 Feb 2022 11:54:01 -0800 (PST)
MIME-Version: 1.0
References: <20220201163005.989457-1-venture@google.com>
 <59040e43-2375-1f73-15bb-ce1a47165145@amsat.org>
 <CAO=notxPP8+b6S6UnUX7s4yWQsEhaAS0CZbn1my0HEN2idL6tA@mail.gmail.com>
 <CAO=notw9jYSc6xGr3_kwuAWHG2J3VJ7WxJT+tL_fbXFfTRrhpw@mail.gmail.com>
 <CAO=notzLfum_zkXhP+xQ9RTxcpG3oNxwFMPYWz+o1vYdF8ynQg@mail.gmail.com>
 <CAFEAcA-N3BwSNsXSidXK6PgmjDrGfOQabyfVRv03nnyLpsBURw@mail.gmail.com>
In-Reply-To: <CAFEAcA-N3BwSNsXSidXK6PgmjDrGfOQabyfVRv03nnyLpsBURw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 2 Feb 2022 11:53:50 -0800
Message-ID: <CAO=notzSLm-Huy6nHShd+QzpGb2bWLysWuiwBxb5JGueeuUouQ@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c: flatten pca954x mux device
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Corey Minyard <cminyard@mvista.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 Hao Wu <wuhaotsh@google.com>
Content-Type: multipart/alternative; boundary="0000000000000cda7105d70e6144"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=venture@google.com; helo=mail-ua1-x92d.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--0000000000000cda7105d70e6144
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 2, 2022 at 11:01 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 2 Feb 2022 at 17:36, Patrick Venture <venture@google.com> wrote:
> > Just saw your reply, and found a bunch of other non-spam in my
> > spam folder.  I sent the message to the anti-spam team, hopefully
> > that'll resolve this for myself and presumably others.
>
> I dunno if you folk get a specially tuned version or just
> the standard gmail spam filter, but IME it's not very good
> with mailing list traffic. In particular "this is a patch"
> should be a really really easy thing to detect as not-spam
> but it doesn't always manage it. I have my filters set to
> "Do not send to spam" for mailing list traffic...
>

I'm sure we have some dogfood version.  I have a rule set to all
mailing list from qemu-devel to go into a label and everything... but it
gets the label and then is sometimes sent right to spam, even in messages
where it's an active thread (like this one).  And I just saw some other
messages I missed.


>
> -- PMM
>

--0000000000000cda7105d70e6144
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 2, 2022 at 11:01 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, 2 Feb 2022 at 17:36, Patrick Venture &lt;<a href=3D"mailto:ve=
nture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br>
&gt; Just saw your reply, and found a bunch of other non-spam in my<br>
&gt; spam folder.=C2=A0 I sent the message to the anti-spam team, hopefully=
<br>
&gt; that&#39;ll resolve this for myself and presumably others.<br>
<br>
I dunno if you folk get a specially tuned version or just<br>
the standard gmail spam filter, but IME it&#39;s not very good<br>
with mailing list traffic. In particular &quot;this is a patch&quot;<br>
should be a really really easy thing to detect as not-spam<br>
but it doesn&#39;t always manage it. I have my filters set to<br>
&quot;Do not send to spam&quot; for mailing list traffic...<br></blockquote=
><div><br></div><div>I&#39;m sure we have some dogfood=C2=A0version.=C2=A0 =
I have a rule set to all mailing=C2=A0list from qemu-devel to go into a lab=
el and everything... but it gets the label and then is sometimes sent right=
 to spam, even in messages where it&#39;s an active thread (like this one).=
=C2=A0 And I just saw some other messages I missed.</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- PMM<br>
</blockquote></div></div>

--0000000000000cda7105d70e6144--


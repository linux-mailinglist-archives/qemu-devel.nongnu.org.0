Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D0E550ABD
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 15:05:19 +0200 (CEST)
Received: from localhost ([::1]:55444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2ucA-0003O7-LN
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 09:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imranyusuff@gmail.com>)
 id 1o2pWJ-0005eB-J4
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 03:38:55 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:35604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imranyusuff@gmail.com>)
 id 1o2pWH-0007F6-Hu
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 03:38:55 -0400
Received: by mail-ej1-x629.google.com with SMTP id me5so15734783ejb.2
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 00:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Usy/NUqEmIXv7QCQsFYF1bnnii6EVaTCkPbLbWFRlTs=;
 b=nkP3OGunvSU/rZQuLaf+AiHjzqtipKAQiPyghLsCn50wqrVguq9Y7b2JQ/SZWobL4i
 iPs23DOQK3HRsu+3LHkloKSp8lcYQ7sb5BUBPzTXqII6+OFNQu/OuRZC3Cyqq5mYhox+
 mY2oMd3ckNBAeR/MjD4qUApiGP4cCwK0ZItO1yWlflpa/alMVrE9YarR/1m2VYLZdPC6
 Q8tyLowtrGetTSBQ5H37c4uWfGI/0t8+s+9BZH2Uv8hpmNedlFJFlwjv8zcv4eeOJf+/
 qLPA2pwIT1lOFtAd2XaqEwLSGg0VqLRnetR5y++q+3NqGUiXrE4beZFKOjZtGRUldLn+
 UVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Usy/NUqEmIXv7QCQsFYF1bnnii6EVaTCkPbLbWFRlTs=;
 b=1T62nRYtFrrsXJ4i/bEL/v3haKLnJziOY+A/xFfIX3jjWz3C2qFURH5rPAh7MOWqNi
 y6z4VJ2k8w9XdOgEoZb5fHzdLcCMZv4LqzR86B0JVUXyOLk+c7oQhhJOmzTm116lQxg/
 7bC4eTQAlBDRhjoW0FhuZTL8kiDveErgpzBsdnyc3neDMSwk/eGVEf2mLWIhy93QkemL
 us4m6SpVPudncAAvHYdGAx0zEwq0kAznql64pfWlnVyylAMTS59ZrU1nr+JU1rwxdCWI
 9YS2DFJUj+uHY03ewqPQ1YeXXnpfNUasUD48FX+F6OKLxAt3F6GYVY1RWO9uzfsm0JP4
 VhGQ==
X-Gm-Message-State: AJIora/YI8EL4Tss7eY20jPh7CVizBmYtnFRR574AsJlLqPHZdUuGpwb
 ek916b6+I/I7lfibHohKyA4M27jdBYosi9eJRQ==
X-Google-Smtp-Source: AGRyM1tX3zsTNk3Ytr4YPD6DR3kzwjz/T3+kCkuLrHQR9bx3lcMbCDw7yA0Gqr33s2fOazcarDAobu32NOBTF2A0gfc=
X-Received: by 2002:a17:907:3f04:b0:6e8:4b0e:438d with SMTP id
 hq4-20020a1709073f0400b006e84b0e438dmr15907984ejc.391.1655624331658; Sun, 19
 Jun 2022 00:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220619004136.35351-1-imranyusuff@gmail.com>
 <6fd5c3dc-fe09-a194-5d5c-6a34dbcc6ce8@gmail.com>
In-Reply-To: <6fd5c3dc-fe09-a194-5d5c-6a34dbcc6ce8@gmail.com>
From: Imran Yusuff <imranyusuff@gmail.com>
Date: Sun, 19 Jun 2022 08:38:40 +0100
Message-ID: <CAHtanb8nR64kMoLu_bnVPMUvz5rK027LYpZuVn6hp0RhoeAeZw@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Fixed modeswitching glitch in zoomed fullscreen
 mode
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000002b8bdc05e1c81471"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=imranyusuff@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 19 Jun 2022 09:01:22 -0400
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

--0000000000002b8bdc05e1c81471
Content-Type: text/plain; charset="UTF-8"

Hi,

Many thanks for the feedback. Actually I have investigated this by writing
printfs in between statements to print out the 'self rect' values, and
apparently the statement [normalWindow setFrame:NSMakeRect([normalWindow
frame].origin.x, ... modifies this 'self rect' values, for reason I am not
sure why, hence the suggested additional statement to undo this. So yes,
case 2 seems to make more sense, but it will not be executed in windowed
(non-fullscreen) mode.

Many thanks for the code rewrite patch. It seems like a more proper work
and I will definitely test this. I will get back to you soon once done.

Regards,
Imran Yusuff

On Sun, Jun 19, 2022 at 5:00 AM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On 2022/06/19 9:41, Imran Yusuff wrote:
> > This applies only on macOS using cocoa UI library.
> >
> > In zoom-to-fit fullscreen mode, upon graphics mode switch,
> > the viewport size is wrong, and the usual consequence
> > is only a part of the screen is visible. One have to exit
> > and reenter fullscreen mode to fix this.
> >
> > This is reproducible by setting up a Windows 3.11 system,
> > booting into DOS, enable zoom-to-fit, enter fullscreen mode and
> > start Windows by 'win'. Then you can see only part of the screen.
> >
> > This commit fixes this problem, by including one line of code
> > which is from the fullscreen mode initialization.
> >
> > Signed-off-by: Imran Yusuff <imranyusuff@gmail.com>
> > ---
> >   ui/cocoa.m | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/ui/cocoa.m b/ui/cocoa.m
> > index 84c84e98fc..bd602817cd 100644
> > --- a/ui/cocoa.m
> > +++ b/ui/cocoa.m
> > @@ -636,6 +636,7 @@ - (void) switchSurface:(pixman_image_t *)image
> >       if (isFullscreen) {
> >           [[fullScreenWindow contentView] setFrame:[[NSScreen
> mainScreen] frame]];
> >           [normalWindow setFrame:NSMakeRect([normalWindow
> frame].origin.x, [normalWindow frame].origin.y - h + oldh, w, h +
> [normalWindow frame].size.height - oldh) display:NO animate:NO];
> > +        [self setFrame:NSMakeRect(cx, cy, cw, ch)];
> >       } else {
> >           if (qemu_name)
> >               [normalWindow setTitle:[NSString stringWithFormat:@"QEMU
> %s", qemu_name]];
>
> [self setFrame:NSMakeRect(cx, cy, cw, ch)] already exist in the earlier
> part of the method. It is redundant and not a proper way to fix. It is
> necessary to understand why adding the same statement fixes the problem,
> and to fix it without duplicate statements. I can think of two
> possibilities:
> 1. The isResize variable is not enough to cover all the situations when
> the statement needs to be executed.
> 2. The statement needs to be executed after [normalWindow setFrame:].
>
> In case 1, you need to assign a correct value to isResize or add [self
> setFrame:] to somewhere else, but not in [-CocoaView switchSurface].
> Putting the statement in [-CocoaView switchSurface] may cause redundant
> execution of the statement when isResize is true as I explained.
>
> In case 2, the existing statement should be simply moved.
>
> By the way, I have a patch to rewrite the code implementing full screen
> so you may try it. If you tested the patch, please give Tested-by.
> https://patchew.org/QEMU/20220316060244.46669-1-akihiko.odaki@gmail.com/
>
> Regards,
> Akihiko Odaki
>

--0000000000002b8bdc05e1c81471
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Many thanks for the feedback. Actua=
lly I have investigated this by writing printfs in between statements to pr=
int out the &#39;self rect&#39; values, and apparently the statement=C2=A0<=
span style=3D"color:rgb(0,0,0);font-family:Menlo;font-size:11px">[normalWin=
dow setFrame:NSMakeRect([normalWindow frame].origin.x, ...=C2=A0</span>modi=
fies this &#39;self rect&#39; values, for reason I am not sure why, hence t=
he suggested additional statement to undo this. So yes, case 2 seems to mak=
e more sense, but it will not be executed in windowed (non-fullscreen) mode=
.</div><div><br></div><div>Many thanks for the code rewrite patch. It seems=
 like a more proper work and I will definitely test this. I will get back t=
o you soon once done.</div><div><br></div><div>Regards,</div><div>Imran Yus=
uff</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Sun, Jun 19, 2022 at 5:00 AM Akihiko Odaki &lt;<a href=3D"mailt=
o:akihiko.odaki@gmail.com">akihiko.odaki@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);p=
adding-left:1ex">On 2022/06/19 9:41, Imran Yusuff wrote:<br>
&gt; This applies only on macOS using cocoa UI library.<br>
&gt; <br>
&gt; In zoom-to-fit fullscreen mode, upon graphics mode switch,<br>
&gt; the viewport size is wrong, and the usual consequence<br>
&gt; is only a part of the screen is visible. One have to exit<br>
&gt; and reenter fullscreen mode to fix this.<br>
&gt; <br>
&gt; This is reproducible by setting up a Windows 3.11 system,<br>
&gt; booting into DOS, enable zoom-to-fit, enter fullscreen mode and<br>
&gt; start Windows by &#39;win&#39;. Then you can see only part of the scre=
en.<br>
&gt; <br>
&gt; This commit fixes this problem, by including one line of code<br>
&gt; which is from the fullscreen mode initialization.<br>
&gt; <br>
&gt; Signed-off-by: Imran Yusuff &lt;<a href=3D"mailto:imranyusuff@gmail.co=
m" target=3D"_blank">imranyusuff@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0ui/cocoa.m | 1 +<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/ui/cocoa.m b/ui/cocoa.m<br>
&gt; index 84c84e98fc..bd602817cd 100644<br>
&gt; --- a/ui/cocoa.m<br>
&gt; +++ b/ui/cocoa.m<br>
&gt; @@ -636,6 +636,7 @@ - (void) switchSurface:(pixman_image_t *)image<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (isFullscreen) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[[fullScreenWindow contentView=
] setFrame:[[NSScreen mainScreen] frame]];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[normalWindow setFrame:NSMakeR=
ect([normalWindow frame].origin.x, [normalWindow frame].origin.y - h + oldh=
, w, h + [normalWindow frame].size.height - oldh) display:NO animate:NO];<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [self setFrame:NSMakeRect(cx, cy, cw, ch)=
];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (qemu_name)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[normalWindow se=
tTitle:[NSString stringWithFormat:@&quot;QEMU %s&quot;, qemu_name]];<br>
<br>
[self setFrame:NSMakeRect(cx, cy, cw, ch)] already exist in the earlier <br=
>
part of the method. It is redundant and not a proper way to fix. It is <br>
necessary to understand why adding the same statement fixes the problem, <b=
r>
and to fix it without duplicate statements. I can think of two <br>
possibilities:<br>
1. The isResize variable is not enough to cover all the situations when <br=
>
the statement needs to be executed.<br>
2. The statement needs to be executed after [normalWindow setFrame:].<br>
<br>
In case 1, you need to assign a correct value to isResize or add [self <br>
setFrame:] to somewhere else, but not in [-CocoaView switchSurface]. <br>
Putting the statement in [-CocoaView switchSurface] may cause redundant <br=
>
execution of the statement when isResize is true as I explained.<br>
<br>
In case 2, the existing statement should be simply moved.<br>
<br>
By the way, I have a patch to rewrite the code implementing full screen <br=
>
so you may try it. If you tested the patch, please give Tested-by.<br>
<a href=3D"https://patchew.org/QEMU/20220316060244.46669-1-akihiko.odaki@gm=
ail.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU/202=
20316060244.46669-1-akihiko.odaki@gmail.com/</a><br>
<br>
Regards,<br>
Akihiko Odaki<br>
</blockquote></div>

--0000000000002b8bdc05e1c81471--


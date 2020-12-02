Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BAB2CC467
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 18:58:19 +0100 (CET)
Received: from localhost ([::1]:57094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkWOQ-0001p5-A6
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 12:58:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1kkWMS-0001Ff-F5
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 12:56:16 -0500
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934]:38321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1kkWMO-0004uw-Lk
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 12:56:16 -0500
Received: by mail-ua1-x934.google.com with SMTP id y26so751389uan.5
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 09:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=09INGVHMN5TakIKF2aj1Viampd28NfJylJzX8wEfJuQ=;
 b=l7LOlrZ2/4PbQh7Ti6asUpacIAN9KUIibCULGb2zjr0aSe4G5GgkMpGnI6ZS+DtNm/
 Tvfg+GjqVVV22RPp/BgelVBV3g3AYZ+KhXtqAtM/KPqsyGqSnV2Irsk3EDJ8olQRMa63
 W+QfSRsygmbFcHlXk/YsNRd8pHxiYJUNshgHF7lp2LoqN8OQzi1o5mHpChQYwIRKJu0u
 aO653/CJarqzlDCWz99oIKfPzCqpm9Uj5bWSFvrum5T8N4cLTFYWdsW4x3jRotmJVyvB
 Urlvj7mL+F8ZSw/j59csp/QDvK2PVEDqGx7UrHcM7KdMGt4p6tsDOXmxbPS+/CSmD29G
 ARTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=09INGVHMN5TakIKF2aj1Viampd28NfJylJzX8wEfJuQ=;
 b=aJq+AiPxQ3reXnnOH6tiTcy2wudXrxYAL4fAxGk3lAuZ+y5+O1zgq6ysjJUvYj0WLc
 z6mtK1+qmNm4fVb9OA45SEgSF26J4uiDiaav0/knmyoNv3/RdpIkLGDnxjp30Wzkk76c
 xqPBZE/5/JAnekSuzwGtNHK+UtNjTvrKDXL8e08/RRtual2Ad66VoIMQJGOTXBz0q7HV
 0Q/+qGCKiDxv6jJSLZbXLljcAROFilCX1mE+3r2txFac33HJ8dIwesRFxVwfrGQtmdam
 aU9HBjZGWHpnqTPj+g4JnQf2hvhYvFMIQFG4c6pIgVDHIZB9/s4ABsLVdgg3EB4ozF7t
 qIXg==
X-Gm-Message-State: AOAM533OlJZ2mIVWDT2S0GJKlaTc0/kG0rVR6+cf/le65STBYiOLgM+q
 Vz/XNNGOXCpq/rhxwtPO9ICDoEKRl42WzTLo6MZDMQ==
X-Google-Smtp-Source: ABdhPJzeOhWY+E77krW21DFAw9ons2t0kzgZT+RzwiRq0z0o1n+8CIDrFUuYkxXPMMkCL+E1PAC+T+9G0C9k6WVCV6Q=
X-Received: by 2002:ab0:1d83:: with SMTP id l3mr2655334uak.41.1606931771333;
 Wed, 02 Dec 2020 09:56:11 -0800 (PST)
MIME-Version: 1.0
References: <160687065946.3791.11439184384818467145.malonedeb@soybean.canonical.com>
 <871rg87l7h.fsf@dusky.pond.sub.org>
 <CADPb22S+3j_zpd0iVo=MNPO8=txhYt8iicBge6=B7wFq3ZO0eQ@mail.gmail.com>
 <CAFEAcA8j=zFdN2G43snWPo72JL+PR3F8O4wHJgL7MOSGp4yv-g@mail.gmail.com>
In-Reply-To: <CAFEAcA8j=zFdN2G43snWPo72JL+PR3F8O4wHJgL7MOSGp4yv-g@mail.gmail.com>
From: Doug Evans <dje@google.com>
Date: Wed, 2 Dec 2020 09:55:35 -0800
Message-ID: <CADPb22RPYnDvCSM+k5YF_H6aD42V0Z1jzJPXMo3VgMwakvC=kg@mail.gmail.com>
Subject: Re: [Bug 1906463] [NEW] "-device help" does not report all devices
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000069151505b57ef509"
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=dje@google.com; helo=mail-ua1-x934.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000069151505b57ef509
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 2, 2020 at 9:41 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 2 Dec 2020 at 16:51, Doug Evans <dje@google.com> wrote:
> >
> > Btw, if I may ask another dumb question, I get this:
> >
> > @ruffy:build-arm$ ./qemu-system-arm -M virt -monitor stdio
> > Unable to init server: Could not connect: Connection refused
> > QEMU 5.1.93 monitor - type 'help' for more information
> > (qemu) gtk initialization failed
> > <exit>
> >
> > If I add "-display none" then it works, but it's odd that it's trying to
> initialize with gtk here ($DISPLAY isn't set, there is no X present).
>
> That's expected. By default we try to create a GUI window.
> If DISPLAY is not set, then that fails, which is why
> we print "gtk initialization failed" and exit.
> This is the same behaviour as other GUI apps:
>
> $ DISPLAY= xterm
> xterm: Xt error: Can't open display:
> xterm: DISPLAY is not set
>
> $ DISPLAY= firefox
> Unable to init server: Broadway display type not supported:
> Error: cannot open display:
>
> $ DISPLAY= evince
> Unable to init server: Could not connect: Connection refused
> Cannot parse arguments: Cannot open display:
>
> If you don't want graphics you should tell QEMU you
> don't want graphics (eg with '-display none').
>
> This seems to me more helpful to most users than the
> alternative (if you know you don't want the GUI then
> it's easy to disable it; but most non-sophisticated
> users do want it).
>


Thanks. That's not unreasonable.

OTOH, all those examples don't have a non-X mode.
As counterexamples there's emacs and gvim.

The present situation is fine, now that I understand it.
I can write a wrapper that DTRT.

--00000000000069151505b57ef509
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Wed, Dec 2, 2020 at 9:41 AM Peter Maydell &lt;<a href=3D"m=
ailto:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org<=
/a>&gt; wrote:<br></div></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Wed, 2 Dec 2020 at 16:51, Doug Evans &l=
t;<a href=3D"mailto:dje@google.com" target=3D"_blank">dje@google.com</a>&gt=
; wrote:<br>
&gt;<br>
&gt; Btw, if I may ask another dumb question, I get this:<br>
&gt;<br>
&gt; @ruffy:build-arm$ ./qemu-system-arm -M virt -monitor stdio<br>
&gt; Unable to init server: Could not connect: Connection refused<br>
&gt; QEMU 5.1.93 monitor - type &#39;help&#39; for more information<br>
&gt; (qemu) gtk initialization failed<br>
&gt; &lt;exit&gt;<br>
&gt;<br>
&gt; If I add &quot;-display none&quot; then it works, but it&#39;s odd tha=
t it&#39;s trying to initialize with gtk here ($DISPLAY isn&#39;t set, ther=
e is no X present).<br>
<br>
That&#39;s expected. By default we try to create a GUI window.<br>
If DISPLAY is not set, then that fails, which is why<br>
we print &quot;gtk initialization failed&quot; and exit.<br>
This is the same behaviour as other GUI apps:<br>
<br>
$ DISPLAY=3D xterm<br>
xterm: Xt error: Can&#39;t open display:<br>
xterm: DISPLAY is not set<br>
<br>
$ DISPLAY=3D firefox<br>
Unable to init server: Broadway display type not supported:<br>
Error: cannot open display:<br>
<br>
$ DISPLAY=3D evince<br>
Unable to init server: Could not connect: Connection refused<br>
Cannot parse arguments: Cannot open display:<br>
<br>
If you don&#39;t want graphics you should tell QEMU you<br>
don&#39;t want graphics (eg with &#39;-display none&#39;).<br>
<br>
This seems to me more helpful to most users than the<br>
alternative (if you know you don&#39;t want the GUI then<br>
it&#39;s easy to disable it; but most non-sophisticated<br>
users do want it).<br></blockquote><div><br></div><div><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Thanks. That&#39;s not unreaso=
nable.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">OTOH, all those ex=
amples don&#39;t have a non-X mode.</div><div class=3D"gmail_default" style=
=3D"font-size:small">As counterexamples there&#39;s emacs and gvim.</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">The present situation is fine,=
 now that I understand it.</div><div class=3D"gmail_default" style=3D"font-=
size:small">I can write a wrapper that DTRT.</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small"></div></div></div>

--00000000000069151505b57ef509--


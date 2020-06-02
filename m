Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 089F41EC365
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 22:05:56 +0200 (CEST)
Received: from localhost ([::1]:59416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgDAY-00015h-GM
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 16:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrea.palmate@gmail.com>)
 id 1jgA1J-00027M-Jb; Tue, 02 Jun 2020 12:44:09 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:45245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrea.palmate@gmail.com>)
 id 1jgA1I-0003TN-DN; Tue, 02 Jun 2020 12:44:09 -0400
Received: by mail-lf1-x12e.google.com with SMTP id d7so6549569lfi.12;
 Tue, 02 Jun 2020 09:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y+Uy3JRWtnAAZnb9OFa+JM4IeQLYsoo4q4M8wxV1BVg=;
 b=Mxs16OIkn3MJKBhjCRXM26HpFBSE4pW7vcog06+Eiu37onS926uCOkGt28NObzOkJD
 c5pGsTDqvK+KbWkjV/qQsfzF0XsaLmCJwwQJvTXC9q3406Fe+oqgh2eOYcUef03BUzaR
 5jIt/n2dlfFAUO38v8+dX0G/I6EXqz4OxBHpWG222yNI8KvmfL5eQeJZPwPsFP95oC3T
 4YTD/u5bke4EPISHBNJM43mDAlN2ZZ6mfGOlWtBZRg9AM/vsbbD7b4DVDelybM/6HTfh
 sDBM7eMUAPY9FvIh/IorGLTt0YCWjE/gAnBDBrzZndy1B+dtrf6u9NvEx4tVkJUrCmKW
 zuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y+Uy3JRWtnAAZnb9OFa+JM4IeQLYsoo4q4M8wxV1BVg=;
 b=JNT2nJirfH1qL/DxIPfbTPSNbLq9TLmxCPJWAjHINLM/Ed4rw22ZEJDcAsEEdEBYvg
 aeoV52ZSB0j+fiKeuPTiCKVPcoVYgNJA0heLyMdFH8VACPCynU0Jqa6wB8Xjpg3W1rPH
 VYEq9LYoj5POWpLYUntuJCFwCO/ngmmbCtozuMvGFPrCxPH12NPbRGM6kaKIYd8wnxqh
 JHdirHZBpq4H2R1/fm1JSjdWRGWcA0JgKmHN1LXEMJFacMr3CYGnzwB1/qKMehl9NQm0
 duRa5fIM+K3QnRRRUiLZzUNnmK+QhFmYT0dCiyK6w3MD0VaYvNHVKP7ixlb/dKXj34Fl
 sfLg==
X-Gm-Message-State: AOAM530DgMUpjUkiggVbBBmNn7cXna0MjPR7+ZSls8HA4rEMiaWi2Rlf
 ccZ6lomOvl0+dynblqyCGCRI+eG3GJ1KaGSICNo=
X-Google-Smtp-Source: ABdhPJzkUZJ7aEqWduzRTv9RbPbnoZqsT1fmvGUroyLy3kINfx4X9459AqqmbQiHLeiX7kCIoyamE2ic/cP2xBjuJWg=
X-Received: by 2002:a05:6512:3a6:: with SMTP id
 v6mr155717lfp.136.1591116245652; 
 Tue, 02 Jun 2020 09:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAD+yzTSr2edTNmzkGOH7todx7uVPbL_BSNSJPb62mJWCUSa8NA@mail.gmail.com>
 <4d64c939-3431-b637-488e-676a5f9171e5@amsat.org>
 <alpine.BSF.2.22.395.2006021510140.40694@zero.eik.bme.hu>
 <alpine.BSF.2.22.395.2006021647240.70962@zero.eik.bme.hu>
In-Reply-To: <alpine.BSF.2.22.395.2006021647240.70962@zero.eik.bme.hu>
From: =?UTF-8?Q?Andrea_Palmat=C3=A8?= <andrea.palmate@gmail.com>
Date: Tue, 2 Jun 2020 18:43:51 +0200
Message-ID: <CAD+yzTRCwsMgG9JUoyCi7ecc_Vmph7GJjrdH7moqLGfmKMjvVg@mail.gmail.com>
Subject: Re: Sam460Ex screen mode, audio and network
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: multipart/alternative; boundary="0000000000009e593005a71c9e26"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=andrea.palmate@gmail.com; helo=mail-lf1-x12e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 02 Jun 2020 16:04:31 -0400
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-discuss@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009e593005a71c9e26
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zoltan,
I've forwarded the message to Massimiliano Tretene. I'm waiting for his
answer.
In the meanwhile i've tried to add -device ES1370 but i get no audio at
all. I've also a lot of shared "memfd open() failed: Function not
implemented" errors on console
Regard the video mode. I'm pretty sure that resolutions like 1366x768
should work but not unticking the "default" checkbox. They needs to be
created by Screenmode program. The strange thing is that during
installation i've created successfully the resolution (that however had
that problem). Now with the OS even if the resolution is created i have
1024x768 twice.
I've also a problem that host mouse pointer is shown. I've read that i need
to add a "tabled" device in the xml file. But where i have to create that
file? Keep in mind that i'm using Ubuntu on Windows 10 via WSL and not an
ubuntu machine

Andrea

Il giorno mar 2 giu 2020 alle ore 16:58 BALATON Zoltan <balaton@eik.bme.hu>
ha scritto:

> On Tue, 2 Jun 2020, BALATON Zoltan wrote:
> > On Tue, 2 Jun 2020, Philippe Mathieu-Daud=C3=A9 wrote:
> >> Cc'ing the sam460ex maintainer.
> >> On 6/1/20 8:01 PM, Andrea Palmat=C3=A8 wrote:
> >>> It is working on an i5 laptop. I've tried to use the native screen mo=
de
> >>> 1366x768 but it has some problems. It seems a stride problem and so i=
s
> >>> not usable
> >
> > I'm not sure if it's a problem on AmigaOS side or in emulation. How to
> > reproduce this? Such resolution does not show up for me in ScreenMode
> prefs
> > so cannot be simply selected.
>
> OK I've got it. I think you've unticked default and set a custom width.
> This seems to set the width of frame buffer in memory but the mode the
> card is programmed to use is still the one selected from the list so this
> won't work. It seems to be either a bug in AmigaOS or the width option
> does not do what you may think. Maybe ask AmigaOS developers or aCube who
> wrote the driver about this. (Another known issue is that 24/32 bit modes
> are not available with the AmigaOS SM502 driver which would be needed for
> optimal performance with QEMU, the 16 bit mode it offers is much slower
> because it has to be converted on every display update.)
>
> Regards,
> BALATON Zoltan



--=20
Saluti,
Andrea Palmat=C3=A8

--0000000000009e593005a71c9e26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Zoltan,<div>I&#39;ve forwarded the message to Massimili=
ano Tretene. I&#39;m waiting for his answer.</div><div>In the meanwhile i&#=
39;ve tried to add -device ES1370 but i get no audio at all. I&#39;ve also =
a lot of=C2=A0shared &quot;memfd open() failed: Function not implemented&qu=
ot; errors on console</div><div>Regard the video mode. I&#39;m pretty sure =
that resolutions like 1366x768 should work but not unticking the &quot;defa=
ult&quot; checkbox. They needs to be created by Screenmode program. The str=
ange thing is that during installation i&#39;ve created successfully the re=
solution (that however had that problem). Now with the OS even if the resol=
ution is created i have 1024x768 twice.</div><div>I&#39;ve also a problem t=
hat host mouse pointer is shown. I&#39;ve read that i need to add a &quot;t=
abled&quot; device in the xml file. But where i have to create that file? K=
eep in mind that i&#39;m using Ubuntu on Windows 10 via WSL and not an ubun=
tu machine</div><div><br></div><div>Andrea</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il giorno mar 2 giu 2020 al=
le ore 16:58 BALATON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balat=
on@eik.bme.hu</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Tue, 2 Jun 2020, BALATON Zoltan wrote:<br>
&gt; On Tue, 2 Jun 2020, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt;&gt; Cc&#39;ing the sam460ex maintainer.<br>
&gt;&gt; On 6/1/20 8:01 PM, Andrea Palmat=C3=A8 wrote:<br>
&gt;&gt;&gt; It is working on an i5 laptop. I&#39;ve tried to use the nativ=
e=C2=A0screen mode<br>
&gt;&gt;&gt; 1366x768 but it has some problems. It seems a stride problem a=
nd so is<br>
&gt;&gt;&gt; not usable<br>
&gt;<br>
&gt; I&#39;m not sure if it&#39;s a problem on AmigaOS side or in emulation=
. How to <br>
&gt; reproduce this? Such resolution does not show up for me in ScreenMode =
prefs <br>
&gt; so cannot be simply selected.<br>
<br>
OK I&#39;ve got it. I think you&#39;ve unticked default and set a custom wi=
dth. <br>
This seems to set the width of frame buffer in memory but the mode the <br>
card is programmed to use is still the one selected from the list so this <=
br>
won&#39;t work. It seems to be either a bug in AmigaOS or the width option =
<br>
does not do what you may think. Maybe ask AmigaOS developers or aCube who <=
br>
wrote the driver about this. (Another known issue is that 24/32 bit modes <=
br>
are not available with the AmigaOS SM502 driver which would be needed for <=
br>
optimal performance with QEMU, the 16 bit mode it offers is much slower <br=
>
because it has to be converted on every display update.)<br>
<br>
Regards,<br>
BALATON Zoltan</blockquote></div><br clear=3D"all"><div><br></div>-- <br><d=
iv dir=3D"ltr" class=3D"gmail_signature">Saluti,<br>Andrea Palmat=C3=A8</di=
v>

--0000000000009e593005a71c9e26--


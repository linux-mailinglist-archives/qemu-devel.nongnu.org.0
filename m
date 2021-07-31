Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798533DC35D
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 06:36:28 +0200 (CEST)
Received: from localhost ([::1]:32976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9gja-0002h2-W1
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 00:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1m9giN-0001z3-AD
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 00:35:11 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:34640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1m9giL-0000LA-Hi
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 00:35:11 -0400
Received: by mail-oi1-x236.google.com with SMTP id t128so16219350oig.1
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 21:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iCN9Mm8Ytz1ntxOBl1T6OsXO4TuZmz/dgW5rHlkvkvk=;
 b=V/xnnanfxBPw588o5GWnWJaL8lK/iPDERGRa+p+4BWXLUmaXpCiC0HxA46GOkS38hg
 PmQyqvRD/PIdAtBwrI2ABzU5wYht1iZIEgSbLemzZWuORxeJdzI0rka/jzMg7Hj66Tvz
 Jm/HbRXsny+I31LlQTo4JGudVm0MQia+buKfaxTXYUSsJK4OFZ/Q06aIK6DLk8x7imbc
 TVSs4fwnSXpDLKi/ZA86Zh1GbOM3coZXM7doVIQOMqJeRpukyCirNN96fXFnrK8mELhs
 QcXvGdmHqBbgq2wIrTU4MpBTHZwUrKdPHPIJaX5+obBFhREA0WPsFyLn7upeUz1iZVYt
 gwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iCN9Mm8Ytz1ntxOBl1T6OsXO4TuZmz/dgW5rHlkvkvk=;
 b=ngalIf4B3DWb9a6W/PyhTgUbzQHuLuLmiwY/qs6P4h+zf2Ksf1GoMjtZeAZnPHSmTo
 QJP/kLb9d7TOFcSzAL3//BB4jxrsl5JNphgn8o0POqIsK7KYOWLSPB4TLdxckLdKHL0Q
 7jCEgZ4U1QhUy0PThUJ+WS5r8rcj02kF6TSyIUO0J95MkiSi4u5a8nIRnH9adymltE95
 9DH0hB8JP4dY68hiIj+7kVa+IANFthYwBcpdtAqXQKvG54BybIVT0q8dJmdybKpXmxyF
 o/C1wYWMXY5LnT1oVLasWD3qtzlo7Gp1CK/DIR6qG60r2hykwlOtoJlpbZbkY6j941OB
 //dA==
X-Gm-Message-State: AOAM533bCLdup+GJKoRQ0HYuLcrUXpFWTy+Z4+Lpc6wV63kaiQHDq0on
 FVJBpTdLQeFqtXKApyuhaiFFe2rPwgDZcK9cdy0=
X-Google-Smtp-Source: ABdhPJzIaleqjVyfUdF3mKlj4euXT7mhlac9YOr1qwD35GXcedD1JUyZ+0itc7aySIu1Zv5ZDyafMtD4Lvw9jGR+/+I=
X-Received: by 2002:aca:280b:: with SMTP id 11mr4004576oix.62.1627706105592;
 Fri, 30 Jul 2021 21:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <CABLmASFwffwhuNKTxfxUvHjCxZQHV+BiBTWeu0XoqRC0E1UU9A@mail.gmail.com>
 <214af2d-c11e-862d-2c4c-4273ef4cef1b@eik.bme.hu>
In-Reply-To: <214af2d-c11e-862d-2c4c-4273ef4cef1b@eik.bme.hu>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Sat, 31 Jul 2021 06:34:54 +0200
Message-ID: <CABLmASEo4Pq6bFfdOHn601OSBib4ORdaHCwSmTSC4NHPQc5Q8Q@mail.gmail.com>
Subject: Re: Bug in qemu-system-ppc running fedora 12 ppc guest
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: multipart/alternative; boundary="00000000000038fe4105c863dc62"
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oi1-x236.google.com
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
Cc: matheus.ferst@eldorado.org.br,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000038fe4105c863dc62
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 29, 2021 at 12:07 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> Hello,
>
> On Thu, 29 Jul 2021, Howard Spoelstra wrote:
> > Hi,
> >
> > Qemu-system-ppc built from current master can no longer run Fedora 12 ppc
> > as guest. (This the only ppc distro I tested.) Host is Fedora 34. Please
> > see screen shot attached.
> > Booting from both an installation DVD and from an installed system fail.
> >
> > To reproduce:
> > compile qemu-system-ppc from current master and run:
> >
> > ./qemu-system-ppc \
> > -M mac99,via=pmu \
> > -m 1024 \
> > -L pc-bios \
> > -boot d \
> > -cdrom Fedora-12-ppc-DVD.iso \
> > -g 1024x768x8
> >
> > I tracked the issue down to this commit:
> >
> > 8f0a4b6a9b40e18116a2bb6bbcc00feb8119c792 is the first bad commit
> > commit 8f0a4b6a9b40e18116a2bb6bbcc00feb8119c792
>
> There's a fix for a similar problem I've seen with AROS and pegasos2
> firmware 1.2 that's in today's pull request:
>
> https://lists.nongnu.org/archive/html/qemu-ppc/2021-07/msg00281.html
>
> That should likely fixes this. Can you try with that (either once it's
> merged or from David's for-6.1 branch).
>
> Regards,
> BALATON Zoltan
>

Thanks, this issue is indeed fixed by
https://github.com/qemu/qemu/commit/2d1154bd95a8bfea30cc59de8e080e5a016a9bee

Best,
Howard

--00000000000038fe4105c863dc62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 29, 2021 at 12:07 PM BALA=
TON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hell=
o,<br>
<br>
On Thu, 29 Jul 2021, Howard Spoelstra wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; Qemu-system-ppc built from current master can no longer run Fedora 12 =
ppc<br>
&gt; as guest. (This the only ppc distro I tested.) Host is Fedora 34. Plea=
se<br>
&gt; see screen shot attached.<br>
&gt; Booting from both an installation DVD and from an installed system fai=
l.<br>
&gt;<br>
&gt; To reproduce:<br>
&gt; compile qemu-system-ppc from current master and run:<br>
&gt;<br>
&gt; ./qemu-system-ppc \<br>
&gt; -M mac99,via=3Dpmu \<br>
&gt; -m 1024 \<br>
&gt; -L pc-bios \<br>
&gt; -boot d \<br>
&gt; -cdrom Fedora-12-ppc-DVD.iso \<br>
&gt; -g 1024x768x8<br>
&gt;<br>
&gt; I tracked the issue down to this commit:<br>
&gt;<br>
&gt; 8f0a4b6a9b40e18116a2bb6bbcc00feb8119c792 is the first bad commit<br>
&gt; commit 8f0a4b6a9b40e18116a2bb6bbcc00feb8119c792<br>
<br>
There&#39;s a fix for a similar problem I&#39;ve seen with AROS and pegasos=
2 <br>
firmware 1.2 that&#39;s in today&#39;s pull request:<br>
<br>
<a href=3D"https://lists.nongnu.org/archive/html/qemu-ppc/2021-07/msg00281.=
html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.org/archive=
/html/qemu-ppc/2021-07/msg00281.html</a><br>
<br>
That should likely fixes this. Can you try with that (either once it&#39;s =
<br>
merged or from David&#39;s for-6.1 branch).<br>
<br>
Regards,<br>
BALATON Zoltan<br></blockquote><div><br></div><div><div>Thanks, this issue =
is indeed fixed by <br></div><div><a href=3D"https://github.com/qemu/qemu/c=
ommit/2d1154bd95a8bfea30cc59de8e080e5a016a9bee">https://github.com/qemu/qem=
u/commit/2d1154bd95a8bfea30cc59de8e080e5a016a9bee</a></div><div><br></div><=
div>Best,</div><div>Howard</div></div><div><br></div></div></div>

--00000000000038fe4105c863dc62--


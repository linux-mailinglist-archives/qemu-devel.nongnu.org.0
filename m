Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC371315D1C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 03:21:21 +0100 (CET)
Received: from localhost ([::1]:46576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9f84-0003F3-G1
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 21:21:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l9f4X-0002cL-7o
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 21:17:44 -0500
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:42502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l9f4T-0000cP-I0
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 21:17:41 -0500
Received: by mail-vs1-xe2d.google.com with SMTP id z3so332002vsn.9
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 18:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RxpCPM9Xcm3yHcE6FyzVylL8yaERbR2gJNJ3M8hIgKA=;
 b=q7WociAtVyuRtyowDCyGtkFpQJoq+j5i81hAjyL/RMvUUedkH5je9IN8YM4ucRecW6
 OQ620xE6RUV7ITST898Ti0RbMmTKgkZBR4czoo8Z/jgpRAOogvFE10CP6FAlLA0yTbpr
 8VWuGP7qVAycS2fARb75Chz3uM2oeThDhs/Ug/KwDoh8S6ukRip0Dqm4aE+buIWSb0wm
 nVq0U1R9og1Ep5bH/jiu+RbrGd9vz27iH8mHVbfIz0RNBjmmDbqS8sDL/A94BZQJ4fbJ
 HLrkiSvGU9HF6lemeJ3LxxP8HGAVnQIkn7zdA/rVBJ2AO6bwIMK89l4UxskkSgp9NoTV
 d9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RxpCPM9Xcm3yHcE6FyzVylL8yaERbR2gJNJ3M8hIgKA=;
 b=FIoMNPpMfAAgBZCyNG7ZD5eErm/HpT6h/5y3ml+Ydkc+r5YkKEup11Bc3Hl1ud7Bf9
 EphwAn1Y2ftcAbBJghcsQXmbaMTTvpxlL6ZJljBQLt4pIu/DqfWNExo1jnQ3vYkS0ym8
 d3wUkJFjpSf93ySKOiBJ5i6jVGw/dWXPHLzKc+b1pJCRg/BzHhQijJXfzZEYwMLx9LdJ
 IBolJE4g+mVw/huhTof48e/8jttNEqIZuqj+J+Hxfdq2tyebMmcKQp31C64Vc/6YOOjd
 iXJSHD0Vp+28oeVq1ra5JJgyPJCw1lsD3rmMi6obLPipgrR2h1z1ERUVvPHyAYChrdAL
 yVcw==
X-Gm-Message-State: AOAM533QdgzcdmEf3tSNIAEr/XkotgbVswEDx1BgZBVu27SqSc/Av2+y
 05IXQ1I2tDjt+o1IgLbW4WFCJddkgO3W9IJt4EHMPQ==
X-Google-Smtp-Source: ABdhPJxGRDvwxBGloz6YSlc1nfxgZAtEoRG+1DiMbzW8loxcR3eTVvnbOnvMDMvJCpuQw8bBBE0d/r826ZLPp6f1Pg8=
X-Received: by 2002:a67:e204:: with SMTP id g4mr363363vsa.29.1612923454350;
 Tue, 09 Feb 2021 18:17:34 -0800 (PST)
MIME-Version: 1.0
References: <20210203233539.1990032-1-dje@google.com>
 <20210204100349.GF549438@redhat.com>
 <CADPb22THtnaRgz3MAa+=U+dgZeZR4+FDO_SvpfsqKbnSJRnOmA@mail.gmail.com>
In-Reply-To: <CADPb22THtnaRgz3MAa+=U+dgZeZR4+FDO_SvpfsqKbnSJRnOmA@mail.gmail.com>
From: Doug Evans <dje@google.com>
Date: Tue, 9 Feb 2021 18:16:57 -0800
Message-ID: <CADPb22Q2k0EpEG6=h=Riswitpha0okeEeoP9Use3yfYtV7t6ZA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3]
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: multipart/alternative; boundary="0000000000008c46b605baf2017a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=dje@google.com; helo=mail-vs1-xe2d.google.com
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

--0000000000008c46b605baf2017a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 4, 2021 at 10:25 AM Doug Evans <dje@google.com> wrote:

> On Thu, Feb 4, 2021 at 2:03 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om>
> wrote:
>
>> On Wed, Feb 03, 2021 at 03:35:36PM -0800, dje--- via wrote:
>> > Add support for ipv6 host forwarding
>> >
>> > This patchset takes the original patch from Maxim,
>> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg569573.html
>> > and updates it.
>> >
>> > New option: -ipv6-hostfwd
>> >
>> > New commands: ipv6_hostfwd_add, ipv6_hostfwd_remove
>> >
>> > These are the ipv6 equivalents of their ipv4 counterparts.
>>
>> Before I noticed this v3, I send a reply to your v2 sugesting
>> that we don't need to add any new commands/options. We can
>> use existing inet_parse() helper function to parse the address
>> info and transparently support IPv4/6 in the existing commands
>> and options. This matches normal practice elsewhere in QEMU
>> for IP dual stack.
>>
>
> I'm all for this, fwiw.
>


I should say I'm all for not adding new commands/options.
Looking at inet_parse() it cannot be used as-is.
The question then becomes: Will refactoring it buy enough?

--0000000000008c46b605baf2017a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Thu, Feb 4, 2021 at 10:25 AM Doug Evans &lt;<a href=3D"mai=
lto:dje@google.com">dje@google.com</a>&gt; wrote:<br></div></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small">On Thu, Feb 4, 202=
1 at 2:03 AM Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.=
com" target=3D"_blank">berrange@redhat.com</a>&gt; wrote:<br></div></div><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Wed, Feb 03, 2021 at 03:35:36PM -0800, dje--- via wrote:<br>
&gt; Add support for ipv6 host forwarding<br>
&gt; <br>
&gt; This patchset takes the original patch from Maxim,<br>
&gt; <a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg56957=
3.html" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/q=
emu-devel@nongnu.org/msg569573.html</a><br>
&gt; and updates it.<br>
&gt; <br>
&gt; New option: -ipv6-hostfwd<br>
&gt; <br>
&gt; New commands: ipv6_hostfwd_add, ipv6_hostfwd_remove<br>
&gt; <br>
&gt; These are the ipv6 equivalents of their ipv4 counterparts.<br>
<br>
Before I noticed this v3, I send a reply to your v2 sugesting<br>
that we don&#39;t need to add any new commands/options. We can<br>
use existing inet_parse() helper function to parse the address<br>
info and transparently support IPv4/6 in the existing commands<br>
and options. This matches normal practice elsewhere in QEMU<br>
for IP dual stack.<br></blockquote><div><br></div><div style=3D"font-size:s=
mall">I&#39;m all for this, fwiw.</div></div></div></blockquote><div><br></=
div><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">I=
 should say I&#39;m all for not adding new commands/options.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Looking at inet_parse() it ca=
nnot be used as-is.</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">The question then becomes: Will refactoring it buy enough?</div></div>=
</div>

--0000000000008c46b605baf2017a--


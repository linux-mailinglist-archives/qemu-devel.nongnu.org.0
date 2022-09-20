Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FD95BF0F3
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:16:33 +0200 (CEST)
Received: from localhost ([::1]:37152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamTg-0004sH-PI
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1oajkn-0000De-IF
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 16:22:01 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:36633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1oajkl-0001Ac-6h
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 16:22:01 -0400
Received: by mail-vs1-xe36.google.com with SMTP id o123so4454239vsc.3
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 13:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Umu8p66Yl13Co/yZT8zX/Lrs2H8HmrnKg5EYg1n3nk8=;
 b=pdTZAnRJDzepTE1n85cLmD1BmKKvKRH1CY1Xnyks0jwz2Z+BJ1m0nHIpslkSBHiV7B
 A/JeioIdtXbrOx2KAAmSIqBnsswtgGGBgyhyTto3HMcFILaYr60m+Q4h3aoOul5poIXj
 UuN6q8kyr+6kUS1nciJVUohb09fhF854qpMDLNTKAhDV42ng2MAZHX71A7w1WT5cjLSB
 631u6s1UN45/DTkc1d37PIdtyggF7CuS0QKuTbJkx9pWX5VjbnDxGgCukEwJF2TWIULA
 VvZ+kbUepTHeea0Iw/LM08fmDLT0m7T3J9NfgzJg/MEPTP0fAf4NtxEvRf8BwZKOHGUb
 DG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Umu8p66Yl13Co/yZT8zX/Lrs2H8HmrnKg5EYg1n3nk8=;
 b=pMaHP2Hxr/6+eCCz19TVyspuQkM6JxG3acGgb494KYFSzCMOdMQ0hmiqchKMEW2s18
 FKwj0F6+tpc2DEBn3/PgpAa+L/h1yzbcFpJvRN/ixFRX2tO6V6iD5ByXpZORiQUL83R9
 aJDMNGePA1yb07IDMHTvDLC4SCi/tgR0br4MnnmFcFZLtHWIaH6JAP+qtKmLEY6ey8+8
 shgeinEvDoRYDjRzJnUNtr0V2mqqOndLv8HE1ycigK3FkqQYsX68GVuEJtbIyYQ+pknT
 9OhoQ9srhDepKl/DEOrh1nTY0HhW9z33JTbU6FY3XGp0ORQYIgxorRDRVlKN/XToh/v9
 6x7Q==
X-Gm-Message-State: ACrzQf0ZgvWVfttCeh4I/l07o3vQU6ZOySRbEhpqWux2Nry9e8QOoGMw
 KAYe6VqHsqS+etcQbEh2WAVVAmgU+2KPfn34J+o+ew==
X-Google-Smtp-Source: AMsMyM4QK6rKgq1i7dRLyKPVFRaJtkOui0sR0IjsqI4TT9kxR3fprqrbbwODZwGjDVyztvkrb1caFpFskV7kGoCODrU=
X-Received: by 2002:a67:fb8a:0:b0:398:9d72:bddf with SMTP id
 n10-20020a67fb8a000000b003989d72bddfmr9114816vsr.38.1663705317505; Tue, 20
 Sep 2022 13:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <b403c8e4-3788-7ba1-a038-3a71fa0bc7c6@redhat.com>
 <Yyl4EO0L5h02HOLN@redhat.com>
 <ed402176-df96-dff2-869b-a3326e6314ea@redhat.com>
 <Yyl5yRMxGAEA7K05@redhat.com>
In-Reply-To: <Yyl5yRMxGAEA7K05@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 20 Sep 2022 14:21:46 -0600
Message-ID: <CANCZdfr6HWx8M8YzWDv2sqi96z+HyLMSGtzTUnTF_XbfNzcs4g@mail.gmail.com>
Subject: Re: QEMU's FreeBSD 13 CI job is failing
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Brad Smith <brad@comstyle.com>, John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000076125105e92194e9"
Received-SPF: none client-ip=2607:f8b0:4864:20::e36;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe36.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000076125105e92194e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2022 at 2:57 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Tue, Sep 20, 2022 at 10:23:56AM +0200, Thomas Huth wrote:
> > On 20/09/2022 10.21, Daniel P. Berrang=C3=A9 wrote:
> > > On Tue, Sep 20, 2022 at 08:44:27AM +0200, Thomas Huth wrote:
> > > >
> > > > Seen here for example:
> > > >
> > > > https://gitlab.com/qemu-project/qemu/-/jobs/3050165356#L2543
> > > >
> > > > ld-elf.so.1: /lib/libc.so.7: version FBSD_1.7 required by
> > > > /usr/local/lib/libpython3.9.so.1.0 not found
> > > > ERROR: Cannot use '/usr/local/bin/python3', Python >=3D 3.6 is
> required.
> > > >
> > > > ... looks like the Python binary is not working anymore? Does
> anybody know
> > > > what happened here?
> > >
> > > FreeBSD ports is only guaranteed to work with latest minor release
> > > base image. The python binary recently started relying on symbols
> > > in the 13.1 base image, and we're using 13.0.
> > >
> > > I updated lcitool last week to pick 13.1, so we just need a refresh
> > > on the QEMU side to pick this up.
> >
> > OK ... Alex, IIRC you have a patch queued to update the files that are
> > refreshed by lcitool ... does that already contain the update for
> FreeBSD,
> > too?
>
> Oh actually, I'm forgetting that QEMU doesn't use the 'lcitool manifest'
> command for auto-generating the gitlab-ci.yml file. In QEMU's case just
> manually edit .gitlab-ci.d/cirrus.yml to change
>
>     CIRRUS_VM_IMAGE_NAME: freebsd-13-0
>

FreeBSD's support policy is that we EOL minor dot releases a few months
after
the next minor release is final. Part of that process involves moving the
build
of packages to that new minor version (which is what's not guaranteed to
work
on older versions... only old binaries on new versions is guaranteed)...
And that's
the problem that was hit here.

I'll try to submit changes after the next minor release in that 'few month'
window
to update this in the future. In general, doing so would be the best fit
with FreeBSD's
support model...  It's one of those things I didn't think of at the time,
but is obvious in
hindsight.

Warner

--00000000000076125105e92194e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 20, 2022 at 2:57 AM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Tue, Sep 20, 2022 at 10:23:56AM +0200, Thomas Huth wrote:<br>
&gt; On 20/09/2022 10.21, Daniel P. Berrang=C3=A9 wrote:<br>
&gt; &gt; On Tue, Sep 20, 2022 at 08:44:27AM +0200, Thomas Huth wrote:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Seen here for example:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/30501=
65356#L2543" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-p=
roject/qemu/-/jobs/3050165356#L2543</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; ld-elf.so.1: /lib/libc.so.7: version FBSD_1.7 required by<br=
>
&gt; &gt; &gt; /usr/local/lib/libpython3.9.so.1.0 not found<br>
&gt; &gt; &gt; ERROR: Cannot use &#39;/usr/local/bin/python3&#39;, Python &=
gt;=3D 3.6 is required.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; ... looks like the Python binary is not working anymore? Doe=
s anybody know<br>
&gt; &gt; &gt; what happened here?<br>
&gt; &gt; <br>
&gt; &gt; FreeBSD ports is only guaranteed to work with latest minor releas=
e<br>
&gt; &gt; base image. The python binary recently started relying on symbols=
<br>
&gt; &gt; in the 13.1 base image, and we&#39;re using 13.0.<br>
&gt; &gt; <br>
&gt; &gt; I updated lcitool last week to pick 13.1, so we just need a refre=
sh<br>
&gt; &gt; on the QEMU side to pick this up.<br>
&gt; <br>
&gt; OK ... Alex, IIRC you have a patch queued to update the files that are=
<br>
&gt; refreshed by lcitool ... does that already contain the update for Free=
BSD,<br>
&gt; too?<br>
<br>
Oh actually, I&#39;m forgetting that QEMU doesn&#39;t use the &#39;lcitool =
manifest&#39;<br>
command for auto-generating the gitlab-ci.yml file. In QEMU&#39;s case just=
<br>
manually edit .gitlab-ci.d/cirrus.yml to change<br>
<br>
=C2=A0 =C2=A0 CIRRUS_VM_IMAGE_NAME: freebsd-13-0<br></blockquote><div><br><=
/div><div>FreeBSD&#39;s support policy is that we EOL minor dot releases a =
few months after</div><div>the next minor release is final. Part of that pr=
ocess involves moving the build</div><div>of packages to that new minor ver=
sion (which is what&#39;s not guaranteed to work</div><div>on older version=
s... only old binaries on new versions is guaranteed)...=C2=A0 And that&#39=
;s</div><div>the problem that was hit here.</div><div><br></div><div>I&#39;=
ll try to submit changes after the next minor release in that &#39;few mont=
h&#39; window</div><div>to update this in the future. In general, doing so =
would be the best fit with FreeBSD&#39;s</div><div>support model...=C2=A0 I=
t&#39;s one of those things I didn&#39;t think of at the time, but is obvio=
us in</div><div>hindsight.</div><div><br></div><div>Warner</div></div></div=
>

--00000000000076125105e92194e9--


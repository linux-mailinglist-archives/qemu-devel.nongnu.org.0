Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE874A88F2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 17:46:14 +0100 (CET)
Received: from localhost ([::1]:38918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFfFO-0006yW-09
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 11:46:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nFf8P-00014Z-0g
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:39:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nFf8M-0002iL-80
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:39:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643906331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eFcsEh0U6+Q9LgwtVy9s1zVk+6oq6ElSdqVRYIfAQ4o=;
 b=Z83mC+eNeVAE9D/xNhWl8eXjFDYYQ3yycircej5UktvfAJc6wd3cWrKpmhQhKarYqjVPR5
 ffCknxZqR8io4aM0aU3QYdDsYcpgEy5aSvUAF8mIURM1r9bbK08wB2nIr6DOBl5wt1veCb
 hLMZKlufBBdg2JDJiwyybBUulB52ERk=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-YOxH8daaOLi3Rup2qsxDgw-1; Thu, 03 Feb 2022 11:38:50 -0500
X-MC-Unique: YOxH8daaOLi3Rup2qsxDgw-1
Received: by mail-vk1-f199.google.com with SMTP id
 r189-20020a1f2bc6000000b0031f6aa22a0eso570552vkr.9
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 08:38:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eFcsEh0U6+Q9LgwtVy9s1zVk+6oq6ElSdqVRYIfAQ4o=;
 b=ZGzWXUGcJhotaZThj3OENz2DS2L7kiiODR4sNv/slJYHy9EXg+cJlOaPtH0YEwMAea
 r0eRtN3YZqtUT7OIAeRiOQl//fJqVsnO6zKS5WUVoOqHs3B/QD9ju7jEwcvymXC2QD7/
 /Exl5xHDgT0tRI/WvH9uYzcVN4EXo03inWL94p6NopBurZPJT2bxZ4rxk+d+dANVO392
 cC/1o58aPMsq1X9rTTGXp1b8tR08Nd3WxriJkZ6PZibLoCvZjr7xp8hQzr1qUtwBiU2m
 Ghtzbrb7q7QTs75PPSP7tERexh5D3V8KnMEjDOEj5mRMwkn8+3bHED4wG+6dxTVA5xzt
 U32A==
X-Gm-Message-State: AOAM531BloJE4ri/WGTSz9G69yw0+V5iqQAyw8Cewnb2+5qMbRPo2MsA
 rPwbVtQjKPQwf19Cw4cnrocPZx3fOV4z7Tlq4/XIhTDFQmzXO9mJHeSMuFjKskKKC1Lk+2d5og5
 r5m4jlUI9P1dRVIIxIQPtjVHSvd3jjkI=
X-Received: by 2002:a67:d194:: with SMTP id w20mr13773397vsi.35.1643906328831; 
 Thu, 03 Feb 2022 08:38:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6clIygBqTb+yfnPJVEuacpHRVg8r28hhm4Rj9NVY+4NVyTlhYeexXl3t043vCj469hzve4FT5Lt06NYttBhE=
X-Received: by 2002:a67:d194:: with SMTP id w20mr13773387vsi.35.1643906328596; 
 Thu, 03 Feb 2022 08:38:48 -0800 (PST)
MIME-Version: 1.0
References: <20220203015946.1330386-1-jsnow@redhat.com>
 <CAFEAcA_OXJ6C1UTFXiy6x1gp4VRmaWQY7ntU8N-3-O+TGcsKQQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_OXJ6C1UTFXiy6x1gp4VRmaWQY7ntU8N-3-O+TGcsKQQ@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 3 Feb 2022 11:38:38 -0500
Message-ID: <CAFn=p-ZeG2XM_cP3hpKN-Cagk4T1Sr05YEDhtwmR4+_VOjVt7w@mail.gmail.com>
Subject: Re: [PULL 0/4] Python patches
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c2a46605d71fc4fd"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c2a46605d71fc4fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 3, 2022, 11:20 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 3 Feb 2022 at 01:59, John Snow <jsnow@redhat.com> wrote:
> >
> > The following changes since commit
> 47cc1a3655135b89fa75c2824fbddd29df874612:
> >
> >   Merge remote-tracking branch 'remotes/kwolf-gitlab/tags/for-upstream'
> into staging (2022-02-01 19:48:15 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/jsnow/qemu.git tags/python-pull-request
> >
> > for you to fetch changes up to b0b662bb2b340d63529672b5bdae596a6243c4d0=
:
> >
> >   python/aqmp: add socket bind step to legacy.py (2022-02-02 14:12:22
> -0500)
> >
> > ----------------------------------------------------------------
> > Python patches
> >
> > Peter: I expect this to address the iotest 040,041 failures you observe=
d
> > on NetBSD. If it doesn't, let me know.
>
> I still see this one, which is different from the 040,041 stuff,
> and where 'make check' is for some reason giving a lot less useful
> detail. (This is a prexisting intermittent from before this patchset).
>

I'm assuming there's less detail because of the meson test-runner doing
some io redirection into the logfile.

[etc]
>
=E2=96=B6 175/704 /io/channel/pipe/sync
>            OK
> =E2=96=B6 175/704 /io/channel/pipe/async
>            OK
> 175/704 qemu:unit / test-io-channel-file
>            OK              0.11s   5 subtests passed
>
> 177/704 qemu:unit / test-io-channel-tls
>            RUNNING
> >>> G_TEST_BUILDDIR=3D/home/qemu/qemu-test.yiYr4m/build/tests/unit
> MALLOC_PERTURB_=3D5 G_TEST_SRCDIR=3D/home/qemu/qemu-test.yiYr4m/src/tests=
/unit
> /home/
> qemu/qemu-test.yiYr4m/build/tests/unit/test-io-channel-tls --tap -k
> =E2=96=B6 176/704 /io/channel/socket/ipv4-sync
>            OK
> =E2=96=B6 176/704 /io/channel/socket/ipv4-async
>            OK
> =E2=96=B6 176/704 /io/channel/socket/ipv4-fd
>            OK
> =E2=96=B6 176/704 /io/channel/socket/ipv6-sync
>            OK
> =E2=96=B6 176/704 /io/channel/socket/ipv6-async
>            OK
> =E2=96=B6 176/704 /io/channel/socket/unix-sync
>            OK
> =E2=96=B6 176/704 /io/channel/socket/unix-async
>            OK
> =E2=96=B6 176/704 /io/channel/socket/unix-fd-pass
>            OK
> =E2=96=B6 176/704 /io/channel/socket/unix-listen-cleanup
>            OK
> 176/704 qemu:unit / test-io-channel-socket
>            OK              0.13s   9 subtests passed
>
> =E2=96=B6 1/1 qcow2 qsd-jobs                OK
> 1/1 qemu:block / qemu-iotests qcow2 ERROR          243.14s   exit status =
1
>
> 178/704 qemu:unit / test-io-task
>            RUNNING
> >>> G_TEST_BUILDDIR=3D/home/qemu/qemu-test.yiYr4m/build/tests/unit
> MALLOC_PERTURB_=3D194
> G_TEST_SRCDIR=3D/home/qemu/qemu-test.yiYr4m/src/tests/unit /hom
> e/qemu/qemu-test.yiYr4m/build/tests/unit/test-io-task --tap -k
> =E2=96=B6 147/704 /bdrv-drain/blockjob/iothread/error/drain_subtree
>            OK
>
> Summary of Failures:
>
> 1/1 qemu:block / qemu-iotests qcow2 ERROR          243.14s   exit status =
1
>
>
> Ok:                 0
> Expected Fail:      0
> Fail:               1
> Unexpected Pass:    0
> Skipped:            0
> Timeout:            0
>
> Full log written to
> /home/qemu/qemu-test.yiYr4m/build/meson-logs/iotestslog.txt
> =E2=96=B6 147/704 /bdrv-drain/deletion/drain
>            OK
> =E2=96=B6 178/704 /crypto/task/complete
>            OK
> =E2=96=B6 178/704 /crypto/task/datafree
>            OK
> [etc]
>
> thanks
> -- PMM
>

Any chance of seeing that meson-logs/iotestslog.txt file?

>

--000000000000c2a46605d71fc4fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Feb 3, 2022, 11:20 AM Peter Maydell &lt;<a hre=
f=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Thu, 3 Feb 2022 at 01:59, Joh=
n Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank" rel=3D"nor=
eferrer">jsnow@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The following changes since commit 47cc1a3655135b89fa75c2824fbddd29df8=
74612:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/kwolf-gitlab/tag=
s/for-upstream&#39; into staging (2022-02-01 19:48:15 +0000)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/jsnow/qemu.git" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://gitlab.com/jsnow/qemu.git</a> t=
ags/python-pull-request<br>
&gt;<br>
&gt; for you to fetch changes up to b0b662bb2b340d63529672b5bdae596a6243c4d=
0:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0python/aqmp: add socket bind step to legacy.py (2022-02-02=
 14:12:22 -0500)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; Python patches<br>
&gt;<br>
&gt; Peter: I expect this to address the iotest 040,041 failures you observ=
ed<br>
&gt; on NetBSD. If it doesn&#39;t, let me know.<br>
<br>
I still see this one, which is different from the 040,041 stuff,<br>
and where &#39;make check&#39; is for some reason giving a lot less useful<=
br>
detail. (This is a prexisting intermittent from before this patchset).<br><=
/blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39=
;m assuming there&#39;s less detail because of the meson test-runner doing =
some io redirection into the logfile.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">[et=
c]<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
=E2=96=B6 175/704 /io/channel/pipe/sync<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OK<br>
=E2=96=B6 175/704 /io/channel/pipe/async<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OK<br>
175/704 qemu:unit / test-io-channel-file<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0.11s=C2=A0 =C2=A05 subtests passed<br>
<br>
177/704 qemu:unit / test-io-channel-tls<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RUNNING<br>
&gt;&gt;&gt; G_TEST_BUILDDIR=3D/home/qemu/qemu-test.yiYr4m/build/tests/unit=
 MALLOC_PERTURB_=3D5 G_TEST_SRCDIR=3D/home/qemu/qemu-test.yiYr4m/src/tests/=
unit /home/<br>
qemu/qemu-test.yiYr4m/build/tests/unit/test-io-channel-tls --tap -k<br>
=E2=96=B6 176/704 /io/channel/socket/ipv4-sync<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OK<br>
=E2=96=B6 176/704 /io/channel/socket/ipv4-async<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OK<br>
=E2=96=B6 176/704 /io/channel/socket/ipv4-fd<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OK<br>
=E2=96=B6 176/704 /io/channel/socket/ipv6-sync<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OK<br>
=E2=96=B6 176/704 /io/channel/socket/ipv6-async<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OK<br>
=E2=96=B6 176/704 /io/channel/socket/unix-sync<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OK<br>
=E2=96=B6 176/704 /io/channel/socket/unix-async<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OK<br>
=E2=96=B6 176/704 /io/channel/socket/unix-fd-pass<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OK<br>
=E2=96=B6 176/704 /io/channel/socket/unix-listen-cleanup<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OK<br>
176/704 qemu:unit / test-io-channel-socket<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0.13s=C2=A0 =C2=A09 subtests passed<br>
<br>
=E2=96=B6 1/1 qcow2 qsd-jobs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 OK<br>
1/1 qemu:block / qemu-iotests qcow2 ERROR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 243.14s=C2=A0 =C2=A0exit status 1<br>
<br>
178/704 qemu:unit / test-io-task<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RUNNING<br>
&gt;&gt;&gt; G_TEST_BUILDDIR=3D/home/qemu/qemu-test.yiYr4m/build/tests/unit=
 MALLOC_PERTURB_=3D194 G_TEST_SRCDIR=3D/home/qemu/qemu-test.yiYr4m/src/test=
s/unit /hom<br>
e/qemu/qemu-test.yiYr4m/build/tests/unit/test-io-task --tap -k<br>
=E2=96=B6 147/704 /bdrv-drain/blockjob/iothread/error/drain_subtree<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OK<br>
<br>
Summary of Failures:<br>
<br>
1/1 qemu:block / qemu-iotests qcow2 ERROR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 243.14s=C2=A0 =C2=A0exit status 1<br>
<br>
<br>
Ok:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
Expected Fail:=C2=A0 =C2=A0 =C2=A0 0<br>
Fail:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
Unexpected Pass:=C2=A0 =C2=A0 0<br>
Skipped:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
Timeout:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
<br>
Full log written to /home/qemu/qemu-test.yiYr4m/build/meson-logs/iotestslog=
.txt<br>
=E2=96=B6 147/704 /bdrv-drain/deletion/drain<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OK<br>
=E2=96=B6 178/704 /crypto/task/complete<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OK<br>
=E2=96=B6 178/704 /crypto/task/datafree<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OK<br>
[etc]<br>
<br>
thanks<br>
-- PMM<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Any chance of seeing that meson-logs/iotestslog.txt file?</div><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blo=
ckquote></div></div></div>

--000000000000c2a46605d71fc4fd--



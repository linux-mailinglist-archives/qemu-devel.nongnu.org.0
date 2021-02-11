Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D9E318464
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 05:41:58 +0100 (CET)
Received: from localhost ([::1]:50488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA3nh-0001kH-FC
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 23:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lA3mF-000177-8F
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 23:40:27 -0500
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:40029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lA3m9-0002lK-I8
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 23:40:25 -0500
Received: by mail-qk1-x735.google.com with SMTP id u20so4121456qku.7
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 20:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wTDGsL9v0TaPGBsl+MDRgwqdPFQbmGyIP9LJDD0sZc0=;
 b=vM/3a7bvyG/ckidPjxoC83KaW5HOMUN/bLNjkUNxg5nmiWZP3SYyGOc7+cUssCEUSk
 IbJf80I6c58qRnUDqLGzebrPZV8Kp+KGkcv+ilnstJqI/pAdE8x6lUbOfaPelBjhGIjS
 uLcOxwMsO5dIqiE2xn4/N0iQ0gmYvtpuD7bN06u/szYu37DCEW6RZQmckIZxBbwrjsxk
 fkY80o+w0q5duwJVfmlLhtBLjlgjtSnHBzZHVdcTx+GjTVujsYL/7hE9eAbukbDCX/bq
 RNxwbP9+HYZxQfjGgL88kxNFfbh5xOkf7nRCJWmQtSCOcV/wXbRMKSp126Vj0rQqaxqG
 lQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wTDGsL9v0TaPGBsl+MDRgwqdPFQbmGyIP9LJDD0sZc0=;
 b=OFS1mxB+mXGRcETWomts7upV2n8IbMlWXerLw6bWMsnl13d6ByiQlnJVh1bcMNiPPT
 +7q6yYn/1ad464RolJ8n8rvtQpK1yBslETD7p8rJ0ljAnyegS0LLk5m7a7Wqd3S8BPrg
 Wi+P80RuM8+7ICIxfKBs++sOwueUTjVQ4PUYWfYRsATp64Xch5uw0BB0UFzzn3UxlTke
 z5GiKRAk1AnhyHEOnN6bk9mEQhHvY/CfreeHy+/gyJYpFpSRyim2QJF3cGnoqTpgp768
 3J7xIsCTkBpyQ/poR8joPiFrVKLUMi+z7kIi/LNkdnes0Ae5xZTH7ZkqiU8yROUDqSMO
 D61A==
X-Gm-Message-State: AOAM533Fj4eiHW2jJjPyGaOWuUA5B4+Km7W5m4M1bAbceE7R+BTj+xxL
 Nsx6I+ZuzU8krxcMQ8dHOiEFgvXBz5DNQ/Vqp9NRXQ==
X-Google-Smtp-Source: ABdhPJwCulvUWZxqEhk5K4irma1H5cnXh1LzUVGeI/ZE9a2xrAsXw3aF8iJVnTIKt07fN5hrFNH0Gw6RjPN7d+yPang=
X-Received: by 2002:a37:9ecc:: with SMTP id h195mr498514qke.195.1613018419819; 
 Wed, 10 Feb 2021 20:40:19 -0800 (PST)
MIME-Version: 1.0
References: <20210210195252.19339-1-minwoo.im.dev@gmail.com>
 <20210210195252.19339-4-minwoo.im.dev@gmail.com>
 <20210211030011.GD23363@redsun51.ssa.fujisawa.hgst.com>
 <20210211033848.GE24885@localhost.localdomain>
 <20210211042422.GA28207@redsun51.ssa.fujisawa.hgst.com>
In-Reply-To: <20210211042422.GA28207@redsun51.ssa.fujisawa.hgst.com>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 10 Feb 2021 21:40:08 -0700
Message-ID: <CANCZdfrpgAxDgSv-8xCZ-sjXmU1Dg0azAu580tq9ihp7m8tjBw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] hw/block/nvme: add nvme_inject_state HMP command
To: Keith Busch <kbusch@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000ee0a6405bb081d84"
Received-SPF: none client-ip=2607:f8b0:4864:20::735;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Minwoo Im <minwoo.im.dev@gmail.com>, Klaus Jensen <its@irrelevant.dk>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ee0a6405bb081d84
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 10, 2021, 9:26 PM Keith Busch <kbusch@kernel.org> wrote:

> On Thu, Feb 11, 2021 at 12:38:48PM +0900, Minwoo Im wrote:
> > On 21-02-11 12:00:11, Keith Busch wrote:
> > > But I would prefer to see advanced retry tied to real errors that can
> be
> > > retried, like if we got an EBUSY or EAGAIN errno or something like
> that.
> >
> > I have seen a thread [1] about ACRE.  Forgive me If I misunderstood this
> > thread or missed something after this thread.  It looks like CRD field in
> > the CQE can be set for any NVMe error state which means it *may* depend
> on
> > the device status.
>
> Right! Setting CRD values is at the controller's discretion for any
> error status as long as the host enables ACRE.
>
> > And this patch just introduced a internal temporarily error state of
> > the controller by returning Command Intrrupted status.
>
> It's just purely synthetic, though. I was hoping something more natural
> could trigger the status. That might not provide the deterministic
> scenario you're looking for, though.
>
> I'm not completely against using QEMU as a development/test vehicle for
> corner cases like this, but we are introducing a whole lot of knobs
> recently, and you practically need to be a QEMU developer to even find
> them. We probably should step up the documentation in the wiki along
> with these types of features.
>

I'd love that too... I need to test FreeBSD's nvme driver for different
error conditions. I know qemu can help, but it's a bit obscure.

Warner

> I think, in this stage, we can go with some errors in the middle of the
> > AIO (nvme_aio_err()) for advanced retry.  Shouldn't AIO errors are
> > retry-able and supposed to be retried ?
>
> Sure, we can assume that receiving an error in the AIO callback means
> the lower layers exhausted available recovery mechanisms.
>
>

--000000000000ee0a6405bb081d84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Feb 10, 2021, 9:26 PM Keith Busch &lt;<a href=
=3D"mailto:kbusch@kernel.org">kbusch@kernel.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On Thu, Feb 11, 2021 at 12:38:48PM +0900, Minwo=
o Im wrote:<br>
&gt; On 21-02-11 12:00:11, Keith Busch wrote:<br>
&gt; &gt; But I would prefer to see advanced retry tied to real errors that=
 can be<br>
&gt; &gt; retried, like if we got an EBUSY or EAGAIN errno or something lik=
e that.<br>
&gt; <br>
&gt; I have seen a thread [1] about ACRE.=C2=A0 Forgive me If I misundersto=
od this<br>
&gt; thread or missed something after this thread.=C2=A0 It looks like CRD =
field in<br>
&gt; the CQE can be set for any NVMe error state which means it *may* depen=
d on<br>
&gt; the device status.<br>
<br>
Right! Setting CRD values is at the controller&#39;s discretion for any<br>
error status as long as the host enables ACRE.<br>
<br>
&gt; And this patch just introduced a internal temporarily error state of<b=
r>
&gt; the controller by returning Command Intrrupted status.<br>
<br>
It&#39;s just purely synthetic, though. I was hoping something more natural=
<br>
could trigger the status. That might not provide the deterministic<br>
scenario you&#39;re looking for, though.<br>
<br>
I&#39;m not completely against using QEMU as a development/test vehicle for=
<br>
corner cases like this, but we are introducing a whole lot of knobs<br>
recently, and you practically need to be a QEMU developer to even find<br>
them. We probably should step up the documentation in the wiki along<br>
with these types of features.<br></blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">I&#39;d love that too... I need to test FreeBS=
D&#39;s nvme driver for different error conditions. I know qemu can help, b=
ut it&#39;s a bit obscure.=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Warner=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; I think, in this stage, we can go with some errors in the middle of th=
e<br>
&gt; AIO (nvme_aio_err()) for advanced retry.=C2=A0 Shouldn&#39;t AIO error=
s are<br>
&gt; retry-able and supposed to be retried ?<br>
<br>
Sure, we can assume that receiving an error in the AIO callback means<br>
the lower layers exhausted available recovery mechanisms.<br>
<br>
</blockquote></div></div></div>

--000000000000ee0a6405bb081d84--


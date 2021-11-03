Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF3F443B0B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 02:31:40 +0100 (CET)
Received: from localhost ([::1]:59920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi57r-0003sF-0L
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 21:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mi56P-0002un-Ey
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 21:30:09 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:38404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mi56N-0007Yy-41
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 21:30:09 -0400
Received: by mail-ua1-x931.google.com with SMTP id o26so1533767uab.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 18:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5RrtUbVgGMgtqf+8lvES/bSnfWt6HvWqatyLNILH34c=;
 b=EVBV5bK6s9G+MuTRl1XCtcIpnrKFgfNIsS8YSxknyR20863l8Bwyqiq5wyedf7a2ZW
 hwA2iWFjE//1EBijlJTRugwhgMoYocMoXrm5PTB7f155FMemSx8Z0UXOEM22r9GWNFU9
 DuKRoY2DQKyJK+eNoE2U9/3kGdgFVG5zQD3O8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5RrtUbVgGMgtqf+8lvES/bSnfWt6HvWqatyLNILH34c=;
 b=IwpdfJajzc+UpsyMrwiWxo9bZVwLIAJGD5F6I+a3bX2CskUdmtBA0BkHkKmudyrJBN
 CzhhJ3GawfHTSTCxffGjAxtm9EXcuXdO0ahaNy9OKhszSHV4yRzNLsK24fajD+C94tTh
 pWe+UWKk1xNXLFJ1oaeq6Sna7eAwQM1zvmDZH7NViB4Mow8FbBB4hNH4rBiz4BjvdGLY
 7j1EOVsyRUYrWVkZ/wB0YIPt4fUo4tQldWTeR+L1dNwilACSRGSvblniaVc42YM0d2W/
 pGVbzE0xhM5TSGA4n67Pt9rbWuDG3A8ooGr7k/V45jr4luFrMk0l2GrCN107jzgS53ER
 apig==
X-Gm-Message-State: AOAM531yV2oLDolkzI8UYtTvQ15l9axyzgZRvO1068RhlMxebxFvvUc9
 HnlGOzIDJk1H7CF3giFlCwRviECZir8utSbo5nmk3g==
X-Google-Smtp-Source: ABdhPJxF3ZRTw/AVlugqCFZiRzPnADGDuF1mo8SCpIFBOoY9AvimBrcTJrEDvcYfwjLr/wd4i529D6FHGD+oCncmux4=
X-Received: by 2002:ab0:22d0:: with SMTP id z16mr42349138uam.143.1635903005767; 
 Tue, 02 Nov 2021 18:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211026002344.405160-1-sjg@chromium.org>
 <20211026002344.405160-7-sjg@chromium.org>
 <CAFEAcA-UukuQXT3ebcboiVOSn0J+88w-kzoH8jE1JVxQnoeuvQ@mail.gmail.com>
 <CAPnjgZ2C8okdUMcgKjuLgV8JdPexYY0=9NtbSOHO81dN7=2RCg@mail.gmail.com>
 <CAHFG_=XWc+Fb=m=SHC6=y4KeF533yqCNk=Ae088oAZyjOULPaw@mail.gmail.com>
 <20211101180707.GJ24579@bill-the-cat>
 <CAPnjgZ0XeFHrXwBuTZ=eoKHCo7cMSuM_gUiTfv-Sqt8o6tPOXw@mail.gmail.com>
 <20211102172833.GS24579@bill-the-cat>
In-Reply-To: <20211102172833.GS24579@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 2 Nov 2021 19:29:54 -0600
Message-ID: <CAPnjgZ1zDeXMCtccy6=cQzjjAz92xJZunObm2OYKZ2eyP=Sdsw@mail.gmail.com>
Subject: Re: [PATCH v5 06/26] arm: qemu: Add a devicetree file for qemu_arm64
To: Tom Rini <trini@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=sjg@google.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
 Albert Aribaud <albert.u.boot@aribaud.net>,
 =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Anderson <seanga2@gmail.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Tom,

On Tue, 2 Nov 2021 at 11:28, Tom Rini <trini@konsulko.com> wrote:
>
> On Tue, Nov 02, 2021 at 09:00:53AM -0600, Simon Glass wrote:
> > Hi Tom,
> >
> > On Mon, 1 Nov 2021 at 12:07, Tom Rini <trini@konsulko.com> wrote:
> > >
> > > On Mon, Nov 01, 2021 at 06:33:35PM +0100, Fran=C3=A7ois Ozog wrote:
> > > > Hi Simon
> > > >
> > > > Le lun. 1 nov. 2021 =C3=A0 17:58, Simon Glass <sjg@chromium.org> a =
=C3=A9crit :
> > > >
> > > > > Hi Peter,
> > > > >
> > > > > On Mon, 1 Nov 2021 at 04:48, Peter Maydell <peter.maydell@linaro.=
org>
> > > > > wrote:
> > > > > >
> > > > > > On Tue, 26 Oct 2021 at 01:33, Simon Glass <sjg@chromium.org> wr=
ote:
> > > > > > >
> > > > > > > Add this file, generated from qemu, so there is a reference d=
evicetree
> > > > > > > in the U-Boot tree.
> > > > > > >
> > > > > > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > > > >
> > > > > > Note that the dtb you get from QEMU is only guaranteed to work =
if:
> > > > > >  1) you run it on the exact same QEMU version you generated it =
with
> > > > > >  2) you pass QEMU the exact same command line arguments you use=
d
> > > > > >     when you generated it
> > > > >
> > > > > Yes, I certainly understand that. In general this is not safe, bu=
t in
> > > > > practice it works well enough for development and CI.
> > > >
> > > > You recognize that you hijack a product directory with development =
hack
> > > > facility. There is a test directory to keep things clear. There can=
 be a
> > > > dev-dts or something similar for Dev time tools.
> > > > I have only seen push back on those fake dts files in the dts direc=
tory: I
> > > > guess that unless someone strongly favors a continuation of the dis=
cussion,
> > > > you may consider re-shaping the proposal to address concerns.
> > >
> > > Yes.  We need to document how to make development easier.  But I'm st=
ill
> > > not on board with the notion of including DTS files for platforms whe=
re
> > > the source of truth for the DTB is elsewhere.  That's going to bring =
us
> > > a lot more pain.
> >
> > Are you talking about QEMU specifically, or Raspberry Pi?
>
> I was using two of the more common and readily available platforms where
> the source of truth for the DTS/DTB is not (and will not be) U-Boot.
>
> > How can we get this resolved? I very much want to get to just having
> > OF_SEPARATE and OF_EMBED as the only available build-time options,
> > with OF_BOARD (and perhaps OF_PASSAGE) as something we can enable for
> > runtime support. I feel that separating the build-time and run-time
> > behaviour is very important. Over time perhaps we will have some
> > success in upstreaming bindings, but for now we have what we have.
> > There is still a lot of pushback on U-Boot having things in the
> > devicetree, although I do see that softening somewhat.
>
>
> To reiterate, the uniform bit of feedback on this series has been that
> everyone else disagrees with your notion that we _must_ have a dts
> in-tree.

[I would like everyone to take a deep breath and think about what this
actually impacts. I argue the impact outside U-Boot is approximately
zero. What are we actually discussing here?]

A few have responded that they can just add the files. I think that is
the case for everything except QEMU, right? I think even Fran=C3=A7ois
agrees with the documentation argument. There is no real burden in
adding the files so we can see what is going on, add a binman node,
SPL nodes, etc.

So I am going to stand my ground on that one. It affects:

- highbank
- qemu-ppce500
- rpi_4
- xilinx_versal_virt
- octeontx
- xenguest_arm64
- juno

So that is just 7 boards that I want to add devicetree files for. I
think that is reasonable and not a burden on these maintainers.

Let me deal with QEMU.

Let's imagine that we were in the state that I am proposing here,
which we would be if I were a better devicetree maintainer for U-Boot
and had not taken my eye off the ball, basically with my review of
[1], where I should have pushed to get a response on the questions
before it was applied. That might have triggered me to think about the
implications of this at the time.

Anyway, in the state that I am proposing, what problems would we have?

1. QEMU has a DT which only matches the 'standard' invocation as
documented at [2]

2. QEMU may get out of date if there is a new release.

I don't think (1) is really a problem. People will have to remove
CONFIG_OF_BOARD from configs/qemu_arm_spl_defconfig (or the like) to
get into this state, and we have a message now that prints out where
the devicetree comes from ("separate" in this case):

Core:  42 devices, 11 uclasses, devicetree: separate

For (2), I tested QEMU 6.1.50 and the only difference from 4.2.1 (a
year old) is:

kaslr-seed =3D <0x2037f53d 0x42c279e8>;

It doesn't affect anything here. It boots the lastest image fine.

Just for interest I went back to 2.5.0 which is nearly 6 years old!
There are a few differences like dma-coherent and gpio-keys being
added, but again it boots fine.

So in practice that doesn't seem to be a problem from what I can tell.

3. Anything else?

For qemu_arm_spl, it *does not boot* unless the U-Boot SPL properties
are present. There is no easy way to fix this. If we merge them into
qemu with dumpdtb, etc. we are assuming that the node we want to
update is present, so this is not really any better than having the
devicetree in U-Boot. Actually I think it is worse, since who knows
what changes might happen to the devicetree in QEMU which will stop
U-Boot from working.

QEMU cannot make changes that don't follow the bindings. U-Boot uses
the bindings, so we are good.

It just seems very clear to me that this approach is far superior to
U-Boot to the wonky business that we have today.

>
> > > It is important to make sure our "develop our project" workflow is sa=
ne
> > > and relatively pain free.  But that needs to not come by making
> > > sacrifices to the "use our project" outcome.  I would hope for exampl=
e
> > > that the new Pi zero platform is just dtb changes, as far as the linu=
x
> > > kernel is concerned which means that for rpi_arm64 (which uses run ti=
me
> > > dtb) it also just works.  And that's what we want to see.
> >
> > So long as OF_BOARD is enabled then the flow should work as you expect.
>
> Then we need to get things spun such that we can build the platforms
> where the dtb is given to us, complete and correct, at run time, to not
> require an in-tree dts that's not going to be used.  Documentation
> (another area we have much improved on these past few years and for
> which I am grateful for all of the effort behind!) is how we make the
> developer use-case for those platforms better.

I did not expect everyone to love this; this is how we got into the
mess we are in. A few people thinking it would be expedient to just do
their own thing. But I have come to this after an enormous amount of
thought and much discussion. I think sometimes people imagine that I
just throw things over the wall to get a reaction. That is not the
case.

We need some way to put U-Boot properties in there, at least until
things change upstream and within U-Boot. That envisages tooling that
is clearly not going to be in place for the upcoming release.

For the test, how about I create a separate qemu build (which I have
done, actually, qemu_arm_spl) and control the QEMU flags so we know it
will boot. It is for CI so we can keep it in sync and deal with any
breakages if people change things in QEMU (as above, this seems to be
a theoretical problem).

Again, please take a deep breath and consider how much this actually
affects TF-A, QEMU, etc. I'd argue not at all. We are talking about a
build-time devicetree in the U-Boot tree. We are not talking about
disabling OF_BOARD or removing that option.

Regards,
Simon

[1] http://patchwork.ozlabs.org/project/uboot/patch/20170402082520.32546-1-=
deymo@google.com/
[2] https://u-boot.readthedocs.io/en/latest/board/emulation/qemu-arm.html


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14684443D2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:48:15 +0100 (CET)
Received: from localhost ([::1]:60126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHYk-00013F-JG
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1miHW1-0007QC-Ui
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:45:37 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:33438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1miHVd-00008k-8m
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:45:24 -0400
Received: by mail-ed1-x52d.google.com with SMTP id m14so10007644edd.0
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YJwKM8W+NKcp5C0SgBpLuA4CPNot0j6lxWZ6spvJKbk=;
 b=r/gYAlEl2rvB0IQ4kPSCFNRk5byyhNV479GlQ0KZCFVisTsK9C0qB2sZxwgY8PcnGD
 uuyhWXiJ5S6xfLP1d7RVNDkwkt0qwpGy3+mP8CEcBSkirQjkndPW7vGGCcuoWkOAe3V6
 4mAsSO0PjMAcTlCTx7MS3vLdpzRo4zevXE+RrV1q/rjQjXOQGyPpbuA6cqf0r2tEiCWY
 JvBrGDn+PKcUlr4yzy6VpYocnWfVosqFIczwEUqZYdG9jMuaUREpCQyrgE9hTIEa1b/p
 vUUyh/w7jqLMOcvfemQlbx/+1vlZhFMFhaWyi0szPF1FciBxY5TT97MFFNu+/qgMd0k4
 dCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YJwKM8W+NKcp5C0SgBpLuA4CPNot0j6lxWZ6spvJKbk=;
 b=mSGWI3LLn4bRv4/dooUIBM1J5Ovf+H1173ynk9PgyBUVrWNA339eGitbpFXInh9TMQ
 ZINfNv3H9rPn9vkBMy9EhvSh9kQdmO0WJn31gRNpEbWh5Zp3qx8EBweDhvOoszzq2XNa
 kYUNi0KE++KrxndqJBPkZYnj23j3FD1BsrQ5IbJ/n5QuWXaEP+cIoauUOpMl+jlSt0IQ
 ys5MF9X8ldlnhIfvDyaSTpyw1vzgX4+RwSl6BlX/WxnaeV8F7XFf+i6GuGhTjPHDOfsQ
 y3dQOYm0xDNPOuhMt2J6km8r0ji/gr4WkmPotx312574ftGUg1YpwgbPMyMESFSie3Pz
 kleg==
X-Gm-Message-State: AOAM530uiMOVBMmGr+a2ijrcNbMhfZ5V8XIWcdSh/hRmKcOLG8kUNCP6
 +LPbiVjaJ5gOH0Di6Ob55t7ZivW77w5GoC4wtBWyoQ==
X-Google-Smtp-Source: ABdhPJyQT1H5hac7Qt2pzZ7dfNHzattpNzdC2GiJTr03qbl2K8qkMP5D7H/B98mQkWc6baAobsqFxuLxLFoEGTMPokE=
X-Received: by 2002:a05:6402:22d6:: with SMTP id
 dm22mr1594340edb.400.1635950686775; 
 Wed, 03 Nov 2021 07:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211026002344.405160-1-sjg@chromium.org>
 <20211026002344.405160-7-sjg@chromium.org>
 <CAFEAcA-UukuQXT3ebcboiVOSn0J+88w-kzoH8jE1JVxQnoeuvQ@mail.gmail.com>
 <CAPnjgZ2C8okdUMcgKjuLgV8JdPexYY0=9NtbSOHO81dN7=2RCg@mail.gmail.com>
 <CAHFG_=XWc+Fb=m=SHC6=y4KeF533yqCNk=Ae088oAZyjOULPaw@mail.gmail.com>
 <20211101180707.GJ24579@bill-the-cat>
 <CAPnjgZ0XeFHrXwBuTZ=eoKHCo7cMSuM_gUiTfv-Sqt8o6tPOXw@mail.gmail.com>
 <20211102172833.GS24579@bill-the-cat>
 <CAPnjgZ1zDeXMCtccy6=cQzjjAz92xJZunObm2OYKZ2eyP=Sdsw@mail.gmail.com>
 <CAHFG_=UTbUkZ3EUss4qoJwL6nJcL6tvZQATfPrH1WFQpRgqubQ@mail.gmail.com>
In-Reply-To: <CAHFG_=UTbUkZ3EUss4qoJwL6nJcL6tvZQATfPrH1WFQpRgqubQ@mail.gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Wed, 3 Nov 2021 15:44:35 +0100
Message-ID: <CAHFG_=WbfhfsTxBdAcQ52NVxQEhc7dq09za-rR9DAFYe=xABYw@mail.gmail.com>
Subject: Re: [PATCH v5 06/26] arm: qemu: Add a devicetree file for qemu_arm64
To: Simon Glass <sjg@chromium.org>
Content-Type: multipart/alternative; boundary="0000000000008e473a05cfe37391"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Anderson <seanga2@gmail.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Tom Rini <trini@konsulko.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008e473a05cfe37391
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon, and team

On Wed, 3 Nov 2021 at 06:29, Fran=C3=A7ois Ozog <francois.ozog@linaro.org> =
wrote:

> Hi Simon
>
> Le mer. 3 nov. 2021 =C3=A0 02:30, Simon Glass <sjg@chromium.org> a =C3=A9=
crit :
>
>> Hi Tom,
>>
>> On Tue, 2 Nov 2021 at 11:28, Tom Rini <trini@konsulko.com> wrote:
>> >
>> > On Tue, Nov 02, 2021 at 09:00:53AM -0600, Simon Glass wrote:
>> > > Hi Tom,
>> > >
>> > > On Mon, 1 Nov 2021 at 12:07, Tom Rini <trini@konsulko.com> wrote:
>> > > >
>> > > > On Mon, Nov 01, 2021 at 06:33:35PM +0100, Fran=C3=A7ois Ozog wrote=
:
>> > > > > Hi Simon
>> > > > >
>> > > > > Le lun. 1 nov. 2021 =C3=A0 17:58, Simon Glass <sjg@chromium.org>=
 a
>> =C3=A9crit :
>> > > > >
>> > > > > > Hi Peter,
>> > > > > >
>> > > > > > On Mon, 1 Nov 2021 at 04:48, Peter Maydell <
>> peter.maydell@linaro.org>
>> > > > > > wrote:
>> > > > > > >
>> > > > > > > On Tue, 26 Oct 2021 at 01:33, Simon Glass <sjg@chromium.org>
>> wrote:
>> > > > > > > >
>> > > > > > > > Add this file, generated from qemu, so there is a referenc=
e
>> devicetree
>> > > > > > > > in the U-Boot tree.
>> > > > > > > >
>> > > > > > > > Signed-off-by: Simon Glass <sjg@chromium.org>
>> > > > > > >
>> > > > > > > Note that the dtb you get from QEMU is only guaranteed to
>> work if:
>> > > > > > >  1) you run it on the exact same QEMU version you generated
>> it with
>> > > > > > >  2) you pass QEMU the exact same command line arguments you
>> used
>> > > > > > >     when you generated it
>> > > > > >
>> > > > > > Yes, I certainly understand that. In general this is not safe,
>> but in
>> > > > > > practice it works well enough for development and CI.
>> > > > >
>> > > > > You recognize that you hijack a product directory with
>> development hack
>> > > > > facility. There is a test directory to keep things clear. There
>> can be a
>> > > > > dev-dts or something similar for Dev time tools.
>> > > > > I have only seen push back on those fake dts files in the dts
>> directory: I
>> > > > > guess that unless someone strongly favors a continuation of the
>> discussion,
>> > > > > you may consider re-shaping the proposal to address concerns.
>> > > >
>> > > > Yes.  We need to document how to make development easier.  But I'm
>> still
>> > > > not on board with the notion of including DTS files for platforms
>> where
>> > > > the source of truth for the DTB is elsewhere.  That's going to
>> bring us
>> > > > a lot more pain.
>> > >
>> > > Are you talking about QEMU specifically, or Raspberry Pi?
>> >
>> > I was using two of the more common and readily available platforms whe=
re
>> > the source of truth for the DTS/DTB is not (and will not be) U-Boot.
>> >
>> > > How can we get this resolved? I very much want to get to just having
>> > > OF_SEPARATE and OF_EMBED as the only available build-time options,
>> > > with OF_BOARD (and perhaps OF_PASSAGE) as something we can enable fo=
r
>> > > runtime support. I feel that separating the build-time and run-time
>> > > behaviour is very important. Over time perhaps we will have some
>> > > success in upstreaming bindings, but for now we have what we have.
>> > > There is still a lot of pushback on U-Boot having things in the
>> > > devicetree, although I do see that softening somewhat.
>> >
>> >
>> > To reiterate, the uniform bit of feedback on this series has been that
>> > everyone else disagrees with your notion that we _must_ have a dts
>> > in-tree.
>>
>> [I would like everyone to take a deep breath and think about what this
>> actually impacts. I argue the impact outside U-Boot is approximately
>> zero. What are we actually discussing here?]
>>
>> A few have responded that they can just add the files. I think that is
>> the case for everything except QEMU, right? I think even Fran=C3=A7ois
>> agrees with the documentation argument.
>
> I do providing that the sample goes into documentation, not actionable as
> a build artifact in the dts directory.
>
>> There is no real burden in
>> adding the files so we can see what is going on, add a binman node,
>> SPL nodes, etc.
>>
>> So I am going to stand my ground on that one. It affects:
>>
>> - highbank
>> - qemu-ppce500
>> - rpi_4
>> - xilinx_versal_virt
>> - octeontx
>> - xenguest_arm64
>> - juno
>>
>> So that is just 7 boards that I want to add devicetree files for. I
>> think that is reasonable and not a burden on these maintainers.
>>
>> Let me deal with QEMU.
>>
>> Let's imagine that we were in the state that I am proposing here,
>> which we would be if I were a better devicetree maintainer for U-Boot
>> and had not taken my eye off the ball, basically with my review of
>> [1], where I should have pushed to get a response on the questions
>> before it was applied. That might have triggered me to think about the
>> implications of this at the time.
>>
>> Anyway, in the state that I am proposing, what problems would we have?
>>
>> 1. QEMU has a DT which only matches the 'standard' invocation as
>> documented at [2]
>
>
>>
>> 2. QEMU may get out of date if there is a new release.
>>
>> I don't think (1) is really a problem. People will have to remove
>> CONFIG_OF_BOARD from configs/qemu_arm_spl_defconfig (or the like) to
>> get into this state, and we have a message now that prints out where
>> the devicetree comes from ("separate" in this case):
>>
>> Core:  42 devices, 11 uclasses, devicetree: separate
>>
>> For (2), I tested QEMU 6.1.50 and the only difference from 4.2.1 (a
>> year old) is:
>>
>> kaslr-seed =3D <0x2037f53d 0x42c279e8>;
>>
>> It doesn't affect anything here. It boots the lastest image fine.
>>
>> Just for interest I went back to 2.5.0 which is nearly 6 years old!
>> There are a few differences like dma-coherent and gpio-keys being
>> added, but again it boots fine.
>>
>> So in practice that doesn't seem to be a problem from what I can tell.
>>
> You are essentially saying =E2=80=9CI don=E2=80=99t care about the system=
 design, this DTS
> simplifies my development work for U-Boot and I checked it works on a
> useless =E2=80=98standard invocation=E2=80=99=E2=80=9D
>
>>
>> 3. Anything else?
>>
>> For qemu_arm_spl, it *does not boot* unless the U-Boot SPL properties
>> are present. There is no easy way to fix this.
>
> one clean and easy way would be to upstream a Qemu change to merge a
> supplied overlay to the generated one. This the same idea as applying the
> NT_FW_COnFIG overlay in the TFA world. In both cases previous loaders do
> their job properly for U-Boot : setting up the stage as needed.
>
I was pointed to your proposal in Qemu mailing list and added my support to
it.
I could not comment on the exact details of the proposal, but commented on
the fact that merging a DT fragment provided to Qemu at runtime makes sense
and has some precedent in TFA.

> If we merge them into
>> qemu with dumpdtb, etc. we are assuming that the node we want to
>> update is present, so this is not really any better than having the
>> devicetree in U-Boot. Actually I think it is worse, since who knows
>> what changes might happen to the devicetree in QEMU which will stop
>> U-Boot from working.
>>
>> QEMU cannot make changes that don't follow the bindings. U-Boot uses
>> the bindings, so we are good.
>>
>> It just seems very clear to me that this approach is far superior to
>> U-Boot to the wonky business that we have today.
>>
>> >
>> > > > It is important to make sure our "develop our project" workflow is
>> sane
>> > > > and relatively pain free.  But that needs to not come by making
>> > > > sacrifices to the "use our project" outcome.  I would hope for
>> example
>> > > > that the new Pi zero platform is just dtb changes, as far as the
>> linux
>> > > > kernel is concerned which means that for rpi_arm64 (which uses run
>> time
>> > > > dtb) it also just works.  And that's what we want to see.
>> > >
>> > > So long as OF_BOARD is enabled then the flow should work as you
>> expect.
>> >
>> > Then we need to get things spun such that we can build the platforms
>> > where the dtb is given to us, complete and correct, at run time, to no=
t
>> > require an in-tree dts that's not going to be used.  Documentation
>> > (another area we have much improved on these past few years and for
>> > which I am grateful for all of the effort behind!) is how we make the
>> > developer use-case for those platforms better.
>>
>> I did not expect everyone to love this; this is how we got into the
>> mess we are in. A few people thinking it would be expedient to just do
>> their own thing. But I have come to this after an enormous amount of
>> thought and much discussion. I think sometimes people imagine that I
>> just throw things over the wall to get a reaction. That is not the
>> case.
>>
>> We need some way to put U-Boot properties in there, at least until
>> things change upstream and within U-Boot. That envisages tooling that
>> is clearly not going to be in place for the upcoming release.
>>
>> For the test, how about I create a separate qemu build (which I have
>> done, actually, qemu_arm_spl) and control the QEMU flags so we know it
>> will boot. It is for CI so we can keep it in sync and deal with any
>> breakages if people change things in QEMU (as above, this seems to be
>> a theoretical problem).
>>
>> Again, please take a deep breath and consider how much this actually
>> affects TF-A, QEMU, etc. I'd argue not at all. We are talking about a
>> build-time devicetree in the U-Boot tree. We are not talking about
>> disabling OF_BOARD or removing that option.
>>
> It is less about development environnement and respective CIs and more
> about how we want to deliver products on the market and how the supply
> chain is organized. U-Boot is a key component of that chain. If something
> is missing from the previous stages of the chain, don=E2=80=99t try to wo=
rk around
> the problem in U-Boot, just propose the change/correction in the relevant
> project (Qemu, TFA, RPI Videocore=E2=80=A6) or ask for help. If nothing c=
an be
> resolved =E2=80=9Cthe clean way=E2=80=9D then we can hack our way out (Qe=
mu fork you
> proposed). But let=E2=80=99s try the clean path first.
>
>>
>> Regards,
>> Simon
>>
>> [1]
>> http://patchwork.ozlabs.org/project/uboot/patch/20170402082520.32546-1-d=
eymo@google.com/
>> [2] https://u-boot.readthedocs.io/en/latest/board/emulation/qemu-arm.htm=
l
>>
> --
> Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
> T: +33.67221.6485
> francois.ozog@linaro.org | Skype: ffozog
>
>

--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--0000000000008e473a05cfe37391
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Simon, and team</div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 3 Nov 2021 at 0=
6:29, Fran=C3=A7ois Ozog &lt;<a href=3D"mailto:francois.ozog@linaro.org">fr=
ancois.ozog@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-s=
tyle:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div dir=3D=
"auto">Hi Simon</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Le=C2=A0mer. 3 nov. 2021 =C3=A0 02:30, Simon Glass &lt;=
<a href=3D"mailto:sjg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&=
gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;pad=
ding-left:1ex;border-left-color:rgb(204,204,204)">Hi Tom,<br>
<br>
On Tue, 2 Nov 2021 at 11:28, Tom Rini &lt;<a href=3D"mailto:trini@konsulko.=
com" target=3D"_blank">trini@konsulko.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, Nov 02, 2021 at 09:00:53AM -0600, Simon Glass wrote:<br>
&gt; &gt; Hi Tom,<br>
&gt; &gt;<br>
&gt; &gt; On Mon, 1 Nov 2021 at 12:07, Tom Rini &lt;<a href=3D"mailto:trini=
@konsulko.com" target=3D"_blank">trini@konsulko.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, Nov 01, 2021 at 06:33:35PM +0100, Fran=C3=A7ois Ozog=
 wrote:<br>
&gt; &gt; &gt; &gt; Hi Simon<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Le lun. 1 nov. 2021 =C3=A0 17:58, Simon Glass &lt;<a hr=
ef=3D"mailto:sjg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt; a=
 =C3=A9crit :<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Hi Peter,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Mon, 1 Nov 2021 at 04:48, Peter Maydell &lt;<a =
href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@li=
naro.org</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Tue, 26 Oct 2021 at 01:33, Simon Glass &lt=
;<a href=3D"mailto:sjg@chromium.org" target=3D"_blank">sjg@chromium.org</a>=
&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Add this file, generated from qemu, so t=
here is a reference devicetree<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; in the U-Boot tree.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Simon Glass &lt;<a href=
=3D"mailto:sjg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Note that the dtb you get from QEMU is only g=
uaranteed to work if:<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 1) you run it on the exact same QEMU ve=
rsion you generated it with<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 2) you pass QEMU the exact same command=
 line arguments you used<br>
&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0when you generated it<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Yes, I certainly understand that. In general this =
is not safe, but in<br>
&gt; &gt; &gt; &gt; &gt; practice it works well enough for development and =
CI.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; You recognize that you hijack a product directory with =
development hack<br>
&gt; &gt; &gt; &gt; facility. There is a test directory to keep things clea=
r. There can be a<br>
&gt; &gt; &gt; &gt; dev-dts or something similar for Dev time tools.<br>
&gt; &gt; &gt; &gt; I have only seen push back on those fake dts files in t=
he dts directory: I<br>
&gt; &gt; &gt; &gt; guess that unless someone strongly favors a continuatio=
n of the discussion,<br>
&gt; &gt; &gt; &gt; you may consider re-shaping the proposal to address con=
cerns.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Yes.=C2=A0 We need to document how to make development easie=
r.=C2=A0 But I&#39;m still<br>
&gt; &gt; &gt; not on board with the notion of including DTS files for plat=
forms where<br>
&gt; &gt; &gt; the source of truth for the DTB is elsewhere.=C2=A0 That&#39=
;s going to bring us<br>
&gt; &gt; &gt; a lot more pain.<br>
&gt; &gt;<br>
&gt; &gt; Are you talking about QEMU specifically, or Raspberry Pi?<br>
&gt;<br>
&gt; I was using two of the more common and readily available platforms whe=
re<br>
&gt; the source of truth for the DTS/DTB is not (and will not be) U-Boot.<b=
r>
&gt;<br>
&gt; &gt; How can we get this resolved? I very much want to get to just hav=
ing<br>
&gt; &gt; OF_SEPARATE and OF_EMBED as the only available build-time options=
,<br>
&gt; &gt; with OF_BOARD (and perhaps OF_PASSAGE) as something we can enable=
 for<br>
&gt; &gt; runtime support. I feel that separating the build-time and run-ti=
me<br>
&gt; &gt; behaviour is very important. Over time perhaps we will have some<=
br>
&gt; &gt; success in upstreaming bindings, but for now we have what we have=
.<br>
&gt; &gt; There is still a lot of pushback on U-Boot having things in the<b=
r>
&gt; &gt; devicetree, although I do see that softening somewhat.<br>
&gt;<br>
&gt;<br>
&gt; To reiterate, the uniform bit of feedback on this series has been that=
<br>
&gt; everyone else disagrees with your notion that we _must_ have a dts<br>
&gt; in-tree.<br>
<br>
[I would like everyone to take a deep breath and think about what this<br>
actually impacts. I argue the impact outside U-Boot is approximately<br>
zero. What are we actually discussing here?]<br>
<br>
A few have responded that they can just add the files. I think that is<br>
the case for everything except QEMU, right? I think even Fran=C3=A7ois<br>
agrees with the documentation argument. </blockquote><div dir=3D"auto">I do=
 providing that the sample goes into documentation, not actionable as a bui=
ld artifact in the dts directory.</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:sol=
id;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto">There =
is no real burden in<br>
adding the files so we can see what is going on, add a binman node,<br>
SPL nodes, etc.<br>
<br>
So I am going to stand my ground on that one. It affects:<br>
<br>
- highbank<br>
- qemu-ppce500<br>
- rpi_4<br>
- xilinx_versal_virt<br>
- octeontx<br>
- xenguest_arm64<br>
- juno<br>
<br>
So that is just 7 boards that I want to add devicetree files for. I<br>
think that is reasonable and not a burden on these maintainers.<br>
<br>
Let me deal with QEMU.<br>
<br>
Let&#39;s imagine that we were in the state that I am proposing here,<br>
which we would be if I were a better devicetree maintainer for U-Boot<br>
and had not taken my eye off the ball, basically with my review of<br>
[1], where I should have pushed to get a response on the questions<br>
before it was applied. That might have triggered me to think about the<br>
implications of this at the time.<br>
<br>
Anyway, in the state that I am proposing, what problems would we have?<br>
<br>
1. QEMU has a DT which only matches the &#39;standard&#39; invocation as<br=
>
documented at [2]</blockquote><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;paddin=
g-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
2. QEMU may get out of date if there is a new release.<br>
<br>
I don&#39;t think (1) is really a problem. People will have to remove<br>
CONFIG_OF_BOARD from configs/qemu_arm_spl_defconfig (or the like) to<br>
get into this state, and we have a message now that prints out where<br>
the devicetree comes from (&quot;separate&quot; in this case):<br>
<br>
Core:=C2=A0 42 devices, 11 uclasses, devicetree: separate<br>
<br>
For (2), I tested QEMU 6.1.50 and the only difference from 4.2.1 (a<br>
year old) is:<br>
<br>
kaslr-seed =3D &lt;0x2037f53d 0x42c279e8&gt;;<br>
<br>
It doesn&#39;t affect anything here. It boots the lastest image fine.<br>
<br>
Just for interest I went back to 2.5.0 which is nearly 6 years old!<br>
There are a few differences like dma-coherent and gpio-keys being<br>
added, but again it boots fine.<br>
<br>
So in practice that doesn&#39;t seem to be a problem from what I can tell.<=
br>
</blockquote><div dir=3D"auto">You are essentially saying =E2=80=9CI don=E2=
=80=99t care about the system design, this DTS simplifies my development wo=
rk for U-Boot and I checked it works on a useless =E2=80=98standard invocat=
ion=E2=80=99=E2=80=9D</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-l=
eft:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
3. Anything else?<br>
<br>
For qemu_arm_spl, it *does not boot* unless the U-Boot SPL properties<br>
are present. There is no easy way to fix this.</blockquote><div dir=3D"auto=
">one clean and easy way would be to upstream a Qemu change to merge a supp=
lied overlay to the generated one. This the same idea as applying the NT_FW=
_COnFIG overlay in the TFA world. In both cases previous loaders do their j=
ob properly for U-Boot : setting up the stage as needed.</div></div></div><=
/blockquote><div>I was pointed to your proposal in Qemu mailing list and ad=
ded my support to it.</div><div>I could not comment on the exact details of=
 the proposal, but commented on the fact that merging a DT fragment provide=
d to Qemu at runtime makes sense and has some precedent in TFA.</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding=
-left:1ex"><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style=
:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"> I=
f we merge them into<br>
qemu with dumpdtb, etc. we are assuming that the node we want to<br>
update is present, so this is not really any better than having the<br>
devicetree in U-Boot. Actually I think it is worse, since who knows<br>
what changes might happen to the devicetree in QEMU which will stop<br>
U-Boot from working.<br>
<br>
QEMU cannot make changes that don&#39;t follow the bindings. U-Boot uses<br=
>
the bindings, so we are good.<br>
<br>
It just seems very clear to me that this approach is far superior to<br>
U-Boot to the wonky business that we have today.<br>
<br>
&gt;<br>
&gt; &gt; &gt; It is important to make sure our &quot;develop our project&q=
uot; workflow is sane<br>
&gt; &gt; &gt; and relatively pain free.=C2=A0 But that needs to not come b=
y making<br>
&gt; &gt; &gt; sacrifices to the &quot;use our project&quot; outcome.=C2=A0=
 I would hope for example<br>
&gt; &gt; &gt; that the new Pi zero platform is just dtb changes, as far as=
 the linux<br>
&gt; &gt; &gt; kernel is concerned which means that for rpi_arm64 (which us=
es run time<br>
&gt; &gt; &gt; dtb) it also just works.=C2=A0 And that&#39;s what we want t=
o see.<br>
&gt; &gt;<br>
&gt; &gt; So long as OF_BOARD is enabled then the flow should work as you e=
xpect.<br>
&gt;<br>
&gt; Then we need to get things spun such that we can build the platforms<b=
r>
&gt; where the dtb is given to us, complete and correct, at run time, to no=
t<br>
&gt; require an in-tree dts that&#39;s not going to be used.=C2=A0 Document=
ation<br>
&gt; (another area we have much improved on these past few years and for<br=
>
&gt; which I am grateful for all of the effort behind!) is how we make the<=
br>
&gt; developer use-case for those platforms better.<br>
<br>
I did not expect everyone to love this; this is how we got into the<br>
mess we are in. A few people thinking it would be expedient to just do<br>
their own thing. But I have come to this after an enormous amount of<br>
thought and much discussion. I think sometimes people imagine that I<br>
just throw things over the wall to get a reaction. That is not the<br>
case.<br>
<br>
We need some way to put U-Boot properties in there, at least until<br>
things change upstream and within U-Boot. That envisages tooling that<br>
is clearly not going to be in place for the upcoming release.<br>
<br>
For the test, how about I create a separate qemu build (which I have<br>
done, actually, qemu_arm_spl) and control the QEMU flags so we know it<br>
will boot. It is for CI so we can keep it in sync and deal with any<br>
breakages if people change things in QEMU (as above, this seems to be<br>
a theoretical problem).<br>
<br>
Again, please take a deep breath and consider how much this actually<br>
affects TF-A, QEMU, etc. I&#39;d argue not at all. We are talking about a<b=
r>
build-time devicetree in the U-Boot tree. We are not talking about<br>
disabling OF_BOARD or removing that option.<br>
</blockquote><div dir=3D"auto">It is less about development environnement a=
nd respective CIs and more about how we want to deliver products on the mar=
ket and how the supply chain is organized. U-Boot is a key component of tha=
t chain. If something is missing from the previous stages of the chain, don=
=E2=80=99t try to work around the problem in U-Boot, just propose the chang=
e/correction in the relevant project (Qemu, TFA, RPI Videocore=E2=80=A6) or=
 ask for help. If nothing can be resolved =E2=80=9Cthe clean way=E2=80=9D t=
hen we can hack our way out (Qemu fork you proposed). But let=E2=80=99s try=
 the clean path first.</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-=
left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
Regards,<br>
Simon<br>
<br>
[1] <a href=3D"http://patchwork.ozlabs.org/project/uboot/patch/201704020825=
20.32546-1-deymo@google.com/" rel=3D"noreferrer" target=3D"_blank">http://p=
atchwork.ozlabs.org/project/uboot/patch/20170402082520.32546-1-deymo@google=
.com/</a><br>
[2] <a href=3D"https://u-boot.readthedocs.io/en/latest/board/emulation/qemu=
-arm.html" rel=3D"noreferrer" target=3D"_blank">https://u-boot.readthedocs.=
io/en/latest/board/emulation/qemu-arm.html</a><br>
</blockquote></div></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div><div><div dir=3D"=
ltr"><div dir=3D"ltr"><div dir=3D"ltr"><table style=3D"font-size:small" bor=
der=3D"0" cellpadding=3D"0" cellspacing=3D"0"><tbody><tr><td style=3D"paddi=
ng-right:10px" valign=3D"top"><img src=3D"https://static.linaro.org/common/=
images/linaro-logo-web.png"></td><td valign=3D"top"><table border=3D"0" cel=
lpadding=3D"0" cellspacing=3D"0"><tbody><tr><td style=3D"font-family:Arial,=
Helvetica,&quot;Sans Serif&quot;;white-space:nowrap;font-size:9pt;padding-t=
op:0px;color:rgb(87,87,87)" valign=3D"top"><span style=3D"font-weight:bold"=
>Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog</span>=C2=A0<span style=3D"color:rgb=
(161,161,161)">|</span>=C2=A0<i>Director Business Development</i></td></tr>=
<tr><td style=3D"font-family:Arial,Helvetica,&quot;Sans Serif&quot;;white-s=
pace:nowrap;font-size:9pt;padding-top:2px;color:rgb(87,87,87)" valign=3D"to=
p">T:=C2=A0<a value=3D"+393384075993" style=3D"color:rgb(17,85,204)">+33.67=
221.6485</a><br><a href=3D"mailto:francois.ozog@linaro.org" style=3D"color:=
rgb(87,87,87);text-decoration:none" target=3D"_blank">francois.ozog@linaro.=
org</a>=C2=A0<span style=3D"color:rgb(161,161,161)">|</span>=C2=A0Skype:=C2=
=A0ffozog</td></tr></tbody></table></td></tr></tbody></table></div></div></=
div></div></div><div><div><br style=3D"font-size:small"></div></div></div><=
/div></div></div></div></div></div></div></div></div></div></div></div></di=
v></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div><div><div dir=3D"ltr"><div dir=3D"ltr">=
<div dir=3D"ltr"><table style=3D"font-size:small" border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0"><tbody><tr><td style=3D"padding-right:10px" valign=
=3D"top"><img src=3D"https://static.linaro.org/common/images/linaro-logo-we=
b.png"></td><td valign=3D"top"><table border=3D"0" cellpadding=3D"0" cellsp=
acing=3D"0"><tbody><tr><td style=3D"font-family:Arial,Helvetica,&quot;Sans =
Serif&quot;;white-space:nowrap;font-size:9pt;padding-top:0px;color:rgb(87,8=
7,87)" valign=3D"top"><span style=3D"font-weight:bold">Fran=C3=A7ois-Fr=C3=
=A9d=C3=A9ric Ozog</span>=C2=A0<span style=3D"color:rgb(161,161,161)">|</sp=
an>=C2=A0<i>Director Business Development</i></td></tr><tr><td style=3D"fon=
t-family:Arial,Helvetica,&quot;Sans Serif&quot;;white-space:nowrap;font-siz=
e:9pt;padding-top:2px;color:rgb(87,87,87)" valign=3D"top">T:=C2=A0<a value=
=3D"+393384075993" style=3D"color:rgb(17,85,204)">+33.67221.6485</a><br><a =
href=3D"mailto:francois.ozog@linaro.org" style=3D"color:rgb(87,87,87);text-=
decoration:none" target=3D"_blank">francois.ozog@linaro.org</a>=C2=A0<span =
style=3D"color:rgb(161,161,161)">|</span>=C2=A0Skype:=C2=A0ffozog</td></tr>=
</tbody></table></td></tr></tbody></table></div></div></div></div></div><di=
v><div><br style=3D"font-size:small"></div></div></div></div></div></div></=
div></div></div></div></div></div></div></div></div></div></div></div>

--0000000000008e473a05cfe37391--


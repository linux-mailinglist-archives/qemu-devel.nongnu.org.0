Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D712CDDEC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 19:44:44 +0100 (CET)
Received: from localhost ([::1]:35264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kktar-0006wQ-Fm
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 13:44:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kktYs-00066i-Od
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 13:42:40 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:45448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kktYn-0004eK-38
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 13:42:38 -0500
Received: by mail-io1-xd36.google.com with SMTP id n4so3096267iow.12
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 10:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FhMFcJN4z6PjBkBZpXE4bBsDBnX/celXMB66wWbrb4o=;
 b=Tex/enLGRIh6G92LDFx/VjfV7M+xvX2jXiE6l3+OKaGT8rhs1eNAJe92DmsHZ8jLmr
 Kn6UbUeTXJoE/nficAaStnhSQXSk9s8l0o6i5xZnWuchrxs6FWXM8idOrAAAa1VTLrFR
 Vd6CXnzTIMMixjumodK+LBoqCVi4//YEpkW5ZOVMrXcokG51kqQfCvTSJujouJoGLPg8
 TlepD7d/dzQJ3J6uLP8LFCbPX/NL/e+gm5nNtSiGkfoVjOW9E1mDu/nI/g/P/UWIT0PQ
 c9sEetMYAUnzGtnA3MxBOd740lSRdoWZcZZ/mIK5ISHRAO4aVBCnGE7M0mGY/8lkG79o
 U9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FhMFcJN4z6PjBkBZpXE4bBsDBnX/celXMB66wWbrb4o=;
 b=shMy1K63G8PrCZYbjyVEKIp2rFKng0nY6og7owypgGOA78bxh/3tFeYOYHK487GKGI
 BLTcz7Q2YsuBe7xc8+9wZnzI1rV37VjRoAEU/ztlnkokIKE9Kj0WvOxqv7pn53GMuMic
 UkGNBosmMI/IiIxNCBtgqVT2+8fYAvBv1WeBgNCdrIrk2cZ2uDJLTHtrtLKIeByJoQAT
 EqsnjDPZ631A+QZ5TG1jzjM5TaPhilwYeOQ0V+TdOhf6fui6VGluyolOcqO8ut0L26iu
 3DJrbR/Jom7yAASdRc+PO6xRXvUMWZj+O7vqQDpypmiNYHgYTJUM0UUcO919av/UrYFZ
 ID4Q==
X-Gm-Message-State: AOAM532SmYrdkxUPpMSRx1GgKRlDk6b3Bm8wfimvFiFtzmU2HhswTXy1
 nhDOH1mgkQ95sGGlMVGSd1JnhD7Wj4uY5U0f7MQNFA==
X-Google-Smtp-Source: ABdhPJyR+PkNe4/WuljPLVWngv3k9Zd84CV6uTyHtpmimx6DWMYRlKIaBe2ABnwsDrY3Mm5ixomKNXjQ3VeHHpPeeek=
X-Received: by 2002:a5e:da46:: with SMTP id o6mr624287iop.139.1607020951629;
 Thu, 03 Dec 2020 10:42:31 -0800 (PST)
MIME-Version: 1.0
References: <392c2465-157e-e15a-0a2c-2e3faa166d22@csgraf.de>
 <CAEkmjvUArgL+Mcvy6nUhfJrdX3OaF=U8UdWia7ZDo9GWk0VF=g@mail.gmail.com>
 <CAEkmjvVJ5zup4NR2+DStt_NvV2cV7+7dj2=fJ3DQBkth8pAfcw@mail.gmail.com>
 <cecd20d0-278b-0a4b-ba9c-0207504c99d7@csgraf.de>
 <CAEkmjvVOAYP6wJyVpAtZE3d=iNOOWGZeHptQ9xJDGcTi4qQ0hQ@mail.gmail.com>
 <CAMn1gO7jqjsqJHtSaV7F+2qmtfF-YFDJwo=O8ot2iem+Uz4Zrw@mail.gmail.com>
 <6975b4a3-1568-df40-8594-bfcf488ac425@csgraf.de>
 <CAMn1gO5xs8RniRYm+Gnbh8S3GVah2+2Ew2V6tFL6PNuSJ7o5Hw@mail.gmail.com>
 <4e1d93a4-9dcc-c6b6-e060-6eea39ae2f16@csgraf.de>
 <CAMn1gO44Y4rahufveQ1dOq96nhqvGEmZ0pYci2f6BKv9kd638Q@mail.gmail.com>
 <20201203094124.GA7201@SPB-NB-133.local>
In-Reply-To: <20201203094124.GA7201@SPB-NB-133.local>
From: Peter Collingbourne <pcc@google.com>
Date: Thu, 3 Dec 2020 10:42:20 -0800
Message-ID: <CAMn1gO6kMFLGKy4VuOL=CyP=ioGAZJmogT=y6dd=SQ82odK8_Q@mail.gmail.com>
Subject: Re: [PATCH 2/8] hvf: Move common code out
To: Roman Bolshakov <r.bolshakov@yadro.com>
Cc: Alexander Graf <agraf@csgraf.de>, Frank Yang <lfy@google.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm <qemu-arm@nongnu.org>, 
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=pcc@google.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

On Thu, Dec 3, 2020 at 1:41 AM Roman Bolshakov <r.bolshakov@yadro.com> wrot=
e:
>
> On Mon, Nov 30, 2020 at 04:00:11PM -0800, Peter Collingbourne wrote:
> > On Mon, Nov 30, 2020 at 3:18 PM Alexander Graf <agraf@csgraf.de> wrote:
> > >
> > >
> > > On 01.12.20 00:01, Peter Collingbourne wrote:
> > > > On Mon, Nov 30, 2020 at 1:40 PM Alexander Graf <agraf@csgraf.de> wr=
ote:
> > > >> Hi Peter,
> > > >>
> > > >> On 30.11.20 22:08, Peter Collingbourne wrote:
> > > >>> On Mon, Nov 30, 2020 at 12:56 PM Frank Yang <lfy@google.com> wrot=
e:
> > > >>>>
> > > >>>> On Mon, Nov 30, 2020 at 12:34 PM Alexander Graf <agraf@csgraf.de=
> wrote:
> > > >>>>> Hi Frank,
> > > >>>>>
> > > >>>>> Thanks for the update :). Your previous email nudged me into th=
e right direction. I previously had implemented WFI through the internal ti=
mer framework which performed way worse.
> > > >>>> Cool, glad it's helping. Also, Peter found out that the main thi=
ng keeping us from just using cntpct_el0 on the host directly and compare w=
ith cval is that if we sleep, cval is going to be much < cntpct_el0 by the =
sleep time. If we can get either the architecture or macos to read out the =
sleep time then we might be able to not have to use a poll interval either!
> > > >>>>> Along the way, I stumbled over a few issues though. For starter=
s, the signal mask for SIG_IPI was not set correctly, so while pselect() wo=
uld exit, the signal would never get delivered to the thread! For a fix, ch=
eck out
> > > >>>>>
> > > >>>>>     https://patchew.org/QEMU/20201130030723.78326-1-agraf@csgra=
f.de/20201130030723.78326-4-agraf@csgraf.de/
> > > >>>>>
> > > >>>> Thanks, we'll take a look :)
> > > >>>>
> > > >>>>> Please also have a look at my latest stab at WFI emulation. It =
doesn't handle WFE (that's only relevant in overcommitted scenarios). But i=
t does handle WFI and even does something similar to hlt polling, albeit no=
t with an adaptive threshold.
> > > >>> Sorry I'm not subscribed to qemu-devel (I'll subscribe in a bit) =
so
> > > >>> I'll reply to your patch here. You have:
> > > >>>
> > > >>> +                    /* Set cpu->hvf->sleeping so that we get a
> > > >>> SIG_IPI signal. */
> > > >>> +                    cpu->hvf->sleeping =3D true;
> > > >>> +                    smp_mb();
> > > >>> +
> > > >>> +                    /* Bail out if we received an IRQ meanwhile =
*/
> > > >>> +                    if (cpu->thread_kicked || (cpu->interrupt_re=
quest &
> > > >>> +                        (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ)=
)) {
> > > >>> +                        cpu->hvf->sleeping =3D false;
> > > >>> +                        break;
> > > >>> +                    }
> > > >>> +
> > > >>> +                    /* nanosleep returns on signal, so we wake u=
p on kick. */
> > > >>> +                    nanosleep(ts, NULL);
> > > >>>
> > > >>> and then send the signal conditional on whether sleeping is true,=
 but
> > > >>> I think this is racy. If the signal is sent after sleeping is set=
 to
> > > >>> true but before entering nanosleep then I think it will be ignore=
d and
> > > >>> we will miss the wakeup. That's why in my implementation I block =
IPI
> > > >>> on the CPU thread at startup and then use pselect to atomically
> > > >>> unblock and begin sleeping. The signal is sent unconditionally so
> > > >>> there's no need to worry about races between actually sleeping an=
d the
> > > >>> "we think we're sleeping" state. It may lead to an extra wakeup b=
ut
> > > >>> that's better than missing it entirely.
> > > >>
> > > >> Thanks a bunch for the comment! So the trick I was using here is t=
o > > >> modify the timespec from the kick function before sending the IPI
> > > >> signal. That way, we know that either we are inside the sleep (whe=
re the
> > > >> signal wakes it up) or we are outside the sleep (where timespec=3D=
{} will
> > > >> make it return immediately).
> > > >>
> > > >> The only race I can think of is if nanosleep does calculations bas=
ed on
> > > >> the timespec and we happen to send the signal right there and then=
.
> > > > Yes that's the race I was thinking of. Admittedly it's a small wind=
ow
> > > > but it's theoretically possible and part of the reason why pselect =
was
> > > > created.
> > > >
> > > >> The problem with blocking IPIs is basically what Frank was describ=
ing
> > > >> earlier: How do you unset the IPI signal pending status? If the si=
gnal
> > > >> is never delivered, how can pselect differentiate "signal from las=
t time
> > > >> is still pending" from "new signal because I got an IPI"?
> > > > In this case we would take the additional wakeup which should be
> > > > harmless since we will take the WFx exit again and put us in the
> > > > correct state. But that's a lot better than busy looping.
> > >
> > >
> > > I'm not sure I follow. I'm thinking of the following scenario:
> > >
> > >    - trap into WFI handler
> > >    - go to sleep with blocked SIG_IPI
> > >    - SIG_IPI arrives, pselect() exits
> > >    - signal is still pending because it's blocked
> > >    - enter guest
> > >    - trap into WFI handler
> > >    - run pselect(), but it immediate exits because SIG_IPI is still p=
ending
> > >
> > > This was the loop I was seeing when running with SIG_IPI blocked. Tha=
t's
> > > part of the reason why I switched to a different model.
> >
> > What I observe is that when returning from a pending signal pselect
> > consumes the signal (which is also consistent with my understanding of
> > what pselect does). That means that it doesn't matter if we take a
> > second WFx exit because once we reach the pselect in the second WFx
> > exit the signal will have been consumed by the pselect in the first
> > exit and we will just wait for the next one.
> >
>
> Aha! Thanks for the explanation. So, the first WFI in the series of
> guest WFIs will likely wake up immediately? After a period without WFIs
> there must be a pending SIG_IPI...
>
> It shouldn't be a critical issue though because (as defined in D1.16.2)
> "the architecture permits a PE to leave the low-power state for any
> reason, it is permissible for a PE to treat WFI as a NOP, but this is
> not recommended for lowest power operation."
>
> BTW. I think a bit from the thread should go into the description of
> patch 8, because it's not trivial and it would really be helpful to keep
> in repo history. At least something like this (taken from an earlier
> reply in the thread):
>
>   In this implementation IPI is blocked on the CPU thread at startup and
>   pselect() is used to atomically unblock the signal and begin sleeping.
>   The signal is sent unconditionally so there's no need to worry about
>   races between actually sleeping and the "we think we're sleeping"
>   state. It may lead to an extra wakeup but that's better than missing
>   it entirely.

Okay, I'll add something like that to the next version of the patch I send =
out.

Peter

>
>
> Thanks,
> Roman
>
> > I don't know why things may have been going wrong in your
> > implementation but it may be related to the issue with
> > mach_absolute_time() which I posted about separately and was also
> > causing busy loops for us in some cases. Once that issue was fixed in
> > our implementation we started seeing sleep until VTIMER due work
> > properly.
> >
> > >
> > >
> > > > I reckon that you could improve things a little by unblocking the
> > > > signal and then reblocking it before unlocking iothread (e.g. with =
a
> > > > pselect with zero time interval), which would flush any pending
> > > > signals. Since any such signal would correspond to a signal from la=
st
> > > > time (because we still have the iothread lock) we know that any fut=
ure
> > > > signals should correspond to new IPIs.
> > >
> > >
> > > Yeah, I think you actually *have* to do exactly that, because otherwi=
se
> > > pselect() will always return after 0ns because the signal is still pe=
nding.
> > >
> > > And yes, I agree that that starts to sound a bit less racy now. But i=
t
> > > means we can probably also just do
> > >
> > >    - WFI handler
> > >    - block SIG_IPI
> > >    - set hvf->sleeping =3D true
> > >    - check for pending interrupts
> > >    - pselect()
> > >    - unblock SIG_IPI
> > >
> > > which means we run with SIG_IPI unmasked by default. I don't think th=
e
> > > number of signal mask changes is any different with that compared to
> > > running with SIG_IPI always masked, right?
> >
>
> P.S. Just found that Alex already raised my concern. Pending signals
> have to be consumed or there should be no pending signals to start
> sleeping on the very first WFI.
>
> > And unlock/lock iothread around the pselect? I suppose that could work
> > but as I mentioned it would just be an optimization.
> >
> > Maybe I can try to make my approach work on top of your series, or if
> > you already have a patch I can try to debug it. Let me know.
> >
> > Peter


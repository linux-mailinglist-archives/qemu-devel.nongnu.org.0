Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B634600F2E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 14:27:16 +0200 (CEST)
Received: from localhost ([::1]:53938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okPD8-0005Li-C6
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 08:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okP7y-0001gv-Fx
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 08:21:54 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:46901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okP7u-000722-OR
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 08:21:52 -0400
Received: by mail-qv1-xf34.google.com with SMTP id o67so7246198qvo.13
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 05:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dVFyYR8YPtLQEJ7g5pJCu2bLy3e+eTgYW3qTbElNtsk=;
 b=bgc74t80H+oL3FNvQHrj9IIiJMxpfxtJ7j9qYZgZqC8MWrD2tIQCx9ubGvMUp9KONH
 pau437WfJnISI61giI3q/24saoUSjv4L9QhgpGLRChQgwwrqCIjC/1F7gF5ys7lsH2RE
 XZTGlOk5ljhXKzGprFGVF+gmt5uD4lpQCkcuSu2rR4L3Vnic3Wh6DCQE41xy0x15sgqk
 SZlpVlnSf4iIB9y9J3VxwWajW3dCmB2LHudmiWFlb66HmStSAwQUeYTdXjn/VRctWrVE
 vYlNKkkFkhC5EZpQzdwYJ9PnT77sA3sSAJkwr6XNqiU4dza/w9X+CGeO+sPAJmkPUGF/
 Ywkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dVFyYR8YPtLQEJ7g5pJCu2bLy3e+eTgYW3qTbElNtsk=;
 b=HCrFAWkFnVrpEUSgCILv0K4ENDNj5z9OmFDCYOb4xYaA9hjIgvmN+NqMnr9Y+CQkqT
 9PvKdU9LKKTw2f0ym2M4ho/675Y3H4xs3Qj/FJKn5rVqisVllfdazGhxSst3auShipvi
 fD6wPx/jHj65Cq2qENYyh72y8X0ZBMAn7lbQTJzY6bBE8QjDltSQf7bZsu/mOWZeP/Cw
 10M+bpqicCMiazYYXgw+eNlghQMPVvWj6Fzd/t4WmL/R4mSuTlbEowYP7qNSbU64Y0fs
 c2UKfnnsLHGVDv2zsCoNdFxajvFKi9BaP462TUc9BHKAVoUrBVQHlxUWfJ0+JQfp6sCQ
 kRAA==
X-Gm-Message-State: ACrzQf2RtNMiQvpOxVAw3MbY+WDfyBDVNdlrtkH74W22I7Z8e2OCtk0o
 rpBRD/alYWPy1DHTbsdMsQSN4Ng5chqlHSBhFrQ=
X-Google-Smtp-Source: AMsMyM7gJvCOc1H9p02eMvUEnK4VCt9Xw933JH1wvxB4ETSp5OFaltq6gXOwVctcER8B5rrGgXfvoPTD1tA66jneGec=
X-Received: by 2002:a0c:810f:0:b0:47b:299a:56d7 with SMTP id
 15-20020a0c810f000000b0047b299a56d7mr8091859qvc.12.1666009308235; Mon, 17 Oct
 2022 05:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-50-bmeng.cn@gmail.com>
 <CAJ+F1C+-4U1huf=Jv_uJP-XXnXu88Gj9HHvrGS0dTFyKGv=qBg@mail.gmail.com>
 <CAEUhbmV_UU1TpRXfyz5U9kRj5r1ihm-HrXhzw_D-L96_Skxy+g@mail.gmail.com>
 <CAJ+F1CJo-0isj2LKdabMHu854e7kukwjp=CCejgk_TzLRwtA3w@mail.gmail.com>
 <CAEUhbmXjHCEOy+U3zABsvCU20rDj5pogNVTUCUEevdrqhcjuoA@mail.gmail.com>
 <CAJ307EiOGrHqfdzSfb6L3MPKtAWLPCQT8ZVY7M+R5mT6d9wVvQ@mail.gmail.com>
 <CAEUhbmW0v_5Ro3mY6Ztt=MmZJf=ueApmNGpT=+1RTPLrWd4=Rg@mail.gmail.com>
 <CAJ307EhBSg4ENykkbqsT=5oBjc34JR+d3bJAVSTaxRM-uG4LGg@mail.gmail.com>
 <CAEUhbmUAF0W_SCtYOuAZ+xc7Y4So3J4QB29Us0AV44eVF8KtLg@mail.gmail.com>
 <CAJ307EjyXxbGLK-PhBjf18p3AApYM-jGqA2L9q3xLS9wX16h_w@mail.gmail.com>
 <CAEUhbmWStgz4oUEgrtAVU_YFdKSPFJrK-4kd+DP4jqLS51+X+A@mail.gmail.com>
 <CAEUhbmVYPo46nx8LLXcS21myzxcwT0HAzKt+cTRprmn06+g0PQ@mail.gmail.com>
 <CAEUhbmUSLgiZM4w-rnrOeW+tER8SBdj5=1DvC85jp1e4GvKFoA@mail.gmail.com>
 <CAEUhbmUXUiW_Gr4wpeJR-32djq=-E_UJRYc8KN86Ko16w_ysNw@mail.gmail.com>
 <CAEUhbmVs3QXP7iDH1O5M9utLeyVmkMwf7hW8gty49SDcSBFj+w@mail.gmail.com>
 <CAEUhbmWkS1rx9O=mhPaoYm-Bk7AC6USrVb1iw-Vf0q6SB4Jn2w@mail.gmail.com>
In-Reply-To: <CAEUhbmWkS1rx9O=mhPaoYm-Bk7AC6USrVb1iw-Vf0q6SB4Jn2w@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 17 Oct 2022 20:21:37 +0800
Message-ID: <CAEUhbmWV+7HxRE=oo9Eb9ys7tYE8uGp+PbaDVrD+wPULYSFfNw@mail.gmail.com>
Subject: Re: [PATCH 49/51] io/channel-watch: Fix socket watch on Windows
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+more people

On Tue, Oct 11, 2022 at 6:42 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Paolo,
>
> On Thu, Oct 6, 2022 at 11:03 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Paolo,
> >
> > On Wed, Sep 28, 2022 at 2:10 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > Hi Paolo,
> > >
> > > On Wed, Sep 21, 2022 at 9:02 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > On Wed, Sep 14, 2022 at 4:08 PM Bin Meng <bmeng.cn@gmail.com> wrote=
:
> > > > >
> > > > > On Wed, Sep 7, 2022 at 1:07 PM Bin Meng <bmeng.cn@gmail.com> wrot=
e:
> > > > > >
> > > > > > Hi Cl=C3=A9ment,
> > > > > >
> > > > > > On Tue, Sep 6, 2022 at 8:06 PM Cl=C3=A9ment Chigot <chigot@adac=
ore.com> wrote:
> > > > > > >
> > > > > > > > > > I checked your patch, what you did seems to be somethin=
g one would
> > > > > > > > > > naturally write, but what is currently in the QEMU sour=
ces seems to be
> > > > > > > > > > written intentionally.
> > > > > > > > > >
> > > > > > > > > > +Paolo Bonzini , you are the one who implemented the so=
cket watch on
> > > > > > > > > > Windows. Could you please help analyze this issue?
> > > > > > > > > >
> > > > > > > > > > > to avoid WSAEnumNetworkEvents for the master GSource =
which only has
> > > > > > > > > > > G_IO_HUP (or for any GSource having only that).
> > > > > > > > > > > As I said above, the current code doesn't do anything=
 with it anyway.
> > > > > > > > > > > So, IMO, it's safe to do so.
> > > > > > > > > > >
> > > > > > > > > > > I'll send you my patch attached. I was planning to se=
nd it in the following
> > > > > > > > > > > weeks anyway. I was just waiting to be sure everythin=
g looks fine on our
> > > > > > > > > > > CI. Feel free to test and modify it if needed.
> > > > > > > > > >
> > > > > > > > > > I tested your patch. Unfortunately there is still one t=
est case
> > > > > > > > > > (migration-test.exe) throwing up the "Broken pipe" mess=
age.
> > > > > > > > >
> > > > > > > > > I must say I didn't fully test it against qemu testsuite =
yet. Maybe there are
> > > > > > > > > some refinements to be done. "Broken pipe" might be linke=
d to the missing
> > > > > > > > > G_IO_HUP support.
> > > > > > > > >
> > > > > > > > > > Can you test my patch instead to see if your gdb issue =
can be fixed?
> > > > > > > > >
> > > > > > > > > Yeah sure. I'll try to do it this afternoon.
> > > > > > >
> > > > > > > I can't explain how mad at me I am... I'm pretty sure your pa=
tch was the first
> > > > > > > thing I've tried when I encountered this issue. But it wasn't=
 working
> > > > > > > or IIRC the
> > > > > > > issue went away but that was because the polling was actually=
 disabled (looping
> > > > > > > indefinitely)...I'm suspecting that I already had changed the=
 CreateEvent for
> > > > > > > WSACreateEvent which forces you to handle the reset.
> > > > > > > Finally, I end up struggling reworking the whole check functi=
on...
> > > > > > > But yeah, your patch does work fine on my gdb issues too.
> > > > > >
> > > > > > Good to know this patch works for you too.
> > > > > >
> > > > > > > And I guess the events are reset when recv() is being called =
because of the
> > > > > > > auto-reset feature set up by CreateEvent().
> > > > > > > IIUC, what Marc-Andr=C3=A9 means by busy loop is the polling =
being looping
> > > > > > > indefinitely as I encountered. I can ensure that this patch d=
oesn't do that.
> > > > > > > It can be easily checked by setting the env variable G_MAIN_P=
OLL_DEBUG.
> > > > > > > It'll show what g_poll is doing and it's normally always avai=
lable on
> > > > > > > Windows.
> > > > > > >
> > > > > > > Anyway, we'll wait for Paolo to see if he remembers why he ha=
d to call
> > > > > > > WSAEnumNetworkEvents. Otherwize, let's go for your patch. Min=
e might
> > > > > > > be a good start to improve the whole polling on Windows but i=
f it doesn't
> > > > > > > work in your case, it then needs some refinements.
> > > > > > >
> > > > > >
> > > > > > Yeah, this issue bugged me quite a lot. If we want to reset the=
 event
> > > > > > in qio_channel_socket_source_check(), we will have to do the fo=
llowing
> > > > > > to make sure qtests are happy.
> > > > > >
> > > > > > diff --git a/io/channel-watch.c b/io/channel-watch.c
> > > > > > index 43d38494f7..f1e1650b81 100644
> > > > > > --- a/io/channel-watch.c
> > > > > > +++ b/io/channel-watch.c
> > > > > > @@ -124,8 +124,6 @@ qio_channel_socket_source_check(GSource *so=
urce)
> > > > > > return 0;
> > > > > > }
> > > > > > - WSAEnumNetworkEvents(ssource->socket, ssource->ioc->event, &e=
v);
> > > > > > -
> > > > > > FD_ZERO(&rfds);
> > > > > > FD_ZERO(&wfds);
> > > > > > FD_ZERO(&xfds);
> > > > > > @@ -153,6 +151,10 @@ qio_channel_socket_source_check(GSource *s=
ource)
> > > > > > ssource->revents |=3D G_IO_PRI;
> > > > > > }
> > > > > > + if (ssource->revents) {
> > > > > > + WSAEnumNetworkEvents(ssource->socket, ssource->ioc->event, &e=
v);
> > > > > > + }
> > > > > > +
> > > > > > return ssource->revents;
> > > > > > }
> > > > > >
> > > > > > Removing "if (ssource->revents)" won't work.
> > > > > >
> > > > > > It seems to me that resetting the event twice (one time with th=
e
> > > > > > master Gsource, and the other time with the child GSource) caus=
es some
> > > > > > bizarre behavior. But MSDN [1] says
> > > > > >
> > > > > >     "Resetting an event that is already reset has no effect."
> > > > > >
> > > > > > [1] https://docs.microsoft.com/en-us/windows/win32/api/synchapi=
/nf-synchapi-resetevent
> > > > > >
> > > > >
> > > > > Paolo, any comments about this issue?
> > > > >
> > > >
> > > > v2 series has been sent out, and this patch remains unchanged.
> > > >
> > > > Paolo, still would appreciate your comments.
> > > >
> > >
> > > Ping?
> > >
> >
> > Ping? Can you please comment??
> >
>
> Ping?
>

Hi,

Paolo remains silent. Please let me know who else could approve this
change. Thanks.

Regards,
Bin


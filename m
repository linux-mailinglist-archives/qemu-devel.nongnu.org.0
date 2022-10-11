Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624DD5FB298
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 14:43:07 +0200 (CEST)
Received: from localhost ([::1]:45012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiEbC-0002yU-FF
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 08:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oiCiP-0004u3-Ur
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:42:25 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:38621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oiCiN-0007q8-Qd
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:42:25 -0400
Received: by mail-qt1-x829.google.com with SMTP id z8so3436517qtv.5
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h5AoNuEqW8cG/2fV/Mjec/7fCms6H27N4JWPA9q0dMA=;
 b=MwMLPAXNYdsLnITtxw0SSvKSV22RLmSJq89sijT3W15gw/t/dgXw13AjG4rDLlQPwf
 RgNTyXhIrNPZraQIUHZ6vXTayPuzDPGjbT7xjLceMdOvZdTU6tsA1YM0AzhokvAvXz5y
 /qwj8OqBjFwROINHv44Cdi12GJibjbjVPHg86yZpsMmVJauiYl33WNi0r2RN1LwTHBcW
 JlHAAJocBzHhsRycaxK1fpzbReXOrWXcMM8wKRGXS6jk/yD4DH/Xie1ryR+p1oQOP1ua
 WkTHtPQmRJshTFkYBjlLr+yNU8BpW3Un5pnbov65aUmFXJKCpukHQSRQC1rodvNyFbnt
 Zt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h5AoNuEqW8cG/2fV/Mjec/7fCms6H27N4JWPA9q0dMA=;
 b=0qHclRuwq+ybbEMjyPgS/XaEbWTzijg6h0s/QgBlpDU9uxhDwrdsV4L7LQCmIJwO17
 2WHCwhU9/teb4bcdE6l/1TU5CvyUyls/LkPHrtqvDeYRkVZduVibi0BOTC5u0J+8+mkH
 1dq+VmAYIIvZ6E2NyAQrUdaPJFl7nq5DIrbLLcA/nZMQo5U2bO2mG3y3F/XeLEnsA6l5
 ii9mWSjxbtSLmX/v55fIEJ2YnwKWU8c0SjeamTzidPTIH1UwfqP9eP3CLPYuf9NaFTl3
 0/I0h2TXqZBdBvUQqI800bbKUPwGw+iydVvuUQBR0Wxq5FUjbMYe9OrZKh2cwyVejmrM
 x13Q==
X-Gm-Message-State: ACrzQf27m48lbfu1ZReCr6XGc453Hoo8iNTo2wnIE2ZGRJI4WOBJPhDd
 BgCWyYQ5oXHFPv/cSraa+RZx+4M4XjMHs+yKRhc=
X-Google-Smtp-Source: AMsMyM76KBNA3XFdSlpHjySuIlZg2EREf+YNwnO2jaYjkaDXZOK8nCQ3ihRsp9F3bj+ThAPkFGtnIdO2JoXxD4GkZuI=
X-Received: by 2002:ac8:5d49:0:b0:39c:526f:217d with SMTP id
 g9-20020ac85d49000000b0039c526f217dmr1621990qtx.543.1665484942788; Tue, 11
 Oct 2022 03:42:22 -0700 (PDT)
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
In-Reply-To: <CAEUhbmVs3QXP7iDH1O5M9utLeyVmkMwf7hW8gty49SDcSBFj+w@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 11 Oct 2022 18:42:11 +0800
Message-ID: <CAEUhbmWkS1rx9O=mhPaoYm-Bk7AC6USrVb1iw-Vf0q6SB4Jn2w@mail.gmail.com>
Subject: Re: [PATCH 49/51] io/channel-watch: Fix socket watch on Windows
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x829.google.com
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

Hi Paolo,

On Thu, Oct 6, 2022 at 11:03 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Paolo,
>
> On Wed, Sep 28, 2022 at 2:10 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Paolo,
> >
> > On Wed, Sep 21, 2022 at 9:02 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Wed, Sep 14, 2022 at 4:08 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > On Wed, Sep 7, 2022 at 1:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > >
> > > > > Hi Cl=C3=A9ment,
> > > > >
> > > > > On Tue, Sep 6, 2022 at 8:06 PM Cl=C3=A9ment Chigot <chigot@adacor=
e.com> wrote:
> > > > > >
> > > > > > > > > I checked your patch, what you did seems to be something =
one would
> > > > > > > > > naturally write, but what is currently in the QEMU source=
s seems to be
> > > > > > > > > written intentionally.
> > > > > > > > >
> > > > > > > > > +Paolo Bonzini , you are the one who implemented the sock=
et watch on
> > > > > > > > > Windows. Could you please help analyze this issue?
> > > > > > > > >
> > > > > > > > > > to avoid WSAEnumNetworkEvents for the master GSource wh=
ich only has
> > > > > > > > > > G_IO_HUP (or for any GSource having only that).
> > > > > > > > > > As I said above, the current code doesn't do anything w=
ith it anyway.
> > > > > > > > > > So, IMO, it's safe to do so.
> > > > > > > > > >
> > > > > > > > > > I'll send you my patch attached. I was planning to send=
 it in the following
> > > > > > > > > > weeks anyway. I was just waiting to be sure everything =
looks fine on our
> > > > > > > > > > CI. Feel free to test and modify it if needed.
> > > > > > > > >
> > > > > > > > > I tested your patch. Unfortunately there is still one tes=
t case
> > > > > > > > > (migration-test.exe) throwing up the "Broken pipe" messag=
e.
> > > > > > > >
> > > > > > > > I must say I didn't fully test it against qemu testsuite ye=
t. Maybe there are
> > > > > > > > some refinements to be done. "Broken pipe" might be linked =
to the missing
> > > > > > > > G_IO_HUP support.
> > > > > > > >
> > > > > > > > > Can you test my patch instead to see if your gdb issue ca=
n be fixed?
> > > > > > > >
> > > > > > > > Yeah sure. I'll try to do it this afternoon.
> > > > > >
> > > > > > I can't explain how mad at me I am... I'm pretty sure your patc=
h was the first
> > > > > > thing I've tried when I encountered this issue. But it wasn't w=
orking
> > > > > > or IIRC the
> > > > > > issue went away but that was because the polling was actually d=
isabled (looping
> > > > > > indefinitely)...I'm suspecting that I already had changed the C=
reateEvent for
> > > > > > WSACreateEvent which forces you to handle the reset.
> > > > > > Finally, I end up struggling reworking the whole check function=
...
> > > > > > But yeah, your patch does work fine on my gdb issues too.
> > > > >
> > > > > Good to know this patch works for you too.
> > > > >
> > > > > > And I guess the events are reset when recv() is being called be=
cause of the
> > > > > > auto-reset feature set up by CreateEvent().
> > > > > > IIUC, what Marc-Andr=C3=A9 means by busy loop is the polling be=
ing looping
> > > > > > indefinitely as I encountered. I can ensure that this patch doe=
sn't do that.
> > > > > > It can be easily checked by setting the env variable G_MAIN_POL=
L_DEBUG.
> > > > > > It'll show what g_poll is doing and it's normally always availa=
ble on
> > > > > > Windows.
> > > > > >
> > > > > > Anyway, we'll wait for Paolo to see if he remembers why he had =
to call
> > > > > > WSAEnumNetworkEvents. Otherwize, let's go for your patch. Mine =
might
> > > > > > be a good start to improve the whole polling on Windows but if =
it doesn't
> > > > > > work in your case, it then needs some refinements.
> > > > > >
> > > > >
> > > > > Yeah, this issue bugged me quite a lot. If we want to reset the e=
vent
> > > > > in qio_channel_socket_source_check(), we will have to do the foll=
owing
> > > > > to make sure qtests are happy.
> > > > >
> > > > > diff --git a/io/channel-watch.c b/io/channel-watch.c
> > > > > index 43d38494f7..f1e1650b81 100644
> > > > > --- a/io/channel-watch.c
> > > > > +++ b/io/channel-watch.c
> > > > > @@ -124,8 +124,6 @@ qio_channel_socket_source_check(GSource *sour=
ce)
> > > > > return 0;
> > > > > }
> > > > > - WSAEnumNetworkEvents(ssource->socket, ssource->ioc->event, &ev)=
;
> > > > > -
> > > > > FD_ZERO(&rfds);
> > > > > FD_ZERO(&wfds);
> > > > > FD_ZERO(&xfds);
> > > > > @@ -153,6 +151,10 @@ qio_channel_socket_source_check(GSource *sou=
rce)
> > > > > ssource->revents |=3D G_IO_PRI;
> > > > > }
> > > > > + if (ssource->revents) {
> > > > > + WSAEnumNetworkEvents(ssource->socket, ssource->ioc->event, &ev)=
;
> > > > > + }
> > > > > +
> > > > > return ssource->revents;
> > > > > }
> > > > >
> > > > > Removing "if (ssource->revents)" won't work.
> > > > >
> > > > > It seems to me that resetting the event twice (one time with the
> > > > > master Gsource, and the other time with the child GSource) causes=
 some
> > > > > bizarre behavior. But MSDN [1] says
> > > > >
> > > > >     "Resetting an event that is already reset has no effect."
> > > > >
> > > > > [1] https://docs.microsoft.com/en-us/windows/win32/api/synchapi/n=
f-synchapi-resetevent
> > > > >
> > > >
> > > > Paolo, any comments about this issue?
> > > >
> > >
> > > v2 series has been sent out, and this patch remains unchanged.
> > >
> > > Paolo, still would appreciate your comments.
> > >
> >
> > Ping?
> >
>
> Ping? Can you please comment??
>

Ping?

Regards,
Bin


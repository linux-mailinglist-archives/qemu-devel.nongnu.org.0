Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548BD4201DA
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 15:59:18 +0200 (CEST)
Received: from localhost ([::1]:57874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX21N-0004WH-ED
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 09:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1mX20E-000354-CS
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 09:58:06 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:42932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1mX20B-0000Je-58
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 09:58:06 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 c26-20020a056830349a00b0054d96d25c1eso18149258otu.9
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 06:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4fgkr+/4g2hY2i6w1MFjjwZnGLRDD7K6e7Zkz2H394s=;
 b=pros1gvLXUHZandLGItT1IHcXpvuBeQIkweXc8+457DEdGWW1nFCPa6lAI2UdefFpf
 9+gc+pWL9+pTJ0fpPBqJDzDUGS5F4zTvvT2j8dC5BWaGRT57tnxFwOq0idufQXifLACK
 tnQ1RGojHF2ygMW1WzdbW+AJ17Q/8Tt9mA3xgWzuh08dvNhDWX+SGRUcnRMFMmydn/HB
 4G1Xz/4razw5x3NkE5fxcd7VTscAoaMhHu+pmDOLPRliduD6WujNuDErvGS3J8CarM87
 JMD9ml8CyRBDx1w0dtwDW7yR9i+9KUfKRsfnupBFft12yHwhzbunMd/+6yumh7sy8FDV
 r6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4fgkr+/4g2hY2i6w1MFjjwZnGLRDD7K6e7Zkz2H394s=;
 b=m3mj/gktPW8ApgxdEcvq8jnfLJKvmG0L3PluZLAPEgZ+MQnsIll4b+f6kVc7fmVzB2
 i3PXrcasQkfzDNO25DkgLjqVNdPTvEdGz9IOe4Lh1ZmW79u9vGwKG6wNsXLuwWUXfHaG
 Su1ssvvGi1fwUVy7rse7ZOY5Z8FqCXPV8Wxb5htQ0liPt5RC2HBq62pvQM9xeBhc3317
 LFMmiCzrOmbNTyEGrgCNtnCU1Y4EYr8ZaFfTpmKdr7TwKcul3z0MRiXU9/voo7oF+4ge
 iVTM+rhx4R+y+CF9phJt91KucEbw1v3gM6Z9VcZRWHRAs2+GGIC5FhFHmcpYjsQzGRBq
 CNqw==
X-Gm-Message-State: AOAM530oZMGGcelEyLuISK9bLJE/LBDYD09qvFx7mO1kIZ13OD5Jsq/m
 sWeWH0sS+TYq50CJKSXcXLBlpfcSWrXy+G0EHuY=
X-Google-Smtp-Source: ABdhPJzcB6pQpgVF2xGD9lrwQr4S/sheCuj3SBKct+PMcvQezhtoANmkIs06XHcbMAmtmwTt3ZIOnmouy8KmH5K0dgw=
X-Received: by 2002:a05:6830:204d:: with SMTP id
 f13mr5877992otp.123.1633269481289; 
 Sun, 03 Oct 2021 06:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633122670.git.balaton@eik.bme.hu>
 <CABLmASG_Coop-fMRdv_PvBorO1fQUrhY3h+-PGts_ixhhkaADA@mail.gmail.com>
 <6c2830fe-70d5-3c1a-ba17-85f3d252d860@eik.bme.hu>
 <CABLmASGkZ3kuGPF=d0jWPyryepcM-Hpd_VcgL=Z4qpmk07E-1A@mail.gmail.com>
 <c541324-ed75-e6d2-d9b8-2742baed30da@eik.bme.hu>
In-Reply-To: <c541324-ed75-e6d2-d9b8-2742baed30da@eik.bme.hu>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Sun, 3 Oct 2021 15:57:50 +0200
Message-ID: <CABLmASHZqTrON_MG_tw9D6C_eo++8VZEJduce3WRfPY0u=+9rQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Misc OHCI patches
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: multipart/alternative; boundary="000000000000413cab05cd732f22"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ot1-x32d.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000413cab05cd732f22
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 3, 2021 at 12:00 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Sun, 3 Oct 2021, Howard Spoelstra wrote:
> > On Sat, Oct 2, 2021 at 5:42 PM BALATON Zoltan <balaton@eik.bme.hu>
> wrote:
> >> I'm also not sure where's the problem (maybe we have multiple problems).
> >> It also does not work with an emulated usb-audio device but that also
> >> doesn't work with EHCI so it may have a problem by itself (UHCI also
> seems
> >> to be broken on its own so it does not even work as much as OHCI and
> >> EHCI). You've also said it worked with pass through with a different
> >> device so maybe this only happens with some devices or some sequence of
> >> things these devices are doing. Only allowing one async packet in OHCI
> >> instead of allowing one per endpoint is just a guess that could cause
> >> delays in processing other packets but eventually it should go through
> >> unless one async packet never completes and blocks all later ones or the
> >> delays introduced by this limitaion causes things to go in a way that
> >> guests don't expect and thus fail.
> >>
> > After some sifting through the logs, I my interpretation of our issue is
> > this:
> > Too many pending is referring to endpoint 0 when something is not
> > completed. Qemu permantly checks endpoint 4 for hid activity, skips when
> no
> > interrupt occurs. You can see both intermittently in the 1st log below.
> > Too many pending refers to qemu not being able to fully read/get the
> device
> > descriptors from boot. The too many pending is "solved", with a click on
> a
> > hid button. That leads to async complete, after which the only activity
> is
> > to check for interrupts from the hid devices.
>
> That sounds like an async packet waiting on ep 4 blocks communication on
> ep 0 because we don't allow one active packet per ep in hcd-ohci as the
> comment says so this may be fixed by implementing that. But I'm not sure
> because this log did not include packet status. Maybe also enable
> usb_packet_state traces to confirm this. I may try to fix this, I have an
> idea how do it: I can pass the USBPacket back from the completion callback
> via OHCIState to ohci_service_td() but have to find a way to replace the
> various cancel calls that use the usb_packet from OHCIState now to stop
> relying on that and do it by ep or whatever they have. This needs some
> more thinking and understand the code and OHCI better.
>
> I assume no more than one callback can be running at once so I can't get
> completion for two packets at the same time, therefore one pointer to pass
> back a packet is enough. I'll put an assert there and see what happens but
> if somebody knows please advise.
>
> > However, as the descriptors from endpoint 0 are not fully read from boot,
> > endpoint 1 (the actual audio stream) is not available.
> > Unplugging/plugging the usb device in combination with some hid
> interrupts
> > (me pushing the volume button) can sometimes reload the configuration
> > correctly, so endpoint 1 becomes available and sound can be played
> through
> > it.
>
> Could be if guest driver starts polling ep 4 while still trying to talk to
> ep 0 which then fails due to packet waiting in async on ep 4. The emulated
> usb-audio may be different, that does not have HID endpoint only ep 0 for
> control and two audio ones and it seems to be detected but playing sound
> does not work. Does -device usb-audio instead of passed through device
> makes sound with your guest OSes or that has a separate problem?
>

Usb-audio works in MacOS 9.2 guest, but only for some seconds. After that
the desktop becomes unresponsive. Icons disappear, mouse still moves but
cannot activate anything. With via=pmu, log shows usb mouse/kbd still
communicating.
I've seen something very similar happen when I attempt to stop and start
usb support in Mac OS 9.2 with the headset passed through.
System sounds in Fedora 12 guest can be played.

New logging with package status shows:
usb_ohci_ed_pkt_flags fa=107 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_packet_status status=0
usb_ohci_ed_pkt_flags fa=107 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_packet_status status=-6
usb_ohci_ed_pkt_flags fa=107 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=107 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_async_complete
usb_ohci_ed_pkt_flags fa=107 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=107 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_packet_status status=0
usb_ohci_ed_pkt_flags fa=107 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_packet_status status=0
usb_ohci_ed_pkt_flags fa=107 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_td_packet_status status=-6  --------------------------> note this
is line 1282 in my log

The following then continues to line 17671
usb_ohci_ed_pkt_flags fa=107 en=4 d=2 s=0 k=0 f=0 mps=37

And is followed by:
usb_ohci_ed_pkt_flags fa=107 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=107 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=107 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=107 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=107 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=107 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=107 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=107 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending

The first async complete is then at 57456
usb_ohci_td_too_many_pending
usb_ohci_async_complete
usb_ohci_ed_pkt_flags fa=107 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=107 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=107 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_packet_status status=-6
usb_ohci_async_complete
usb_ohci_ed_pkt_flags fa=107 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=107 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_packet_status status=0
usb_ohci_ed_pkt_flags fa=107 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_packet_status status=0  ------------------------> last status=0
usb_ohci_ed_pkt_flags fa=107 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_td_packet_status status=-6
usb_ohci_ed_pkt_flags fa=107 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_async_complete
usb_ohci_ed_pkt_flags fa=107 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=107 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_td_packet_status status=-6

It then takes some 4000 lines before a
usb_ohci_td_packet_status status=-6
usb_ohci_async_complete
happens (me clicking hid button)

Next I get:
usb_ohci_ed_pkt_flags fa=107 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=107 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_td_packet_status status=-6
usb_ohci_ed_pkt_flags fa=107 en=4 d=2 s=0 k=0 f=0 mps=37  ----> Line 107770
usb_ohci_ed_pkt_flags fa=107 en=4 d=2 s=0 k=0 f=0 mps=37
-----
usb_ohci_ed_pkt_flags fa=107 en=4 d=2 s=0 k=0 f=0 mps=37 ---> Line 187472

usb_ohci_async_complete (me clicking hid button)
usb_ohci_ed_pkt_flags fa=107 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=107 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_td_packet_status status=-6

En1 is then active from line 190303 (after unplug/replug)
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=1 d=1 s=0 k=0 f=1 mps=192
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=1 d=1 s=0 k=0 f=1 mps=192
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=1 d=1 s=0 k=0 f=1 mps=192
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=1 d=1 s=0 k=0 f=1 mps=192
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=1 d=1 s=0 k=0 f=1 mps=192
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=1 d=1 s=0 k=0 f=1 mps=192
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending

Which is again solve by a hid button click:
usb_ohci_async_complete
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=1 d=1 s=0 k=0 f=1 mps=192
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_packet_status status=0
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_packet_status status=0
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_packet_status status=-6
usb_ohci_async_complete
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_packet_status status=0
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_packet_status status=0
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_packet_status status=-6
usb_ohci_async_complete
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_packet_status status=0
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_packet_status status=0
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_packet_status status=-6
usb_ohci_async_complete
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_td_packet_status status=-6
usb_ohci_ed_pkt_flags fa=108 en=1 d=1 s=0 k=0 f=1 mps=192
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=1 d=1 s=0 k=0 f=1 mps=192
usb_ohci_async_complete

From here on there is intermittent en1 and en 4 traffic:
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=1 d=1 s=0 k=0 f=1 mps=192
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_td_packet_status status=-6

and for good measure some:
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending

and finally completing with ep 4 polling:
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=108 en=4 d=2 s=0 k=0 f=0 mps=37

The last async complete is when I shut down the host ;-)

Best,
Howard

--000000000000413cab05cd732f22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 3, 2021 at 12:00 PM BALAT=
ON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu" target=3D"_blank">balat=
on@eik.bme.hu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Sun, 3 Oct 2021, Howard Spoelstra wrote:<br>
&gt; On Sat, Oct 2, 2021 at 5:42 PM BALATON Zoltan &lt;<a href=3D"mailto:ba=
laton@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu</a>&gt; wrote:<br>
&gt;&gt; I&#39;m also not sure where&#39;s the problem (maybe we have multi=
ple problems).<br>
&gt;&gt; It also does not work with an emulated usb-audio device but that a=
lso<br>
&gt;&gt; doesn&#39;t work with EHCI so it may have a problem by itself (UHC=
I also seems<br>
&gt;&gt; to be broken on its own so it does not even work as much as OHCI a=
nd<br>
&gt;&gt; EHCI). You&#39;ve also said it worked with pass through with a dif=
ferent<br>
&gt;&gt; device so maybe this only happens with some devices or some sequen=
ce of<br>
&gt;&gt; things these devices are doing. Only allowing one async packet in =
OHCI<br>
&gt;&gt; instead of allowing one per endpoint is just a guess that could ca=
use<br>
&gt;&gt; delays in processing other packets but eventually it should go thr=
ough<br>
&gt;&gt; unless one async packet never completes and blocks all later ones =
or the<br>
&gt;&gt; delays introduced by this limitaion causes things to go in a way t=
hat<br>
&gt;&gt; guests don&#39;t expect and thus fail.<br>
&gt;&gt;<br>
&gt; After some sifting through the logs, I my interpretation of our issue =
is<br>
&gt; this:<br>
&gt; Too many pending is referring to endpoint 0 when something is not<br>
&gt; completed. Qemu permantly checks endpoint 4 for hid activity, skips wh=
en no<br>
&gt; interrupt occurs. You can see both intermittently in the 1st log below=
.<br>
&gt; Too many pending refers to qemu not being able to fully read/get the d=
evice<br>
&gt; descriptors from boot. The too many pending is &quot;solved&quot;, wit=
h a click on a<br>
&gt; hid button. That leads to async complete, after which the only activit=
y is<br>
&gt; to check for interrupts from the hid devices.<br>
<br>
That sounds like an async packet waiting on ep 4 blocks communication on <b=
r>
ep 0 because we don&#39;t allow one active packet per ep in hcd-ohci as the=
 <br>
comment says so this may be fixed by implementing that. But I&#39;m not sur=
e <br>
because this log did not include packet status. Maybe also enable <br>
usb_packet_state traces to confirm this. I may try to fix this, I have an <=
br>
idea how do it: I can pass the USBPacket back from the completion callback =
<br>
via OHCIState to ohci_service_td() but have to find a way to replace the <b=
r>
various cancel calls that use the usb_packet from OHCIState now to stop <br=
>
relying on that and do it by ep or whatever they have. This needs some <br>
more thinking and understand the code and OHCI better.<br>
<br>
I assume no more than one callback can be running at once so I can&#39;t ge=
t <br>
completion for two packets at the same time, therefore one pointer to pass =
<br>
back a packet is enough. I&#39;ll put an assert there and see what happens =
but <br>
if somebody knows please advise.<br>
<br>
&gt; However, as the descriptors from endpoint 0 are not fully read from bo=
ot,<br>
&gt; endpoint 1 (the actual audio stream) is not available.<br>
&gt; Unplugging/plugging the usb device in combination with some hid interr=
upts<br>
&gt; (me pushing the volume button) can sometimes reload the configuration<=
br>
&gt; correctly, so endpoint 1 becomes available and sound can be played thr=
ough<br>
&gt; it.<br>
<br>
Could be if guest driver starts polling ep 4 while still trying to talk to =
<br>
ep 0 which then fails due to packet waiting in async on ep 4. The emulated =
<br>
usb-audio may be different, that does not have HID endpoint only ep 0 for <=
br>
control and two audio ones and it seems to be detected but playing sound <b=
r>
does not work. Does -device usb-audio instead of passed through device <br>
makes sound with your guest OSes or that has a separate problem?<br></block=
quote><div><br></div><div>Usb-audio works in MacOS 9.2 guest, but only for =
some seconds. After that the desktop becomes unresponsive. Icons disappear,=
 mouse still moves but cannot activate anything. With via=3Dpmu, log shows =
usb mouse/kbd still communicating. <br></div><div>I&#39;ve seen something v=
ery similar happen when I attempt to stop and start usb support in Mac OS 9=
.2 with the headset passed through.</div><div>System sounds in Fedora 12 gu=
est can be played.<br></div><div><br></div><div>New logging with package st=
atus shows:</div><div>usb_ohci_ed_pkt_flags fa=3D107 en=3D0 d=3D0 s=3D0 k=
=3D0 f=3D0 mps=3D64<br>usb_ohci_td_packet_status status=3D0<br>usb_ohci_ed_=
pkt_flags fa=3D107 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_p=
acket_status status=3D-6<br>usb_ohci_ed_pkt_flags fa=3D107 en=3D0 d=3D0 s=
=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_ed_pkt_flags fa=3D107 en=3D0 d=3D0 s=
=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_async_complete <br>usb_ohci_ed_pkt_fl=
ags fa=3D107 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_ed_pkt_fla=
gs fa=3D107 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_packet_s=
tatus status=3D0<br>usb_ohci_ed_pkt_flags fa=3D107 en=3D0 d=3D0 s=3D0 k=3D0=
 f=3D0 mps=3D64<br>usb_ohci_td_packet_status status=3D0<br>usb_ohci_ed_pkt_=
flags fa=3D107 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_td_packe=
t_status status=3D-6=C2=A0 --------------------------&gt; note this is line=
 1282 in my log</div><div><br></div><div>The following then continues to li=
ne 17671<br></div><div>usb_ohci_ed_pkt_flags fa=3D107 en=3D4 d=3D2 s=3D0 k=
=3D0 f=3D0 mps=3D37<br></div><div><br></div><div>And is followed by:</div><=
div>usb_ohci_ed_pkt_flags fa=3D107 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<=
br>usb_ohci_ed_pkt_flags fa=3D107 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<b=
r>usb_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=3D107 en=3D4 d=
=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D107 en=3D0 d=
=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pending <br>usb_ohc=
i_ed_pkt_flags fa=3D107 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci=
_ed_pkt_flags fa=3D107 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_=
td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=3D107 en=3D4 d=3D2 s=3D0 k=
=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D107 en=3D0 d=3D0 s=3D0 k=
=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pending </div><div><br></div>Th=
e first async complete is then at 57456</div><div class=3D"gmail_quote">usb=
_ohci_td_too_many_pending <br>usb_ohci_async_complete <br>usb_ohci_ed_pkt_f=
lags fa=3D107 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_ma=
ny_pending <br>usb_ohci_ed_pkt_flags fa=3D107 en=3D4 d=3D2 s=3D0 k=3D0 f=3D=
0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D107 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0=
 mps=3D64<br>usb_ohci_td_packet_status status=3D-6=C2=A0 <br>usb_ohci_async=
_complete <br>usb_ohci_ed_pkt_flags fa=3D107 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0=
 mps=3D64<br>usb_ohci_ed_pkt_flags fa=3D107 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 =
mps=3D64<br>usb_ohci_td_packet_status status=3D0=C2=A0 <br>usb_ohci_ed_pkt_=
flags fa=3D107 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_packe=
t_status status=3D0=C2=A0  ------------------------&gt; last status=3D0<br>=
usb_ohci_ed_pkt_flags fa=3D107 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>u=
sb_ohci_td_packet_status status=3D-6<br>usb_ohci_ed_pkt_flags fa=3D107 en=
=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_async_complete <br>usb_oh=
ci_ed_pkt_flags fa=3D107 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohc=
i_ed_pkt_flags fa=3D107 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci=
_td_packet_status status=3D-6</div><div class=3D"gmail_quote"><div><br></di=
v><div>It then takes some 4000 lines before a <br></div><div>usb_ohci_td_pa=
cket_status status=3D-6<br>usb_ohci_async_complete <br></div><div>happens (=
me clicking hid button)</div><div><br></div><div>Next I get:</div><div>usb_=
ohci_ed_pkt_flags fa=3D107 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_o=
hci_ed_pkt_flags fa=3D107 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_oh=
ci_td_packet_status status=3D-6<br>usb_ohci_ed_pkt_flags fa=3D107 en=3D4 d=
=3D2 s=3D0 k=3D0 f=3D0 mps=3D37=C2=A0 ----&gt; Line 107770<br>usb_ohci_ed_p=
kt_flags fa=3D107 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37</div><div>-----</=
div><div>usb_ohci_ed_pkt_flags fa=3D107 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=
=3D37 ---&gt; Line 187472<br></div><div><br></div><div>usb_ohci_async_compl=
ete (me clicking hid button)<br>usb_ohci_ed_pkt_flags fa=3D107 en=3D4 d=3D2=
 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D107 en=3D4 d=3D2 =
s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_td_packet_status status=3D-6</div><d=
iv><br></div><div>En1 is then active from line 190303 (after unplug/replug)=
<br></div><div>usb_ohci_ed_pkt_flags fa=3D108 en=3D4 d=3D2 s=3D0 k=3D0 f=3D=
0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D108 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0=
 mps=3D64<br>usb_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=3D10=
8 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D108=
 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pending <b=
r>usb_ohci_ed_pkt_flags fa=3D108 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br=
>usb_ohci_ed_pkt_flags fa=3D108 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>=
usb_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=3D108 en=3D4 d=3D=
2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D108 en=3D0 d=3D0=
 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pending <br>usb_ohci_ed=
_pkt_flags fa=3D108 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_=
pkt_flags fa=3D108 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_t=
oo_many_pending <br>usb_ohci_ed_pkt_flags fa=3D108 en=3D4 d=3D2 s=3D0 k=3D0=
 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D108 en=3D1 d=3D1 s=3D0 k=3D0 =
f=3D1 mps=3D192<br>usb_ohci_ed_pkt_flags fa=3D108 en=3D0 d=3D0 s=3D0 k=3D0 =
f=3D0 mps=3D64<br>usb_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=
=3D108 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=
=3D108 en=3D1 d=3D1 s=3D0 k=3D0 f=3D1 mps=3D192<br>usb_ohci_ed_pkt_flags fa=
=3D108 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pend=
ing <br>usb_ohci_ed_pkt_flags fa=3D108 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=
=3D37<br>usb_ohci_ed_pkt_flags fa=3D108 en=3D1 d=3D1 s=3D0 k=3D0 f=3D1 mps=
=3D192<br>usb_ohci_ed_pkt_flags fa=3D108 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=
=3D64<br>usb_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=3D108 en=
=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D108 en=
=3D1 d=3D1 s=3D0 k=3D0 f=3D1 mps=3D192<br>usb_ohci_ed_pkt_flags fa=3D108 en=
=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pending <br>u=
sb_ohci_ed_pkt_flags fa=3D108 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>us=
b_ohci_ed_pkt_flags fa=3D108 en=3D1 d=3D1 s=3D0 k=3D0 f=3D1 mps=3D192<br>us=
b_ohci_ed_pkt_flags fa=3D108 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb=
_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=3D108 en=3D4 d=3D2 s=
=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D108 en=3D1 d=3D1 s=
=3D0 k=3D0 f=3D1 mps=3D192<br>usb_ohci_ed_pkt_flags fa=3D108 en=3D0 d=3D0 s=
=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pending=C2=A0</div><div><=
br></div><div>Which is again solve by a hid button click:</div><div>usb_ohc=
i_async_complete <br>usb_ohci_ed_pkt_flags fa=3D108 en=3D0 d=3D0 s=3D0 k=3D=
0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_flags =
fa=3D108 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags f=
a=3D108 en=3D1 d=3D1 s=3D0 k=3D0 f=3D1 mps=3D192<br>usb_ohci_ed_pkt_flags f=
a=3D108 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_packet_statu=
s status=3D0<br>usb_ohci_ed_pkt_flags fa=3D108 en=3D0 d=3D0 s=3D0 k=3D0 f=
=3D0 mps=3D64<br>usb_ohci_td_packet_status status=3D0<br>usb_ohci_ed_pkt_fl=
ags fa=3D108 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_packet_=
status status=3D-6<br>usb_ohci_async_complete <br>usb_ohci_ed_pkt_flags fa=
=3D108 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_ed_pkt_flags fa=
=3D108 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_packet_status=
 status=3D0<br>usb_ohci_ed_pkt_flags fa=3D108 en=3D0 d=3D0 s=3D0 k=3D0 f=3D=
0 mps=3D64<br>usb_ohci_td_packet_status status=3D0<br>usb_ohci_ed_pkt_flags=
 fa=3D108 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_packet_sta=
tus status=3D-6<br>usb_ohci_async_complete <br>usb_ohci_ed_pkt_flags fa=3D1=
08 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_ed_pkt_flags fa=3D10=
8 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_packet_status stat=
us=3D0<br>usb_ohci_ed_pkt_flags fa=3D108 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=
=3D64<br>usb_ohci_td_packet_status status=3D0<br>usb_ohci_ed_pkt_flags fa=
=3D108 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_packet_status=
 status=3D-6<br>usb_ohci_async_complete <br>usb_ohci_ed_pkt_flags fa=3D108 =
en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_ed_pkt_flags fa=3D108 e=
n=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_td_packet_status status=
=3D-6<br>usb_ohci_ed_pkt_flags fa=3D108 en=3D1 d=3D1 s=3D0 k=3D0 f=3D1 mps=
=3D192<br>usb_ohci_ed_pkt_flags fa=3D108 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=
=3D37<br>usb_ohci_ed_pkt_flags fa=3D108 en=3D1 d=3D1 s=3D0 k=3D0 f=3D1 mps=
=3D192<br>usb_ohci_async_complete <br></div><div><br></div><div>From here o=
n there is intermittent en1 and en 4 traffic:</div><div>usb_ohci_ed_pkt_fla=
gs fa=3D108 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flag=
s fa=3D108 en=3D1 d=3D1 s=3D0 k=3D0 f=3D1 mps=3D192<br>usb_ohci_ed_pkt_flag=
s fa=3D108 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_td_packet_st=
atus status=3D-6</div><div><br></div><div>and for good measure some:</div><=
div>usb_ohci_ed_pkt_flags fa=3D108 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<=
br>usb_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=3D108 en=3D4 d=
=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D108 en=3D0 d=
=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pending <br>usb_ohc=
i_ed_pkt_flags fa=3D108 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci=
_ed_pkt_flags fa=3D108 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_=
td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=3D108 en=3D4 d=3D2 s=3D0 k=
=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D108 en=3D0 d=3D0 s=3D0 k=
=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pending </div><div><br></div><d=
iv>and finally completing with ep 4 polling:</div><div>usb_ohci_ed_pkt_flag=
s fa=3D108 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags=
 fa=3D108 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags =
fa=3D108 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags f=
a=3D108 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=
=3D108 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=
=3D108 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=
=3D108 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=
=3D108 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=
=3D108 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=
=3D108 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37</div><div><br></div><div>The=
 last async complete is when I shut down the host ;-)<br></div><div><br></d=
iv><div>Best,</div><div>Howard<br></div></div></div>

--000000000000413cab05cd732f22--


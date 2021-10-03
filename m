Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3F9420075
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 09:30:54 +0200 (CEST)
Received: from localhost ([::1]:48744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWvxU-0000ec-Ki
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 03:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1mWvtk-0005gL-KV
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:27:00 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:38598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1mWvth-0004aY-AJ
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:27:00 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 c6-20020a9d2786000000b005471981d559so17389590otb.5
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F64aj3isRkUfC5j4ydUYpx1wp4Ogcewuogq8dZGVU1o=;
 b=cke/wkYL7KKq8tiatS0nPAE26VpkmwvJn7I+ZL5khiK8mHX6pPjF7ZUC+VqdF1vaF7
 ptBf7JG3+7h9ZIfwcVotMORavHI92aWYSUwSvwiITJhAN/8M4/Beoo6RQQdHrvDU8nSB
 F9jUv9ck5wrjiAvjI9lLGBsEkig7VzH74hI/od/ObS8fjDJ12KVw78Bja/mM2dka32MV
 pRSuQWQtskssDG1aeHxUvcpjGZB6ljocQ9pav3nD3iEtNP3j+XbRmyyLdq0WF2Uc+wNZ
 RDISoBpZ810ypGig19MhNOiaKzVv5h4KEVM+AveTgKX3dRuDHmuqFvMWd+FE7TfTVusG
 UOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F64aj3isRkUfC5j4ydUYpx1wp4Ogcewuogq8dZGVU1o=;
 b=WIvGQwvNGDCo7kLkAAzMrnTxSw+caSXh331hvSCetG0HEKz+ajWdbJPlQmLubCj+JC
 Bo+2vORrUB0xUNL6MHT+NkyaH9cFx44wPSSvImp9f4CHrGfondHThmehANW66lWwdint
 jpBgj8ObTSrF9VJBUrQ6jkx4QRSI8df6siQTZSIc0SX5LCG9EnwIYxOCKpXIup50F3ij
 bakKqMAtampMeOKstQvGVAC3/vcc7atocu4YN10/COtpC9m0b0sjs84T51SbngbyPuGU
 GhtetlKpNAnxZoCEcjlP2tkkoZJj+KjGWknoq70DZpX8ONWx5gW3O1vqE3t2G0Ve5aAY
 C3Gw==
X-Gm-Message-State: AOAM531MF7Q0fDfq1Ymd/+jEuggALE6YNOV5Ke3ghlCIlyjogHycSSG4
 LNU2ra9ukAo6Y+Rb8OLV5H2FR2Q6tNfwZz3EI2k=
X-Google-Smtp-Source: ABdhPJzO0Ar8UoHagSNVSxwoSLaG4zQ6LvL9+raQy6kQqEGxpFnf56ApKudmkNiSpdmAR4FUQO29son54YWdRr4AcB8=
X-Received: by 2002:a9d:6a85:: with SMTP id l5mr5289860otq.122.1633246016040; 
 Sun, 03 Oct 2021 00:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633122670.git.balaton@eik.bme.hu>
 <CABLmASG_Coop-fMRdv_PvBorO1fQUrhY3h+-PGts_ixhhkaADA@mail.gmail.com>
 <6c2830fe-70d5-3c1a-ba17-85f3d252d860@eik.bme.hu>
In-Reply-To: <6c2830fe-70d5-3c1a-ba17-85f3d252d860@eik.bme.hu>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Sun, 3 Oct 2021 09:26:45 +0200
Message-ID: <CABLmASGkZ3kuGPF=d0jWPyryepcM-Hpd_VcgL=Z4qpmk07E-1A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Misc OHCI patches
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: multipart/alternative; boundary="0000000000009df02e05cd6db827"
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ot1-x336.google.com
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

--0000000000009df02e05cd6db827
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 2, 2021 at 5:42 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Sat, 2 Oct 2021, Howard Spoelstra wrote:
> > Both have issues communicating with endpoint 4 (the hid controls volume
> > up/down and mute).
> > Endpoint 1 should receive the isochronous audio stream, but never does.
> >
> > After some experimentation with unplugging/plugging the headset and
> probing
> > the usb stack (using the usb prober from the mac usb ddk for Mac OS 9.2)
> at
> > some point endpoint 4 communication works for both guests tested. Only
> once
> > was I able to get sound out and in working in Mac OS 9.2. For OSX I could
> > only once get audio in working.
>
> The async packets are on endpoint 0. I'm not sure the HID endpoint 4 is
> normally involved at all unless you push some buttons but it should work
> without that so maybe look at the 0 and the audio endpoints instead of
> HID that should have no traffic unless you press buttons.
>
> > Pcap and text logs for both MacOS 9.2 and OSX 10.4 tests included...
>
> These are way too big to be possible to find anything in them. Maybe you
> should do something simpler like boot the guest without the device
> attached and discard all logs up to that point. Then start collecting logs
> and attach device and play a short sound. Stop collecting log and try to
> make sense of where that fails. That's still a lot of traces but should
> only contain the relevant info of detecing the device and playing a sound
> not a lot of others that makes it difficult to find what's relevant.
>
> I'm also not sure where's the problem (maybe we have multiple problems).
> It also does not work with an emulated usb-audio device but that also
> doesn't work with EHCI so it may have a problem by itself (UHCI also seems
> to be broken on its own so it does not even work as much as OHCI and
> EHCI). You've also said it worked with pass through with a different
> device so maybe this only happens with some devices or some sequence of
> things these devices are doing. Only allowing one async packet in OHCI
> instead of allowing one per endpoint is just a guess that could cause
> delays in processing other packets but eventually it should go through
> unless one async packet never completes and blocks all later ones or the
> delays introduced by this limitaion causes things to go in a way that
> guests don't expect and thus fail.
>
> Regards,
> BALATON Zoltan
>

After some sifting through the logs, I my interpretation of our issue is
this:
Too many pending is referring to endpoint 0 when something is not
completed. Qemu permantly checks endpoint 4 for hid activity, skips when no
interrupt occurs. You can see both intermittently in the 1st log below.
Too many pending refers to qemu not being able to fully read/get the device
descriptors from boot. The too many pending is "solved", with a click on a
hid button. That leads to async complete, after which the only activity is
to check for interrupts from the hid devices.
However, as the descriptors from endpoint 0 are not fully read from boot,
endpoint 1 (the actual audio stream) is not available.
Unplugging/plugging the usb device in combination with some hid interrupts
(me pushing the volume button) can sometimes reload the configuration
correctly, so endpoint 1 becomes available and sound can be played through
it.

usb_ohci_ed_pkt_flags fa=95 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=95 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=95 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=95 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=95 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=95 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=95 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=95 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_async_complete
usb_ohci_ed_pkt_flags fa=95 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=95 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=95 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_async_complete
usb_ohci_ed_pkt_flags fa=95 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=95 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=95 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=95 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=95 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_async_complete
usb_ohci_ed_pkt_flags fa=95 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=95 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=95 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=95 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=95 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=95 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=95 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=95 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=95 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=95 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_async_complete ----------------------------------> me clicking a
hid button.
usb_ohci_ed_pkt_flags fa=95 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=95 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=95 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=95 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=95 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=95 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=95 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=95 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=95 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=95 en=4 d=2 s=0 k=0 f=0 mps=37

After unplugging/plugging the device and some ep 4 traffic generated by
button clicks, ep 1 also becomes active:
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_async_complete
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_async_complete
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_async_complete
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_async_complete
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_async_complete
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=1 d=1 s=0 k=0 f=1 mps=192
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=1 d=1 s=0 k=0 f=1 mps=192
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=1 d=1 s=0 k=0 f=1 mps=192
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=1 d=1 s=0 k=0 f=1 mps=192
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=1 d=1 s=0 k=0 f=1 mps=192
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=1 d=1 s=0 k=0 f=1 mps=192
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending
usb_ohci_ed_pkt_flags fa=96 en=4 d=2 s=0 k=0 f=0 mps=37
usb_ohci_ed_pkt_flags fa=96 en=1 d=1 s=0 k=0 f=1 mps=192
usb_ohci_ed_pkt_flags fa=96 en=0 d=0 s=0 k=0 f=0 mps=64
usb_ohci_td_too_many_pending

--0000000000009df02e05cd6db827
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">=C2=A0<br></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Oct 2, 2021 at 5:42 PM =
BALATON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu" target=3D"_blank">=
balaton@eik.bme.hu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Sat, 2 Oct 2021, Howard Spoelstra wrote:<br>
&gt; Both have issues communicating with endpoint 4 (the hid controls volum=
e<br>
&gt; up/down and mute).<br>
&gt; Endpoint 1 should receive the isochronous audio stream, but never does=
.<br>
&gt;<br>
&gt; After some experimentation with unplugging/plugging the headset and pr=
obing<br>
&gt; the usb stack (using the usb prober from the mac usb ddk for Mac OS 9.=
2) at<br>
&gt; some point endpoint 4 communication works for both guests tested. Only=
 once<br>
&gt; was I able to get sound out and in working in Mac OS 9.2. For OSX I co=
uld<br>
&gt; only once get audio in working.<br>
<br>
The async packets are on endpoint 0. I&#39;m not sure the HID endpoint 4 is=
 <br>
normally involved at all unless you push some buttons but it should work <b=
r>
without that so maybe look at the 0 and the audio endpoints instead of <br>
HID that should have no traffic unless you press buttons.<br>
<br>
&gt; Pcap and text logs for both MacOS 9.2 and OSX 10.4 tests included...<b=
r>
<br>
These are way too big to be possible to find anything in them. Maybe you <b=
r>
should do something simpler like boot the guest without the device <br>
attached and discard all logs up to that point. Then start collecting logs =
<br>
and attach device and play a short sound. Stop collecting log and try to <b=
r>
make sense of where that fails. That&#39;s still a lot of traces but should=
 <br>
only contain the relevant info of detecing the device and playing a sound <=
br>
not a lot of others that makes it difficult to find what&#39;s relevant.<br=
>
<br>
I&#39;m also not sure where&#39;s the problem (maybe we have multiple probl=
ems). <br>
It also does not work with an emulated usb-audio device but that also <br>
doesn&#39;t work with EHCI so it may have a problem by itself (UHCI also se=
ems <br>
to be broken on its own so it does not even work as much as OHCI and <br>
EHCI). You&#39;ve also said it worked with pass through with a different <b=
r>
device so maybe this only happens with some devices or some sequence of <br=
>
things these devices are doing. Only allowing one async packet in OHCI <br>
instead of allowing one per endpoint is just a guess that could cause <br>
delays in processing other packets but eventually it should go through <br>
unless one async packet never completes and blocks all later ones or the <b=
r>
delays introduced by this limitaion causes things to go in a way that <br>
guests don&#39;t expect and thus fail.<br>
<br>
Regards,<br>
BALATON Zoltan<br></blockquote><div><br></div><div>After some sifting throu=
gh the logs, I my interpretation of our issue is this:</div><div>Too many p=
ending is referring to endpoint 0 when something is not completed. Qemu per=
mantly checks endpoint 4 for hid activity, skips when no interrupt occurs. =
You can see both intermittently in the 1st log below. <br></div><div>Too ma=
ny pending refers to qemu not being able to fully read/get the device descr=
iptors from boot. The too many pending is &quot;solved&quot;, with a click =
on a hid button. That leads to async complete, after which the only activit=
y is to check for interrupts from the hid devices.</div><div>However, as th=
e descriptors from endpoint 0 are not fully read from boot, endpoint 1 (the=
 actual audio stream) is not available.</div><div>Unplugging/plugging the u=
sb device in combination with some hid interrupts (me pushing the volume bu=
tton) can sometimes reload the configuration correctly, so endpoint 1 becom=
es available and sound can be played through it.<br></div><div>=C2=A0<br>us=
b_ohci_ed_pkt_flags fa=3D95 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_=
ohci_ed_pkt_flags fa=3D95 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_oh=
ci_td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=3D95 en=3D4 d=3D2 s=3D0=
 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D95 en=3D0 d=3D0 s=3D0 k=
=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_fla=
gs fa=3D95 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags=
 fa=3D95 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pe=
nding <br>usb_ohci_ed_pkt_flags fa=3D95 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=
=3D37<br>usb_ohci_ed_pkt_flags fa=3D95 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=
=3D64<br>usb_ohci_td_too_many_pending <br>usb_ohci_async_complete <br>usb_o=
hci_ed_pkt_flags fa=3D95 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohc=
i_td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=3D95 en=3D4 d=3D2 s=3D0 =
k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D95 en=3D0 d=3D0 s=3D0 k=
=3D0 f=3D0 mps=3D64<br>usb_ohci_async_complete <br>usb_ohci_ed_pkt_flags fa=
=3D95 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_ed_pkt_flags fa=
=3D95 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_ed_pkt_flags fa=
=3D95 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_ed_pkt_flags fa=
=3D95 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=
=3D95 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_async_complete <b=
r>usb_ohci_ed_pkt_flags fa=3D95 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>=
usb_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=3D95 en=3D4 d=3D2=
 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D95 en=3D0 d=3D0 s=
=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_ed_pkt_flags fa=3D95 en=3D0 d=3D0 s=
=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_ed_pkt_flags fa=3D95 en=3D4 d=3D2 s=
=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_td_too_many_pending <br>usb_ohci_ed_p=
kt_flags fa=3D95 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_ed_pkt=
_flags fa=3D95 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_td_too_m=
any_pending <br>usb_ohci_ed_pkt_flags fa=3D95 en=3D0 d=3D0 s=3D0 k=3D0 f=3D=
0 mps=3D64<br>usb_ohci_ed_pkt_flags fa=3D95 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 =
mps=3D37<br>usb_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=3D95 =
en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_async_complete --------=
--------------------------&gt; me clicking a hid button.<br>usb_ohci_ed_pkt=
_flags fa=3D95 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_ed_pkt_f=
lags fa=3D95 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_ed_pkt_fla=
gs fa=3D95 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_ed_pkt_flags=
 fa=3D95 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags f=
a=3D95 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=
=3D95 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=
=3D95 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=
=3D95 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=
=3D95 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=
=3D95 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37</div><div><br></div><div>Afte=
r unplugging/plugging the device and some ep 4 traffic generated by button =
clicks, ep 1 also becomes active:<br></div><div>usb_ohci_td_too_many_pendin=
g <br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37=
<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<b=
r>usb_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=
=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=
=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pending <br>usb_ohc=
i_async_complete <br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0=
 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_flags f=
a=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=
=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_ed_pkt_flags fa=
=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_ed_pkt_flags fa=
=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_async_complete <b=
r>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>=
usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>us=
b_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_=
ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_oh=
ci_async_complete <br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D=
0 f=3D0 mps=3D64<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 =
f=3D0 mps=3D64<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=
=3D0 mps=3D64<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_async_complete <br>usb_ohci_ed_pkt_flags fa=3D96 =
en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pending <br=
>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>u=
sb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb=
_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_o=
hci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohc=
i_async_complete <br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0=
 f=3D0 mps=3D64<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=
=3D0 mps=3D64<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=
=3D0 mps=3D64<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=
=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=
=3D0 mps=3D64<br>usb_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=
=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=
=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pendi=
ng <br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D3=
7<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<=
br>usb_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=
=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=
=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pending <br>usb_ohc=
i_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_=
ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td=
_too_many_pending <br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D=
0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 =
f=3D0 mps=3D64<br>usb_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=
=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=
=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pendi=
ng <br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D3=
7<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<=
br>usb_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=
=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=
=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pending <br>usb_ohc=
i_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_=
ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td=
_too_many_pending <br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D=
0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 =
f=3D0 mps=3D64<br>usb_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=
=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=
=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pendi=
ng <br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D3=
7<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<=
br>usb_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=
=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=
=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pending <br>usb_ohc=
i_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_=
ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td=
_too_many_pending <br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D=
0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D1 d=3D1 s=3D0 k=3D0 =
f=3D1 mps=3D192<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=
=3D0 mps=3D64<br>usb_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=
=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=
=3D96 en=3D1 d=3D1 s=3D0 k=3D0 f=3D1 mps=3D192<br>usb_ohci_ed_pkt_flags fa=
=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pendi=
ng <br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D3=
7<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D1 d=3D1 s=3D0 k=3D0 f=3D1 mps=3D192=
<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<b=
r>usb_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=
=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D1 d=
=3D1 s=3D0 k=3D0 f=3D1 mps=3D192<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=
=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pending <br>usb_ohc=
i_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_=
ed_pkt_flags fa=3D96 en=3D1 d=3D1 s=3D0 k=3D0 f=3D1 mps=3D192<br>usb_ohci_e=
d_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_=
too_many_pending <br>usb_ohci_ed_pkt_flags fa=3D96 en=3D4 d=3D2 s=3D0 k=3D0=
 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D1 d=3D1 s=3D0 k=3D0 f=
=3D1 mps=3D192<br>usb_ohci_ed_pkt_flags fa=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=
=3D0 mps=3D64<br>usb_ohci_td_too_many_pending <br>usb_ohci_ed_pkt_flags fa=
=3D96 en=3D4 d=3D2 s=3D0 k=3D0 f=3D0 mps=3D37<br>usb_ohci_ed_pkt_flags fa=
=3D96 en=3D1 d=3D1 s=3D0 k=3D0 f=3D1 mps=3D192<br>usb_ohci_ed_pkt_flags fa=
=3D96 en=3D0 d=3D0 s=3D0 k=3D0 f=3D0 mps=3D64<br>usb_ohci_td_too_many_pendi=
ng <br>=C2=A0<br><br><br><br></div><div>=C2=A0</div></div></div>

--0000000000009df02e05cd6db827--


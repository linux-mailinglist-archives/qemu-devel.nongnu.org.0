Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DD33385E2
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 07:30:03 +0100 (CET)
Received: from localhost ([::1]:58692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKbJC-0001l2-9Q
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 01:30:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKbHv-0000jg-FW
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:28:44 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:38853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKbHr-0004j1-Do
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:28:43 -0500
Received: by mail-yb1-xb36.google.com with SMTP id 133so24276932ybd.5
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 22:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Lbp2QpZRUAOSPrS6UdCk82t2lAkPOU+kKesL0C8mm4g=;
 b=EFeNJvV9R2TZiAbKjKron/5AfmpJck4qiGfUKJgH2zun1vWqw7dObMpCQzY+2oEIzC
 ecVRnTyWGxpzNUbY0b6Z+6fsWoIKuBCKRMMrDgQN8mCxnUVl/2gSTxh/fWoq2xVV/RGV
 EQmkIpKYUS1Gecrj90VGmRtG3sRAWHO+8o+Jy9do4FZesWBf4oP1VGG2fF2BsQtRSccH
 hDcxa8/CBhQiPV8D6oOP9zCrLrhZ5xGHwD+oEz8xzRJmtP1A1zac6QSio9QHdTwWT+lF
 cmYmC9oJUzHjbgbF7tATcogbBJC3pXAMl4Fv5pqY+YqrAB/FVpbpNk+K0bsLvUYu5ITJ
 0zRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Lbp2QpZRUAOSPrS6UdCk82t2lAkPOU+kKesL0C8mm4g=;
 b=nwZKnGe3oQsGmWseW+PS2CAHnitB31SH/LEE2Ju/VTCY+npvtjUpZyAvo3NIHnnoT3
 LoWaw2GHQZXMxG+PmQDfQr7cEolMDSkmGAJ5GpuW8k/sBRKwYBg9cNqv7GnOP6O2PHSB
 9dgNhDhXn5dKKAYZOUbTdgF5UeJoYFDP5EYkCWwqTnRJDJJeWTGLEUoa2rgVWJEq30wC
 8Izw9JYq01M5n/avdOvqHIYDEe0zKxX+XIhK3at5YN8rnm86tZLoNH6XS0+fotopkqGB
 Ku4DRMGQ3ltJQlTzyfcl6HVNl0bzlJ8gV/cQxw33rgM9QiFCb9VwTf46DfTvjr70OOIt
 thzQ==
X-Gm-Message-State: AOAM533UD7hgXlRAyq4/g6jSdMhHZuzBh0oU4xdnNGjZY7HUU4ovFfja
 xrA5bOPNSoSBm9pv+vCqpIuKwkfEGeuoEjt8ukc=
X-Google-Smtp-Source: ABdhPJw02oCH+LT3WsmdfNeDToE/9bLhhfFskDpVOVLJMTVn1ZCQjQ7Nmet9yoN4L1+BQ9UuCCGcpFlBaUWDuy5WWc0=
X-Received: by 2002:a25:c090:: with SMTP id
 c138mr16399584ybf.314.1615530517773; 
 Thu, 11 Mar 2021 22:28:37 -0800 (PST)
MIME-Version: 1.0
References: <20210303191205.1656980-1-philmd@redhat.com>
 <20210303191205.1656980-3-philmd@redhat.com>
 <36123f35-06ab-d0da-37d2-6f8324e7f582@redhat.com>
 <CAFEAcA-REYy45Jmean0PhVerG9d_CpqgaFtxuWBMBrGDdyzvdA@mail.gmail.com>
 <edce617c-3591-a172-ad18-3bf138af26e0@redhat.com>
 <CAEUhbmU-KDUBADcX+bZHjH0thhddTSQ=Qtb56GztdRzPKE4Xhw@mail.gmail.com>
 <a26ef919-2e00-ae5b-c016-83e811ea5cdd@redhat.com>
 <CAEUhbmWdn8ZV1vNku_7dQfNg68xL6p3f-BCzq31jj5QAKmjj0w@mail.gmail.com>
 <CAEUhbmUY89OEpBpxCZzya=KKb1U5KBO=rPArn8yre7fmZe1q5A@mail.gmail.com>
 <CAFEAcA89xLMogR5-tUH-LW37Lr+py3LXQRgaO9_P8r8w-0gfzA@mail.gmail.com>
 <f682a3a0-cdb1-4746-ceed-c900c3f669ed@redhat.com>
 <CAFEAcA8_j6q8PweuoUVyW+BAGojZ8HdNnedrZwQNcBFWbn9Kbg@mail.gmail.com>
 <CAEUhbmW1pz0=TgwF12j5pQUaCGSLPumb5-yiy32PKfdTvvdpVQ@mail.gmail.com>
 <CAFEAcA8gwa2NGF2s3f=hO+EaVSJNDJrKz7xG60eSm68-CXf-mw@mail.gmail.com>
 <CAEUhbmWPWA_0wWBzacu1K2Kx+A2dgmFs89TQrbcG52mX=P5o7Q@mail.gmail.com>
 <4cc1bcb9-2288-ac03-4a5f-a1ebad4d34ef@redhat.com>
In-Reply-To: <4cc1bcb9-2288-ac03-4a5f-a1ebad4d34ef@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 12 Mar 2021 14:28:26 +0800
Message-ID: <CAEUhbmWmU9=WyESkdRbQp5DQrNQbf_q4mZZrOHXTH+tYavpTMA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 12, 2021 at 2:23 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/3/11 6:27 =E4=B8=8B=E5=8D=88, Bin Meng wrote:
> > On Thu, Mar 11, 2021 at 6:22 PM Peter Maydell <peter.maydell@linaro.org=
> wrote:
> >> On Thu, 11 Mar 2021 at 09:58, Bin Meng <bmeng.cn@gmail.com> wrote:
> >>> On Thu, Mar 11, 2021 at 5:43 PM Peter Maydell <peter.maydell@linaro.o=
rg> wrote:
> >>>> On Thu, 11 Mar 2021 at 03:01, Jason Wang <jasowang@redhat.com> wrote=
:
> >>>>> And after a discussion 10 years ago [1]. Michael (cced) seems to wa=
nt to
> >>>>> keep the padding logic in the NIC itself (probably with a generic h=
elper
> >>>>> in the core). Since 1) the padding is only required for ethernet 2)
> >>>>> virito-net doesn't need that (it can pass incomplete packet by desi=
gn).
> >>>> Like I said, we need to decide; either:
> >>>>
> >>>>   (1) we do want to support short packets in the net core:
> >>>> every sender needs to either pad, or to have some flag to say
> >>>> "my implementation can't pad, please can the net core do it for me",
> >>>> unless they are deliberately sending a short packet. Every
> >>>> receiver needs to be able to cope with short packets, at least
> >>>> in the sense of not crashing (they should report them as a rx
> >>>> error if they have that kind of error reporting status register).
> >>>> I think we have mostly implemented our NIC models this way.
> >>>>
> >>>>   (2) we simply don't support short packets in the net core:
> >>>> nobody (not NICs, not network backends) needs to pad, because
> >>>> they can rely on the core to do it. Some existing senders and
> >>>> receivers may have now-dead code to do their own padding which
> >>>> could be removed.
> >>>>
> >>>> MST is advocating for (1) in that old thread. That's a coherent
> >>>> position.
> >>> But it's a wrong approach. As Edgar and Stefan also said in the old
> >>> discussion thread, padding in the RX is wrong as real world NICs don'=
t
> >>> do this.
> >> Neither option (1) nor option (2) involve padding in RX.
> > Correct. What I referred to is the current approach used in many NIC
> > modes, which is wrong, and we have to correct this.
> >
> >> Option (1) is:
> >>   * no NIC implementation pads on TX, except as defined
> >>     by whatever NIC-specific config registers or h/w behaviour
> >>     might require (ie if the guest wants to send a short packet
> >>     it can do that)
> >>   * non-NIC sources like slirp need to pad on TX unless they're
> >>     deliberately trying to send a short packet
> >>   * all receivers of packets need to cope with being given a
> >>     short packet; this is usually going to mean "flag it to the
> >>     guest as an RX error", but exact behaviour is NIC-dependent
> >>
> > My patch series in RFC v2/v3 does almost exactly this option (1),
> > except "flag it to the guest as an RX error".
>
>
> Is it? You did it at net core instead of netdevs if I read the code
> correctly.
>

Literally I don't see Peter requested option (1) to be done in net
core or net devs.

If doing it in netdevs, the following codes need to be duplicated in
both SLiRP and TAP codes.

if (sender->info->type =3D=3D NET_CLIENT_DRIVER_USER ||
    sender->info->type =3D=3D NET_CLIENT_DRIVER_TAP) {
    do the short frames padding;
}

>
> >
> >> Option (2) is:
> >>   * the net core code pads any packet that goes through it
> >>   * no NIC implementation needs to pad on TX (it is harmless if they d=
o)
> >>   * non-NIC sources don't need to pad on TX
> >>   * no receivers of packets need to cope with being given short packet=
s
> >>
> >> Option 1 is what the real world does. Option 2 is a simplification
> >> which throws away the ability to emulate handling of short packets,
> >> in exchange for not having to sort out senders like slirp and not
> >> having to be so careful about short-packet handling in NIC models.
> >>
> >> If MST is correct that some use cases require short-packet support,
> >> then we need to go for option 1, I think.
>
>
> For NIC RX, I wonder whether we can introduce a boolean to whether it
> requries padding. And then the netdevs can only do the padding when it's
> required. E.g virito-net doesn't need padding.
>

Regards,
Bin


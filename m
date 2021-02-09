Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B68E3144F7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:32:37 +0100 (CET)
Received: from localhost ([::1]:49108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GxI-00049r-6Z
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:32:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9GYV-0001oL-2k; Mon, 08 Feb 2021 19:07:01 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:37800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9GYR-0005zF-Sf; Mon, 08 Feb 2021 19:06:57 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id p193so2685044yba.4;
 Mon, 08 Feb 2021 16:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B3YrvQcJrZg5Hskw1PO1kbcrH+gfg6mcF4skQ/ltZM4=;
 b=K5IDDeeN0495jTQAiXByEJd/GAUUdfSe9NB4pBtyztzTprc1QH8+GdxWjFlJVw1nE/
 qUDReGmSNvp7zgnz3pk5jxSgQnfUaUFAQHDkZAhwSHtunQYsWQgfQ5IzQ7hjgYB6ruwe
 F4sOO/kyTntJFJCb0NnBv0sMNH6VROOnI3uwVLt1bM2Vxb8rd/Z3utQd6tP7kfLjNEJR
 cLvuCStDPwtUWjuX+0fZdNNjqutjWZY3fbqE3/HCzbqP5BLLBRp3JVhgNqCepYqfgsGl
 O9iwVWH8s0ypv6GMKXgH+M0l4GJNrH2qILFv4fpxYN6I+aA2dJv2RYeL4zPmwVb3H3Ha
 /2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B3YrvQcJrZg5Hskw1PO1kbcrH+gfg6mcF4skQ/ltZM4=;
 b=Z94XV6nDP3bQpHxG07wHJfNq6tXicTv2TK1bEImZXDVIcxeJju/lh9dDsV/u3erT/M
 lhzS01VWQ1O+BG4k+ENmdB7Dor77T6UACCexv0wjQSuKgE8emzOnLBztTmM0npSgfTG2
 KJnZsW/1spdP019JMZwzvlyvvyE3ZoZop8BwuZ7OOnJcAvM9rBiKlXJiXP+L35rZRcE4
 W66v6pT21tl0E4X0apj2hMR0gbPh6d8oDXmfNsSHRIkK4lfNbXJRC9G7ACXhSRQkcT4h
 RchdZksu3c4A3gvUwbYI1/12UdwtXnW9typzhYiasQADXpCSVdzPcfHlVFLC9YNg4G0K
 pmgQ==
X-Gm-Message-State: AOAM532iRoD2Re3eLKV5gVEbJ3FrHQLmOQ/TWsQH5kDPHNC8npk5ooI9
 Ft10GE6l6+UqaJmJU04r3qrL5k765xuFW9ycbTk=
X-Google-Smtp-Source: ABdhPJybKg3jd5gH7FE4VfkVde4FA2TZEtsBmocHOWoeda07BmHLErLME3D0InJt8et4O0+FOYd3tn+43O8cPZ7/HQs=
X-Received: by 2002:a25:c407:: with SMTP id u7mr13448274ybf.387.1612829214296; 
 Mon, 08 Feb 2021 16:06:54 -0800 (PST)
MIME-Version: 1.0
References: <1612766576-7792-1-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA9QzNnXb61vA0Quy3Lii+vpO5wyqh_kthHTf0Jsbn8RkA@mail.gmail.com>
In-Reply-To: <CAFEAcA9QzNnXb61vA0Quy3Lii+vpO5wyqh_kthHTf0Jsbn8RkA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 9 Feb 2021 08:06:42 +0800
Message-ID: <CAEUhbmVpwsmh8Eu6Fb7BbHUkMePa85YV_s_hcYTx=gysHa5kXQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] hw/net: fsl_etsec: Do not reject short frames
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>, slirp@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
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
Cc: Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing libSLiRP

Hi Peter,

On Tue, Feb 9, 2021 at 12:09 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 8 Feb 2021 at 14:53, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > As of today both slirp and tap networking do not pad short frames
> > (e.g.: an ARP packet) to the minimum frame size of 60 bytes.
> >
> > If eTSEC is programmed to reject short frames, ARP requests will be
> > dropped, preventing the guest from becoming visible on the network.
> >
> > The same issue was reported on e1000 and vmxenet3 before, see:
> >
> > commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
> > commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")
>
> How a short frame should be handled is ethernet device specific:
> what is correct for one device model doesn't necessarily apply
> to another.

I digged some history about the above 2 commits and they are the same
issue caused by slirp and tap networking, and workarounded in the
ethernet controller models.

>
> > Ideally this should be fixed on the slirp/tap networking side to
> > pad short frames to the minimum frame length, but I am not sure
> > whether that's doable.
>
> It would be useful to investigate further exactly where these
> short frames are coming from. If one guest is sending out short
> frames, or we are doing tap networking and get a genuine short
> frame from some external host then we should pass them to the
> guest as short frames; if QEMU itself is generating frames (eg
> from the 'fake' hosts in usermode networking) then it should be
> generating valid frames, not bogus ones, and we should fix whatever
> bit of code that is.

From what I can tell it's the QEMU networking codes that generate such
short frames.

However it looks no one has ever attempted to fix that in the QEMU
networking, instead the ethernet controller models are patched in the
*receive* path, which is to pad such short frames to 60 bytes in e1000
and vmxnet3.

>
> > This commit changes to codes to ignore the RCTRL_RSF setting and
> > still allow receiving the short frame. The log message is updated
> > to mention the reject short frames functionality is unimplemented.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> > RESEND using correct email address
> >
> >  hw/net/fsl_etsec/rings.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
> > index 121415a..503b4d3 100644
> > --- a/hw/net/fsl_etsec/rings.c
> > +++ b/hw/net/fsl_etsec/rings.c
> > @@ -502,10 +502,17 @@ ssize_t etsec_rx_ring_write(eTSEC *etsec, const uint8_t *buf, size_t size)
> >          return -1;
> >      }
> >
> > +    /*
> > +     * Both slirp and tap networking do not pad short frames
> > +     * (e.g.: an ARP packet) to the minimum frame size of 60 bytes.
> > +     *
> > +     * If eTSEC is programmed to reject short frames, ARP requests
> > +     * will be dropped, preventing the guest from becoming visible
> > +     * on the network.
> > +     */
> >      if ((etsec->regs[RCTRL].value & RCTRL_RSF) && (size < 60)) {
> >          /* CRC is not in the packet yet, so short frame is below 60 bytes */
> > -        RING_DEBUG("%s: Drop short frame\n", __func__);
> > -        return -1;
> > +        RING_DEBUG("%s: Drop short frame not implemented\n", __func__);
> >      }
>
> This doesn't look right. If the guest programs the device to
> reject frames less than 60 bytes and then expects to recieve a
> frame that's less than 60 bytes, that's a guest bug. If QEMU
> itself is generating packets to send and they're short that sounds
> like a bug elsewhere in QEMU.
>
> But I think the actual problem here is much simpler:
> the datasheet says
> # RSF: Receive short frame mode. When set, enables the reception of
> # frames shorter than 64 bytes. [...]
> #    0 Ethernet frames less than 64B in length are silently dropped
> #    1 Frames less than 64B are accepted upon a DA match
> (https://www.nxp.com/docs/en/reference-manual/MPC8548ERM.pdf chapter 14)
>
> whereas the QEMU code is doing the reverse: dropping short
> packets if the bit is 1.

Yes, that's correct. I will revise my commit message in v2.

>
> If you fix this bug by reversing the sense of the test on the
> RSF bit, does it make your guest happier ?

Yes.

Regards,
Bin


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AC1314C42
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 10:57:10 +0100 (CET)
Received: from localhost ([::1]:59896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Pld-0004Ri-Vd
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 04:57:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9PjT-0003Xh-4g; Tue, 09 Feb 2021 04:54:55 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:37056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9PjQ-0005iy-A2; Tue, 09 Feb 2021 04:54:54 -0500
Received: by mail-yb1-xb30.google.com with SMTP id p193so3830835yba.4;
 Tue, 09 Feb 2021 01:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sm85ySazIqaPPUGm0MhzG/pZ8mJYgfdgqzv66CIGFKU=;
 b=Ru/34dcu4aHhJ8OxvPQordTtGFUrQn9l9cSs+hvcgv12MQUNo6plV+LicUzLV43DNj
 OXeV4KV+fNclX4BlefVXzgrWQqUreJD5+5hymDXaTkCqHQgP2zJ6Q+9bWKcWgLb3gNaO
 hqMuZMcHnNswbq88qJ/WoQhkcIFtrYpf73otKZi8HWboeSE6wbeJc1bHd92m4aCugpJf
 Cd6ku+YWfIAStxWm8Hk7HlfEY0vBiMvpppAiv+QI/qQ09twvyNiTZVHC8yZdaLNvryYi
 0xB2JSUjc3MwqzeOAdMIIj8TLtgRocEsKKB0M0JDT1oAcMJqWqenFuF7P4sMesRWQuYF
 ImIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sm85ySazIqaPPUGm0MhzG/pZ8mJYgfdgqzv66CIGFKU=;
 b=Kw5iDi8wkxoU9Y5GOeT79/+Qu7W8BuzZSnVG+HIQFky9Njq5gR7xfrbDzLRuGGl2Uv
 QY8S+EKw7fXmwnwRGay7x+3u8EIwAmPPjUjS2AEYYg5gWr+dXOaLGJuzhM6CskdAYmOg
 3tBry7//x7E9/UhqHGCbHUy85TnBF5dqBCiyHlTc9kj+LUgWhjWhgl986vekzCvVlNVu
 Tn6lZqs6FVbjvSisoUaPvi0EgPyC8RKSFl0nWj6YTYw6Eyqn8RRpsrXB06F/6+vGcXjl
 mpCfwnCT05zZVfAuQYsihwS84OA5ghn/KRQ0rXmSX59s0WkVFHfVugzLHHjU+8gjaTqJ
 0lYA==
X-Gm-Message-State: AOAM531E1Md4n+FnvoIVrDlAZRirjzrkidHO9IQkV2fx4yqS7UbEy6S7
 vReEVW2L7zkAkzPGKALAVTvIE31kWOBau2kmsPU=
X-Google-Smtp-Source: ABdhPJysyfsE6EhdOdpT9tFZVr80PZNM2smBwi+wy1RE7iwG973Q1K7EW/L725FH7MkjdwyqboT2Q7W/DpsZsvI8e5Q=
X-Received: by 2002:a25:3bc5:: with SMTP id
 i188mr31371496yba.332.1612864491145; 
 Tue, 09 Feb 2021 01:54:51 -0800 (PST)
MIME-Version: 1.0
References: <1612833761-43234-1-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA-yPsHpq+q7osCKTGGJ7LiHdMWFxuxJN9Gyey5dJvjWcw@mail.gmail.com>
In-Reply-To: <CAFEAcA-yPsHpq+q7osCKTGGJ7LiHdMWFxuxJN9Gyey5dJvjWcw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 9 Feb 2021 17:54:38 +0800
Message-ID: <CAEUhbmWEyZQY4B-hOjpF_zV8nc700eY_TzEhw3LU3cBh02p8_Q@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net: fsl_etsec: Reverse the RCTRL.RSF logic
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
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

Hi Peter,

On Tue, Feb 9, 2021 at 5:48 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 9 Feb 2021 at 01:22, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Per MPC8548ERM [1] chapter 14.5.3.4.1:
> >
> > When RCTRL.RSF is 1, frames less than 64 bytes are accepted upon
> > a DA match. But currently QEMU does the opposite.
> >
> > When RCTRL.RSF is 0, short frames are silently dropped, however
> > we cannot drop such frames in QEMU as of today, due to both slirp
> > and tap networking do not pad short frames (e.g.: an ARP packet)
> > to the minimum frame size of 60 bytes.
> >
> > If eTSEC is programmed to reject short frames, ARP requests will be
> > dropped, preventing the guest from becoming visible on the network.
> >
> > The same issue was reported on e1000 and vmxenet3 before, see:
> >
> > commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
> > commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")
> >
> > Ideally this should be fixed on the slirp/tap networking side to
> > pad short frames to the minimum frame length, but I am not sure
> > whether that's doable.
> >
> > This commit reverses the RCTRL.RSF testing logic to match the spec.
> > The log message is updated to mention the reject short frames
> > functionality is unimplemented.
> >
> > [1] https://www.nxp.com/docs/en/reference-manual/MPC8548ERM.pdf
> >
> > Fixes: eb1e7c3e5146 ("Add Enhanced Three-Speed Ethernet Controller (eTSEC)")
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
>
> > -    if ((etsec->regs[RCTRL].value & RCTRL_RSF) && (size < 60)) {
> > +    /*
> > +     * Both slirp and tap networking do not pad short frames
> > +     * (e.g.: an ARP packet) to the minimum frame size of 60 bytes.
> > +     *
> > +     * If eTSEC is programmed to reject short frames, ARP requests
> > +     * will be dropped, preventing the guest from becoming visible
> > +     * on the network.
> > +     */
> > +    if (!(etsec->regs[RCTRL].value & RCTRL_RSF) && (size < 60)) {
> >          /* CRC is not in the packet yet, so short frame is below 60 bytes */
> > -        RING_DEBUG("%s: Drop short frame\n", __func__);
> > -        return -1;
> > +        RING_DEBUG("%s: Drop short frame not implemented\n", __func__);
> >      }
>
> This change is doing two things at once.

We may have to do that. If we just reverse the testing logic, I bet
lots of guest software will break because of the reversion. Doing 2
things at one won't breaks such bisectability.

>
> One of them is an entirely uncontroversial bug fix: we
> got the sense of the RCTRL_RSF test the wrong way round.
>
> The other is different: it is working around a bug elsewhere in QEMU.
>
> If there's a problem with packets that should not be short
> frames being presented to ethernet devices as short frames,
> please fix that bug at the source. I don't think we should
> take any more device-model workarounds for it.

See above, if only fixing the testing logic, the fix may immediately
break guest software.

Or someone could fix the slirp or tap networking ASAP?

> We have lots
> and lots of ethernet device models: it will be much more
> effort to try to fix them all one by one as people encounter
> this bug than it would be to just fix the code that's creating
> bogus short frames.
>
> David, could you drop this from your queue, please ?

Regards,
Bin


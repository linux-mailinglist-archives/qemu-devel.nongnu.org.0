Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907716A07B6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 12:52:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVA89-0003wv-I7; Thu, 23 Feb 2023 06:51:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVA88-0003wd-2n
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 06:51:20 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVA86-0002KI-7i
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 06:51:19 -0500
Received: by mail-pg1-x534.google.com with SMTP id d6so2299474pgu.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 03:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LvUUTSF5sJs4oiIpimDYPEXNLD30booVu0SkpuReh7g=;
 b=DZb8G6ZzoiqwfxoAtdC4QpCbb2mc4c+H8Ds7Oh2g+06rlSNFd8Ek0C6HOsWmuWB9H1
 5mQCRDL2Xt/VxvzPOblHzx9ZPXnwbAtbtO8/8CxWWRPj6OuoZ8YdfZs8XXxcdChq7qJS
 h0PHrQGcpZtbhjamIc5OFyjGKA5Arw0Ra+vfjsD7nHhUUondPUZz0T8XyjJ7kBjcdvJN
 DVyIcw4VKKtlhEhQLDyUm4Ec89isRXyzQe1t2VPOFHr0/+EOr/byRZeQw02lP41txofo
 Bb5J/tO4LWeLHdm+zsd0F6HtjYJXKX3Hnhj4MuKV/mpttG56bJQWTSNELsW9KbGKWdDb
 vJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LvUUTSF5sJs4oiIpimDYPEXNLD30booVu0SkpuReh7g=;
 b=fBvnZf2pS5yIa9Y55LL7xlsd+dXftFP+DDVRfixQ0KrDjG+Z88YhFF9ck0qGNJ89K8
 pvrEs9QY5n91g3/C4/UJEwyg1mbjhkv2NQg+Er/TPrWMSqJZOH2+66s9ZzHWucSBoLRN
 ekJSy11rNaBWjMb8CIiZgnxmbLuusnwqoeGHEa0Vx2xIoAKjyIjJUFRC8h9CX42Fm4+a
 iO82eMSxriEOokTD36zzwd3GKepHhNV1gxYVbmpjv9mf8akkYOBnb0dsdOrg9FQym1TO
 157Mia7p3cVEE0TudNiVN6aE6VMsPaRt0z9ttYOEhvtWHDeR5uU4ZLWOpySdSlrt9hH9
 Lm7A==
X-Gm-Message-State: AO0yUKXoe8NJNPXi5Tw96ORmUIMcWJ4xJvXG7sFA+u28pghm5tRZdB7S
 xMgWHuLPU4YpshV8H43qGtDKY1s5k8p9sD+fEVSA5g==
X-Google-Smtp-Source: AK7set/sIYWUiFrRPPuGN/VM3CaSHluqEBVOc0wdMC5hMI6RAKLsUbEJ9Cxspro3oClEWYIsS0mXSZ4x5BgzybDH+n0=
X-Received: by 2002:a63:7985:0:b0:502:f5c8:f5c8 with SMTP id
 u127-20020a637985000000b00502f5c8f5c8mr294618pgc.9.1677153076322; Thu, 23 Feb
 2023 03:51:16 -0800 (PST)
MIME-Version: 1.0
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-6-gshan@redhat.com>
 <CAFEAcA_6pYvot1AGKfOQA89M9tdH-e6+9jkd3RtXJkGhSLdihA@mail.gmail.com>
 <0db2764b-7d27-ee6a-c7e4-7d7821986c16@redhat.com>
 <CAFEAcA_WjugivvOWxH-bVSNakPWyhX=j5pWydQQpweDVDYd2jw@mail.gmail.com>
 <e0044c64-02f2-32d2-b096-50f9c1f1fe19@redhat.com>
In-Reply-To: <e0044c64-02f2-32d2-b096-50f9c1f1fe19@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 11:51:05 +0000
Message-ID: <CAFEAcA9P0MiuRtTDTVCx_1cPxv4yNH=pJSPqO_n=OzDWjx_gOw@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] hw/arm/virt: Enable backup bitmap for dirty ring
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com, 
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com, maz@kernel.org, 
 zhenyzha@redhat.com, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 23 Feb 2023 at 00:52, Gavin Shan <gshan@redhat.com> wrote:
>
> On 2/23/23 2:54 AM, Peter Maydell wrote:
> > But we might have to for other boards we add later. We shouldn't
> > put code in per-board if it's not really board specific.
> >
> > Moreover, I think "we need the backup bitmap if the kernel is
> > using its GICv3 or ITS implementation" is a kernel implementation
> > detail. It seems to me that it would be cleaner if QEMU didn't
> > have to hardcode "we happen to know that these are the situations
> > when we need to do that". A better API would be "ask the kernel
> > 'do we need this?' and enable it if it says 'yes'". The kernel
> > knows what its implementations of ITS and GICv3 (and perhaps
> > future in-kernel memory-using devices) require, after all.
> >
>
> Well, As we know so far, the backup bitmap extension is only required by 'kvm-arm-gicv3'
> and 'arm-its-kvm' device. Those two devices are only used by virt machine at present.
> So it's a board specific requirement. I'm not sure about the future. We may need to
> enable the extension for other devices and other boards. That time, the requirement
> isn't board specific any more. However, we're uncertain for the future.

Most boards using KVM are likely to want a GICv3, and
probably an ITS too. A board with no interrupt controller
is useless, and the GICv2 is obsolete.

> In order to cover the future requirement, the extension is needed by other boards,
> the best way I can figure out is to enable the extension in generic path in kvm_init()
> if the extension is supported by the host kernel. In this way, the unnecessary overhead
> is introduced for those boards where 'kvm-arm-vgic3' and 'arm-its-kvm' aren't used.
> The overhead should be very small and acceptable. Note that the host kernel don't know
> if 'kvm-arm-vgic3' or 'arm-its-kvm' device is needed by the board in kvm_init(), which
> is the generic path.

We can have a generic hook that happens after board init is
done, if we want to do non-board-specific stuff that happens
later. However I suspect that anybody who cares about migration
performance is likely using a GICv3 at least anyway,
so "enable always" should be fine.

thanks
-- PMM


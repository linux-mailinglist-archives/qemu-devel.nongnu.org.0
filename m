Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B95336EFB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:35:22 +0100 (CET)
Received: from localhost ([::1]:57528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHiz-0001I7-Tl
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:35:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKHhm-0000ZU-GD
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:34:07 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:42446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKHhi-0000oe-8v
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:34:05 -0500
Received: by mail-ej1-x632.google.com with SMTP id c10so44722719ejx.9
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 01:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gpkKcEL6QU//nDf+DkMjbxW3YC+ML6qABfqHRR5EyQg=;
 b=zNV9ZhzLPE7Ve2e6hgag+XxHxLLRmR6w9oRP0+Fz2RIDkMhOr2cQLXeU2Rb8AFSBXi
 9TEhLznblQbjFdhrXhTABQ1wKDVoCqPrfoY0b6XblwKI1K71TVP5l3lLWPY1Di0ahOJ3
 yHMTWB1ZDy9du8yjO2DvFO4WIFiavmaLxAM8joXlDl3V8kne87fyok7LFs4atVi6SNCQ
 WnkJbnWaVOhC3mdA4alpc0ylCd6Us9NLajviH59Ctq6dRF9ZTrHObJ3FB0XHu/IQaGN/
 ON+VrUMNXqmDzki8pezItCdzntNu7pKISe2mK0TXir9HMqroJ9uw9ScjqW2lGNwUpnMM
 GxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gpkKcEL6QU//nDf+DkMjbxW3YC+ML6qABfqHRR5EyQg=;
 b=fuIU9C9Zzy+3BVUyWApPk3wJChyeuvAQH7kQw0sTpJS+Vo8zuXHx0blq3NFiRT8v+E
 hj0HFTYjZCBV2bVU2tq7KVxB30IYp8ps9rMFklbd8jBbsCWl+0WLIPWT+Mj4LuTXFGw5
 /8Bx3HKhY8v+t0ImYEOihyeqgDUTpHpX+nEk379B8SezjkKkx510BZ4pz0oS2wFessR7
 76JuCcuWOn7jU68eDW2hjKmN381vI/lK937Q/246e7DNextGw+72k4EVc482/IHIfyZ8
 8ecfJMGu4Sy2wK0Z2/JZH2awmDnRIaEHBq2yEqulngG5FHinxaaDsmqgAvAS8O5wXipb
 nmNQ==
X-Gm-Message-State: AOAM533N7td95dPdk3C7BF03u4EGx1BFMWXpn0l8zOgGCrxPlVIHQUJU
 nG7T+/XgSYNOitkllmdDpEszP+Smr/9FpMvT4W2pXqWcZas=
X-Google-Smtp-Source: ABdhPJxjapTXPzdZLbs/23LBbG+jdAL2Ua7EmbTUwcI0Px6qMEq9lyv9mzYC5HT9aIhMxB2Zaa/oZJAUnsRAN7Kkrpc=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr2202428ejg.482.1615455240146; 
 Thu, 11 Mar 2021 01:34:00 -0800 (PST)
MIME-Version: 1.0
References: <b9b0e381-c045-bab1-eea7-b8112526e5e8@c-sky.com>
In-Reply-To: <b9b0e381-c045-bab1-eea7-b8112526e5e8@c-sky.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 09:33:41 +0000
Message-ID: <CAFEAcA_jnLzZN-nA+Cf_HwGjxvOaxUzZ44LYxqpcmw=3eAU6qg@mail.gmail.com>
Subject: Re: Question about edge-triggered interrupt
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Mar 2021 at 02:59, LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
> Currently, I am writing an interrupt controller (CLIC) for RISC-V.  I can't find a good way to process edge-triggered interrupt.
>
> According to edge-triggered definition, if I select an edge-triggered  interrupt to serve , it will clean its pending status. However after serving the interrupt,  there is no chance to select other pending interrupts.
>
> I have two methods.
>
> One is to add a timer for interrupt controller, so that every pending interrupt can be served at some point.
> The other is that  always pull a pending interrupt to serve at the interrupt return instruction.

You should do what the hardware you're modelling does. I'm
pretty sure it won't be using a timer, at any rate. Whether
it does something on interrupt-return insns will depend on
the architecture and how tightly the interrupt controller
is integrated with the CPU.

In general edge-triggered interrupts for an interrupt
controller just mean "when it sees a 0->1 transition
on its input line it does something, eg mark the interrupt
pending", and also usually "when the guest OS acknowledges
the interrupt (eg via a register write to the interrupt
controller), mark the interrupt as no longer pending", and
a "keep telling the OS that there is an available interrupt
of some kind until all the interrupts are no longer pending".

The details of how this works depend entirely on the
interrupt controller -- hopefully it has a specification
document which will tell you the actual behaviour.

thanks
-- PMM


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF3C565960
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:08:02 +0200 (CEST)
Received: from localhost ([::1]:41886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Ng9-0005w8-4L
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8NSw-0006is-C5
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 10:54:22 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:36857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8NSt-0003Mk-SZ
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 10:54:22 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-31caffa4a45so12847817b3.3
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 07:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5v5L/YeDwfdpkj4LzyQbq+hQlaBO9PJsx7CUU6kb8OI=;
 b=cbRG08eR2ZdN/ykgSKFYRMsSInRhLElcnSikzl3CWLAQfsDWRyWs6p/s7yZ4Xbyz5E
 hKRLOBKIm3MTeqa1a7TOhmEwFf7YdFW1QPCUfDGhIOyoQq7s3H3UdtE4P9iZHD8RiWrV
 1pzAusjtgnahskycc1aviLhjb1i/so88wqCTR/+xyCocEcS7aKvFPN/XDUhRhxXb4Tdg
 1IQw2OcYLgQ5GWvBaG699oqnl6dtvPwlLI8I1R1TxMMZJ1D4S6Eu5t6TV9+49HoYTHv0
 19AIkdKAKN0N4Fsqk5s8JZ1hVUQ1k/GetmQ6di9WucSHx8Xpdo6tp9nQO9+g8brpPonK
 NRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5v5L/YeDwfdpkj4LzyQbq+hQlaBO9PJsx7CUU6kb8OI=;
 b=WFgsA1Xk2GKRg+x2WgazGT8yJU3EEjx4m0504vIGmWsH+4acDG7S7O2pBXYMuU49ez
 5uK9kcGcrY7pZmE1bW+EE9G+h9EAB6f9V9WP25C6X3qZtzh3+ndTyGJWPTb0M4mNXoMN
 TERiueu8Ta8yfbW9zYNet3wFEHIDiVRF0UmXkTRzwc9RNUCEv0S17CzvZ7zL/pj+gTrz
 MgRBmwU5HfAINVmw6P6hYikPlC5+sq1LJu3wvVrovbehZrBlDRzUsm5OU/B/HaKDyxeA
 mEdhoegQLtA6wJBVYQTYCI6lIuUNDLVb5+HhHkUHNVD/2cwbAW3Hl+L7xPnLHnD5i6xR
 sUaA==
X-Gm-Message-State: AJIora94rdJFyzDKOEPv4WmzyrZ5BYVyd5DkZC97gs72IJed0KuR0uYi
 d5ate/bP8WvWqiCADP83cFUcwCUQ7ZtNBpQunLKVFA==
X-Google-Smtp-Source: AGRyM1vb/sMnvSgqE3UwrdElnfBn26gLXqlo5x+blUbBHs3fSWkXhJd7q3a9+1/3ausBAMaz0oYZTvNZ6gcj3bMyNI0=
X-Received: by 2002:a81:6a85:0:b0:31c:8624:b065 with SMTP id
 f127-20020a816a85000000b0031c8624b065mr11775538ywc.64.1656946457685; Mon, 04
 Jul 2022 07:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220703082419.770989-1-richard.henderson@linaro.org>
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 15:54:06 +0100
Message-ID: <CAFEAcA_5s3avpeHNO5cC0HS5Unq9QsCp9mTof4uqLJwE13h+pA@mail.gmail.com>
Subject: Re: [PATCH 00/62] target/arm: Implement FEAT_HAFDBS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Sun, 3 Jul 2022 at 09:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is a major reorg to arm page table walking.  While the result
> here is "merely" Hardware-assited Access Flag and Dirty Bit Setting
> (HAFDBS), the ultimate goal is the Realm Management Extension (RME).
> RME "recommends" that HAFDBS be implemented (I_CSLWZ).
>
> For HAFDBS, being able to find a host pointer for the ram that
> backs a given page table entry is required in order to perform the
> atomic update to that PTE.  The easiest way to find a host pointer
> is to use the existing softtlb mechanism.  Thus all of the page
> table walkers have been adjusted to take an mmu_idx that corresponds
> to the regime in which the page table is stored.  In some cases,
> this is a new "physical" mmu_idx that has a permanent 1-1 mapping.
>
> For RME, "physical" addresses also have page permissions, coming
> from the Root realm Granule Protection Table, which can be thought
> of as a third stage page table lookup.  So eventually the new
> Secure and Nonsecure physical mmu indexes will joined by
> Realm and Root physical mmu indexes, and all of them will take
> the new Granule Page Table into account.
>
> Previously, we had A-profile allocate separate mmu_idx for secure
> vs non-secure.  I've done away with that.  Now, I flush all mmu_idx
> when SCR_EL3.NS is changed.  I did not see how we could reasonably
> add 8 more mmu_idx for Realm.  Moreover, I had a look through ARM
> Trusted Firmware, at the code paths used to change between Secure
> and Nonsecure.  We wind up flushing all of these mmu_idx anyway while
> swapping the EL1+EL2 cpregs, so there is no gain at all in attempting
> to keep them live at the same time within qemu.

Is there no SMC/interrupt/etc at all which is handled as a "just do the
thing at EL3" without dropping down to secure EL2/EL1 ?

thanks
-- PMM


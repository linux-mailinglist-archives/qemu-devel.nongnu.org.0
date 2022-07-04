Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875F8565A87
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 18:00:00 +0200 (CEST)
Received: from localhost ([::1]:39500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8OUR-0007yj-DV
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8OS9-0006Iv-10
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:57:37 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:37811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8OS7-00081b-GD
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:57:36 -0400
Received: by mail-yb1-xb36.google.com with SMTP id e80so10336084ybb.4
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 08:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+6F4PCKhzFBdFwQmc+mBMmF3yxissWDsbGajyOXABQU=;
 b=q+V/DniweCYk/EcytaFlNsbLhTRMPKliBSe98IOZ9eI0hd1tQcdIeLUBZHwLa7M29y
 pyoKdjpx1YbpTFYqmP/qoDRkote45SUPxEUJfAtNNMn6b8a/Hbp+6lJNT19u1zY0G3Er
 UnDjSTU8YiqsWF9mCffjjzHWkKmmgwKhUrUbISWBGI6lk5BaW38bxEr77k1S/mdQy5N/
 C3rF32CdvLeKpjSGFY+kAzX02t/LleaaxgrwGS9/llUy3uISY4dO9HpxtU1DzN3YlzDy
 SYsnVXKl4B+nnvzCJIRFbENexpN0PaBEAVuTq+VSVUWqq6g2lFtnU7mb4qdqGedndoxW
 u8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+6F4PCKhzFBdFwQmc+mBMmF3yxissWDsbGajyOXABQU=;
 b=m2uLLvK1dNbbtP+Ntpmdf19oJBwI7aiDRJ8JGPPRDpnAx6Z/tFrQ9R9boQSd2dn/gR
 Z1yyHBw/1U2ENf3lpM90RDaLjuHeaVybIZP5OKNUqfJa4KXdc4kwpLPMUZ58Eqs4izVW
 h163YGqtkAynC+kzdib4l0wT5pda5Tlyn6vVp9cXl+pn4SQYL3GpP5dZB/DMq+cr3cdc
 X0efh1y06JF5GB+utb2lj5WU5dCiEZn6KAEtDhFxpb1BypNQy/f6TwxiltrcBzOVInxA
 mMkTb1VZfJuTY9O+a9VTJXQSbSp/NsTQ8un1tSqhbCpLGuUMHT7mE7uB/e3elcs1oS2C
 RdgA==
X-Gm-Message-State: AJIora+GeEGBLhH/zn3wTioJywD9vh4Oc2QCadFXvJQaJwTVva5va8Jk
 IgucVWQPSfXjW473MhvJwJIjBs+G1bJe8wHsmbejCQ==
X-Google-Smtp-Source: AGRyM1twCWj9tWPMTARHdQAwNIEAmHOAVkv0TByCSqDgqANrHDI8142a4yVbrfmLnofFVKqlKAk72/9Pu5MmjrURlhk=
X-Received: by 2002:a25:d381:0:b0:66e:2943:1c9d with SMTP id
 e123-20020a25d381000000b0066e29431c9dmr13005742ybf.67.1656950254482; Mon, 04
 Jul 2022 08:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <CAFEAcA_5s3avpeHNO5cC0HS5Unq9QsCp9mTof4uqLJwE13h+pA@mail.gmail.com>
 <6bad14a8-a6dd-4bbe-7808-d51e6c3f777b@linaro.org>
In-Reply-To: <6bad14a8-a6dd-4bbe-7808-d51e6c3f777b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 16:57:23 +0100
Message-ID: <CAFEAcA-aLdqTaGKfF-b9zmjUwdrmHwc2hHwam-oLe9ruHBbApw@mail.gmail.com>
Subject: Re: [PATCH 00/62] target/arm: Implement FEAT_HAFDBS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 4 Jul 2022 at 15:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/4/22 20:24, Peter Maydell wrote:
> >> Previously, we had A-profile allocate separate mmu_idx for secure
> >> vs non-secure.  I've done away with that.  Now, I flush all mmu_idx
> >> when SCR_EL3.NS is changed.  I did not see how we could reasonably
> >> add 8 more mmu_idx for Realm.  Moreover, I had a look through ARM
> >> Trusted Firmware, at the code paths used to change between Secure
> >> and Nonsecure.  We wind up flushing all of these mmu_idx anyway while
> >> swapping the EL1+EL2 cpregs, so there is no gain at all in attempting
> >> to keep them live at the same time within qemu.
> >
> > Is there no SMC/interrupt/etc at all which is handled as a "just do the
> > thing at EL3" without dropping down to secure EL2/EL1 ?
>
> I'm sure there is, but it's only swapping between S EL[012] and NS EL[012] that concerned
> me.  Is there something that I'm missing?

Oh, right, EL3 remains its own mmu_idx, of course. (And I guess
also Monitor mode for AArch32 EL3, though the degree to which we
care about performance of emulation there is decreasing I suspect.)

thanks
-- PMM


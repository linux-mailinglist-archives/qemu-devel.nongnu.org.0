Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429EA3F208E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 21:25:56 +0200 (CEST)
Received: from localhost ([::1]:38792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGnfn-0004Ht-BG
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 15:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGner-0003Uk-Oe
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:24:57 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGnen-0007Xc-Ni
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:24:57 -0400
Received: by mail-ej1-x62c.google.com with SMTP id lo4so15011056ejb.7
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 12:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1S5rlGQJOxW6i/Vbiv/03PIWeJgR2rqloSYKR9ehRAI=;
 b=OaSGn28otDNUeIrTkqb1t++fsibOp06830IQfZ6HLdRnd60B4du444HlXmChx6j0PI
 NzpU0bfQJcSBslz2Eg2UR+5/6xLWUBUdTFbBvWBqwNGwrzwjkyjKpnqsiBPwrjtg7qUC
 php8OkiKXID4e4NfAgc7afhwOtCtZoQ6He+sOmp+kv4eETRWvzuuGXzeee11d2Q6wJbl
 aVaq0yVvjyWL4m4Twvug1x/c2Lt/RwQQFU0LzBKhK5ErKHwNkcMMy6oeFpDgPFXDniU1
 MOmjPTaQyndoaZzK00Mg/+XvCA5zJgBnGZpt8FCWqWPz7bKQemjoxNfbr7fz/e5aew4R
 NEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1S5rlGQJOxW6i/Vbiv/03PIWeJgR2rqloSYKR9ehRAI=;
 b=Wf4cODQwdsAZDBcsbww/S2xKn5BrPLZLZoJOKytco630049OEXds/t1B3bucd3088D
 jxob4316dRC+/bm9ZPBqTYEP4YFCCnSf5qtZIfUrAZ4mNq9zlcJiTIYar70RvLOEdGFf
 5vO3h83rXuV//F61Mi60xBQ8WS6n4bL7zgroMN0kI6i4WsmGKdO2OKl6UCmtninx0+5i
 XGi2dNJSkTBqF3Lr8QNVuWIc0oVeXOQsJC7Sv5OfvTsNUPX1grHqnqOiuHLRY1hX+FlV
 tfTUKEy2eGU9OhffWje8dAZQB3EmUaN+68f1wTkKg9YI8vrMevn0xiGzCZ/KTBjrl4ZR
 k+4g==
X-Gm-Message-State: AOAM530e5lpY7EMj8gGC6QhUlahMcOgbdXpGe9iJT4ZZjC3lTegVo2b/
 bBW9jHbAwmRSGJCy3kQCRKDwpG4DAbjtKks9bDKF1g==
X-Google-Smtp-Source: ABdhPJyZvE9XL+8yzhFhf2VJ5VZR9d3PJdopOJhjfb5/8+fGrovd/dDVwjht5IIosen+i4tOOmsKgbEk800JuRLVMHI=
X-Received: by 2002:a17:906:3bc3:: with SMTP id
 v3mr17289627ejf.482.1629401092304; 
 Thu, 19 Aug 2021 12:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210818010041.337010-1-richard.henderson@linaro.org>
 <20210818010041.337010-4-richard.henderson@linaro.org>
 <CAFEAcA-v6z9UTbmdHqMugbtqv1n92SJ7EFGM8Gnk+_90FMyoBg@mail.gmail.com>
 <bb739396-f8d1-a5a8-ab1a-61892d9c84e6@linaro.org>
 <b6754a17-7b6a-201d-6c33-7759ea8ea270@linaro.org>
In-Reply-To: <b6754a17-7b6a-201d-6c33-7759ea8ea270@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 20:24:06 +0100
Message-ID: <CAFEAcA_p_sUJF2PFkmxS7LcB0ed_BtRC_VbF2WDP-eAPsZukNQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/arm: Take an exception if PC is misaligned
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Aug 2021 at 17:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/19/21 6:50 AM, Richard Henderson wrote:
> > On 8/19/21 3:40 AM, Peter Maydell wrote:
> >>>       uint32_t insn;
> >>>       bool is_16bit;
> >>>
> >>> -    if (arm_pre_translate_insn(dc)) {
> >>> +    if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {
> >>
> >>
> >> Is it not possible to get a misaligned PC in the Thumb case ?
> >
> > No.  The thumb bit is always removed, leaving all pc aligned mod 2.
> > Both BXWritePC and BranchWritePC do this, as do we in gen_bx and store_reg.
>
> Do you think it's worth an assert here to make sure we never miss a case?  I did an audit
> of the exception code and it looks like we mask everything correctly there, but...

(Did you check the M-profile code too? That also architecturally I think
should never let PC have the low bit set; hopefully the code I wrote
actually ensures that...)

I guess an assert() is more helpful than ploughing ahead with
a misaligned PC value. If we don't assert we should at least have
a comment saying misaligned Thumb PCs are architecturally impossible.

If we do go for the assert, then the comment in arm_cpu_gdb_write_register()
about why we don't let GDB set bit 0 in the PC would need updating (there
would now be two reasons). We should probably also fail the migration if
we get an unaligned Thumb PC in the inbound data.

-- PMM


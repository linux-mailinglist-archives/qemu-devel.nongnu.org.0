Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AA31FF90B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 18:18:14 +0200 (CEST)
Received: from localhost ([::1]:40674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlxEz-0004D1-SX
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 12:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxDa-0002vC-38
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 12:16:46 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxDX-00082D-7A
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 12:16:45 -0400
Received: by mail-ot1-x343.google.com with SMTP id t6so4953546otk.9
 for <qemu-devel@nongnu.org>; Thu, 18 Jun 2020 09:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y7u5drJT0mavJGQbNOJVAerHycRJJAKN9jThBgI5L4Y=;
 b=SS+UD4V0AucHg1TPPK829NYQF6kZmIG3TGIm3UIjuozdJL3Tc3T1IcUHn1sOiy6f6g
 lzZQbYh3fKiCbNCDQRa22+n01eQPcJ6BH92UybrJFZGdg2Fg0QQuu0pastubdXsRUEBf
 VPMLYx2A3R+piYqtSxk03yywPShm7fgsMfbeCGvmkQG/Ycy/CJz2R2IBc9LN9wVwpBJs
 ThC6v/y3LpZoiLeknWhVDCLPRN87LMtVVzdGuZbzoGscWAWqhizemSl/wZUhXQFyWzDV
 2y9YEPZBx88JGEmr3nSaMtCNVnJoFsUDixGrRa1QfwWbWLDtTML113WTLzzu4u9HXwxT
 kGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y7u5drJT0mavJGQbNOJVAerHycRJJAKN9jThBgI5L4Y=;
 b=rIi2fcKI2YUALZVa1ejC+6H4Ac9QpcgVH1NWl30JxOETzHvgBCkgIVKSTEoON7XYZj
 egehiVswghNwRqGgvOOB7GNHiFCcGCo4StrciUo9Pz15j8PjbIpUUkO8R8VCeeBbCDED
 3OjCtsueoHKxfntN+3xgES+KLlSFQrp9JBSrCq5LLbQjfggW6LCKleC5eC547MBSFM6t
 3JYvKnQz8FWYGYMapWkWhzXjvWnG/tRCMyvstsHtyGuKqnfX5uxNM0a16phAzIEYrYRs
 QQzn7+JkBfWWtn1gpjf0vjOnRSU4K7n8LgGemKXU469xgkIgy7nc7X9TRVAhE1ynJwzd
 UXcA==
X-Gm-Message-State: AOAM531x4752zc2/Rd2lvqk0QEDsb+E+N9Wu49XDKMNdyD9EwggfO6hS
 ilXBKWBBK+9yYI8ygtkGPmcBV0hAvwKXrwhhN33Zxg==
X-Google-Smtp-Source: ABdhPJwqaXIiNMN6/ixavJRAAMknBlsow4Z+IgLbAVJdS7kRxCkltAIYzguYjXz/yR/l2SavLDxOrAh12o/6cwq5H3s=
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr4288713ote.135.1592497002126; 
 Thu, 18 Jun 2020 09:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-11-richard.henderson@linaro.org>
 <CAFEAcA-QZ_D1tQMv785xsxWwcEKmM76dK4Mvgx=y7eyb_mUqEg@mail.gmail.com>
 <3b1b50b8-061e-8422-2df0-e8df6f856941@linaro.org>
In-Reply-To: <3b1b50b8-061e-8422-2df0-e8df6f856941@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 17:16:31 +0100
Message-ID: <CAFEAcA_LFC8isWLjUZCXOjDnPcfO+-bS1jRJTEwqMP9CwKS-Tw@mail.gmail.com>
Subject: Re: [PATCH v7 10/42] target/arm: Implement the ADDG, SUBG instructions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Jun 2020 at 17:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/18/20 6:17 AM, Peter Maydell wrote:
> >> +        imm = (imm >> 6) << LOG2_TAG_GRANULE;
> ...
> >> +            TCGv_i32 tag_offset = tcg_const_i32(imm & 15);
> ...
> > Given that we don't really share any of the codegen with the
> > existing disas_add_sub_imm() insns, and the insn format isn't
> > the same (uimm6/op3/uimm4 rather than an imm12), I'm tempted
> > to suggest we should structure this the same way the Arm ARM
> > decode tables do, where "Add/subtract (immediate, with tags)"
> > is a separate subtable from "Add/subtract (immediate)": so
> > instead of disas_data_proc_imm() sending both case
> > 0x22 and 0x23 to disas_add_sub_imm(), it would send 0x23
> > to a new disas_add_sub_tag().
>
> I'll do that, because...
>
> > But this patch is functionally correct...
>
> ... I've just noticed that it isn't correct.

Heh. I do think it will look nicer this way round.
Don't forget to tidy up disas_add_sub_imm(): its 'shift'
field will then be 1 bit, not 2.

thanks
-- PMM


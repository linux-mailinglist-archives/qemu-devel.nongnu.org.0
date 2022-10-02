Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA4D5F23B1
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 16:49:18 +0200 (CEST)
Received: from localhost ([::1]:36440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1of0HK-0004Lg-DF
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 10:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1of0E0-0001ph-7n
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 10:45:48 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:37686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1of0Dy-0000PW-9P
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 10:45:47 -0400
Received: by mail-ed1-x52e.google.com with SMTP id a41so11530483edf.4
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 07:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=gGpaR8d9j1nZPkVQKdGE6surX0mzpNbyWEbeIwzJShA=;
 b=gbUQwJagl8pZDyNPICH4v2wWjSQ9KpTb5WLurCF0ctGsFxY30k+LG/pFR8ZOnhRbA8
 l4s98SVy5OXxz3/+3RIa2aFbj5qD7KBjV2stlcMW6klVxCNJDgJxlk0ZXG6SPLqk8ybW
 DuyY7f5HyX2zksJOzPbLc5F3/YFscTEG84qBNLdwtVK4kSqiS5dNS0akxdlwmZGX3izg
 128qylvXi2StuqUVYHobws4J92UgWLEcrZyxvzaQkYu0pr/WPtGstPgS6kH7iF6CAPiK
 fA1auUu6CrgwgrJVtg5Cq4x+WqB+5s54RVQlXFRgJrQ3el/K7e0oKfIOuE0896/1zG8Y
 Gz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=gGpaR8d9j1nZPkVQKdGE6surX0mzpNbyWEbeIwzJShA=;
 b=Ckyx6VoYtVOrCNLHtT99oa5gSWpdGntAfk84eB07g898GomHUgWSeR6EMzUeglVlhd
 XMHMtyG/jhwEcf6D9DjbFta/yHSpaerV0gceolB2otulmqwRDkf4omLrddfZCBg6klrT
 a5wfnW0IrGjXYy1zUGiT3rpsD6sjRJEkRN6wA/yl4eq6Ggc9j7cLD7BVxgNc4aWzjAkq
 HnuH/CMdTXAkmgZZ6dBkXKE/fo2uEQ7lu/iqjKt7ouF+a+AwB/6DuhiwVdhbSgDQnvLV
 yijIA9RfcTsX0LmPf9Sqw4B7mygd7r9veN9ouZAoyvwv917hmHmS37KzftaXsTYYat3b
 QDLQ==
X-Gm-Message-State: ACrzQf29yEhpCylr3aWBNvoM9FtmBE7PcfHUZUbUIcpL9TPFhX/I642y
 ag3x1A3HK/GrpN4LcSSW2vM5sy/LFlGGXrmEYSkRbw==
X-Google-Smtp-Source: AMsMyM7upAbyWcP0TS4TRDvSamioA5SaSTZ99pz536rRu4kZGc8wQQ3njVw3vgv979kjY0Ih2l8xzhpeEU/uAlWDOfI=
X-Received: by 2002:a05:6402:350b:b0:452:2b68:90db with SMTP id
 b11-20020a056402350b00b004522b6890dbmr15481188edd.255.1664721937209; Sun, 02
 Oct 2022 07:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <CABVhSWP7XjNvCXUvawXLcOkP4vXQ8wbMObKbxc+jN6gv0wzawQ@mail.gmail.com>
 <3ca717d7-fbc9-b2f9-71cc-01ef459da257@linaro.org>
 <CABVhSWNkCn-V=ZzUTEi7+hO_a4KJgfpv7N_MW_t+jKRtmTh08A@mail.gmail.com>
In-Reply-To: <CABVhSWNkCn-V=ZzUTEi7+hO_a4KJgfpv7N_MW_t+jKRtmTh08A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 2 Oct 2022 15:45:25 +0100
Message-ID: <CAFEAcA-JztxsEQ-RMAtnkQxVZOFcRXxg-+Csa+uEeQWH73PQzg@mail.gmail.com>
Subject: Re: access guest address from within instruction
To: BitFriends <commandspider12@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 2 Oct 2022 at 10:22, BitFriends <commandspider12@gmail.com> wrote:
> I now came up with this code:
>
> TCGv_i64 res = 0;
> TCGv_i64 addr = (TCGv_i64)(env->regs[R_EDI]);
>
> tcg_gen_qemu_ld_i64(res, addr, 0, MO_LEUQ);
>
> env->regs[R_EAX] = (target_ulong)res;

This is wrong, because you cannot read or write env->regs[] at
translate time. The "translate time" vs "run time" distinction
in a JIT is critical to understand:

 * translate time is when we read guest instructions,
   and output TCG ops. We do this once, the first time
   we encounter a particular piece of guest code. At
   this point you cannot directly access the state of the
   guest CPU. This is because the exact value of EDI
   will be *different* each time the generated code is run.
 * run time is when we are actually emulating the guest
   CPU, by executing the code built from the TCG ops.
   At run time the CPU state is known and can be updated.

You should look at how existing instructions in the x86
translator generate code to read and write registers --
you will see that they use cpu_regs[], which is an array
of TCGv which correspond to the CPU registers (so they can
say "generate code which will read EDI"), and they
never use env->regs[] (which would be "read EDI right now").

More generally, "read guest memory and get the result into
a guest CPU register" is a common thing in existing x86
instructions. So find how we implement one of those
existing insns that's similar to what you want, and see
how that is handled.

(NB: so far you haven't said why your custom instruction
would be any different from a normal load instruction
that x86 already has...)

thanks
-- PMM


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D6D524D8A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 14:52:09 +0200 (CEST)
Received: from localhost ([::1]:44918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np8IZ-0006yD-5o
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 08:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1np8EL-0004ca-Nw
 for qemu-devel@nongnu.org; Thu, 12 May 2022 08:47:45 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:37465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1np8EJ-00082D-VC
 for qemu-devel@nongnu.org; Thu, 12 May 2022 08:47:45 -0400
Received: by mail-pg1-x52a.google.com with SMTP id x8so1074883pgr.4
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 05:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1r2ZFfV9cCwXX7DzuzlgvizjrxkKwyPtNrR4+vG2fsE=;
 b=AGVsrBCr257SyE4/SUpWePJMHurazZN/kwrz/vs5L+z0B9C7eHsf7zgaG4BDWK+A6k
 1XtlKirYrQNi+yMxN7IbK8iUYjs+tUXW+/9uz4fZL7lwkb1CJVUH7qVw28Dtx5LWiCTk
 0mG/7Ln8C6GbmciTG7WvDvTmvCaj23bw2s4MBSwur4WWQ72NZsXUNr2RVkO258f3MKsN
 3GxMNpjMELPiZ0Xo3K3LA7DiVYtRYUUEHKiL/J52x0+Z6hg1wbF8oDicPbfgz8T/cbb9
 TAb3bpsGvgrAH0FSFJHm1ZxedLHAuXMb8LR2LBCIL2nfUG61rZQSrTXSkuBdbyFGLisT
 QHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1r2ZFfV9cCwXX7DzuzlgvizjrxkKwyPtNrR4+vG2fsE=;
 b=FyhR4wD+yQeig79wM66zBTNkYOpcNvowN9XQstRSAsbpbL9SqOF7COG6uW2uxBhqCP
 S8fV/G9DStS2aOhRK7kY/lYKX6P3MPiIuTvm3AB4dyj8R86oOGLA7T0gH7eb9BP1mOX5
 OZdCm3iISgYDCwWXvhstt/P/057lNkVlM8SipRuYhVdqLzWCrIWE7af+VUORtSgT8otu
 xzUE8phut321QjbhxA9Yugnns5nuW0gWqqapoaqs5V7IRuny7n5npzoVc+5FllOm1Xww
 zVhyn5+5uTwvjoO1oO09Mh9Edv/XJ89uiDJGjl/nM8M7wgaxXGM1MNI7l6HLaZGjERGU
 kW7g==
X-Gm-Message-State: AOAM530X563ZyOMaZdkuxfQsPFS3tMX7ekhgTpvvq2nDnaxAIgXFuhCh
 w14OktF/KUR8+Enfur2X4PI=
X-Google-Smtp-Source: ABdhPJwMQrtDe0ZfmYaY4E1xQHmf45bBgtM6ksUUlDfDI32NOqfaVR4GLC2/9z1SgRqABb9N1MCTdA==
X-Received: by 2002:a63:6aca:0:b0:3ab:a56:126a with SMTP id
 f193-20020a636aca000000b003ab0a56126amr24937922pgc.576.1652359662056; 
 Thu, 12 May 2022 05:47:42 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a170902c94700b0015edcdea308sm3996624pla.233.2022.05.12.05.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 05:47:41 -0700 (PDT)
Date: Thu, 12 May 2022 21:47:39 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Development <qemu-devel@nongnu.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] target/openrisc: Do not reset delay slot flag on early
 tb exit
Message-ID: <Yn0B6xk4Olu5uRxY@antec>
References: <20220511120541.2242797-1-shorne@gmail.com>
 <cf7c27e9-3bc9-888e-dbba-25c0bb583e09@linaro.org>
 <YnwuFZsNjQLxOfp0@antec>
 <9c8c68d0-cb7c-4ec5-eac4-fd915934db5e@linaro.org>
 <Ynw6CymBBiqQgElu@antec>
 <9eb36cb4-e727-9c10-df6a-2dfe22943244@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9eb36cb4-e727-9c10-df6a-2dfe22943244@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Wed, May 11, 2022 at 07:11:20PM -0700, Richard Henderson wrote:
> On 5/11/22 15:34, Stafford Horne wrote:
> > In this case I don't see how the tb->flag would be updated, ooh, I guess it
> > would have been set earlier when the TB was generated.  Maybe that is what I am
> > missing.
> 
> Correct, it should be unchanged (and correct) from generation.

OK, its very clear now thanks.

With that said, I am still not convinced we need something like:

--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -37,6 +37,7 @@ static void openrisc_cpu_synchronize_from_tb(CPUState *cs,
     OpenRISCCPU *cpu = OPENRISC_CPU(cs);
 
     cpu->env.pc = tb->pc;
+    cpu->env.dflag = (tb->flags & TB_FLAGS_DFLAG) ? 1 : 0;
 }


I will leave it out for now as I feel comfortable that the env.dflag will be
correct.  But if you think of something let me know.

-Stafford


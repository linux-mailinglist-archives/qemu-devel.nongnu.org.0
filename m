Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CB0524056
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 00:36:20 +0200 (CEST)
Received: from localhost ([::1]:47344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nouwN-0004iK-0q
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 18:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nouv4-0003xs-2i
 for qemu-devel@nongnu.org; Wed, 11 May 2022 18:34:58 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nouv2-0005DU-1E
 for qemu-devel@nongnu.org; Wed, 11 May 2022 18:34:57 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so6167604pjb.3
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 15:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nJ+4ZePH/Z9wHEmnB3gIRQ8OoKLLhC7vkiiupeX/3LE=;
 b=C7ym/GqqzBhd5zSk0LoprVK7rojMuD0sFHE28N7r0vKKHa7n/mygs3uejOZWfu6Gal
 O5pVaFjY9PpqBcFlblCHcMS9hEiKTm7NGgoE8BIeW8OA9IRBEY04iE980NpbErBXxG2Z
 Wgx1qnnindwkp5Z3LqF7HF8p+VX0v5V1O51BHHKtesKbUmVk6kEn6d0X2Uf+FEsHf7ed
 EqU3FuA0Sd2+yliQeNRhSqKuhllzvINcmtqZmLbC8D4vgsy11tq1E1F9+yaoUgPdOm0S
 7Ibgf1uNncT+Q1wSUGhYQj3VWyjDGTSyGITL8fZsOmTG9odNW+DBIvkj/n6nUUs0l8oj
 /0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nJ+4ZePH/Z9wHEmnB3gIRQ8OoKLLhC7vkiiupeX/3LE=;
 b=GIwoBU/JTQYRo+AEWZG+PYHshhE9lwjt2ygqDGxbdu0WgS9sF5OmmXeu1tAtJCJ899
 jpqTjF74CUZOd0A6gfhNbLWfb8J2A+ASte8zX4/mLzMZxGlhgfrXX9LLKyv1qzuvhdQC
 ntIXq2+5qCESGua6UkupMrMPWnzYoVX6zaQrXX9L6Fr3WSL1/JeQ0OjcniUD5pwdE4Du
 7rVeTMjVQrpdknLAPJlV+cl+71H7lxWRtgie0FqN/lnHwmzDmOjEKW5ARPwkjlqlrPqX
 YFSjQyCStF222qboYq7d9VfCS9DJoX7BxViWFbNlX+Cw3QbJ/xeSB58jTB+gGQOg1CKQ
 L08A==
X-Gm-Message-State: AOAM532K+u99Q7Dwv5jSLFnzZp+wXRLtDgTn4VgbkTDM5EqtCkG76v/+
 LwXaMTzd/6/UlZ01uiJf89o=
X-Google-Smtp-Source: ABdhPJzFWMoSL6/6ZF15n56YJLkovMP/eveRXt3JvZZDf2z2D5asVPqMDzG+EJNnRvdcXQJ67UNtfQ==
X-Received: by 2002:a17:903:40cf:b0:15e:9bd0:2cab with SMTP id
 t15-20020a17090340cf00b0015e9bd02cabmr26806717pld.170.1652308494024; 
 Wed, 11 May 2022 15:34:54 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a1709027b8400b0015e8d4eb2c0sm2411897pll.266.2022.05.11.15.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 15:34:53 -0700 (PDT)
Date: Thu, 12 May 2022 07:34:51 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Development <qemu-devel@nongnu.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] target/openrisc: Do not reset delay slot flag on early
 tb exit
Message-ID: <Ynw6CymBBiqQgElu@antec>
References: <20220511120541.2242797-1-shorne@gmail.com>
 <cf7c27e9-3bc9-888e-dbba-25c0bb583e09@linaro.org>
 <YnwuFZsNjQLxOfp0@antec>
 <9c8c68d0-cb7c-4ec5-eac4-fd915934db5e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c8c68d0-cb7c-4ec5-eac4-fd915934db5e@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x1034.google.com
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

On Wed, May 11, 2022 at 02:56:37PM -0700, Richard Henderson wrote:
> On 5/11/22 14:43, Stafford Horne wrote:
> > At this point how would tb->flags have the right value?  Would it always be set
> > correctly by `cpu_get_tb_cpu_state` in the `lookup_tb_ptr`call?
> 
> Well, it would be set by cpu_get_tb_cpu_state in cpu_exec, which is then
> passed to tb_gen_code.  If we go around a loop and look it up a second time,
> we'll find a tb with a matching set of flags.

Right, cpu_get_tb_cpu_state called in lookup_tb_ptr will not update tb->flags.

What you mention, that is for when we have to generate a new TB, the tb->flags
get set right before tb_gen_code.

But for the case where we exit the delay-slot TB due to a pending exception I
think the flow would go.

 TB chain:
     -> branch-TB     : set env->flag 1
     -> delay-slot-TB : exit_tb due to condition
 Exit:
     -> return to cpu_tb_exec
       -> tcg_ops->synchronize_from_tb

In this case I don't see how the tb->flag would be updated, ooh, I guess it
would have been set earlier when the TB was generated.  Maybe that is what I am
missing.

-Stafford


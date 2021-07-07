Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B21933BF126
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 23:01:17 +0200 (CEST)
Received: from localhost ([::1]:55612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1EfU-0002Yb-AO
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 17:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1m1Edv-0001mU-Cj
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 16:59:39 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:42777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1m1Edt-0002SH-Lb
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 16:59:39 -0400
Received: by mail-pg1-x52d.google.com with SMTP id d12so3591512pgd.9
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 13:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3S81MrDSp5kg5px8E8Ok3Bou4ROKWGk9q6OU6iacBJ0=;
 b=ZBlMLLG+yerjoWjuaOI/l9F1eVHig7CY1PNHh9/tzYYkxO333h6sByBM82cePNDl4X
 OZzC8c27PMS2eUNcnXzOvAI0435Y3R4/gWh9yzV0zfOIry10+VQVDgDlr7xxBHOedeoF
 aw//zrJ0YGVH2YORiUSopAEPvM/u+5NtiUQBi+Y540poRKE4RkTnLaDxqK8XX6voEy27
 WQzEmLchCIM9TN5uB7xqxQVnfM0JHy5nHIeN9ISd/B5jrjiBTFiKMpVDxCcf3EAFZytV
 4VjHGPVP4Yc7HhN3ogID1PZiJ45ElIYb8YDbquMVrGOXWC+sCiu+vvWLS1/QWr/0D6as
 zrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3S81MrDSp5kg5px8E8Ok3Bou4ROKWGk9q6OU6iacBJ0=;
 b=uUbEix/p99ZOXK1iHdrxQELy2VtN1jWwBn/6Hrj3S74VV5MPwOMn9PCkqyx79WLwWY
 r+x8cQTZspWSagE8RmOS/aasv7pNFiMPWL9iNd5euH8wCT8Gs5lX1pY4A4huog2YvVlO
 EF01t245weBjbznNPWgS46NRaTWreKtHeXNNwMYIYgwZJRqpkJwTXSYd0mgzToFKyRVd
 9M3l3PCzfNfUqIU3sMZ/MKIaUZCwXfVG2AOxJegf/T1uA5uAv6S4RrqEKGbo3attTTra
 MUsAk0Lp6qu5TPnbqECgX/nCBLupVH2Ebv2I+LZaJFt2lqdLCVuVKVmEweXo2qAnhCCV
 qbcg==
X-Gm-Message-State: AOAM530+3Txk7pwUu8DfFSM+YPCH51V4iwTLka26DG5u+HSZjpnYJubi
 d4AcFCfiRXjt/alQ48FSR5A=
X-Google-Smtp-Source: ABdhPJxYQQuHyou+l2jjL9zH2/sfWc0fdSIBkMvGhr/N89HHPWwjCYid4fWByS/+n4WrHBBgmocevw==
X-Received: by 2002:a63:e507:: with SMTP id r7mr28189721pgh.435.1625691575621; 
 Wed, 07 Jul 2021 13:59:35 -0700 (PDT)
Received: from localhost (g164.115-65-218.ppp.wakwak.ne.jp. [115.65.218.164])
 by smtp.gmail.com with ESMTPSA id 2sm144462pgz.26.2021.07.07.13.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 13:59:34 -0700 (PDT)
Date: Thu, 8 Jul 2021 05:59:32 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 18/28] target/openrisc: Use translator_use_goto_tb
Message-ID: <YOYVtKsXCwiNvcXp@antec>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-19-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210630183226.3290849-19-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x52d.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 30, 2021 at 11:32:16AM -0700, Richard Henderson wrote:
> Reorder the cases in openrisc_tr_tb_stop to make this easier to read.

Hi Richard,

For me the description is a bit misleading.  I don't see it as a simple
reorder for making things easier to read, because we need to understand
what is inside of translator_use_goto_tb now.

From the patch basically translator_use_goto_tb indicates that a jump is in
the same page and we are not single stepping.

The old code was:

  If single step
   DEBUG
  else if not same page
   tcg_gen_lookup_and_goto_ptr()
  else *same page*
   jump same page

Now:

  If translator_use_goto_tb() (same page & not single step)
    jump same page

  If single step
    DEBUG
  else *not same page*
    tcg_gen_lookup_and_goto_ptr()

It would be a bit easier to understand if the description was something like,
Reorder the control statements to allow using the page boundary check from
translator_use_goto_tb().

That said it looks correct so:

Reviewed-by: Stafford Horne <shorne@gmail.com>


> Cc: Stafford Horne <shorne@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/openrisc/translate.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
> index a9c81f8bd5..2d142d8577 100644
> --- a/target/openrisc/translate.c
> +++ b/target/openrisc/translate.c
> @@ -1720,16 +1720,17 @@ static void openrisc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>          /* fallthru */
>  
>      case DISAS_TOO_MANY:
> -        if (unlikely(dc->base.singlestep_enabled)) {
> -            tcg_gen_movi_tl(cpu_pc, jmp_dest);
> -            gen_exception(dc, EXCP_DEBUG);
> -        } else if ((dc->base.pc_first ^ jmp_dest) & TARGET_PAGE_MASK) {
> -            tcg_gen_movi_tl(cpu_pc, jmp_dest);
> -            tcg_gen_lookup_and_goto_ptr();
> -        } else {
> +        if (translator_use_goto_tb(&dc->base, jmp_dest)) {
>              tcg_gen_goto_tb(0);
>              tcg_gen_movi_tl(cpu_pc, jmp_dest);
>              tcg_gen_exit_tb(dc->base.tb, 0);
> +            break;
> +        }
> +        tcg_gen_movi_tl(cpu_pc, jmp_dest);
> +        if (unlikely(dc->base.singlestep_enabled)) {
> +            gen_exception(dc, EXCP_DEBUG);
> +        } else {
> +            tcg_gen_lookup_and_goto_ptr();
>          }
>          break;
>  
> -- 
> 2.25.1
> 


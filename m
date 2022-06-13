Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E08547D5F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 03:24:48 +0200 (CEST)
Received: from localhost ([::1]:58182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0Yow-0005B6-JT
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 21:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o0Yo1-0004VK-G7
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 21:23:49 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o0Ynz-0001jc-Vu
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 21:23:49 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 v11-20020a17090a4ecb00b001e2c5b837ccso7382119pjl.3
 for <qemu-devel@nongnu.org>; Sun, 12 Jun 2022 18:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=G7UstLkIns/ZPE3UPJa+JiyaEYm0d3iM14cVj3Wzmuc=;
 b=JkseZ2VCyeWE2hAPI0hsc6VfvY/kk+HgugDEmQqQy5JkbBfmlmSuMxOMPbfDEmZ0jd
 rYSCFENlxhcXE8gIU6U06mAZdDoFpxOvhYLKBuvwf9eqfDaR3BvlfJbRat6J9E9hQEs7
 YMCslK3LOp2Qee22mlZujxOMPKg2em32VqZ+SUhoI1mWsqpdxXe7p5bRltHXOcDvNFU2
 pAmn5qBO8UHE4R2DSuKp9MV1cPYtfGU85HxLrASeYmWm5daA3bVDwX7zgYlqhJzkrnL3
 yWrMudhVqm/SGt58DKkz6CNhzbZTUqI7s4mYjfn3l9X/xJIvE7Q70ZWUWO3uG9vTB89Q
 OWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G7UstLkIns/ZPE3UPJa+JiyaEYm0d3iM14cVj3Wzmuc=;
 b=hMOtQ6g+Zgp/834n+SePIus4TK2iU7AwiRZIK7sqlSYC8tBDC2PJ7HIKTh47fHgMoU
 dOPe5O4gM3QVjo9dPhItjduSD0zlDV3QZQ3THacl2jAbaPQmsTuAVewH9CpRozaeV6sh
 XrqIaNY5d2HyhgZM8N0YFaKOQ2StQZL5YgcvbcPrdWcWEyLtOf1MIM962CU5kSgDMI+4
 F6ZRKpEhPQFtXV0XWDPVsJE1cYP1J+mu6lpBRZArcM5q2q1qn6CeEHORiN2dK2Y8Jz5n
 1Emtu6uGdBH2Xu3TFA8nq93mxqrdduwFQTKIGOa5xe5IR2SINgkBkfvly7Yb6J2QaC77
 tVjg==
X-Gm-Message-State: AOAM532TXwwcFYxK7GqKp+YcCCtIZkcUApsn2avftU3U40qJfUw4hW70
 E4E3Qg/7QU6xQIjMQ6dakpo=
X-Google-Smtp-Source: ABdhPJxeuIlwcEjwVRQMxWymg0BOAVODAAkBvowZ9oPbjBq2zXFT9Hc55BCN0eccKKkKeV8cwOBGuw==
X-Received: by 2002:a17:90a:d148:b0:1ea:4e16:545b with SMTP id
 t8-20020a17090ad14800b001ea4e16545bmr13025051pjw.132.1655083425934; 
 Sun, 12 Jun 2022 18:23:45 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a170902e40c00b0015e8d4eb2e0sm3637991ple.298.2022.06.12.18.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 18:23:45 -0700 (PDT)
Date: Mon, 13 Jun 2022 10:23:43 +0900
From: Stafford Horne <shorne@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/openrisc: pass random seed to fdt
Message-ID: <YqaRn6GiHstCbbMm@antec>
References: <20220612215949.134807-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220612215949.134807-1-Jason@zx2c4.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x1033.google.com
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

On Sun, Jun 12, 2022 at 11:59:49PM +0200, Jason A. Donenfeld wrote:
> If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
> initialize early. Set this using the usual guest random number
> generation function. This is confirmed to successfully initialize the
> RNG on Linux 5.19-rc2.
>
> Cc: Stafford Horne <shorne@gmail.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  hw/openrisc/openrisc_sim.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> index 35adce17ac..41821b5f30 100644
> --- a/hw/openrisc/openrisc_sim.c
> +++ b/hw/openrisc/openrisc_sim.c
> @@ -20,6 +20,7 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/error-report.h"
> +#include "qemu/guest-random.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "hw/irq.h"
> @@ -115,6 +116,7 @@ static void openrisc_create_fdt(Or1ksimState *state,
>      int cpu;
>      char *nodename;
>      int pic_ph;
> +    uint8_t rng_seed[32];
>  
>      fdt = state->fdt = create_device_tree(&state->fdt_size);
>      if (!fdt) {
> @@ -165,6 +167,10 @@ static void openrisc_create_fdt(Or1ksimState *state,
>          qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
>      }
>  
> +    /* Pass seed to RNG. */
> +    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
> +    qemu_fdt_setprop(fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
> +
>      /* Create aliases node for use by devices. */
>      qemu_fdt_add_subnode(fdt, "/aliases");
>  }

This all looks fine to me.  I will queue it with my current changes.  Since this
is only applying to openrisc_sim I would like to also apply it to virt.  To do
that I need to have a common core openrisc system creation api.  That way I
don't end up copying and pasting this to every platform.

-Stafford


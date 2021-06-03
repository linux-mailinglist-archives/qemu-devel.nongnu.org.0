Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DE439A647
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:52:54 +0200 (CEST)
Received: from localhost ([::1]:43484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqaT-0000I6-NA
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1loqKv-0004DR-H3
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:36:49 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:33510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1loqKt-0005IP-VJ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:36:49 -0400
Received: by mail-lf1-x136.google.com with SMTP id t7so2647077lff.0
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 09:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=xdlASrZ2XU7dTTxY0f4sSNCaQO7p3PkW+7AumqQC93s=;
 b=HLVwL7c4V1pDPxTlqDpW+9R3CPPqr2db7VccxJmNdVs/Iu0ZOLgXCM5yGx8mVNu9ie
 boNgyfgxLzIYY7SCKSUX+EqefYeIutGfv/mY4ilbAySpuBNbxLnwv/jVWqOxSFVp6lNl
 dkc4d63AttIkK0kEZZYUOWUiG53ZYYjdpHQMHcfXewHWXjQML2uJHoWmiFe1H5tvL8Kk
 c9LHjdV3N8V9cx/Ai6nGw0o0bUMXD14ToafDETWLHP4wnvo/m4AQ27dnJ8+kgy0xPpnH
 POr8mg5B1hhV7Sjl2JpFf5tXQ7d3jmz3Bxd1UH+6qakFhvivY5nXlXKzFnT73CW45LR+
 moJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xdlASrZ2XU7dTTxY0f4sSNCaQO7p3PkW+7AumqQC93s=;
 b=lbuI+qNPfcImeBdaYT0LO2pvTBiGplqlD6ZbpSLJxQgSHAKk9WiFVY+I38tNb+2EHG
 iYNqyD5HarEKCPu7f9/cHzpX4ZqCtEFGf7ZarWarNNuvvj9qC+dT2q66DXLbxhTbJsct
 oEtVecgtbjudNhPXEeDCChzS0J19NclfuM2yRUOvzc9c0HI2T6K6jrN+UGKUy7L1KJSi
 IC/SdCzyw9hbwXrYBxHdoaiK43fGczAp62YKnBxeVq3ym/P0ypw65hvcOqG8Z8mGJ7WT
 zepTh3Me3NP1pMtut1x8W/JwnvstvqMkSrawjzm7C5FS7XNi9swSzm1B3iGBWtGm+GE+
 udZA==
X-Gm-Message-State: AOAM530LRbwlGMIUqS7wovD/lvZ5k/fwQZZtulgzteQN8t4/nAA/ONaI
 cILwZaD37oLwwu2PcXlUiGI=
X-Google-Smtp-Source: ABdhPJy0bIy47D/RjZOs5iQFDh8X+uXNxY2g8eLtyT7HagKUogRPY/jaTyrxFZK5pnVTCrWJA37XUw==
X-Received: by 2002:a19:c194:: with SMTP id r142mr327530lff.363.1622738206315; 
 Thu, 03 Jun 2021 09:36:46 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id q16sm392945lfn.220.2021.06.03.09.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 09:36:45 -0700 (PDT)
Date: Thu, 3 Jun 2021 18:36:45 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 5/6] target/microblaze: Replace magic values by proper
 definitions
Message-ID: <20210603163645.GL477672@toto>
References: <20210603090310.2749892-1-f4bug@amsat.org>
 <20210603090310.2749892-6-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210603090310.2749892-6-f4bug@amsat.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x136.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 03, 2021 at 11:03:09AM +0200, Philippe Mathieu-Daudé wrote:
> Use the Exception Status Register definitions from "cpu.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/microblaze/helper.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
> index 20dbd673136..d537f300ca6 100644
> --- a/target/microblaze/helper.c
> +++ b/target/microblaze/helper.c
> @@ -99,14 +99,22 @@ bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                    mmu_idx, address);
>  
>      env->ear = address;
> +
> +    env->esr = (access_type == MMU_DATA_STORE) ? ESR_S : 0;
>      switch (lu.err) {
>      case ERR_PROT:
> -        env->esr = access_type == MMU_INST_FETCH ? 17 : 16;
> -        env->esr |= (access_type == MMU_DATA_STORE) << 10;
> +        if (access_type == MMU_INST_FETCH) {
> +            env->esr |= ESR_EC_INSN_STORAGE;
> +        } else {
> +           env->esr |= ESR_EC_DATA_STORAGE;
> +        }
>          break;
>      case ERR_MISS:
> -        env->esr = access_type == MMU_INST_FETCH ? 19 : 18;
> -        env->esr |= (access_type == MMU_DATA_STORE) << 10;
> +        if (access_type == MMU_INST_FETCH) {
> +            env->esr |= ESR_EC_INSN_TLB;
> +        } else {
> +           env->esr |= ESR_EC_DATA_TLB;
> +        }
>          break;
>      default:
>          abort();
> -- 
> 2.26.3
> 


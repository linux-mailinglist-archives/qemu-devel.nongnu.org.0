Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEF0626240
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 20:42:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otZtx-0003Yt-MR; Fri, 11 Nov 2022 14:41:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1otZtv-0003YR-Qy
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 14:41:19 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1otZtu-0005bg-8Y
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 14:41:19 -0500
Received: by mail-lj1-x231.google.com with SMTP id z24so5593579ljn.4
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 11:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dFT8Yt9C/yqlxdBIRg1LIe3JaIpdE/jZgbN/tmPpRMw=;
 b=iWDfEZ+Hc3dAEQLGF3b8RHP7eYSAjnNhpuWph2L7L3DrHcb4yE7F8Wkk3dr5bynwMa
 GMsOiV0k+jOY8E7WY++5DpMLdFwySwoxbGCQOOI/Kxg7IERawAGwUlkn+r2a4nCvOhfC
 Q4eUhXK9C7tVemgb2+czdPS4yT4HZyd++yesI9t8feLewJEAzgSYHUo82byhceevjtKa
 aUMqLbQcizoSWG8snBJftRtoN8twFJKGDbgxsALiMFk/hC+X+LMtuAu/UhJnewbAkCj7
 8SYQsFuV/1ZLIWgQ0vcBALvEHHaffHbodJPVGEKO92MID1cOhlTJFyEBCW2gBeCgbmzD
 DTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dFT8Yt9C/yqlxdBIRg1LIe3JaIpdE/jZgbN/tmPpRMw=;
 b=yitwB3nabi5g21SsPw7T7VLoEzkRzrA2ptgem81b0BKYBVg7sUoTfuk442utAMiUEo
 7jstMFy1gejHmHP9TujI7E1g1RwQ+AP8p3WjeMXmOA+WKkL3iyC2sqcREClloQxSZ31/
 DCTsogQH+bsiBpDOiUkNzYp6HCfHOwNngVhhXS/R9T7kn/5jDG3c+sDtNCwMJUqgw83b
 JWKMUAqwrCwp5L/vvzCl/0jx80hZd5U8NRIZ7Qgn68/QITc22l9vmHXqIV0e3MIkI4nc
 aHK0yfLWT4ScKG1gaD9ct+Q7MJZKFgVCiiqTR7jl3AKVsKCNqoLaRKKSA3ZNPuU+qTLA
 O5sA==
X-Gm-Message-State: ANoB5pkPHlrAySJt+k1jxhAU877rHLwdQTvRlMe278lsISe+IwKSTuA3
 0KcokXPxKeLe0rUZroI+zBM=
X-Google-Smtp-Source: AA0mqf4dZuoCJMGayzK43sjKYr1x4tGuTOYblqlVnRIMPA+rhMgStW4ygycyttOkiZHMtct0PcvRmw==
X-Received: by 2002:a2e:8e3b:0:b0:26b:de20:ba89 with SMTP id
 r27-20020a2e8e3b000000b0026bde20ba89mr1119159ljk.254.1668195675968; 
 Fri, 11 Nov 2022 11:41:15 -0800 (PST)
Received: from gmail.com (81-232-4-135-no39.tbcn.telia.com. [81.232.4.135])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a05651203f600b004ab98cd5644sm473699lfq.182.2022.11.11.11.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 11:41:15 -0800 (PST)
Date: Fri, 11 Nov 2022 20:41:15 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org
Subject: Re: [PATCH  v5 10/20] target/microblaze: initialise MemTxAttrs for
 CPU access
Message-ID: <Y26lWx2rlMn8sYYV@toto>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-11-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221111182535.64844-11-alex.bennee@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Nov 11, 2022 at 06:25:25PM +0000, Alex Bennée wrote:
> Both of these functions deal with CPU based access (as is evidenced by
> the secure check straight after). Use the new MEMTXATTRS_CPU
> constructor to ensure the correct CPU id is filled in should it ever
> be needed by any devices later.

Looks good to me!

Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/microblaze/helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
> index 98bdb82de8..655be3b320 100644
> --- a/target/microblaze/helper.c
> +++ b/target/microblaze/helper.c
> @@ -44,7 +44,7 @@ bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      MicroBlazeMMULookup lu;
>      unsigned int hit;
>      int prot;
> -    MemTxAttrs attrs = {};
> +    MemTxAttrs attrs = MEMTXATTRS_CPU(cs);
>  
>      attrs.secure = mb_cpu_access_is_secure(cpu, access_type);
>  
> @@ -235,7 +235,7 @@ hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
>      unsigned int hit;
>  
>      /* Caller doesn't initialize */
> -    *attrs = (MemTxAttrs) {};
> +    *attrs = MEMTXATTRS_CPU(cs);
>      attrs->secure = mb_cpu_access_is_secure(cpu, MMU_DATA_LOAD);
>  
>      if (mmu_idx != MMU_NOMMU_IDX) {
> -- 
> 2.34.1
> 


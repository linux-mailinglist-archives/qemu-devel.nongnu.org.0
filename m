Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CDD39A63B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:50:17 +0200 (CEST)
Received: from localhost ([::1]:38992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqXw-000509-LK
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1loqK0-0002bx-LI
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:35:54 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:44683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1loqJw-0004fC-H1
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:35:52 -0400
Received: by mail-lj1-x233.google.com with SMTP id d2so3766268ljj.11
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 09:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=MYZJim8EEcjyUjBD/u++DH5g3gCohVA/b2gXENA8K5c=;
 b=rjXt7ErBsTlQnd+e5Fy23f09sURmEMTC5m5uGfokh+uXemEtSZr1JunC02AXOzTd/0
 zkUJD3tDVp8DKCO7c+v2wFmTsFGVRdNPiIBK8FISKiJL/uO+1UpuxWqMvP7QZaze3/Pq
 V58p0jfEoz++EVUeYEX/QHrHKxgTO9w/gGsxyEpWb/C6hHxe/t5xwKUPIep1YsBZ5Tar
 D5uY3QlM2TULpXeFA47w+c/dRapZcpGx13FnwdZvC5BrzqEExa2EBsZzelWSl0D8WNJH
 u3Dpi+uQYXTJ5MicK9ar2mnaAp3/7eMokhywJahql0SAg6IUAXI1HjJ2Prm6OhdQOlIh
 cV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MYZJim8EEcjyUjBD/u++DH5g3gCohVA/b2gXENA8K5c=;
 b=rqA4uXrQhxlnkDX/66VRbYQxMujjE1iI9w9SXr9YgOg9luX1TlTkhxesC003BrLha0
 jF5aTQLyggUi4AalvyULMdg+Alw/Vx1KE3BSqdUHezZTdqBd8unX7+2krEPd+4aUW9BO
 /bHIizkY/9iFljxh6TeZl5EzUPaK7babUwjNGA3zC4v3AKiuqS7bqSSVvBZ5e9R/fWkp
 q67tF7t2XW7IW7BsdzIagYdi+ltrPqKQ3Eiaa73d0A543K9jB06WPEb4eOYlG5bpTUAV
 ZSqfwJ49abLKusWDWwfsWRB3jRH7ACUbREcR3OaIuLC116hPrFyQN7omYxY9Mn4DU4NN
 hWQA==
X-Gm-Message-State: AOAM532YMu8Mwc+QMXGZjsJr298nfuo/ZVyOsvBz2nkhmdqR3ln/s8/q
 xz+/x60sj4oxJa3w/cVC9hc=
X-Google-Smtp-Source: ABdhPJygEMg6gZhuiHG/g2Qnj4uVLmHKdv0YKhk3xfJ5Uau3ulD3khmw2QZjU8y5f01ifxucnofBUQ==
X-Received: by 2002:a2e:a781:: with SMTP id c1mr179643ljf.462.1622738146788;
 Thu, 03 Jun 2021 09:35:46 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id e5sm411145ljn.21.2021.06.03.09.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 09:35:46 -0700 (PDT)
Date: Thu, 3 Jun 2021 18:35:45 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 4/6] target/microblaze: Fix Exception Status Register
 'Cause' definitions
Message-ID: <20210603163545.GK477672@toto>
References: <20210603090310.2749892-1-f4bug@amsat.org>
 <20210603090310.2749892-5-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210603090310.2749892-5-f4bug@amsat.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x233.google.com
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

On Thu, Jun 03, 2021 at 11:03:08AM +0200, Philippe Mathieu-Daudé wrote:
> See 'MicroBlaze Processor Reference Guide' UG081 (v9.0),
> Table 1-11: "Exception Status Register (ESR)".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/microblaze/cpu.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
> index e4bba8a7551..42b9ad8d313 100644
> --- a/target/microblaze/cpu.h
> +++ b/target/microblaze/cpu.h
> @@ -95,10 +95,10 @@ typedef struct CPUMBState CPUMBState;
>  #define          ESR_EC_FPU             6
>  #define          ESR_EC_PRIVINSN        7
>  #define          ESR_EC_STACKPROT       7  /* Same as PRIVINSN.  */
> -#define          ESR_EC_DATA_STORAGE    8
> -#define          ESR_EC_INSN_STORAGE    9
> -#define          ESR_EC_DATA_TLB        10
> -#define          ESR_EC_INSN_TLB        11
> +#define          ESR_EC_DATA_STORAGE    16
> +#define          ESR_EC_INSN_STORAGE    17
> +#define          ESR_EC_DATA_TLB        18
> +#define          ESR_EC_INSN_TLB        19
>  #define          ESR_EC_MASK            31
>  
>  /* Floating Point Status Register (FSR) Bits */
> -- 
> 2.26.3
> 


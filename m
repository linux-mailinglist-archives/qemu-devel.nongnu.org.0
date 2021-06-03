Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A85C39A636
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:48:51 +0200 (CEST)
Received: from localhost ([::1]:35064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqWY-0001xP-GH
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1loqUy-0000RE-Q0
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:47:12 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:38721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1loqUw-0004UF-SX
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:47:12 -0400
Received: by mail-lf1-x130.google.com with SMTP id r5so9862913lfr.5
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 09:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0Byn7uVULsJ1Bz9xvsHcnfxupMmIawqrLnEDllVhDFw=;
 b=urTDxc51LEBwahujF1Wu33oMk1uvH8z8WnQlCAR1ZnbBa/nSp4liS07tHnR/ZHmRD7
 zqFI9cnqe1gCJfnMXzsTs8XrwGP7fn2nCwT29Qw+tBKyRPxpNaYujW6r0Bre9HZ1eBfi
 kOESK6UDPLLouXuOUEL31Eehx98CBMZd0ZmQobBUECXBSRGzyf/jvhE7CiZB5Mx/Gyn0
 wQvLEKtH76owCGdOF+Ff1zd4qz+PHU5Mp/XC7FlU1sXIBwqWP8RIh723hu7J6a7FbFIJ
 Bp8ia+uLHYbbqn1IXXz09HtYuIlwe1aTSKy4XDLYwHnOecXEiXy/SU4BD87FEkyvt633
 Ocxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0Byn7uVULsJ1Bz9xvsHcnfxupMmIawqrLnEDllVhDFw=;
 b=fzQGB9QOpIO68W/LsxPA9PNZCDcgqnspGbmfmaZ41Yk8R7bzdPtAwVxH9oURSZCxZZ
 heJyoVuRv8tMBrMMIGnjJ/C2HEXxb7nu/H40S5ewCIpu2OIi5A2jljNRHbUKPkg1wsNN
 Ozi0YDhLF0Jq+feOUVP3jIecfs8quqUIfrQGgmuCmyaXbuWy5HldUf1UtvtFLT8xWQ1o
 RIIlqU8TFF0UfXcY33hUVY8gekajSCUiDcX44NW1lctcWqDYLn+LLQidreHP8TJFaEoG
 3UX6WQc7BGVTjXk+dj2Y6o05lVUF+xvPHjMT8eIw89XicVLXA1fT5+TMi+Pi5oFeXDkb
 h/aw==
X-Gm-Message-State: AOAM533N+jN9M1j0/mVX+sWVbyMAuHZ0Jphw1S3q92wewL/aVhmw/Zil
 HDH2tmDaFAQ4LPAdhULlUi0=
X-Google-Smtp-Source: ABdhPJwk4uuPxYPWjBQGCSLZka0g1k+8p/O3ZYvpi9FruuMBd78zwe025O9Adf4PwSV30IhUv5XPSA==
X-Received: by 2002:a05:6512:332c:: with SMTP id
 l12mr402210lfe.454.1622738829267; 
 Thu, 03 Jun 2021 09:47:09 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id f6sm417962ljn.136.2021.06.03.09.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 09:47:08 -0700 (PDT)
Date: Thu, 3 Jun 2021 18:47:08 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 6/6] target/microblaze: Set OPB bits in tlb_fill, not in
 transaction_failed
Message-ID: <20210603164708.GM477672@toto>
References: <20210603090310.2749892-1-f4bug@amsat.org>
 <20210603090310.2749892-7-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210603090310.2749892-7-f4bug@amsat.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x130.google.com
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

On Thu, Jun 03, 2021 at 11:03:10AM +0200, Philippe Mathieu-Daudé wrote:
> Per the 'MicroBlaze Processor Reference Guide' UG081 (v9.0),
> "Hardware Exceptions" chapter:
> 
>   Exception Causes:
> 
>   * Instruction Bus Exception
> 
>   The instruction On-chip Peripheral Bus exception is caused by an
>   active error signal from the slave (IOPB_errAck) or timeout signal
>   from the arbiter (IOPB_timeout).
> 
>   * Data Bus Exception
> 
>   The data On-chip Peripheral Bus exception is caused by an active
>   error signal from the slave (DOPB_errAck) or timeout signal from
>   the arbiter (DOPB_timeout).
> 
> the table 1-24 (Processor Version Register 2):
> 
>   * IOPBEXC:  Generate exception for IOPB error
> 
>   * DOPBEXC: Generate exception for DOPB error
> 
> and the table 2-12 (MPD Parameters):
> 
>   * C_IOPB_BUS_EXCEPTION
> 
>   Enable exception handling for IOPB bus error
> 
>   * C_DOPB_BUS_EXCEPTION
> 
>   Enable exception handling for DOPB bus error
> 
> So if PVR2.[ID]OPBEXC feature is disabled, no exception will be
> generated. Thus we can not get to the transaction_failed() handler.
> The ESR bits have to be set in tlb_fill().
> 
> However we never implemented the MMU check whether the address belong
> to the On-chip Peripheral Bus interface, so simply add a stub for it,
> warning the feature is not implemented.


This doesn't look correct either...

The OPB interface that you're refering to is implemented. It's the
insn and data memory ports of the cpu. Most MB designs today use
AXI though, but the name originated from the old DT bindings.

The transaction_failed() you're editing is not related to the MMU.
It's related to bus errors (e.g device slave errors).
These are not "avoided" by the CPU, if SW issues a transactions that
results in one, the MSR_EE flag and the properties invovled here
determine if the core will generate an trap for SW to handle the
bus error or if the error will be ignored.

Cheers,
Edgar



> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/microblaze/helper.c    | 19 +++++++++++++++++++
>  target/microblaze/op_helper.c | 13 -------------
>  2 files changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
> index d537f300ca6..60e62bc0710 100644
> --- a/target/microblaze/helper.c
> +++ b/target/microblaze/helper.c
> @@ -56,6 +56,18 @@ static bool mb_cpu_access_is_secure(MicroBlazeCPU *cpu,
>      }
>  }
>  
> +/* On-chip Peripheral Bus (OPB) interface */
> +static bool mb_cpu_address_is_opb(MicroBlazeCPU *cpu,
> +                                  vaddr address, unsigned size)
> +{
> +    if (cpu->cfg.iopb_bus_exception || cpu->cfg.dopb_bus_exception) {
> +        /* TODO */
> +        warn_report_once("On-chip Peripheral Bus (OPB) interface "
> +                         "feature not implemented.");
> +    }
> +    return false;
> +}
> +
>  bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                       MMUAccessType access_type, int mmu_idx,
>                       bool probe, uintptr_t retaddr)
> @@ -119,6 +131,13 @@ bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      default:
>          abort();
>      }
> +    if (mb_cpu_address_is_opb(cpu, address, size)) {
> +        if (access_type == MMU_INST_FETCH) {
> +            env->esr = ESR_EC_INSN_BUS;
> +        } else {
> +           env->esr = ESR_EC_DATA_BUS;
> +        }
> +    }
>  
>      if (cs->exception_index == EXCP_MMU) {
>          cpu_abort(cs, "recursive faults\n");
> diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.c
> index 1048e656e27..171c4cf99a0 100644
> --- a/target/microblaze/op_helper.c
> +++ b/target/microblaze/op_helper.c
> @@ -123,19 +123,6 @@ void mb_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
>                    (access_type == MMU_DATA_LOAD ? "DATA_LOAD" : "DATA_STORE"));
>  
>      assert(env->msr & MSR_EE);
> -
> -    if (access_type == MMU_INST_FETCH) {
> -        if (!cpu->cfg.iopb_bus_exception) {
> -            return;
> -        }
> -        env->esr = ESR_EC_INSN_BUS;
> -    } else {
> -        if (!cpu->cfg.dopb_bus_exception) {
> -            return;
> -        }
> -        env->esr = ESR_EC_DATA_BUS;
> -    }
> -
>      env->ear = addr;
>      cs->exception_index = EXCP_HW_EXCP;
>      cpu_loop_exit_restore(cs, retaddr);
> -- 
> 2.26.3
> 


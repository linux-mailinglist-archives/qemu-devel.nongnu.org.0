Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CCA1AFD8E
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Apr 2020 21:34:33 +0200 (CEST)
Received: from localhost ([::1]:46930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQFi4-0004wE-QA
	for lists+qemu-devel@lfdr.de; Sun, 19 Apr 2020 15:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52826 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luc.michel@greensocs.com>) id 1jQFe3-0003rg-SB
 for qemu-devel@nongnu.org; Sun, 19 Apr 2020 15:30:24 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <luc.michel@greensocs.com>) id 1jQFe3-0007cn-Bm
 for qemu-devel@nongnu.org; Sun, 19 Apr 2020 15:30:23 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40670)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1jQFe2-0007Z7-PC
 for qemu-devel@nongnu.org; Sun, 19 Apr 2020 15:30:23 -0400
Received: from [172.17.10.10] (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 7330B96EF0;
 Sun, 19 Apr 2020 19:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1587324621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Fv2wmZCwhIezBAXFiRL7dCaTJ/NqIvNhYGnFDtTyhs=;
 b=t6Tpb/0ieroseNahC+2sxwBS3170nbP8O9idcJA+fwaG3fhLlz0jMoP9EvjGY4rtAc8wvS
 NJDL+S0deiHakklUjtSa6iq2+WXy2UvB8EJ3yW5v1UIyNbetDzun4aBQ87OAOdTsWIg9hw
 4US0Pwl1EgIcZoc2pfaRC/XgZ6uI4ck=
Subject: Re: [PATCH v1 6/6] target/microblaze: Add the pvr-user2 property
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200417191022.5247-1-edgar.iglesias@gmail.com>
 <20200417191022.5247-7-edgar.iglesias@gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <c924f71d-b858-8327-8b62-b5aa283bec10@greensocs.com>
Date: Sun, 19 Apr 2020 21:30:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200417191022.5247-7-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1587324621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Fv2wmZCwhIezBAXFiRL7dCaTJ/NqIvNhYGnFDtTyhs=;
 b=ZEyeciS0Up4ReEBYKziEfFBWvCyL1sWCTX3wpr2vy52yz4ax+lueODoh4ei2p1N6bZwhiB
 uRFdBRC0Ae7Yc1Wop/WKoI4VoFtqz0nKWHMs5U6jG084s/RBgiMpqVY/NTURRsZzOHZOxt
 thlHjBXLlV1VU8zByqmlrZSsq7whZuI=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1587324621; a=rsa-sha256; cv=none;
 b=h15ZjweX9jgTVlxAf0JLF69cWQMCVkZAP52hVdKXRBZx9QslXkz5+81ACrL/6XVMH1Dhkg
 u57BloZk2mXPhQ5x469dD5nPeSOew46uMnIVkojaVJ6AdcPPokWnScafSYwDIjL2kTcj1c
 YHy9fyzeFQNVgtj3i7224Cip2r0/SCQ=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=luc smtp.mailfrom=luc.michel@greensocs.com
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-detected-operating-system: by eggs1p.gnu.org: Linux 3.11 and newer
X-Received-From: 5.135.226.135
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/17/20 9:10 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Add the pvr-user2 property to control the user-defined
> PVR1 User2 register.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>  target/microblaze/cpu.c | 2 ++
>  target/microblaze/cpu.h | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 0759b23a83..d024ec80eb 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -196,6 +196,7 @@ static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
>                          (cpu->cfg.pvr == C_PVR_FULL ? PVR0_PVR_FULL_MASK : 0) |
>                          cpu->cfg.pvr_user1;
>  
> +    env->pvr.regs[1] = cpu->cfg.pvr_user2;
>      env->pvr.regs[2] |= (cpu->cfg.use_fpu ? PVR2_USE_FPU_MASK : 0) |
>                          (cpu->cfg.use_fpu > 1 ? PVR2_USE_FPU2_MASK : 0) |
>                          (cpu->cfg.use_hw_mul ? PVR2_USE_HW_MUL_MASK : 0) |
> @@ -292,6 +293,7 @@ static Property mb_properties[] = {
>      DEFINE_PROP_STRING("version", MicroBlazeCPU, cfg.version),
>      DEFINE_PROP_UINT8("pvr", MicroBlazeCPU, cfg.pvr, C_PVR_FULL),
>      DEFINE_PROP_UINT8("pvr-user1", MicroBlazeCPU, cfg.pvr_user1, 0),
> +    DEFINE_PROP_UINT32("pvr-user2", MicroBlazeCPU, cfg.pvr_user2, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
> index 7bb5a3d6c6..a31134b65c 100644
> --- a/target/microblaze/cpu.h
> +++ b/target/microblaze/cpu.h
> @@ -308,6 +308,7 @@ struct MicroBlazeCPU {
>          bool div_zero_exception;
>          bool unaligned_exceptions;
>          uint8_t pvr_user1;
> +        uint32_t pvr_user2;
>          char *version;
>          uint8_t pvr;
>      } cfg;
> 


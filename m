Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EB139CB04
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 22:51:04 +0200 (CEST)
Received: from localhost ([::1]:50938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpdG3-0007HL-4B
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 16:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpdFG-0006Gd-VL
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 16:50:14 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:40576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpdFE-00024Q-Tu
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 16:50:14 -0400
Received: by mail-pg1-x52c.google.com with SMTP id j12so10683139pgh.7
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 13:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zUCX+WJiwhqANyN275NwjJ7fZTnAmYv2uUsgNhiGyyg=;
 b=rKIzBS7eF8eQdlHc4GU1fvpGuJW4NKEaXwjWNJIOWDipXlbkPM58ihucObeKlxBrf1
 xLF4jUfoDQX4PK1clSJYAFx56+cNn2muGPX9zlsPviIM/V43+hTW2WbUNLWdbIKtZaka
 2zzE01A7gsDUTrosl7DROzxRTmg4MQvOD1290HvksI46rWPRz8W8u2cXd36FhtUb+GrH
 4r7WA82X9tfZ/npW1BV1O3rhbcVuMOBH3iNTEw+YeokVAFyYASielYa/uxM4twDvkdae
 VhFJntX1ysMmKO5785/8rEe9M8Em4Y8Eqz8O5s8Lduz/m58dOP8A4kawIJitOwm2VsJ8
 8w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zUCX+WJiwhqANyN275NwjJ7fZTnAmYv2uUsgNhiGyyg=;
 b=GAP/HHUcr/TdkCFMap4oNhrTQA9Rd6usy0YQJt+NyfVJlCpkM8Ei6zShKBYew4ZqoN
 7qhy+bLUB88/s0rYdxXxKUJ2khA7jsMvVOq+MXfEcpStyGNdyJF4WMRaq/d2qs7G8I2l
 VB2YxW/KPk14HgwFDgUnbzc9poZAf83qA19j0Zy4iHZzAo92FyqR/TAur7jg1mdzMHbp
 L7hwJqeFPng4xEZ2sQfsVoSoa4mWO3l6mktA+2a/5WMS7cOFOem8UEkU3ECvik1BxBBD
 mGRmIV0k+oWKpP39OVSHxtOC43DURTMb1JPcbrnFA5aOBv/5WrNzedd/dvQI47wJr9+b
 UYfw==
X-Gm-Message-State: AOAM530nEmK/AF5p7diPbc+MzyAjQCQ9yLbjBNmsKthVc667vbxBzRHO
 djBKkpA35DpgWblxc92zx2jM6w==
X-Google-Smtp-Source: ABdhPJyjBpp+tr9GDo1Vf9goHp/YZCkKM+DIAr/88HTUqMhgMPVTdiSuNxM12oWFE61HG9a0ZZ7fKw==
X-Received: by 2002:a65:6103:: with SMTP id z3mr11150619pgu.61.1622926211227; 
 Sat, 05 Jun 2021 13:50:11 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 11sm4756757pge.57.2021.06.05.13.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 13:50:10 -0700 (PDT)
Subject: Re: [PATCH v16 78/99] target/arm: cpu-exceptions,
 cpu-exceptions-aa64: new modules
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-79-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0865350-88f9-0f91-f984-25832c0f289b@linaro.org>
Date: Sat, 5 Jun 2021 13:50:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-79-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> diff --git a/target/arm/cpu-exceptions-aa64.h b/target/arm/cpu-exceptions-aa64.h
> new file mode 100644
> index 0000000000..64f800a15d
> --- /dev/null
> +++ b/target/arm/cpu-exceptions-aa64.h
> @@ -0,0 +1,28 @@
> +/*
> + * QEMU AArch64 CPU Exceptions Sysemu code
> + *
> + * Copyright (c) 2012 SUSE LINUX Products GmbH
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see
> + *<http://www.gnu.org/licenses/gpl-2.0.html>
> + */
> +
> +#ifndef CPU_EXCEPTIONS_AA64_H
> +#define CPU_EXCEPTIONS_AA64_H
> +
> +#include "cpu.h"
> +
> +void arm_cpu_do_interrupt_aarch64(CPUState *cs);
> +
> +#endif /* CPU_EXCEPTIONS_AA64_H */

I don't see the point in the excessive replication of header files, for exactly 
one declaration.  This is not the first example.

What's wrong with internal.h?  Or some other header that collects sysemu 
specific declarations?

Also, "cpu.h" is not required by this declaration, as I've pointed out before.


r~


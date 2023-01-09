Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C02C662A7E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 16:49:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEuNH-0000Mc-5X; Mon, 09 Jan 2023 10:47:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEuN6-0000Lf-OH
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 10:47:44 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEuN5-0007ZZ-18
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 10:47:36 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d17so8617919wrs.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 07:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SKDaXlLHRBEEhlFQhgiXF6/Je2YdY000ZPPLTtmLFlc=;
 b=ob5HQWKg9spyaF9Rr2K18L0bYnWNXJzkw+RP95ub0ml4N6cbOUJNId1s0oI0Egwld+
 uj1fpbdWn9ylccTQqEQkXBoNL6uAZuPboRMn8OQpZM/OGUvWfKpOBg4mPm6YbdwNEnYf
 uZWxq3+o7Cjp542OcyDiBclMIEVxrX3EzMk4k5ux7TPoF3rdxJu2SSWq6vsLOAZWXeum
 iSHaFac7SkfzWC3KdpbEnk3S1JH9x0EGCTI5j8HdZN3wWvVEkMZEa3IYlzDsEYWxvFMc
 RMYDgBZdeHVyNHs94pLAwo8rOHIX5gisY+o1IAhSkjj/CEmlZAVcV3TAC/CMd3PjWBe8
 IDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SKDaXlLHRBEEhlFQhgiXF6/Je2YdY000ZPPLTtmLFlc=;
 b=Z8aFSsSHNN7u3Nyhm6xW0qC2lsRRoiFoM+F5WnokEkIFhBpLjDQVCYcHRmCs44Pp3i
 Tq9PKne3SG0KrHSLcI1BcZyNQRf9kLDBgI9Zg3n676iA6eLpyWKpNCmED7fhadU10xc1
 rMiMo1Hp4fOz1U0+TTzZyHSDt5XTbehqsFU+Ip3CgV3LkU0stGg0fk/lsh7STWMUOl8e
 fY5ruUQrPhr07TqHc+oeHhJEgqSkGUpBBHNV4Y+Wq56t5Ni/AYqPFFUIQXXnL3JdWIVf
 vY/+BnAnLU+pIDtgXiNHquoNO8u6U/8R2ZtjjnIWBOmfwDA7lngAHWv2IXaT2G4mbBGj
 Ijow==
X-Gm-Message-State: AFqh2kqaxxewgXTCD+gRNvAHI5j1OS5WSwLuEKkEU5R+dBg/YQZRMzFi
 7tWECfZJfdn6c1HRZVnJVgFjhQ==
X-Google-Smtp-Source: AMrXdXtzwMlzqA2vf6kitrLuNCNmnDRrnih0HUvV+E5uRGO51LBVzdVkN+Z7tDXj5kFdjpx97l15Fg==
X-Received: by 2002:adf:eb4f:0:b0:242:659c:dc7 with SMTP id
 u15-20020adfeb4f000000b00242659c0dc7mr39118724wrn.61.1673279253528; 
 Mon, 09 Jan 2023 07:47:33 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5186000000b002bbddb89c71sm5025297wrv.67.2023.01.09.07.47.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 07:47:33 -0800 (PST)
Message-ID: <6e3de50d-38d9-b5ba-dac4-91352be8b96b@linaro.org>
Date: Mon, 9 Jan 2023 16:47:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] target/riscv: Use TARGET_FMT_lx for env->mhartid
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20230109152655.340114-1-bmeng@tinylab.org>
Cc: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109152655.340114-1-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 9/1/23 16:26, Bin Meng wrote:
> env->mhartid is currently casted to long before printed, which drops
> the high 32-bit for rv64 on 32-bit host. Use TARGET_FMT_lx instead.

Oh, a 32-bit host user!

> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
> 
>   target/riscv/cpu.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index cc75ca7667..a5ed6d3f63 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -660,9 +660,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>               (env->priv_ver < isa_edata_arr[i].min_version)) {
>               isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
>   #ifndef CONFIG_USER_ONLY
> -            warn_report("disabling %s extension for hart 0x%lx because "
> -                        "privilege spec version does not match",
> -                        isa_edata_arr[i].name, (unsigned long)env->mhartid);
> +            warn_report("disabling %s extension for hart 0x" TARGET_FMT_lx
> +                        " because privilege spec version does not match",
> +                        isa_edata_arr[i].name, env->mhartid);

Could we cast it to vaddr instead? I'm trying to remove target_[u]long
from hw/ and restrict it to the target/ directory. Per "exec/cpu-common.h":

  /**
   * vaddr:
   * Type wide enough to contain any #target_ulong virtual address.
   */
  typedef uint64_t vaddr;

Alternatively, since this value has to be accessed out of target/,
can we change its type to vaddr in CPURISCVState?

Thanks,

Phil.


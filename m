Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C448674303
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 20:40:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIalM-0005v3-3w; Thu, 19 Jan 2023 14:39:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIalG-0005uR-0s
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:39:48 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIalE-00049I-0x
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:39:45 -0500
Received: by mail-ej1-x632.google.com with SMTP id bk15so8419450ejb.9
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 11:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rhBn4Q7sapQ8G6+OZKi0juSaT8tNnKBzYGlBIyGz9qg=;
 b=K96WSCCze2T1PoOoHxAoArqDvLwuVixNLm9ugEYSmWz9pdHGDlfWTj2KXhExECno6P
 l1Jf7nes8YCyDRg3LkpSHNJ6GvwntB4aBH7ChraKgILmFiuzvtggkENxZ6bCaXoDktyT
 jwbBm1izyE6zsIHOU4U+nAPtviVsNEPUU8FkQFzHWSPgasKdqAXU2I/d97n4Er0I94u5
 rI3n0qtHhKJ4e2rz+At5ddhkC0zwu0yivyeia0OVU+DgNU23tJ2KRtH8CbQq98IoGO9y
 pnEvreSz+dOVzfXHWrZ/v0ZRIryQPoNIVLbB/HrxgdC6GYUpDc+Kp4D5dZWGNPgQyFfK
 5mDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rhBn4Q7sapQ8G6+OZKi0juSaT8tNnKBzYGlBIyGz9qg=;
 b=mYLdI0jDqFR7OWDDfgL4yZdS3+BaA3JF/5DczfOe6MP+ugkeRFpCmVhxTrZjn8u1G1
 BrJDbAEXsnWlwRxhtT4JX5QMn2JQmsow78nzqU4lEiX5GAnAYKo70n20PTg5/jYuketr
 xlxE4bKGVCqmSHT9AoRPsQy29gd8HBJl3TKEkqOaWm9OeNPRoIbSNHeiBFIYbfzlRI6g
 /3CMPiCQXUAlote+6JY9Pop2yl+xS4GLEtOz6sOGRBC6aIWX9gfZH4Jn1zrhlFHzJE2A
 J1Hs7gUjDqnVqXqv3wwyyMSpklXKiqDRtyPYVd06jJJQetxGDC4n9pijq9aUmVuW4G4Q
 C2RQ==
X-Gm-Message-State: AFqh2kqqxzHL+0poHDiMD2AODjtv4J1Sbjju7Sxgh1GOqp2rKPdOvFFA
 w0/Rju+NBL5MlnhwINvvtq+UJA==
X-Google-Smtp-Source: AMrXdXsfKSAfOeucBuDSIlNoPLsB5XN/W0A4C4bsutZM0tidCP4nYd519MGmBRV7mKckIIehtjo4gg==
X-Received: by 2002:a17:906:cb95:b0:86a:addf:880a with SMTP id
 mf21-20020a170906cb9500b0086aaddf880amr11998771ejb.65.1674157182229; 
 Thu, 19 Jan 2023 11:39:42 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 hq15-20020a1709073f0f00b0084c4b87a69csm16751510ejc.153.2023.01.19.11.39.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 11:39:41 -0800 (PST)
Message-ID: <91833080-784f-06cf-70ae-67936040ab78@linaro.org>
Date: Thu, 19 Jan 2023 20:39:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 4/7] hw/riscv: simplify riscv_compute_fdt_addr()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230119191728.622081-1-dbarboza@ventanamicro.com>
 <20230119191728.622081-5-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119191728.622081-5-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 19/1/23 20:17, Daniel Henrique Barboza wrote:
> All callers are using attributes from the MachineState object. Use a
> pointer to it instead of passing dram_size (which is always
> machine->ram_size) and fdt (always machine->fdt).
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/riscv/boot.c         | 6 +++---
>   hw/riscv/sifive_u.c     | 4 ++--
>   hw/riscv/spike.c        | 4 ++--
>   hw/riscv/virt.c         | 3 +--
>   include/hw/riscv/boot.h | 2 +-
>   5 files changed, 9 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



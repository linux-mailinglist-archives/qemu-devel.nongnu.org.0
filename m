Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0BF6542F8
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 15:28:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8MYn-00010B-Fo; Thu, 22 Dec 2022 09:28:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8MYi-0000yV-HL
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 09:28:32 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8MYg-0006dZ-RW
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 09:28:32 -0500
Received: by mail-wr1-x431.google.com with SMTP id i7so1808792wrv.8
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 06:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hW/oKlF3/WVva6dxidB/M4dgoBLAlkvUcex40TKH1Tk=;
 b=LO6r7nZbGgOrzZaWwksQcHn04GkHcPS3tCYozrPK7B40fb2tCuxP543MyzC6uOj4E9
 +y8NMd4gpT8neTX8CeOHZuq2yQy85I8AxoX0yZuHZnLLqdVufiypusg+Pm0xtxifyR+Z
 zLXNUAkAhiqyKX12J1lRWT5QHBdalWuBLhbBW6n4s1bmKEtp0Gewb+XTSbQoiAAZh3JJ
 obmawXISq1J4p+Bt5hpmE1vf6asAwiRtR/HjUijTogEdFZ+nOf/aOD6QTAzlwQXoAB3e
 2syF5CWQxSdP6ayDW/Go4g5bh40Ju5Jn/ksSltwtM4J2OlqBwXECoBYgrFZSl7rOsb+b
 r4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hW/oKlF3/WVva6dxidB/M4dgoBLAlkvUcex40TKH1Tk=;
 b=nK7+evKZ3ObQly7J2J/OZrMsCv31Y0GZfQoMyzu56Lx90C30sqdCmsX5NMxH09+Wrv
 5uAiEpAFzQg1xf9xkbz0jVQiwYf3JjvnqrvTgCgYeylH6KNDbMX4Xl09K5gKLHOBJGpO
 MjO8y9E4BZ2nqBjGBo+VIoo/SYShUreG+VbnZRZoI6AkKIJAfCnq/a3n2WML9GUt1VVv
 yvnyM7w+kPNtwyAxLX0l4ahw1yjnmOihY9Cn8Ii0lJ7pFaQLfySWNjc7+JDgzVs/bRaU
 HcsjQsY9Z4/aif4AXw8qXBY5ec4BecFpVSpa+kvRMSoQ801hTA0AjDm/yhtN82xUjAJr
 mWfQ==
X-Gm-Message-State: AFqh2kryDv/i2tOCqPJ7DtqOJy4LLiEs0O9l3z4Tq6p5o+0XIzxNRUzx
 ApuP/HLAer9h02yE05eO2JF/RSGHHQ9neMVWndU=
X-Google-Smtp-Source: AMrXdXuu3NpTgYOL27ddg8X/muRGOez3MGFiJHIarAPbQ9r2tQCsRp4JZ60nOfpN4yVlhHGR5mny4A==
X-Received: by 2002:adf:db47:0:b0:242:fd7:285f with SMTP id
 f7-20020adfdb47000000b002420fd7285fmr3613899wrj.45.1671719307588; 
 Thu, 22 Dec 2022 06:28:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b2-20020adff242000000b0023662245d3csm659699wrp.95.2022.12.22.06.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 06:28:27 -0800 (PST)
Message-ID: <457567bf-d660-6a14-91c1-bd500db8d545@linaro.org>
Date: Thu, 22 Dec 2022 15:28:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 10/15] hw/riscv/boot.c: use MachineState in
 riscv_load_kernel()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-11-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221182300.307900-11-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 21/12/22 19:22, Daniel Henrique Barboza wrote:
> All callers are using kernel_filename as machine->kernel_filename.
> 
> This will also simplify the changes in riscv_load_kernel() that we're
> going to do next.
> 
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/riscv/boot.c            | 3 ++-
>   hw/riscv/microchip_pfsoc.c | 3 +--
>   hw/riscv/opentitan.c       | 3 +--
>   hw/riscv/sifive_e.c        | 3 +--
>   hw/riscv/sifive_u.c        | 3 +--
>   hw/riscv/spike.c           | 3 +--
>   hw/riscv/virt.c            | 3 +--
>   include/hw/riscv/boot.h    | 2 +-
>   8 files changed, 9 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



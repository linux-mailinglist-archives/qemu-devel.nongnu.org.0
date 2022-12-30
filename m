Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE2F659878
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 13:52:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBEs7-0000Kc-Ip; Fri, 30 Dec 2022 07:52:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBEry-0000He-VW
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:52:19 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBErx-0005aC-CZ
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:52:18 -0500
Received: by mail-wr1-x42d.google.com with SMTP id j17so14478087wrr.7
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 04:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WzGoLPltgfo1rto7FsROPBYQnlYnw6VCzHrINoyC9QQ=;
 b=I6/SLaSjWCgTDuaJbGcYlzHLb4DHMsndNXFRFSOF42Fd/ym/LLGGGACFVEuLmPxTv3
 5bOqw8gpXfhOjfEjdm0PQDPNJeZMtt/c4DmSK1RWDJvqqekIIwIy/5uz5oKpfIb7AuW0
 nD0mHlpOj2ItEPSvORgKnta0phE1XuAKstit77Syq2O96csAAKCl5JQBeFfcr6m+qpsC
 hek2BaRVWAbXJzTVuWUBcegYei4HwYR1mXRfCkzaZYUiN8Ld1jbQrwYTdrG1GgPhTpsW
 ebrdWWQOAlsi47aAJYmp3RotwXLev2XVUDtZd3gdk7N0UAb0YRjsOjqFR2bBtH6TgzBY
 EhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WzGoLPltgfo1rto7FsROPBYQnlYnw6VCzHrINoyC9QQ=;
 b=KEfZSJrUZdyer06cZ4FSOsrOp/QpkXxu06/Fyam6DYW4gqWlLxxSJiG+9GRuBeXk/m
 EzECglnDC3MdfSFBkvXMC/6IOheHh/8Fs+CMY08+XNWPofV9qxyIMFL2vJ786ZRCY2od
 0TaTu0DLtpxz9olAsyp7Nj2CX5/p34bM6aBLj5VRZ2oSWwZtWcb1Oz/GbvAqnZ1Qu8kO
 5rLLRKc28g+o8fHdOMpmgfAufegExizSeUu3GGvI/NSxxLvYuyUJ5jIR5xlFU5r/jlcG
 85EV+IZdlVKKfJayfo3tD/ZIigTA2D1sf3EuBLgDoEsYa3hSGsuPBhCqGnK6/yOiWBjw
 Rc9A==
X-Gm-Message-State: AFqh2krLNhmlnPjrx68RQZtjcppiKIt1HWVdmQ0ZB/6iH6C8fOohrUIl
 Uuu0FUFPDFFp0PiAkCgjtg0G0Q==
X-Google-Smtp-Source: AMrXdXsgWDgfAkjloh3ZSPUhsYKAlA+O8VV3kr/WgGVASEdms0QwAWRbbwT1adAz+o/LqdCklshBcw==
X-Received: by 2002:adf:ed51:0:b0:242:659f:9411 with SMTP id
 u17-20020adfed51000000b00242659f9411mr23745635wro.9.1672404735843; 
 Fri, 30 Dec 2022 04:52:15 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s1-20020a5d6a81000000b0024228b0b932sm24480463wru.27.2022.12.30.04.52.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Dec 2022 04:52:15 -0800 (PST)
Message-ID: <f4ea3dd2-cba0-b317-46ca-5f3a1e865eb8@linaro.org>
Date: Fri, 30 Dec 2022 13:52:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 06/11] hw/riscv: write initrd 'chosen' FDT inside
 riscv_load_initrd()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bmeng@tinylab.org>
References: <20221229181135.270661-1-dbarboza@ventanamicro.com>
 <20221229181135.270661-7-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221229181135.270661-7-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 29/12/22 19:11, Daniel Henrique Barboza wrote:
> riscv_load_initrd() returns the initrd end addr while also writing a
> 'start' var to mark the addr start. These informations are being used
> just to write the initrd FDT node. Every existing caller of
> riscv_load_initrd() is writing the FDT in the same manner.
> 
> We can simplify things by writing the FDT inside riscv_load_initrd(),
> sparing callers from having to manage start/end addrs to write the FDT
> themselves.
> 
> An 'if (fdt)' check is already inserted at the end of the function
> because we'll end up using it later on with other boards that doesn´t
> have a FDT.
> 
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> ---
>   hw/riscv/boot.c            | 18 ++++++++++++------
>   hw/riscv/microchip_pfsoc.c | 10 ++--------
>   hw/riscv/sifive_u.c        | 10 ++--------
>   hw/riscv/spike.c           | 10 ++--------
>   hw/riscv/virt.c            | 10 ++--------
>   include/hw/riscv/boot.h    |  4 ++--
>   6 files changed, 22 insertions(+), 40 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E596CA573
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 15:20:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmlN-00073I-45; Mon, 27 Mar 2023 09:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmlK-00072X-3t
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:19:50 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmlI-0006qm-ES
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:19:49 -0400
Received: by mail-oi1-x22a.google.com with SMTP id y184so6297019oiy.8
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 06:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679923187;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J2XeDcpUibTrydqD4wrMhPpMjN+DQQyi/5/gaM0qhe0=;
 b=YPetc1IIR8ICuEqJ2NGk0ey2imx7R2B+JPumCvrmNc4dpG2gRKaKBd4EIE3T0FB/qd
 ti03iGWlk8WU+boL98Ai9kOv07kXMURWWjDvOZbMZdk7ffiX5A097gMyNV72JqEx0LuH
 DzkIQFLybQ7W1ZTqdeHXuchXQvsZ1YB1s7N6Nwvao73GMxoQZAFRxluyrNVotGP3TCUI
 XKDLs7r+/esywJ8HYOz0oD6bDpfMWDUMChl2hBgJjD2Up6mtm82d21zFVDcpj7+TY2fs
 d4PQw/Eo2C2QoUu0EVXrDnlJ2BSLoYWRs8QrJwfb/3b2ZCCez160waF4K/ypQTRpnfza
 ZAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679923187;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J2XeDcpUibTrydqD4wrMhPpMjN+DQQyi/5/gaM0qhe0=;
 b=AzD2CtufAqmX+jH9BzvPrKVwTkaUhs9XyZSXInIn3O55XQFMTOAUTmDek6sKoD7Gob
 WZzKN6WyxttnyHjuGyrd55wEmOowEl6VsvHqCj56xSNP/NdVSYi2NAx1gbEAl0UMYBji
 uyPu2hlBbaivFPrEUmvS9kmUdwl6LkkYoXwfbb86JxM3QMPvAXmxVNwmUtZqNzlnXm2V
 3/4G1c0S1wvdRBQSVgauq++EiOXZPFh47vgEUAx0b8NOv0A7+z7kvRZABVrNw9fZFHe6
 yfOifazAVhEQeUywl+INNg8GogaaV4+xABA7cKNFwsnrbZCHCmlnNUBu6x9hbGHkBPLj
 LxyA==
X-Gm-Message-State: AAQBX9d3i4i6HbhfDklfQ9EtMnwRTlteuehoQEwpzMH1HFYtMHqE7Fjk
 AknOrSZ4cnHaQ0GauhCYq/wC/g==
X-Google-Smtp-Source: AKy350ZBiltU6M12U7mYWgz4vF5bd6T8M56AU9SKB1YABhbOFhW3Xg2gygAQ+5civX2DQQBoXjo+2w==
X-Received: by 2002:aca:1e0b:0:b0:388:f4de:1ed7 with SMTP id
 m11-20020aca1e0b000000b00388f4de1ed7mr2499480oic.1.1679923186971; 
 Mon, 27 Mar 2023 06:19:46 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 p204-20020acaf1d5000000b003845f4991c7sm11224227oih.11.2023.03.27.06.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 06:19:46 -0700 (PDT)
Message-ID: <b39dc2f5-82b5-5cdc-d2c5-a0fe943ef96d@ventanamicro.com>
Date: Mon, 27 Mar 2023 10:19:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/5] target/riscv: Fix effective address for pointer mask
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
 <20230327100027.61160-2-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230327100027.61160-2-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
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



On 3/27/23 07:00, Weiwei Li wrote:
> Since pointer mask works on effective address, and the xl works on the
> generation of effective address, so xl related calculation should be done

nit: I believe you can remove the 'so'

> before pointer mask.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/translate.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 0ee8ee147d..bf0e2d318e 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -568,11 +568,15 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
>       TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
>   
>       tcg_gen_addi_tl(addr, src1, imm);
> +
> +    if (get_xl(ctx) == MXL_RV32) {
> +        tcg_gen_ext32u_tl(addr, addr);
> +    }
> +
>       if (ctx->pm_mask_enabled) {
>           tcg_gen_andc_tl(addr, addr, pm_mask);
> -    } else if (get_xl(ctx) == MXL_RV32) {
> -        tcg_gen_ext32u_tl(addr, addr);
>       }
> +
>       if (ctx->pm_base_enabled) {
>           tcg_gen_or_tl(addr, addr, pm_base);
>       }
> @@ -586,11 +590,15 @@ static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
>       TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
>   
>       tcg_gen_add_tl(addr, src1, offs);
> +
> +    if (get_xl(ctx) == MXL_RV32) {
> +        tcg_gen_ext32u_tl(addr, addr);
> +    }
> +
>       if (ctx->pm_mask_enabled) {
>           tcg_gen_andc_tl(addr, addr, pm_mask);
> -    } else if (get_xl(ctx) == MXL_RV32) {
> -        tcg_gen_ext32u_tl(addr, addr);
>       }
> +
>       if (ctx->pm_base_enabled) {
>           tcg_gen_or_tl(addr, addr, pm_base);
>       }


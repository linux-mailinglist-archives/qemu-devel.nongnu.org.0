Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA536B20DA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 11:03:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paD6J-0002tO-BO; Thu, 09 Mar 2023 05:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paD6G-0002sc-7H
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 05:02:16 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paD6E-0005xu-EI
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 05:02:15 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so3160585wms.2
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 02:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678356132;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lAqw6PffOJy0fHk9lBNCyL6gaQhFMvaU66Hs2tHyrKk=;
 b=IjEzcsD3sFkPv24Jzfrd52tvAp1jY3CEp1CR/Lk1WmeKrar6G3UfUAX+OlTlnuxYkg
 XqUa3JGnXFGN0SAh11EhiEcWD4se2hensPfWiPaq9Zo5H+SFGR346RBIAHA/GwK6VT40
 MPlL8zey1PC5p7RCOuviPtPv3gBdE+xtxO/VvqcthTlZoq+4FvCRgBAukQfZRrVtX/FD
 IQPNTAqxN1lF43ZwG7RfxQ6cBYnv85O4Uo9QzjAbiFQDtedogIJyQlX+joz6Pe09rIrm
 v5WTK166EVrODjiMy45V8O39Tr8kN98AWmiv0+XDdVMO78cUXXt2c/udgmJtB2iccu3t
 38dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678356132;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lAqw6PffOJy0fHk9lBNCyL6gaQhFMvaU66Hs2tHyrKk=;
 b=bb8J2Csdx5uffGoxt+hG+XyNMG9G7C7ckdMBpRVGcYRgXd1VZ0o71kyee7MhSKVJNh
 cpVIJn9nG7U3s2fp2hj2fXXM+4pmpt7JZXX+eMNS4uXm7wgrYVJbNsfPKCRiWpNaF4wp
 nFj1tXApkGA6oBt6AWRScHEghJl6kAvj+LEblJwoBtq9jVQTc6z6vgWYJBSteCDWXSS8
 LdJakDJL20SpQLQW2uQsuBlZxxJiTYe7NMEAPgRUU05J3sx6C/E6dmdar/i/3gzBRAlS
 eO5uyta6dURYkiIhBDhHDyAtAxblrRxsDPKcvPVwrpOrfZof0mxiv5otRJtqB5+Ze1YQ
 gb3Q==
X-Gm-Message-State: AO0yUKV31aPqxMGqNmNSfoxfyRb0DNnDaDDwA9ziqpR7vo0But5HFmBP
 FWc/i7zBqRHFRhTX/HZzuLN/hg==
X-Google-Smtp-Source: AK7set8J9PdZHd6RGBnQYjC24r3H6S3FL6yONx5i11RiVbupqQN9pM6DF2f/CeVtqAXWUBePYh/pcA==
X-Received: by 2002:a05:600c:a48:b0:3eb:3912:5ae9 with SMTP id
 c8-20020a05600c0a4800b003eb39125ae9mr19262879wmq.24.1678356132702; 
 Thu, 09 Mar 2023 02:02:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c4f8500b003e2096da239sm2222613wmq.7.2023.03.09.02.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 02:02:12 -0800 (PST)
Message-ID: <41353952-6a5e-8b8b-3fc8-022ec1d20706@linaro.org>
Date: Thu, 9 Mar 2023 11:02:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 22/25] target/ppc: Avoid tcg_const_* in translate.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307183503.2512684-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 7/3/23 19:35, Richard Henderson wrote:
> All remaining uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: qemu-ppc@nongnu.org
> ---
>   target/ppc/translate.c | 142 +++++++++++++++++++++--------------------
>   1 file changed, 72 insertions(+), 70 deletions(-)


> @@ -386,7 +386,7 @@ void spr_noaccess(DisasContext *ctx, int gprn, int sprn)
>   static void spr_load_dump_spr(int sprn)
>   {
>   #ifdef PPC_DUMP_SPR_ACCESSES
> -    TCGv_i32 t0 = tcg_const_i32(sprn);
> +    TCGv_i32 t0 = tcg_constant_i32(sprn);
>       gen_helper_load_dump_spr(cpu_env, t0);
>   #endif
>   }
> @@ -400,7 +400,7 @@ void spr_read_generic(DisasContext *ctx, int gprn, int sprn)
>   static void spr_store_dump_spr(int sprn)
>   {
>   #ifdef PPC_DUMP_SPR_ACCESSES
> -    TCGv_i32 t0 = tcg_const_i32(sprn);
> +    TCGv_i32 t0 = tcg_constant_i32(sprn);
>       gen_helper_store_dump_spr(cpu_env, t0);
>   #endif
>   }

Unrelated, but probably better to convert this PPC_DUMP_SPR_ACCESSES
#ifdef'ry to a boolean in DisasContext.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



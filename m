Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03278436D91
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 00:37:23 +0200 (CEST)
Received: from localhost ([::1]:53490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdggc-0004fN-4A
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 18:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdgLs-0000FH-2U
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 18:15:58 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:41609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdgLo-0000z6-JV
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 18:15:55 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so1637871pjb.0
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 15:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jIMviV/8WRjMiMYc6HNy6xVe8GBZmdxM6RBK3aTxqNY=;
 b=aOqbwAKIlS2vcyjdsqFFyWneyzKLX05Ho1sDcezxFC2dD7jZZr3scR8EFwGi/G6maf
 qeDldRzEty/y3P6WkTzMWgW8NtniKkKlxwMnkYgDfx+5ufd3S8C+SJN0/l9wpzNf2JBw
 aek4l6TDvd6cGkGdB9cX6Oo4ZtBHNlpWPMsUiS4+R/m5z+w9Dht3frRX5OuxIdTsW19c
 W+KlGyk5UyFMIT1SaJ9BPHxT4qjPfJO3YYC0NAiw+iukuKWXohzk8ELtmi6ZJWyEGLAe
 RAPpSoL3UT1aXrMDPU9VJZgUO4vfq0bh17iWSlt96egyzejeIV8bLMbcXm7Mx5nCYtdS
 wefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jIMviV/8WRjMiMYc6HNy6xVe8GBZmdxM6RBK3aTxqNY=;
 b=0S7nIeJLZrhphhGtGsMZxQSdKrR9jA7TjpEvlTG/z3PbsfdZxThdwFk0eocfhAZ+BL
 ihn6tZrjpGh+78QJkh/OJ9WoPS8vqKHnB0ES+L/nINxZdXIybifVBPmxZlXNbCEk6c4H
 eSTcuLzslIOMITF85aoHy1gfLbNOphDZmsILsZpNmuWV37GM1XV+1Wner7G0InlTHsvx
 qEZl499RYVA4qeIzE2giWglJ2CzC+hrEPceBASBhj3obgdSFrr4ybltR20/dilXRGg7e
 pIB4/GymoFJ1V3H6KdlXh813LWXrRkDQOgSwxYFRyZyD+s3jx7lFSbO3SHGxcHGM+o7i
 dAeA==
X-Gm-Message-State: AOAM531KSEb8o039k23GOvt5p/5Jv8eXDR4YM3hX6y2weKUUw94nJzV9
 UGpxurMMoHHPiFOx+NC0hOgzWQ==
X-Google-Smtp-Source: ABdhPJzR6Fg71VPT4YkqaG9Sn6oin5K+L5kXt6JoA6SZe4O26APvPSYDtSoBabAZ7fyUsuoOCfaI5Q==
X-Received: by 2002:a17:90b:3850:: with SMTP id
 nl16mr9621945pjb.127.1634854550460; 
 Thu, 21 Oct 2021 15:15:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m28sm6404494pgl.9.2021.10.21.15.15.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 15:15:49 -0700 (PDT)
Subject: Re: [PATCH v3 18/22] target/ppc: Move
 dcmp{u,o}[q],dts{tex,tsf,tsfi}[q] to decodetree
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <20210910112624.72748-19-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <48b7f232-3e21-f7a6-15f4-91994b31d0a2@linaro.org>
Date: Thu, 21 Oct 2021 15:15:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910112624.72748-19-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
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
Cc: groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 4:26 AM, Luis Pires wrote:
> -#define GEN_DFP_BF_A_B(name)                      \
> -static void gen_##name(DisasContext *ctx)         \
> -{                                                 \
> -    TCGv_ptr ra, rb;                              \
> -    if (unlikely(!ctx->fpu_enabled)) {            \
> -        gen_exception(ctx, POWERPC_EXCP_FPU);     \
> -        return;                                   \
> -    }                                             \
> -    gen_update_nip(ctx, ctx->base.pc_next - 4);            \

nip

> -#define GEN_DFP_BF_I_B(name)                      \
> -static void gen_##name(DisasContext *ctx)         \
> -{                                                 \
> -    TCGv_i32 uim;                                 \
> -    TCGv_ptr rb;                                  \
> -    if (unlikely(!ctx->fpu_enabled)) {            \
> -        gen_exception(ctx, POWERPC_EXCP_FPU);     \
> -        return;                                   \
> -    }                                             \
> -    gen_update_nip(ctx, ctx->base.pc_next - 4);            \

and nip.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



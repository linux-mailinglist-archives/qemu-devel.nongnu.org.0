Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24305545483
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 20:57:08 +0200 (CEST)
Received: from localhost ([::1]:53446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzNL9-0005Nf-69
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 14:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzMSQ-0006a3-Ur
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 14:00:35 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:36428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzMSP-00010O-6F
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 14:00:34 -0400
Received: by mail-pf1-x42a.google.com with SMTP id 15so21737580pfy.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 11:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vuvxq4kbXxNpj4VNPWX4gS5U5NGjgIP0ngH3zQGcWt4=;
 b=iEuyLxnQNm47fxMEVnH/o3VbHYZRYKhzLhBd67hAVmR8N2a6YH/rG4JgstgI1I0EY2
 q4JVsCjg+PApU0TD2o8/96nphYD46YQfOvcFogNr9B+OflxTaaHKiEB1WC60QuyVFK/V
 Faz1NPhR19tDRbTzme8n+FH7qbXH/7OdxgKAgxNulkeLnBx25Y8Tn0j3/8BI4o+ohskg
 zkoyvGg9XAqOGmwwt026BpsyIvZV/ZZh04e7l8ebCjw2ooA3+I0c6gZPeo2xJ70lzZFK
 07Kygr3LfGPwhkHup+Xpi/Cv1K15RfXJF5UbL/plSWS3V/TOWPoZ202qc5ZSuEMxVYxz
 oD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vuvxq4kbXxNpj4VNPWX4gS5U5NGjgIP0ngH3zQGcWt4=;
 b=deU/iEkhwSSd78qpxxGg7JsCCICTvyfGqVD9ukZyPi5lEYVyLzW2R5cwAYqHApbg+a
 bvkuSOTZqCAwGf60uRhTS0LnK7J0wauekh5+vfwt19Kv09yXs1Zpo5SDOpkKRm5a4p9z
 wg8LR0Wh32TruBlFXQFZXE9XGE9e1NfSI9uR2P4m3FsfpSPr5eZQX0f4TTnhLuofu2R6
 3pS+afZ8sSx3eO8tp/cDyZA1e/fsx5pNv3uoCwpF6b5wJYtgZ/bgykJ6E/LfYTu6EAn1
 QedDQh5VangwCprecuTX0VoWsFsHWW/WleMbnX703UU/gJBaBLMhssqmAWc23Nmb9WLN
 NT+g==
X-Gm-Message-State: AOAM5334FehnA5pq76Arq2tEpuSqYUsRzgM8EKnqcS9iRavaTWqSbmmD
 pm2EkdoCGjXTigGacR8R+BAglQ==
X-Google-Smtp-Source: ABdhPJzRpR7TkgFqrEal47SGvuwOT7z1NzIZZhUM+gDTvaQmgYGWAptSrus3JPxbYbVlFmcm5TxpCA==
X-Received: by 2002:a65:4188:0:b0:39d:2197:13b5 with SMTP id
 a8-20020a654188000000b0039d219713b5mr35656901pgq.368.1654797631504; 
 Thu, 09 Jun 2022 11:00:31 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:839f:476f:678:38a?
 ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a655181000000b003fbaae74971sm17514472pgq.72.2022.06.09.11.00.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 11:00:30 -0700 (PDT)
Message-ID: <81369530-2c9f-478a-9dfc-1f5f0ba026a1@linaro.org>
Date: Thu, 9 Jun 2022 11:00:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v15 2/9] linux-user: Add LoongArch signal support
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220609024209.2406188-1-gaosong@loongson.cn>
 <20220609024209.2406188-3-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220609024209.2406188-3-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/22 19:42, Song Gao wrote:
> +struct target_sigcontext {
> +    uint64_t sc_pc;
> +    uint64_t sc_regs[32];
> +    uint32_t sc_flags;
> +    uint64_t sc_extcontext[0] __attribute__((aligned(16)));
> +};
> +
> +struct target_fpu_context {
> +    uint64_t fc_regs[32];
> +    uint64_t fc_fcc;
> +    uint32_t fc_fcsr;
> +};
> +
> +struct target_ucontext {
> +    target_ulong tuc_flags;
> +    struct target_ucontext *tuc_link;
> +    target_stack_t tuc_stack;
> +    target_sigset_t tuc_sigmask;
> +    uint8_t __unused[1024 / 8 - sizeof(target_sigset_t)];
> +    struct target_sigcontext tuc_mcontext;
> +};
> +
> +struct target_rt_sigframe {
> +    struct target_siginfo rs_info;
> +    struct target_ucontext rs_uc;
> +    struct target_fpu_context rs_fc;
> +};

This is missing sctx_info.  In the kernel, see setup_extcontext and parse_extcontext.


r~


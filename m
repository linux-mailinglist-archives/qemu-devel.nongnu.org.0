Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F409B54B5CC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 18:19:44 +0200 (CEST)
Received: from localhost ([::1]:55160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o19Ga-0004On-1y
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 12:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o19DR-0001zC-19
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:16:29 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:37715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o19DP-0006Hq-97
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:16:28 -0400
Received: by mail-pf1-x429.google.com with SMTP id bo5so8999856pfb.4
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 09:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=II0aXaAtEYxjr7ejxApDtO1RRv7O6hgaDrP31gn7ZZg=;
 b=Eg73fHlKnhv+oBhbaVwuZqkTTWBkAjEz4gKct/Epf+HPH3l46t/HgFBW9VR3C5cWaK
 TI6V1rfUoG9U8bBo0Dtt29RFG9XKv3uYt0z0xxNjAdfaAbFJ6l63RxHZdqAWUbQ9/wmo
 fFDZ6TikzmvZGRY4AZalFPfuwozBEW00LuQjubsz2abK5vUJxhuYBwvPtrx9/BTAItHF
 xAj6pB8kVi1tb2/WS7zHp6oArjutWrLcBKp+jgDq85+Bywdp9LlqDJrQZW6oi6lE00Go
 8fuRPmEhBPk2Z1jfbnF53A+Z9iZVha+LdsUywD+qNCUWlZd/UuOO1SzucnOT91erQzZY
 8OGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=II0aXaAtEYxjr7ejxApDtO1RRv7O6hgaDrP31gn7ZZg=;
 b=DC/48kkX+eEsgq83h0HhvnFaCa/uOxpba6jf5yCzO7orW2LMl54ovnH4HeRfMFkazR
 ICd7F2TbGZN5pqzTRZz6Hfy6C0lbxTOj+amAPIMnJLpgn7GZBBqIK9ObESZw8UDScg3k
 RBRa/76OCADp34kGWecS8I/20EJYYcRaqhU5elG6cejA4yrl6/phGOg5SZTu7x69VtwS
 2vqGmU14WHbbdg50TnstANl27r5NlEQ17r9/34bjYBRSljmBtYXJs+osAyY5H2e1zkCH
 JJRbqDoyiilHTEQjwBW7TZqM1MXZ3rtB4O4me4Ztiq/h6+wf2uzczLeKfmWNKzMuWL5X
 1/5g==
X-Gm-Message-State: AOAM533plJ/XpinW5hvcufCX4kKZh0vQo/3heSo7wY9zzTXixIhrL3GK
 3zwllDiLY3rrLLoFvxnooKJKRQ==
X-Google-Smtp-Source: ABdhPJyB9cLQT6n79okN8DyW8OW0q6yLvD9J+8i5MO4z1Zu5Jh0OqwCchsmZVV5Z9ynCLoqLzreWow==
X-Received: by 2002:a65:6d97:0:b0:3fc:af2f:7be8 with SMTP id
 bc23-20020a656d97000000b003fcaf2f7be8mr5055354pgb.246.1655223382695; 
 Tue, 14 Jun 2022 09:16:22 -0700 (PDT)
Received: from ?IPV6:2607:fb90:806a:4827:adb5:6bfe:ffa:b215?
 ([2607:fb90:806a:4827:adb5:6bfe:ffa:b215])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a1709027e4700b00168b4b550f2sm7495201pln.54.2022.06.14.09.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 09:16:22 -0700 (PDT)
Message-ID: <a50a74b3-f26a-c3cf-7aaf-12735b712968@linaro.org>
Date: Tue, 14 Jun 2022 09:15:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v16 2/9] linux-user: Add LoongArch signal support
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220614090536.1103616-1-gaosong@loongson.cn>
 <20220614090536.1103616-3-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220614090536.1103616-3-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

On 6/14/22 02:05, Song Gao wrote:
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   linux-user/loongarch64/signal.c        | 283 +++++++++++++++++++++++++
>   linux-user/loongarch64/target_signal.h |  13 ++
>   2 files changed, 296 insertions(+)
>   create mode 100644 linux-user/loongarch64/signal.c
>   create mode 100644 linux-user/loongarch64/target_signal.h

You copied too much directly from the kernel, without changing to match the host/guest 
split that is present in qemu.

> +struct target_ctx_layout {
> +    struct target_sctx_info *addr;

abi_ulong.

> +    unsigned int size;
> +};
> +
> +struct target_extctx_layout {
> +    unsigned long size;

unsigned int -- it only needs to hold sizeof(target_fpu_context) + 
sizeof(target_sctx_info).  Use of "unsigned long" in qemu is generally incorrect.

Both of these two structures should drop the "target_" prefix from the name, because they 
do not appear in target memory.  They are implementation details of this file.

> +static void *get_ctx(struct target_sctx_info *info)
> +{
> +    return (void *)((char *)info + sizeof(struct target_sctx_info));
> +}

Return type should be struct target_sctx_info *.

> +static unsigned long extframe_alloc(struct target_extctx_layout *extctx,
> +                                    struct target_ctx_layout *layout,
> +                                    size_t size, unsigned long base)
> +{
> +    unsigned long new_base = base - size;
> +
> +    new_base -= sizeof(struct target_sctx_info);
> +    layout->addr = (void *)new_base;
> +    layout->size = (unsigned int)(base - new_base);
> +    extctx->size += layout->size;

All of these unsigned long should be abi_ulong.
The cast into layout->addr is wrong.

> +static unsigned long setup_extcontext(struct target_extctx_layout *extctx,
> +                                      unsigned long sp)
> +{
> +    unsigned long new_sp = sp;
> +
> +    memset(extctx, 0, sizeof(struct target_extctx_layout));
> +    new_sp -= sizeof(struct target_sctx_info);
> +
> +    extctx->end.addr = (void *) new_sp;
> +    extctx->end.size = (unsigned int)sizeof(struct target_sctx_info);
> +    extctx->size += extctx->end.size;
> +    extctx->flags = SC_USED_FP;
> +
> +    new_sp = extframe_alloc(extctx, &extctx->fpu,
> +                            sizeof(struct target_fpu_context), new_sp);
> +
> +    return new_sp;
> +}

More unsigned long and casting errors.


> +static void restore_sigcontext(CPULoongArchState *env,
> +                               struct target_sigcontext *sc)
> +{
> +    int i;
> +    struct target_extctx_layout extctx;
> +
> +    memset(&extctx, 0, sizeof(struct target_extctx_layout));
> +
> +    __get_user(extctx.flags, &sc->sc_flags);
> +
> +    extctx.fpu.addr = (struct target_sctx_info *)&sc->sc_extcontext;

This is wrong.  You're missing all of the code from parse_extcontext().


r~


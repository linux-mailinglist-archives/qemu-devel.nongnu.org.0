Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982A3396833
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 20:57:16 +0200 (CEST)
Received: from localhost ([::1]:45304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnn6B-0000sv-ED
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 14:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnn4D-0008Eo-GV
 for qemu-devel@nongnu.org; Mon, 31 May 2021 14:55:13 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnn46-0002yi-Qk
 for qemu-devel@nongnu.org; Mon, 31 May 2021 14:55:13 -0400
Received: by mail-wr1-x429.google.com with SMTP id c5so634903wrq.9
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 11:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XNpu2KSj4XvOKDadL1Zyci5yvwlHGVjMUnN4wbvmGks=;
 b=rOzUjkAZ65lffQiW41mojXOy52xiPfARjU22E6QHKrUaNj0vSSE+0Wl10kP0sVl/xD
 YYxP/J3p8GLXEhTF1RWFfaTisMy4reWuQvQnEnpE4xcXpeu7LTYn8bP0V1z3f2b+eIQ5
 EP9Zt3p+w7fhI48k91zYSMmUCs2Ko6uwKlsO88XrJZ+mtMk75TN9e84EOqdqA7L+BYtF
 +6P8nPazgSW84aW4F8o9NNhrN6ItZ5QIBTJqUO+3Yyqp4OpYbxF0WlMMZGAUCAO2mevn
 IG7qtLImCbqO0pFZd8CgY5nQTDx457fg4alA+ElPX8fjEKtZzDmjfx3W2Jrqk0U5Zhd0
 rwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XNpu2KSj4XvOKDadL1Zyci5yvwlHGVjMUnN4wbvmGks=;
 b=lG7HUsIDFTU6tggOwAeagl6nosKKdmCyH6/xv5453XJUmGF+43s2e4yLMK3ej+hLcG
 R+26A8CYZwbEw1DDLQy0oRdF/IPG8B9hh3L2icV5xrXEOKU2Vn2z5SFZGaMpQmq54Fyk
 tzrRFqcrx2F5JDIfoQN68e0xtwXxq6q1ZGsrgoLrVHmn2i1Yo0JcoBjjtJhKWTYWrp1Q
 WbYfvVIE0ZLi9nEl+pZ95xmRMkrmM25k2dinLYl0V638lLFhh09DLTjkHTsRtZ1JiBLH
 RDBVg0WrOBsXQP2oyj6u+V1IYgeYwm+dav/3JsITJKpnedvF2GKwi3V9z6HjqM09pCOt
 JP9Q==
X-Gm-Message-State: AOAM531iOz+MtmLMKM0chYQoo4DRkEEooAxowZWa3oK9c4SYh68b41SY
 6gtz3OMBz/gPgJGALletpSvHeUj7wTAN7A==
X-Google-Smtp-Source: ABdhPJysfXOmT2/jmQlaegnwK1FlJO+czaRmOqXNdnsc4Yi4inWOth5zE3A3rFMeji7Ds0O2k9cEfQ==
X-Received: by 2002:a5d:4385:: with SMTP id i5mr2420353wrq.233.1622487305223; 
 Mon, 31 May 2021 11:55:05 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id h13sm16676489wml.26.2021.05.31.11.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 11:55:04 -0700 (PDT)
Subject: Re: [PATCH v6 08/26] tcg: Build ffi data structures for helpers
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4ee807ed-5e36-ad86-57eb-aaeaa9b1a04f@amsat.org>
Date: Mon, 31 May 2021 20:55:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210502235727.1979457-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.591,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 5/3/21 1:57 AM, Richard Henderson wrote:
> Add libffi as a build requirement for TCI.
> Add libffi to the dockerfiles to satisfy that requirement.
> 
> Construct an ffi_cif structure for each unique typemask.
> Record the result in a separate hash table for later lookup;
> this allows helper_table to stay const.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build                                   |  9 ++-
>  tcg/tcg.c                                     | 58 +++++++++++++++++++
>  tests/docker/dockerfiles/alpine.docker        |  1 +
>  tests/docker/dockerfiles/centos7.docker       |  1 +
>  tests/docker/dockerfiles/centos8.docker       |  1 +
>  tests/docker/dockerfiles/debian10.docker      |  1 +
>  .../dockerfiles/fedora-i386-cross.docker      |  1 +
>  .../dockerfiles/fedora-win32-cross.docker     |  1 +
>  .../dockerfiles/fedora-win64-cross.docker     |  1 +
>  tests/docker/dockerfiles/fedora.docker        |  1 +
>  tests/docker/dockerfiles/ubuntu.docker        |  1 +
>  tests/docker/dockerfiles/ubuntu1804.docker    |  1 +
>  tests/docker/dockerfiles/ubuntu2004.docker    |  1 +
>  13 files changed, 77 insertions(+), 1 deletion(-)

> @@ -1135,6 +1152,47 @@ void tcg_context_init(TCGContext *s)
>                              (gpointer)&all_helpers[i]);
>      }
>  
> +#ifdef CONFIG_TCG_INTERPRETER
> +    /* g_direct_hash/equal for direct comparisons on uint32_t.  */

Why not use g_int_hash() then?

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    ffi_table = g_hash_table_new(NULL, NULL);
> +    for (i = 0; i < ARRAY_SIZE(all_helpers); ++i) {
> +        struct {
> +            ffi_cif cif;
> +            ffi_type *args[];
> +        } *ca;
> +        uint32_t typemask = all_helpers[i].typemask;
> +        gpointer hash = (gpointer)(uintptr_t)typemask;
> +        ffi_status status;
> +        int nargs;
> +
> +        if (g_hash_table_lookup(ffi_table, hash)) {
> +            continue;
> +        }
> +
> +        /* Ignoring the return type, find the last non-zero field. */
> +        nargs = 32 - clz32(typemask >> 3);
> +        nargs = DIV_ROUND_UP(nargs, 3);
> +
> +        ca = g_malloc0(sizeof(*ca) + nargs * sizeof(ffi_type *));
> +        ca->cif.rtype = typecode_to_ffi[typemask & 7];
> +        ca->cif.nargs = nargs;
> +
> +        if (nargs != 0) {
> +            ca->cif.arg_types = ca->args;
> +            for (i = 0; i < nargs; ++i) {
> +                int typecode = extract32(typemask, (i + 1) * 3, 3);
> +                ca->args[i] = typecode_to_ffi[typecode];
> +            }
> +        }
> +
> +        status = ffi_prep_cif(&ca->cif, FFI_DEFAULT_ABI, nargs,
> +                              ca->cif.rtype, ca->cif.arg_types);
> +        assert(status == FFI_OK);
> +
> +        g_hash_table_insert(ffi_table, hash, (gpointer)&ca->cif);
> +    }
> +#endif
> +
>      tcg_target_init(s);
>      process_op_defs(s);


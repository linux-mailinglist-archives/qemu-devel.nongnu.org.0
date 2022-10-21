Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 063F960755D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:49:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpad-0008HI-Qk
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:49:23 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpZ9-0002nz-0I
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olpYy-0000hS-CI
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:47:40 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olpYs-0004go-Sr
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:47:38 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a3so4358654wrt.0
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 03:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=odLAq4/5m+7AKe3C4arjlLDURYIIwKh0QKDSq1PZAdA=;
 b=jFvtBZfPHNYEOShTmgiPYzCoSQGLFWNVovq9rkfwtHC5A2DbWyeavZ/+oc0B/AF8DZ
 k1qZiHsLMcwH6KwBbXJxJ458C+ix9NOmd4qcZiGtrnTwmW/0HWW8X3lSeRdykU3KjNo8
 OE39aHA8tGlufhcYaVSC14DfJZ/R9DfLNy9upq2mu3J9XSf2sT6HXJusEfN6tNuFMYoJ
 1KNA2i6TVydJzyqZZwFuhzY4TbjMf+XnkEh3Zt06adDVhp6EN7yoh4YsRXaYtbDqtRum
 jvR31HHBTLJxeGO5z4kFCNulBLfAoh4x3mcFSQiotbszcUMg7V+Oe7tgARUTa3hZ+L9I
 mItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=odLAq4/5m+7AKe3C4arjlLDURYIIwKh0QKDSq1PZAdA=;
 b=CgGfTCXcayNCqHKKOBLcZdXaBZyEtr6dh725gAUr55KR+ZjMoCK6YkpLUqsbc3UJ9k
 vKjaK5+K0crLfwgGrqu6GP8ssVqRpneGyhAUTceOcS0P+lW1Egd39UiHr46bOp6dF0xY
 9dZ81dPmbwB3npOlcVNp2FWtxvm5ftIEQjuh3FPLLqSrJzhVlsNM2dqlv5DA9mN+ZDbo
 nli6lyv5NnL7W0Pv+g31IDjBCCddddjf6nC1FUPicAL3pbuSfGgJGKmwPkwPMacmTHXS
 APIUNTY5xrd+NQNPYQ+WpPqKPqSQ8K5wsscclpLFy3gDeM5Cg1L17wXj4IImCn2+h3PL
 /c4Q==
X-Gm-Message-State: ACrzQf31sCYcjuFj6O0GK6QH3TjJFZFnYNgJMFmVrvU3irYHaAIyQS1d
 MKTzD+l3lvFluVfJhwpLgHIPGw==
X-Google-Smtp-Source: AMsMyM7zw+iYhZ+IDKi1Uu+xSZg1qz0ysbxlGa3UV/o/AdOwfbfq68ENUevCGzStMt5viWyI792QFw==
X-Received: by 2002:adf:e711:0:b0:236:2f7f:4f08 with SMTP id
 c17-20020adfe711000000b002362f7f4f08mr4903312wrm.375.1666349252708; 
 Fri, 21 Oct 2022 03:47:32 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a05600c4e1500b003a83ca67f73sm2314762wmq.3.2022.10.21.03.47.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 03:47:32 -0700 (PDT)
Message-ID: <56c357ca-c481-5a69-6bc2-5579c0bf4503@linaro.org>
Date: Fri, 21 Oct 2022 12:47:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v2 33/36] tcg/tci: Add TCG_TARGET_CALL_{RET,ARG}_I128
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
 <20221021071549.2398137-34-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021071549.2398137-34-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/10/22 09:15, Richard Henderson wrote:
> Fill in the parameters for libffi for Int128.
> Adjust the interpreter to allow for 16-byte return values.
> Adjust tcg_out_call to record the return value length.
> 
> Call parameters are no longer all the same size, so we
> cannot reuse the same call_slots array for every function.
> Compute it each time now, but only fill in slots required
> for the call we're about to make.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tci/tcg-target.h     |  3 +++
>   tcg/tcg.c                | 18 ++++++++++++++++
>   tcg/tci.c                | 45 ++++++++++++++++++++--------------------
>   tcg/tci/tcg-target.c.inc |  8 +++----
>   4 files changed, 48 insertions(+), 26 deletions(-)

>   static ffi_type *typecode_to_ffi(int argmask)
>   {
> +    /*
> +     * libffi does not support __int128_t, so we have forced Int128
> +     * to use the structure definition instead of the builtin type.
> +     */
> +    static ffi_type *ffi_type_i128_elements[3] = {

static const.

> +        &ffi_type_uint64,
> +        &ffi_type_uint64,
> +        NULL
> +    };
> +    static ffi_type ffi_type_i128 = {

static const.

> +        .size = 16,
> +        .alignment = __alignof__(Int128),
> +        .type = FFI_TYPE_STRUCT,
> +        .elements = ffi_type_i128_elements,
> +    };

> @@ -499,26 +496,27 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
>   
>           switch (opc) {
>           case INDEX_op_call:
> -            /*
> -             * Set up the ffi_avalue array once, delayed until now
> -             * because many TB's do not make any calls. In tcg_gen_callN,
> -             * we arranged for every real argument to be "left-aligned"
> -             * in each 64-bit slot.
> -             */
> -            if (unlikely(call_slots[0] == NULL)) {
> -                for (int i = 0; i < ARRAY_SIZE(call_slots); ++i) {
> -                    call_slots[i] = &stack[i];
> -                }
> -            }
> -
> -            tci_args_nl(insn, tb_ptr, &len, &ptr);
> -
> -            /* Helper functions may need to access the "return address" */
> -            tci_tb_ptr = (uintptr_t)tb_ptr;
> -
>               {
> -                void **pptr = ptr;
> -                ffi_call(pptr[1], pptr[0], stack, call_slots);
> +                void *call_slots[MAX_OPC_PARAM_IARGS];
> +                ffi_cif *cif;
> +                void *func;
> +                unsigned i, s, n;
> +
> +                tci_args_nl(insn, tb_ptr, &len, &ptr);
> +                func = ((void **)ptr)[0];
> +                cif = ((void **)ptr)[1];
> +
> +                n = cif->nargs;
> +                tci_assert(n <= MAX_OPC_PARAM_IARGS);
> +                for (i = s = 0; i < n; ++i) {
> +                    ffi_type *t = cif->arg_types[i];
> +                    call_slots[i] = &stack[s];
> +                    s += DIV_ROUND_UP(t->size, 8);
> +                }
> +
> +                /* Helper functions may need to access the "return address" */
> +                tci_tb_ptr = (uintptr_t)tb_ptr;
> +                ffi_call(cif, func, stack, call_slots);
>               }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



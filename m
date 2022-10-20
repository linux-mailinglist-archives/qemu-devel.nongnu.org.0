Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22426606BBB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:55:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleRy-0001BB-1c
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:55:42 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleG3-0004Go-8x
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oleFp-00045J-7k
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:43:11 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oleFn-0003Tc-Gr
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:43:08 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 u8-20020a17090a5e4800b002106dcdd4a0so4907901pji.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+qMAZU+8K8LKe6MRvtmm2CGlGk1f+50xJsKGSqzq7uk=;
 b=QWSxB2svz9tSfdmtGrKO3zrR/bQNHE2UdeM8zFHGVwrcZjHH27livfvkRm+232UcNI
 gQeQYKpvj/rbyzQuaQW75XpuvZXCbmY88OsJaae2mO8oJh64PjIECQgk18lgHZteNodV
 S/v56QrmqnjSzZG1JVdw2LuOr7peqQuzZExFJpx8MpaQ8fBPWBiVm3t9hXz2euINT/p1
 3OEfLEnC4LdNTeG3LpcaYQHPbtvePWt5zpgb8XYkOmCsQZWNxb+CbJey5EBau5KbT4ro
 1oXgRYWlATwiMlHPoFBAb3Nn7qPg6WjDHvmWXrYnOmKKIwTe5SV76NQRJcMqLzyJxk5M
 eH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+qMAZU+8K8LKe6MRvtmm2CGlGk1f+50xJsKGSqzq7uk=;
 b=uUPtN0eiGIcV+SDXZ2wqZ0PKtHH15F+uri3FS5LflRBtTm0Rv2seG81IklatOJrgrC
 oIPnKqmjrOjUriiS89K4JDJOgbvmCcA1JXRK6aVt/By76sHD/2ru931Tkxvndg6qF3hB
 TYeaOOfcArqt7ryCaxUZ7WkUimC8oRy1rvpIMfXRnn/XnuUwY2oYg9eeHEF7hmNyptXQ
 6ynHgZq7cMl9FeS0+vUOa+qhX1adZ7pbwQ92U3Rm4imwCL5ngAg0p8xgye/wxAPdOZVj
 5zTNM+gLggkH+yEJS6MqAQm/OMunnsFpKKaJXqjzV1MiQVDfnbgwcnhbNWuIRrNRAtVt
 0LwA==
X-Gm-Message-State: ACrzQf2z9Vc3NzEdibluOHeBfIkLqHaPMKWwaJktDN7fpJipf2PFaMri
 SOOoLjF6HaD1FTtg80A8f4p0Aw==
X-Google-Smtp-Source: AMsMyM4urWgxJLvULcy53b7y+4Ei8DYAjo36XobUBziss3nuZS05pM4KOBcrlt4TsgjQnFyDPPHCjw==
X-Received: by 2002:a17:902:ed53:b0:186:6ad3:c155 with SMTP id
 y19-20020a170902ed5300b001866ad3c155mr3852130plb.43.1666305785856; 
 Thu, 20 Oct 2022 15:43:05 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a17090a4d8900b0020adf65cebbsm432756pjh.8.2022.10.20.15.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 15:43:05 -0700 (PDT)
Message-ID: <9a9fea07-2242-5aff-ea94-cfc119207f09@linaro.org>
Date: Fri, 21 Oct 2022 08:42:58 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4] tcg/loongarch64: Add direct jump support
Content-Language: en-US
To: Qi Hu <huqi@loongson.cn>, WANG Xuerui <git@xen0n.name>
Cc: qemu-devel@nongnu.org
References: <20221015092754.91971-1-huqi@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221015092754.91971-1-huqi@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

On 10/15/22 19:27, Qi Hu wrote:
> Similar to the ARM64, LoongArch has PC-relative instructions such as
> PCADDU18I. These instructions can be used to support direct jump for
> LoongArch. Additionally, if instruction "B offset" can cover the target
> address(target is within ±128MB range), a single "B offset" plus a nop
> will be used by "tb_target_set_jump_target".
> 
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Qi Hu <huqi@loongson.cn>
> ---
> Changes since v3:
> - Fix the offset check error which is pointed by WANG Xuerui.
> - Use TMP0 instead of T0.
> - Remove useless block due to direct jump support.
> - Add some assertions.
> ---

Queued to tcg-next.

Fixed a minor nit:

> +void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
> +                              uintptr_t jmp_rw, uintptr_t addr)
> +{
> +    tcg_insn_unit i1, i2;
> +    ptrdiff_t upper, lower;
> +    ptrdiff_t offset = (ptrdiff_t)(addr - jmp_rx) >> 2;
> +
> +    if (offset == sextreg(offset, 0, 26)) {
> +        i1 = encode_sd10k16_insn(OPC_B, offset);
> +        i2 = NOP;
> +    } else {
> +        tcg_debug_assert(offset == sextreg(offset, 0, 36));

This assert is smaller...

> +/*
> + * PCADDU18I + JIRL sequence can give 20 + 16 + 2 = 38 bits
> + * signed offset, which is +/- 128 GiB.
> + */
> +#define MAX_CODE_GEN_BUFFER_SIZE  (128 * GiB)

... than the correct calculation here.


r~



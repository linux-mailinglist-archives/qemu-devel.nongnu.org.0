Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8420E3D3479
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 08:13:04 +0200 (CEST)
Received: from localhost ([::1]:42254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6oQh-0001Yy-5J
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 02:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6oPZ-0000tq-7h
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:11:53 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:36748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6oPX-0003Zc-It
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:11:52 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso7537087pjb.1
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 23:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NQUfeb+/5zYDGxcF0eAUPXrHlI1vnA5m3ZYcFDSUpVQ=;
 b=Dm47gF6OI9yvBWHr2tC1/KYsuyvWrI++EIB8lbgUSA4eCQwKSvJp+wV73E3BrhMdtq
 dvpYwh+BySQV/0LCoGZpwW0mR0Da8voREHzq22wy3AJq6hQcbzz66btB2UZX5zhPozgc
 8I5q0K4QIo+G/6eQ9ROz3m+BiqcJF6QSTaeSsb5dMLeMoQgg01rSXgm1E+AGEsp7gzbe
 za8fqzvvuwOHv67UNoEmMcGiLUbmlKIgWcokF3FyROpeRyOR2ElvjcmJDs8vroGVfcj3
 9wiQTuomcP2eaYBBT69bnsaeODgp3JiJRNdZEsMRZ8FdCAhHBcK5eNE4JsxCy27QLojW
 SoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NQUfeb+/5zYDGxcF0eAUPXrHlI1vnA5m3ZYcFDSUpVQ=;
 b=i3CIz1fW6G4JtAHvprBjqBqUhQ3P3zY1/JVl+7RZWgsA0PEgIvZqwSexYxdac3yRGY
 CmLfvm7xvq1iFXYaxjLV6ZjUQF5gG89H0k0NTp6JSF5iR4GyNm2RSiiB7OJyJC0kW8Q1
 rOenI+dHy9LgV7XXCL2O/7hmX+LJqLpw3e9jTPBEHe4+pHw7deSDXlAN2mxse3N/cqjY
 MYSmWPmqbOl3ZDldwcIU+fStrRbb7GTKnhokvPzK6me7tZrhlCA1F7ktvM7ZDMCwRvH1
 DY9LqGt6ecn2WbdfeNgy4KDWcEi4QfsYRfAemNEzpF8uAbyA9ZUaLXfjDKDxRhjok/FA
 WHfA==
X-Gm-Message-State: AOAM533drJz7HQ8LE/JFn3NSjUFwHnhdDD6KQo21qRtbbgU29Xl3+M4D
 GMcUb/xAqN3BWHXWaaMG7EY52A==
X-Google-Smtp-Source: ABdhPJxb67a9DlH/KCscusQgs8myMvw5mKObTFhBNzQE7ZUo3Ah2Vz0aDrbAP+s5t8+HOkPHmKBuiw==
X-Received: by 2002:aa7:82cb:0:b029:2e6:f397:d248 with SMTP id
 f11-20020aa782cb0000b02902e6f397d248mr3056686pfn.52.1627020709651; 
 Thu, 22 Jul 2021 23:11:49 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id l12sm3713594pff.182.2021.07.22.23.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 23:11:49 -0700 (PDT)
Subject: Re: [PATCH v2 14/22] target/loongarch: Add floating point comparison
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-15-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e0a368a3-3f43-f5b9-b36b-7f9919148b77@linaro.org>
Date: Thu, 22 Jul 2021 20:11:45 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626861198-6133-15-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, laurent@vivier.eu,
 maobibo@loongson.cn, alistair.francis@wdc.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 11:53 PM, Song Gao wrote:
> +void helper_movreg2cf_i32(CPULoongArchState *env, uint32_t cd, uint32_t src)
> +{
> +    env->active_fpu.cf[cd & 0x7] = src & 0x1;
> +}
> +
> +void helper_movreg2cf_i64(CPULoongArchState *env, uint32_t cd, uint64_t src)
> +{
> +    env->active_fpu.cf[cd & 0x7] = src & 0x1;
> +}
> +
> +/* fcmp.cond.s */
> +uint32_t helper_fp_cmp_caf_s(CPULoongArchState *env, uint32_t fp,
> +                             uint32_t fp1)
> +{
> +    uint64_t ret;
> +    ret = (float32_unordered_quiet(fp1, fp, &env->active_fpu.fp_status), 0);
> +    update_fcsr0(env, GETPC());
> +    if (ret) {
> +        return -1;
> +    } else {
> +        return 0;
> +    }
> +}

I don't understand why you have split the compare from the store to cf?

I don't understand why you're returning -1 instead of 1, when the result is supposed to be 
a boolean.

Alternately, I don't understand why you want a helper function to perform a simple byte 
store operation.  You could easily store a byte with tcg_gen_st8_{i32,i64}.

> +uint32_t helper_fp_cmp_cueq_s(CPULoongArchState *env, uint32_t fp,
> +                              uint32_t fp1)
> +{
> +    uint64_t ret;
> +    ret = float32_unordered_quiet(fp1, fp, &env->active_fpu.fp_status) ||
> +          float32_eq_quiet(fp, fp1, &env->active_fpu.fp_status);

You're better off using

     FloatRelation cmp = float32_compare_quiet(fp0, fp1, status);
     update_fcsr0(env, GETPC();
     return cmp == float_relation_unordered ||
            cmp == float_relation_equal;

Similarly with every other place you use two comparisons.

Indeed, one could conceivably condense everything into exactly four helper functions: two 
using float{32,64}_compare_quiet and two using float{32,64}_compare (signalling).  A 4th 
argument would be a bitmask of the different true conditions, exactly as listed in Table 9.

Since FloatRelation is in {-1, 0, 1, 2}, one could write

   return (mask >> (cmp + 1)) & 1;


r~


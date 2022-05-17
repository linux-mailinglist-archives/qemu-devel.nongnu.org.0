Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF3852A86C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 18:45:37 +0200 (CEST)
Received: from localhost ([::1]:49140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr0KB-0004Np-EE
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 12:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr0I9-0003Zj-EC
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:43:26 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:45800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr0I7-0005m5-Th
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:43:25 -0400
Received: by mail-pf1-x430.google.com with SMTP id y41so17344061pfw.12
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 09:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sY75N/SnIWqWMEGpJNVBJ3FLWp9SbPu/gwv9KyH/gyE=;
 b=U6a2FaO7yq4AB0CzhHpk+dS1/7/D+od+DUGTZnNCYHTcSt0gdshMqXVU7yqO7aYbES
 5L56JMLPeHi7ADS3pFMcf3I4NJzridzP/VhuUXb7Id/Wie0ugIR5EbzJWsraGqjepfzl
 /QrVLVXhWeNAy4xg3pUIDejMAreRc2MfMDqx9nfP02pz9dNS6cNVWtGsdJHE2ZcOHNss
 MOqV3pv7XaxOEAa+NvH2ajMNMyA1+faCEARGgfBHdrQ+96OpaJ4VqW+gfACl/4htpgRO
 uWofIdRS9Z3QzeLQ+DYTtbfjAKZ+vXLbdlRm7adkVFyOt19rAci3VgHL/FaqKvYxJfBy
 lSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sY75N/SnIWqWMEGpJNVBJ3FLWp9SbPu/gwv9KyH/gyE=;
 b=xfvZEyXff2634sRulTFThz0dh+TLK7m1K8pwJRJElIfgp+Yn4q8gIquVV2vcjvsSlK
 s1f+wTCERZEHMMI7D8T8PMf5RXquV4g1g+6P2fb/HnV5/19+Xn7I6v+SbB+3QaT+AmSx
 JK/oWQo4CZeY9Dqi/a36KNq10Jy23R02HXUFrA+NEw0WxwQUfI1fbgDuhVfjEuJOznwC
 ysIlBihZUNl6k4bti5eQOtZwhjn2SnWFtDU8jndndGjDnAVhRIyhK6FcCZIjrnIIvZkq
 edQY7OcINdz01FLuW+Wi4ZaOvQLro6GEwTO4jA0CwtKNZjQkcpa6eCO40aNRoWmHHOmX
 VSKg==
X-Gm-Message-State: AOAM5310F7lhbE6gFDRtGKXgC0vcYpHVINjQ/mWwib6h3Udf008utP87
 gx/u1JT1oxNZmM9LOFPNZQ000g==
X-Google-Smtp-Source: ABdhPJy/2J9Q015AcUIYgH+FGRfIb60D6TfWdJpMERQ46w5TGEz+CHPmPXuxv4m9gXbeyVkCgAPh9w==
X-Received: by 2002:a63:e416:0:b0:3c6:8d10:ea37 with SMTP id
 a22-20020a63e416000000b003c68d10ea37mr20161918pgi.319.1652805802411; 
 Tue, 17 May 2022 09:43:22 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a170902ea4700b0015e8d4eb289sm9304498plg.211.2022.05.17.09.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 09:43:21 -0700 (PDT)
Message-ID: <e1c6ca41-df28-0787-928e-56bc313f730b@linaro.org>
Date: Tue, 17 May 2022 09:43:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 05/12] target/ppc: Use TCG_CALL_NO_RWG_SE in fsel helper
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
 <20220517123929.284511-6-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517123929.284511-6-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

On 5/17/22 05:39, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> fsel doesn't change FPSCR and CR1 is handled by gen_set_cr1_from_fpscr,
> so helper_fsel doesn't need the env argument and can be declared with
> TCG_CALL_NO_RWG_SE. We also take this opportunity to move the insn to
> decodetree.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c            | 15 +++++++--------
>   target/ppc/helper.h                |  2 +-
>   target/ppc/insn32.decode           |  7 +++++++
>   target/ppc/translate/fp-impl.c.inc | 30 ++++++++++++++++++++++++++++--
>   target/ppc/translate/fp-ops.c.inc  |  1 -
>   5 files changed, 43 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


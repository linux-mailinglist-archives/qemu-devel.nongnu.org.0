Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522186D2E5D
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 07:21:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piTfR-0004j4-63; Sat, 01 Apr 2023 01:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTfP-0004iu-QX
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:20:43 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTfN-0000a4-Q6
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 01:20:43 -0400
Received: by mail-pf1-x434.google.com with SMTP id q20so4946861pfs.2
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 22:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680326440;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JPoJr9dAxB5FKe6gbYlLM9zemS1Z8ptHQ95ZAHMgRSQ=;
 b=uBeRgkn76+sL+9lj7sRdPBAG4mqMPc6VibfJltjRH3j32tYEzK84THUmYcMnAjh9Ar
 qC88CoTaKao3ZFle01xsa34fzChb4LupXh+ZgA1gG8mV2n1u6wjzAbKjBWxhkBlNToND
 wzIpVw4Lgsgx0aJJpKY73Dbl1S7kUTBobepLSXUJPU5X9ppIVRoDPgmnJw90DlCZER1x
 cdL02sUZRtuB0I8R1kE/zejnaii2y7TGWQKCbFl8vJ7c/Cl5Wm1OmNkyrf6K9wJUTt6q
 mNbdevibXjO5kQQ2YsVZssb1aH+Z0ZPKQZSWGgf9jABkDrd7sUHC5IPiW4iCA4r86tKd
 JjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680326440;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JPoJr9dAxB5FKe6gbYlLM9zemS1Z8ptHQ95ZAHMgRSQ=;
 b=wy0HA9au25dtbqYTDfFOWT+MitjqcSoClPRmd+GjI6jxXaJ9CGJwZJ5sZS7fxJ4pdE
 BvSbK/oeMqDw5isUho0ro9+zRlROSFUzFmAt3wdA8+DXfxzSBhOF/MEeAMs+hroAa+Rq
 oPtsbEFY9cvdeSFFNguHJAe+cDi67n6+0okfbtRULl1cE6bxynAPDeHnbie63kHX2C8o
 ae7RWxGF96WxkI+FujVIHysNZ+oF2mXZD4m49QdroaYY5esQIseC6DytWXqgl4TDJXg+
 MZXdtbyL1mbBpjIDUO3lNNBF87rGVaf5dGy+g8+n53rEwQR3fDXMEkaEjW41k85ZSI/q
 +0Yw==
X-Gm-Message-State: AAQBX9c7ZY0/geDhISd1FQTTyBArL7phviTpagnBV961fBhzS2fhz6IT
 Vi912j23qyRTofjiTyOaZVFAIJ88cirf8l6Gwh0=
X-Google-Smtp-Source: AKy350YaNrYBlIHk5ZTQy8jWCLaKCf9q33IK0NDTmIX9nBIfYMCthxz2tk1P8SGCopxiF1I75SGcJA==
X-Received: by 2002:a62:585:0:b0:5e0:a86:a76f with SMTP id
 127-20020a620585000000b005e00a86a76fmr26436050pff.0.1680326439723; 
 Fri, 31 Mar 2023 22:20:39 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 65-20020a630444000000b0050fb4181e8bsm2464292pge.40.2023.03.31.22.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 22:20:39 -0700 (PDT)
Message-ID: <d45bc806-9d9e-5640-af80-a83761b8eb65@linaro.org>
Date: Fri, 31 Mar 2023 22:20:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 21/44] target/loongarch: Implement
 vmskltz/vmskgez/vmsknz
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-22-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-22-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

On 3/27/23 20:06, Song Gao wrote:
> +void HELPER(vmskltz_b)(CPULoongArchState *env, uint32_t vd, uint32_t vj)
> +{
> +    VReg temp;
> +    VReg *Vd = &(env->fpr[vd].vreg);
> +    VReg *Vj = &(env->fpr[vj].vreg);
> +
> +    temp.D(0) = 0;
> +    temp.D(1) = 0;
> +    temp.H(0) = do_vmskltz_b(Vj->D(0));
> +    temp.H(0) |= (do_vmskltz_b(Vj->D(1)) << 8);
> +    Vd->D(0) = temp.D(0);
> +    Vd->D(1) = 0;
> +}

Better as uint16_t temp, instead of a full VReg.

> +static uint64_t do_vmskltz_d(int64_t val)
> +{
> +    uint64_t m = 0x8000000000000000ULL;
> +    uint64_t c =  val & m;
> +    c |= c << 63;
> +    return c >> 63;
> +}

No mask or shift left required.


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BEA655AE7
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 19:08:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p98vp-0006LJ-VV; Sat, 24 Dec 2022 13:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98vo-0006L2-7q
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 13:07:36 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98vm-0005wd-Hq
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 13:07:36 -0500
Received: by mail-pl1-x634.google.com with SMTP id 4so7609379plj.3
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 10:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KLqMcv/pshFSNmf5DFTOj4LYp3xdfvtqY2D3mScUeoM=;
 b=KtNfiDx9n6maB8OF0rV7vGn0uHcjGYWRgN8eUSbPQLagCtrTtgCJRQWO++9/GJ8tsP
 gIDEY/kyJNsg01c596QWsvXD4yPNi7e7SV+F8X3o+36RvIHevisleGOAB+IJNtAgrSol
 h80kcfn07uOrhS1zyAnjoFOTakbhS6mbnn/RNKZe75biS9QEVNZ80cCX+KUTwyb+VDkc
 ac1B7P+FCYS1EUBwiss7d4Az81MDuD0tEs3uLs+z2xulmP4pSqxTOe5AhKu1OfGjvSsL
 Zt56X1CfQOZSDlk34FimeVEQIo5PDMDt6jBCNxRCtlPyye/R+PPtkCLFR/FeI2WkvuSk
 VEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KLqMcv/pshFSNmf5DFTOj4LYp3xdfvtqY2D3mScUeoM=;
 b=LhLjZ1ZwVCyn8Zd5ZVFfIrBz8jiLnts8bJRyzITuVSsz6bzIdEQj30nEDzfqt5+c6K
 zn6IOhY0F4gcMsWte7dVyV27xotI91PCuLHYNwbrzuAT3d+L+Q6NaWIQu3qhEV8l9WEL
 W2v+eA3xVJycWzzkvLvH2j/LfEhUBm7C0Nhsu2TTlQg0uq6AtipTGsfcVJdI86l2MUGx
 pSM3xf1uZkZh8iw9TwDjcO5Iz8DgMKZaRgZEj48HAoInDTxWbj2FyBmmxt5r4uDF3++T
 9F6bXpi2uhcdEvCtMalgXZpzLk7OYLigPpiK2/4NSSAVq3HoRjpY3llMJGY/IudR32nP
 Yhpw==
X-Gm-Message-State: AFqh2kqU2UokayodVO+XtMbX5O91L1BSqD9Rkk2c0NCWNujRk3aQa09L
 xYl6mluE5+bXJSi/bHyFcr9zC+9lqfVrOkSY
X-Google-Smtp-Source: AMrXdXtVJD8g+mYPQfDFnuM1/rrE0DxfsMps+DduAWY8Ezj0o2Unova9uTZMXpKekQ/BPTNsAOjWNg==
X-Received: by 2002:a17:902:7891:b0:191:3c62:3be8 with SMTP id
 q17-20020a170902789100b001913c623be8mr18465953pll.4.1671905252320; 
 Sat, 24 Dec 2022 10:07:32 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a170902e49200b0018157b415dbsm4409609ple.63.2022.12.24.10.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 10:07:31 -0800 (PST)
Message-ID: <10925cbb-3113-b915-ce7a-3f9867119606@linaro.org>
Date: Sat, 24 Dec 2022 10:07:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 15/43] target/loongarch: Implement
 vmul/vmuh/vmulw{ev/od}
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-16-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-16-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 12/24/22 00:16, Song Gao wrote:
> +DEF_HELPER_4(vmul_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmul_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmul_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmul_d, void, env, i32, i32, i32)

These are tcg_gen_gvec_mul.

> +DEF_HELPER_4(vmuh_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmuh_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmuh_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmuh_d, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmuh_bu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmuh_hu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmuh_wu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmuh_du, void, env, i32, i32, i32)

These, sadly, have no generic equivalent.  We should probably create one, since several 
targets have it.  E.g. do_vx_mulh in target/ppc/translate/vmx-impl.c.inc.

> +DEF_HELPER_4(vmulwev_h_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwev_w_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwev_d_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwev_q_d, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwod_h_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwod_w_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwod_d_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwod_q_d, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwev_h_bu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwev_w_hu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwev_d_wu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwev_q_du, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwod_h_bu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwod_w_hu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwod_d_wu, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwod_q_du, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwev_h_bu_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwev_w_hu_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwev_d_wu_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwev_q_du_d, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwod_h_bu_b, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwod_w_hu_h, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwod_d_wu_w, void, env, i32, i32, i32)
> +DEF_HELPER_4(vmulwod_q_du_d, void, env, i32, i32, i32)

Similar to widening add: shifts, and, mul.


r~


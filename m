Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C946F6066A2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:03:11 +0200 (CEST)
Received: from localhost ([::1]:57990 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYwh-0005ed-Mf
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:03:03 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYt1-0004lQ-9K
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olXgU-0004rV-Pk
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:42:22 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olXgI-0001Ca-VQ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:42:05 -0400
Received: by mail-wr1-x435.google.com with SMTP id j7so35232447wrr.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 08:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wOYa1LXM8I6r3p1mu8TN6w2/2PLb2q2wAD/Wleu1URU=;
 b=MBjQGuI38cQpiPOl/oOGPP6S9KH3stxGcTQrlong+WieXFP1DfanV148DNRdOhgrTf
 PkVOycoHvkEJGT1EF2vKmPZ4uWulqhipVymMAvxWXafDqRLCizMs50kYjt3+Ib7FNIne
 eSGrfkye6Q91GV+CfFzHubzNuYxFfRdu4pgxWU21RCIoIW77pZuuCGizp0QKJWMtWRxd
 DXsigBxe/pUW7/22DhE8DJWhZtdB+7kzdYvhhKN2+cZOsm6wKEma30vwKdUaSRkbw/dn
 zU8X/G1JrKvP4pq0Ph+JQkSXZzugJtpV18l/X7FDlq6holOrBLLPQ+RzHPasMkpOctFC
 rGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wOYa1LXM8I6r3p1mu8TN6w2/2PLb2q2wAD/Wleu1URU=;
 b=cmLmVVZNh7omAhKZL1Tprkp6C1z6ADVKdaU8o/D1VFx2y0pxntoaKHKvlh34a2LK0i
 wPc+Z4urcCmyMEHrcM8Fp43Jnp3MoRrE/rk/wULN0QIy33jmQAQTFJb8iSUSv+zYuFtE
 Sn0rhpaf2Mz0lHIrvVo1pdOjS2fOEOhc1pcQ9rxgNalDEdt5OTa8l9dv3hqdCnF14jsu
 QEU4WIAy2qwmZDfvANwH4naNZMFgwHbthVV9VGzdc8SsHwdxtHNH5S/nTnF3cZiGFAa6
 ZN1nZ30BZgXYPbm1G/rLEgzq9tx/tnHu8oXLQYVsn4tF54FPi8z1FMnDYUogiDNZyaHP
 iKfQ==
X-Gm-Message-State: ACrzQf2DkquE0wd7juD2tNPt/cTaCuhE25Cbxq/MDWvRQBejx5/8dnlS
 dEgnjsr6px+GDmoP6bcLeBhTyQ==
X-Google-Smtp-Source: AMsMyM7OeAcdMn3QzFEBDr8flWl7/Z1rcCEL4U5KpZ4KUV/F64cWTSjRLQZAn3DH/QZ5Wv0Sd9KdYA==
X-Received: by 2002:a5d:6d81:0:b0:22e:6070:3c04 with SMTP id
 l1-20020a5d6d81000000b0022e60703c04mr8507981wrs.442.1666280519797; 
 Thu, 20 Oct 2022 08:41:59 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 bv16-20020a0560001f1000b0022e6f0d0d7csm20007091wrb.18.2022.10.20.08.41.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 08:41:58 -0700 (PDT)
Message-ID: <8e083193-b04e-79bb-2994-60d7f2e75e35@linaro.org>
Date: Thu, 20 Oct 2022 17:41:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 20/31] tcg: Add TCGHelperInfo argument to tcg_out_call
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
 <20221020115242.2301066-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020115242.2301066-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

On 20/10/22 13:52, Richard Henderson wrote:
> This eliminates an ifdef for TCI, and will be required for
> expanding the call for TCGv_i128.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        | 12 ++----------
>   tcg/aarch64/tcg-target.c.inc     | 19 ++++++++++---------
>   tcg/arm/tcg-target.c.inc         | 10 ++++++++--
>   tcg/i386/tcg-target.c.inc        |  5 +++--
>   tcg/loongarch64/tcg-target.c.inc |  7 ++++---
>   tcg/mips/tcg-target.c.inc        |  3 ++-
>   tcg/ppc/tcg-target.c.inc         |  7 ++++---
>   tcg/riscv/tcg-target.c.inc       |  7 ++++---
>   tcg/s390x/tcg-target.c.inc       | 12 +++++++++---
>   tcg/sparc64/tcg-target.c.inc     |  3 ++-
>   tcg/tci/tcg-target.c.inc         |  3 ++-
>   11 files changed, 50 insertions(+), 38 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



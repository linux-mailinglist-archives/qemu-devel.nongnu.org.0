Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468CF643D9F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 08:27:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2SMG-0007py-JV; Tue, 06 Dec 2022 02:27:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SMC-0007pi-3a
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:27:12 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SMA-0004L4-B1
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:27:11 -0500
Received: by mail-wr1-x42d.google.com with SMTP id q7so22191172wrr.8
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 23:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HRSaOZYj+KT3+f8N4eTFkb8U15WYFia5w3tGQscNlOA=;
 b=ZUS5xa1nLPv/wZuNMUm8uBbkuxqq4O1LpOKPGi4QPZBW4RW4Nbznmz8PZUdJOnWDde
 OJESx43CvVy2voD+gEDEC3zconcBwH4UVxv4nbBe6mhiEQInPhSfuYTqc8vnP72mrmg8
 tYJEyDMGH0nYLzN+TyINbDyYg6z9Cdyxa6+Jw4gKTmenDDvA2an5g0WXfQq4dV74vgeb
 XhU5hbOgZhzkLF4f2b7ea/BlhWxt02Tt67eyP8P08nS4jbNMfRDR+tLmyiK7Ts2bkHrF
 aFIw/yqcMPboom2ad6uBfD95zIfCvK9SsfmzsoYkwoByfBiDwDz5RgwkS4qvNCtRfP2k
 sjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HRSaOZYj+KT3+f8N4eTFkb8U15WYFia5w3tGQscNlOA=;
 b=PUqBL6WgFdeBA2R24zzMXmoB1s4eI3/hhPIT/Y9RoRjzAkJC/iwvqddJ24awqBoJB5
 3pd+kCg32QzAA3AWtWL4a2pVt1vOHBFYjLAQN808tYI9+F5S/8GWy3NXWHWmGGfNKJMh
 xNADMbxHSFg9bcjb2bLmayeisRlNpKSrVPq4CiGhg8EGxrooS7EyU/kucuIDDRAIL4lI
 A6FCZtMvWtscbCBX8JugiZOQlmK+MyaGnwoMQ7P6jwARAeBSGmEel0MuZubcpHbwJEcN
 7BkaPwWWU4odbCnoVWR3BGBONExVAE9ZQeqdYEyXd5Vh64kSZIqx8FjOHJ+AwrJf5Fs8
 HwSw==
X-Gm-Message-State: ANoB5pm6knSGtLd1KZFIDtEBtevadophoUi4EBJriik1FKCQlgD6FL81
 Oo3tnvQ4cTDAQJZNCuhUwrfsu6d5FfMvnYv5z60=
X-Google-Smtp-Source: AA0mqf4WzbRKsGWRcuV6hypmfOFFlCFZCt0J4aq5qY2b0e95GR3JrgFP1vyudIl9oB7XtJmNsRIruw==
X-Received: by 2002:adf:ee83:0:b0:242:4d4c:eb92 with SMTP id
 b3-20020adfee83000000b002424d4ceb92mr8717544wro.356.1670311628669; 
 Mon, 05 Dec 2022 23:27:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l5-20020a5d5605000000b002367ad808a9sm15862168wrv.30.2022.12.05.23.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 23:27:08 -0800 (PST)
Message-ID: <004cfa29-c02d-d808-58fd-10a3c5bfb36f@linaro.org>
Date: Tue, 6 Dec 2022 08:27:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 05/22] tcg: Replace asserts on tcg_jmp_insn_offset
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: r@hev.cc
References: <20221206041715.314209-1-richard.henderson@linaro.org>
 <20221206041715.314209-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221206041715.314209-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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

On 6/12/22 05:16, Richard Henderson wrote:
> Test TCG_TARGET_HAS_direct_jump instead of testing an
> implementation pointer.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/aarch64/tcg-target.c.inc     | 2 +-
>   tcg/arm/tcg-target.c.inc         | 2 +-
>   tcg/loongarch64/tcg-target.c.inc | 2 +-
>   tcg/mips/tcg-target.c.inc        | 2 +-
>   tcg/riscv/tcg-target.c.inc       | 2 +-
>   tcg/s390x/tcg-target.c.inc       | 2 +-
>   tcg/tci/tcg-target.c.inc         | 2 +-
>   7 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



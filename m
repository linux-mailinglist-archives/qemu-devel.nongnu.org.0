Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBE560AF05
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 17:27:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omy2g-0005Wu-28; Mon, 24 Oct 2022 10:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omy2d-0005Vq-CQ
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:02:59 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omy2b-00029T-NL
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:02:59 -0400
Received: by mail-wr1-x429.google.com with SMTP id l14so9184288wrw.2
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bljLdfhmJthx/tvR2xfyD52X/qEajo1iEt34f7Ao2e4=;
 b=CEMHwKFhePmIsm100ree0ugdKJCP2S8IrX0dVYAPm1w+S0rfl0wTY/AJUjjUKnDjnV
 iuxoExMLmoXkT0uuyu2ygbWQu5YQfk7TMktyJcTpWF4YNgQ0jFbY3u0qs3hum74t46ki
 yvKUETFjs7rep97U3DV3e3WUMQOWneTv63/10TT6FqibRvzVoQDbxAfP05TwS2jD3iQU
 6ayCN/ESjxqUjn/Sitef38kD0+URYC7NXJ3QFOueuQBgVjRBUZeJESJc7z9uznEuQSHn
 3R3ENMcvo30chL+XaHSOej2k4xH7BRg52X9Feu+/hIt0U0MASHudyJ+Yf2qlLrDp7Mur
 +83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bljLdfhmJthx/tvR2xfyD52X/qEajo1iEt34f7Ao2e4=;
 b=Nm2+yRrhN6HSWpBBWrKbsS5+0uoXBLOolZ1yRdNrXa5mVVs23JUwwAsUxVN55CriDO
 0wQM7mFZYF9UqNZ9tVIa26wbl/NruYtV5WYIyvYCGT94boBGMRGfEn+ALh0aoOF3UUKb
 xgO/90DIX1otofm/QQ5xbKuar4E8s6Zvu/IfKeYWrv5moHisxDz3+8silj4ILAqJq2r9
 CP1FevFJW1gVHdzkRJe70wfrdhfKHncC6A5rQOapwPhlqUhFYvX5EvNAtv/U6AXYDfDN
 MlHnYHr9QmXi5oAMCUTkRMDuA5zhEqrw6EscfL78lRPU6fCEPlSzn9h22BR1+P19NChs
 JIoA==
X-Gm-Message-State: ACrzQf28bj6BKWnx5UlWEY6BOErr880FhfRsU7CMcpjz5lCEtpHT7y6f
 QtTzt+u5i9PdgOOQqwAgV1hAgsLUQgEKEg==
X-Google-Smtp-Source: AMsMyM4QNmr+oWdinsXclkqAzXt0ZKni1DUOuR9gOXv9Jpn8pfmF5pr9ipX9F8tM9+wi4qp53J5Nsw==
X-Received: by 2002:a05:6000:ca:b0:236:6e0d:6ecf with SMTP id
 q10-20020a05600000ca00b002366e0d6ecfmr4741040wrx.440.1666620175656; 
 Mon, 24 Oct 2022 07:02:55 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 y12-20020adffa4c000000b002367af7a41bsm298983wrr.96.2022.10.24.07.02.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 07:02:54 -0700 (PDT)
Message-ID: <dfe6a503-9a69-a579-037f-e22bb99344b8@linaro.org>
Date: Mon, 24 Oct 2022 16:02:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 12/29] target/mips: Convert to tcg_ops restore_state_to_opc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/10/22 15:24, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/tcg-internal.h | 3 +++
>   target/mips/cpu.c              | 1 +
>   target/mips/tcg/translate.c    | 8 ++++++--
>   3 files changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



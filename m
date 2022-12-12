Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4D264A9F4
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 23:09:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4qyb-0003m7-Pq; Mon, 12 Dec 2022 17:08:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4qyZ-0003lu-UW
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:08:44 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4qyY-0001TY-4M
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:08:43 -0500
Received: by mail-ej1-x635.google.com with SMTP id kw15so31816127ejc.10
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 14:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2WmoCr/Xi4fbqecB4PtHDPenWdsUAep4FsPmGm6450A=;
 b=qCEuEsjrS5uQ8q/RzLwnU4FRMlCn7fhnM7atzNq+fSPSUQ6KcMR8ybY0MiVwEbMo17
 Dm1g9l3KI97gI0lTENg6211rQYF76+dkr4IST5rV93XI9gWWXQGgOSAtV9jx5xUetX6A
 2upGKJnla9ev722ImysDdDmfkMApG87FDlKdWycCs+npBFDV7sFukdETUdgF7QHs0QbC
 iIY33IKrtjSjEagFftHLp8fEizOdwmyA2zoV92ZI8he63BX695sM6xcqIS9EmqOfBlvB
 R3pUTyq5KpCMYVq2GZ0MPbpQwiiBUI6Q2tE9eeeVpyJ7vHjpQTxE2DI123wyWYWIwXM4
 yeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2WmoCr/Xi4fbqecB4PtHDPenWdsUAep4FsPmGm6450A=;
 b=4m+B7qmg68h+fo3f3MZ6l8EEoPTQxro3yDv1slUKid7zFXVGnBlMrmGpi8O6Ide4cj
 1R1E142uWQY/5fH/CKyY7txUMxfjq7IjcH0g3JyUBSOjSjIcTOEo8IfTUcrbPvl8+WDk
 1WusVl9DHNlOrQPxExzdsC9AKCGWQCBtevR47qwskT7Mc6E1EQa4xcavauDNYXdmoUGh
 x3tNxOaVPBaluBgjjm996S88xrixLAiCX30/TUfNG87O7jN0gFlB/k7oo78vL1V2Z9Nu
 Epc+lsMH1NwG393N4KC1kN58IETuajtmeCs0GcsWFEByBqznF41yUo5ja18qHwtT4PbC
 gvvw==
X-Gm-Message-State: ANoB5plCG/Du4O7GNzNGsgcktQUk/2zC4A/VcYv6rwq76Csyuc701D65
 Ho9iMAkNZyn+pVhKg/pPog7OSg==
X-Google-Smtp-Source: AA0mqf413iAMPT16asY7mcpx7/zK4uTZvvlqhA+a7YvdgYdMuQYRGszvcqS9l3VR9sEpi2pc3bRYtA==
X-Received: by 2002:a17:906:3f90:b0:7ad:943a:4da0 with SMTP id
 b16-20020a1709063f9000b007ad943a4da0mr14259339ejj.21.1670882920371; 
 Mon, 12 Dec 2022 14:08:40 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ss2-20020a170907c00200b007c100eba66asm3745356ejc.77.2022.12.12.14.08.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 14:08:39 -0800 (PST)
Message-ID: <25e681a5-1dd8-b864-c5fd-c15672a871c7@linaro.org>
Date: Mon, 12 Dec 2022 23:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v4 09/27] tcg/s390x: Remove FAST_BCR_SER facility check
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: thuth@redhat.com, iii@linux.ibm.com
References: <20221209020530.396391-1-richard.henderson@linaro.org>
 <20221209020530.396391-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209020530.396391-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
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

On 9/12/22 03:05, Richard Henderson wrote:
> The fast-bcr-serialization facility is bundled into facility 45,
> along with load-on-condition.  We are checking this at startup.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/s390x/tcg-target.h     | 1 -
>   tcg/s390x/tcg-target.c.inc | 3 ++-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



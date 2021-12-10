Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB63347011A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 13:59:57 +0100 (CET)
Received: from localhost ([::1]:59344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvfVE-0000ge-JE
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 07:59:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mvfTa-0008BO-Kp; Fri, 10 Dec 2021 07:58:17 -0500
Received: from [2a00:1450:4864:20::435] (port=34429
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mvfTY-0005rO-2V; Fri, 10 Dec 2021 07:58:13 -0500
Received: by mail-wr1-x435.google.com with SMTP id j3so14840859wrp.1;
 Fri, 10 Dec 2021 04:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S51R8KQU1cBOnXPwqJJkmA4O8gi7UXtjJhCmpZ7dBo8=;
 b=mqiQVMIVHKFof9gJqZY7pijJpBulzBCzM2pUeEu1ljRE2Y0jBsjYDGzxbpVYslyWRF
 mIHNR5IUW1Wf4zaDC3L90wvvD3rwx70e8wuzFcZzcMU9lZmjEs2pJUQ4ORFaMSYuX71X
 ul9EZFSixp45+9KEruWzZSNyTEvsjFT0guc+sM24xabAPBnZd7GIvKRhfP212NENv83I
 D+CfIO6lrppygKg868KC+Jbc8cu0h7VEQFiAVFbkxsuzoNZJ71Yjmwb3pUsei55OlIyL
 ws20tebFc38LmCgPesS+s8x9uq0Qm3KVF0Pfrr6uac/m6S1VKExWbDISNVcO1mOVHc1a
 dUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S51R8KQU1cBOnXPwqJJkmA4O8gi7UXtjJhCmpZ7dBo8=;
 b=y2OsAPa3tBszggDIFL3nVWn1L1Tt5arjCM0lirLWeUSSteDIE8tU03HvtC6W5iVw5y
 8ezFYpWt0ibYkaVxMB2Lk4lUDdZd3RUbiW7JEiDUgKGqBOuVqTzGOu3wF8DRH7jTwOgY
 xp8dQIDMEs3oJlnSRRi3/4pNY0cDcRBryrjPnC3JKhqllSbbDd8KlgjLI++HL5mHOjRY
 WXmwYU5C5cDrxAEffOAg8VhYspTNq2S55CeDl9JNxRHa86zqzxwMu6NTv8ZxRbyEMvDP
 HKzTtVtGpZ8jjukZqwLuZs+7zoy05IjhMh0PMIlxjXHWCCof8RZhO/hx0bmyWltaoGAL
 f8Cw==
X-Gm-Message-State: AOAM531R3o74LR31/gfHv9mLMOUnZT8LBG+2MRXebWXMNKIGCpTPSG0+
 2A16LatP5WHgRgSc6CsO9mM=
X-Google-Smtp-Source: ABdhPJwtCzCahoPYhdnwGtMwhSnhJtQTkImZOfYnKCDbf1RSMc/Pq+xFVpUPI+zkRNyzem6amUcc2w==
X-Received: by 2002:a5d:4a85:: with SMTP id o5mr13659367wrq.109.1639141082942; 
 Fri, 10 Dec 2021 04:58:02 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id g19sm12132550wmg.12.2021.12.10.04.58.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 04:58:02 -0800 (PST)
Message-ID: <e0871dc9-e721-27be-737d-c4270b65e4d8@amsat.org>
Date: Fri, 10 Dec 2021 13:58:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1] Add dummy Aspeed AST2600 Display Port MCU (DPMCU)
Content-Language: en-US
To: Troy Lee <troy_lee@aspeedtech.com>, qemu-devel@nongnu.org
References: <20211210083034.726610-1-troy_lee@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211210083034.726610-1-troy_lee@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.317,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 leetroy@gmail.com, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/21 09:30, Troy Lee wrote:
> AST2600 Display Port MCU introduces 0x18000000~0x1803FFFF as it's memory
> and io address. If guest machine try to access DPMCU memory, it will
> cause a fatal error.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> ---
>  hw/arm/aspeed_ast2600.c     | 8 ++++++++
>  include/hw/arm/aspeed_soc.h | 2 ++
>  2 files changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


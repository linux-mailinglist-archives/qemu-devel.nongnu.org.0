Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018C6572777
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:40:07 +0200 (CEST)
Received: from localhost ([::1]:58908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMft-0000vL-4n
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUx-0005b4-U7
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:48 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUw-0004q2-Iw
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:47 -0400
Received: by mail-wr1-x431.google.com with SMTP id a5so12738337wrx.12
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=heQH4jN/K5nV2TeLUp2bJ6gP9mgNPPrXZkJr58tD9UQ=;
 b=pbNWG+Zl9S7Cy6mWmxuWBe/0E1d8yNozwxFXV70Ncqo0IRKHdw1b9ovmZiU9KsfEZA
 mpP4OykjsPPRsUigx80iwFGu2O8o5TlbX3VMEs8Vx6zpeE9HqlzkoNL4KRdVMETY3ZHT
 qdjoXJ2tPqSSNVvEjin6/wNiqArNf8CYOWK5o5zR0q0Ib9ob4piMr69Z1WmYAyTcC65C
 U8iiKtdGX+NA5BnOkuF4u3v/mcjo+OunJw+6dWZV7BOFo4ad+Qo2x8bcjvkUZean2nMo
 CjjSn/fGNEol22AqsqFNKezZ7NT8W1sh+HsGVHLSIPXMbuXFslnz8icd4vEF0AJ2xC6a
 6RyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=heQH4jN/K5nV2TeLUp2bJ6gP9mgNPPrXZkJr58tD9UQ=;
 b=GejS1I1V/+t8tm+nWdIgmS1ensIXe5Mov4PLIBFNzTu/Rem+uv22NwXh8xGZ0wMYNV
 mQgf7twNJRDtEWP3yRlaMp5TPHlTo7ITDNl2sCinZ9O4qUWhMb06e7Se4Ku/NGW3MBlY
 ImTrRmT/153wHsZFvR2mj+TN9ZvqZ7WqB1Dg8PJ37gB1bA4UIwHGwcFihz4j2DDwm8+E
 hO/miCH4n4tBjfpwJvewcCTReS34+iaw9eOHr8+ngfV5BGv5/u+Ixln5MHJCegFY37kX
 mS6B1eUZ+jl3kEYIUDqmxBWMYs1lcN4iZ+O90DtPih+F7cVTUo8ZYQ34PvCzxUiRxiv/
 1fMw==
X-Gm-Message-State: AJIora+MNlyG52GyKK80xIJ7srNX5PpUJO4XB3XSKQD2oTRulc1JXCBP
 Xxa6ZpcqsqFSP6adiqYvzaI=
X-Google-Smtp-Source: AGRyM1vpCRXGH9lyUmX1tRAntW79c2vMpFcLY1X2AJMMH6JsaDDesxkcZXs0KfLcVvf8J5pFyMAYOg==
X-Received: by 2002:a5d:5885:0:b0:21d:ad15:30be with SMTP id
 n5-20020a5d5885000000b0021dad1530bemr7821062wrf.90.1657657725978; 
 Tue, 12 Jul 2022 13:28:45 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j42-20020a05600c1c2a00b003a2e9bdfcf8sm51214wms.5.2022.07.12.13.28.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 13:28:45 -0700 (PDT)
Message-ID: <d8318571-5656-f692-b03f-8f6fb10977d6@amsat.org>
Date: Tue, 12 Jul 2022 22:25:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v5 4/8] target/mips: Avoid qemu_semihosting_log_out for
 UHI_plog
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com
References: <20220628111701.677216-1-richard.henderson@linaro.org>
 <20220628111701.677216-5-richard.henderson@linaro.org>
In-Reply-To: <20220628111701.677216-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 28/6/22 13:16, Richard Henderson wrote:
> Use semihost_sys_write and/or qemu_semihosting_console_write
> for implementing plog.  When using gdbstub, copy the temp
> string below the stack so that gdb has a guest address from
> which to perform the log.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/sysemu/mips-semi.c | 52 +++++++++++++++++++++++-------
>   1 file changed, 41 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


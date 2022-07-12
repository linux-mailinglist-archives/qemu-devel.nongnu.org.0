Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4F4572769
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:37:54 +0200 (CEST)
Received: from localhost ([::1]:54844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMdk-0006Uu-MQ
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMV3-0005hq-6x
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:53 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMV1-0004q2-SP
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:52 -0400
Received: by mail-wr1-x431.google.com with SMTP id a5so12738589wrx.12
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3+wwgHyDkz+Vq2rv2NhF1oYmznzZPHhxPs67D19g6wI=;
 b=HAr7edcjMkvTyAcm8n+HNvOqTduU0R4XQB34Vm/BJssmW7Vio4G0GRZ0ApI/+zL0f5
 ae2h0CpL1INtYR/rMgYQDaiHhke2vkUavQWN+QgZXqFAu66/gA7U8m9keWhkNP0R1bo+
 dfohL5zvvHNSKwDZHfudbQVoCXhvCeXCr3OOn5WqZDzCY1Iy9Fu7FJQ8IkSfiSOQkKps
 S1xK6Lw70R0Ps1xCwrJ1S/irQj425esgcp5lOL+li9lLwoqiIhem9wx/ufLhMZaRZgBY
 aPwb+c8CBLDkzeMl2JXhzZU4E/PQe29EJH+OIzENd/2pZUJRNA+BBpgQ9Mk+/RP+m3dg
 caCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3+wwgHyDkz+Vq2rv2NhF1oYmznzZPHhxPs67D19g6wI=;
 b=INOdK2cZ0crS7MBTCW4Wx+c/zPbiR+FRdwtMMwLo/xUiizN1VIsaip6NPBEieM5GF7
 LovhLmYj9MSE/Mm6Q+I5flvcftu5pohS23ZVta8uGMpN307rvUarrS1QpLvhaG/+s4fE
 1Wm1Z7QG0HKmCvR+9BMPX+bImvoRArIZC7seasDI+1/fkpDsi9YG/PIH/Ddnoz2C5P3z
 loI/SacRrkX3pUrh/eiLrjDd7YD53+iB6vjO2K43dLOW3jXdR2UxDOWs04OayFhc2gFJ
 AUKBxIo+9aYsLH9JJa5fl+4Ak5I1tg55T2UZ8gCPkFwDV4vNLYmLojIFYF3kMQi5yp3J
 c3hg==
X-Gm-Message-State: AJIora/92+8gRCYxyw2y79OOkkeFafs0NYRv4ssnGvGOA70cCz08dV64
 1Ge/C//dP4GMmTrXIys3qOY=
X-Google-Smtp-Source: AGRyM1sHJUPYHP8W6kYlCQS/OJP5a781Jr4XR389goXfkPab+YKysV8rSMHFr2CNavc7b0uHI5BpGQ==
X-Received: by 2002:a5d:64c7:0:b0:21d:a742:5e2c with SMTP id
 f7-20020a5d64c7000000b0021da7425e2cmr11464430wri.178.1657657731233; 
 Tue, 12 Jul 2022 13:28:51 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a5d538f000000b0021b5861eaf7sm9316503wrv.3.2022.07.12.13.28.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 13:28:50 -0700 (PDT)
Message-ID: <663f0947-1105-7f72-675e-6371d44c38a6@amsat.org>
Date: Tue, 12 Jul 2022 22:25:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v5 0/8] target/mips: semihosting cleanup
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com
References: <20220628111701.677216-1-richard.henderson@linaro.org>
In-Reply-To: <20220628111701.677216-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

> Richard Henderson (8):
>    target/mips: Create report_fault for semihosting
>    target/mips: Drop link syscall from semihosting
>    target/mips: Use semihosting/syscalls.h
>    target/mips: Avoid qemu_semihosting_log_out for UHI_plog
>    target/mips: Use error_report for UHI_assert
>    semihosting: Remove qemu_semihosting_log_out
>    target/mips: Simplify UHI_argnlen and UHI_argn
>    target/mips: Remove GET_TARGET_STRING and FREE_TARGET_STRING
> 
>   include/semihosting/console.h      |  13 -
>   semihosting/console.c              |   9 -
>   target/mips/tcg/sysemu/mips-semi.c | 397 ++++++++++++++---------------
>   3 files changed, 186 insertions(+), 233 deletions(-)
> 

Queued, thanks!


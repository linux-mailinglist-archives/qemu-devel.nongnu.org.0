Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A616F441D15
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 16:03:54 +0100 (CET)
Received: from localhost ([::1]:42066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhYqn-0000Gr-EF
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 11:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhYpj-00080B-C6
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 11:02:47 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e]:40632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhYpg-0000FF-OL
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 11:02:47 -0400
Received: by mail-ua1-x92e.google.com with SMTP id e2so32339486uax.7
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 08:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7f5wSpRzGX9yVi1nztApwMSmtom4D1EwcSo9K0JZ0U4=;
 b=EDQaKa+gaHY1ltdazXQyAQ0LLqD8JjXNjtwLfAliU1wJubTaZlnnZbpfS1DNLqb7bB
 RrMVL3XH4xufamWugSlCCBjOXSBYrEpRyN1MptZ3VPKwG9TSXSFKVkKr91D1fxSZrUJd
 0EikFapea+Su/5DtpuBG7Xm7DHnRcT7sA2/YEfNsy2gD5/c/rZf8y2esMbMNDeyZtlTK
 cVrPCm2wOPEU5sWID6flQx/12WramIxS1pdkqRUFc3norLeWlLOFwruNlDJfY0vhC8kc
 38lGd79jH7rVIHwKWOQvELWyuOJfEC0uK67RtRrHRxyMgwBPbThlVxIVf2lcfGoe69cS
 fkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7f5wSpRzGX9yVi1nztApwMSmtom4D1EwcSo9K0JZ0U4=;
 b=W1zqbLrYcMSCQUssLyuYaYkmluXbltbvOruBzCiPYjIpvLYQEEqCJ61J5SGbKE7Ynq
 mPJJhNTkpDOb5GRfxSnt7BuK1SVyw1Rab2y5A/Gi+EwiP1sa12V0pbblfD4OnQhnqV5H
 dTsvmsoz60paNl6+YgAd/w24l3T/VTKiUy/B7X5jBnwdGintSt60YunjYmgkVqVH0dhn
 gdbggLn2yQn+95G9VDDQr0/Z7LnbMilFD3W/VWiuFgLF7x+I3MmEp1tgqxeOzLNFIiGR
 byGp6OYUzo+p0iu/MnlV+GPA5RldKUKBj5IucH24kRdkIYgNsJ/ZCjQsxgTBEf5UUglc
 5U/g==
X-Gm-Message-State: AOAM532E5mBWopy7dRk3bA/dce7/Wa1SaJaAoGFa4BniEV+B1F5N7b94
 3tUCkqFd9LH5Ox3zsUUZXXI8fkJJl+tIgw==
X-Google-Smtp-Source: ABdhPJyJQ95/AaX+wKDycNqGnb93Ox5tlGlfRHLdcSOGMrvUQUvQ7UV2DombWS5kt0LVskhurU8tRA==
X-Received: by 2002:ad4:57a9:: with SMTP id g9mr28723315qvx.46.1635778953347; 
 Mon, 01 Nov 2021 08:02:33 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id a11sm5077573qtx.9.2021.11.01.08.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 08:02:32 -0700 (PDT)
Subject: Re: [PULL 28/30] Hexagon HVX (tests/tcg/hexagon) hvx_misc test
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1635698589-31849-1-git-send-email-tsimpson@quicinc.com>
 <1635698589-31849-29-git-send-email-tsimpson@quicinc.com>
 <e1d3d003-f287-7f82-d604-6f43b0d9c55c@amsat.org>
 <2f35d0c6-0ba7-b911-56db-c1ed9ae4afbc@linaro.org>
 <SN4PR0201MB8808814113CBE84889CD5234DE8A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <3e93e507-da92-0a1c-346b-ebfde27168fc@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d2395c92-4ece-31a3-8bd6-24345c946780@linaro.org>
Date: Mon, 1 Nov 2021 11:02:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3e93e507-da92-0a1c-346b-ebfde27168fc@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 10:17 AM, Philippe Mathieu-Daudé wrote:
> On 11/1/21 15:09, Taylor Simpson wrote:
>> Plan-A should be to update the container with the new toolchain.
> 
> IIUC Richard is going with Plan-A: wait Alex queue get merged,
> then retry merging this pull request.

Correct.


r~


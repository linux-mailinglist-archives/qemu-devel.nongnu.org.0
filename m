Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CDB35A201
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 17:30:11 +0200 (CEST)
Received: from localhost ([::1]:58718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUt5G-0004rF-2A
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 11:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUt3p-0003Zg-G8; Fri, 09 Apr 2021 11:28:41 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:37549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUt3m-0006w1-Tu; Fri, 09 Apr 2021 11:28:40 -0400
Received: by mail-ed1-x52a.google.com with SMTP id s15so7028879edd.4;
 Fri, 09 Apr 2021 08:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+PcFtvgS/H1OuNkpXEruorytMDgYsldeOiA9KrjFnO4=;
 b=B5y5gw4QQ/1U2ra8ycW6hPOKVTnSd139PaGNARL79dLQ//DTYw1Dg6OrqIwUN2IU+q
 eZsG8Q1By1Zjp4neoGIKzYXDz2fAYWDAKdB8StiLzv7u5nW+cfUh5GiKIiXwJAnQ9fXp
 HkHI0O/Z6Y/XCELQ6Dv+5oEyQd24aAdpkTk5L6FpT8qEZulJcTJK//a5ekjDZzjo+l/3
 vnP3uukAE70JL6AacFqHBu7YSRTf87ygPw9ME7+WyUmLj2Mr8kozboo61lk+g5T2tK8F
 h6JmrgkzAPL10hF+7v32VPC+menIDS0g67djdw5N05Uwexuw03vA+cpzlfCFRFnlIhGu
 mLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+PcFtvgS/H1OuNkpXEruorytMDgYsldeOiA9KrjFnO4=;
 b=PkphhvCwfKzCmofcT1w5TwcDk6KrHox761i3sHrpINIIYNAZdOXyQ43SF1ppPoK58i
 tTKEAKpy/6hbRi4Rn0+dQXi0BdFu4uu8difuZMH7/qqg/JvqrYFgRYIei6k3yu3HDaJ+
 /Htyx/VqNbELl9gh7hVpIWPUmghkL/4kB+Eozhg9w2QuH99uMYBILsp/GlM6VtomCV8J
 TCanX9qVXgJRs2UGmxidm/NXvW3Kaflu8WLmG8L4SXaMWX9Ybd0XqH5PZlu/KsoTZ+zc
 md4D55PA17SSep5B5rX2IvbY2JMPytLrkIb4p3TU72WY+DMBJDvBny5ro/gFQRcZPbST
 eWRQ==
X-Gm-Message-State: AOAM530LwdHhf+xHVWibSHp36P0Y9sXc7gxUT6l6HimuUZ+2KwniL3tu
 FKZoad3sSDwqNyjTQeFAjTM38+zkcvPQdg==
X-Google-Smtp-Source: ABdhPJyb1sUhcK4sbLIUD61Z0b74rfssTsLRlmqvBKw1Z9LsnVsKfMBtD54NF/R8Ewlk2pKaqPid4A==
X-Received: by 2002:a50:ed08:: with SMTP id j8mr18515644eds.351.1617982116573; 
 Fri, 09 Apr 2021 08:28:36 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id cy5sm1672008edb.46.2021.04.09.08.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 08:28:36 -0700 (PDT)
Subject: Re: [PATCH for-6.0 1/2] hw/arm/mps2-tz: Fix MPC setting for AN524
 SRAM block
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210409150527.15053-1-peter.maydell@linaro.org>
 <20210409150527.15053-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7a8f28e9-ad01-6798-787f-398cf5befa54@amsat.org>
Date: Fri, 9 Apr 2021 17:28:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210409150527.15053-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 4/9/21 5:05 PM, Peter Maydell wrote:
> The AN524 has three MPCs: one for the BRAM, one for the QSPI flash,
> and one for the DDR.  We incorrectly set the .mpc field in the
> RAMInfo struct for the SRAM block to 1, giving it the same MPC we are
> using for the QSPI.  The effect of this was that the QSPI didn't get
> mapped into the system address space at all, via an MPC or otherwise,
> and guest programs which tried to read from the QSPI would get a bus
> error.  Correct the SRAM RAMInfo to indicate that it does not have an
> associated MPC.
> 

Fixes: 25ff112a8cc ("hw/arm/mps2-tz: Add new mps3-an524 board")

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/mps2-tz.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



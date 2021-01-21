Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815872FF5C1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 21:24:01 +0100 (CET)
Received: from localhost ([::1]:51084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2gUq-0000If-KH
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 15:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2gTH-0007rQ-A0; Thu, 21 Jan 2021 15:22:23 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:38913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2gTF-0004lB-KO; Thu, 21 Jan 2021 15:22:23 -0500
Received: by mail-ed1-x535.google.com with SMTP id b21so4027351edy.6;
 Thu, 21 Jan 2021 12:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BUyioOXyxpJhXE0jFgEZtyk4nWwaFvEEbfgUCv81KuI=;
 b=O5NZF3QfRB3617JnvXplSyMWVTbQ/mCT1XL3cX8JmJOK+hUbCUUpNvkewty9eShycf
 Tq2CKFMuWksEnfcjC80kopq87CL19GJutG8FKtTxXk4JVJwBXFNK7GN/Yeh//rs0BssJ
 /6HEkxFJCYaYZI0NHNNkvjRowYR1V1LSSJ5iBBrxd+ksHnza9KEjxOpWZ1wwG4ycLI37
 sSskUn8VmVCjSMBWpU3Es2N0zjore/gE8LE5C7s9ffLONi5M8WbxLwPl5FoRHlS21yQM
 7oaelFcpjGCOPOcqz72Dl/nWfy88IvNPful8I+o1wnjmJPuELkeJPBZVvcydL5Q5p27K
 3K4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BUyioOXyxpJhXE0jFgEZtyk4nWwaFvEEbfgUCv81KuI=;
 b=Qei1pEwBUctAoG7NlLieNZo8qGe6uq3eTvM4IDsRq96djzWHMgowxLEvQ9v0VZnwcf
 D/IpqXYCHDSyiyTEIhe/iQirQ+42JUB/gIAGZnlNGbbZgyvRHV1lQkDuizh4/CeUrTQt
 ZVgbfVnkWnV6jdPFHg6dqAGoO8wOMXJzdXtSlY7VieQCbdn1t+/+8Nly5IeHRfRdQ+Jf
 BmhEXhhwa/rLXvFeQpmfMnfjqocpKetI2bOWKh5FgHie5TTraXbfjq0WKl0aL+u5eGmw
 au1n/MFiGFn5c0/ITy1tA5ZCHuMA12TYv5rOiuVWZzfV74lYOTbc2Rf759TsBP8l19Yl
 eimg==
X-Gm-Message-State: AOAM530qeVwfuu28ERVT/wj+yonIzFoCRqb6RdgrlouhLd26iuM5gqy5
 UzZhej5LLuWHuoxRK07srGE=
X-Google-Smtp-Source: ABdhPJzijagVKMsogEnOALFE5wDW0CahpFbUT/UHzc/M5Lr2nQmhQls0Gd/QYuFi90eYg+BATZyeyw==
X-Received: by 2002:aa7:d94b:: with SMTP id l11mr696768eds.1.1611260539945;
 Thu, 21 Jan 2021 12:22:19 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s1sm2710726ejx.25.2021.01.21.12.22.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 12:22:19 -0800 (PST)
Subject: Re: [PATCH 07/25] hw/timer/cmsdk-apb-timer: Add Clock input
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <197be2f1-7f89-4669-bf65-2d175753ac5e@amsat.org>
Date: Thu, 21 Jan 2021 21:22:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 8:06 PM, Peter Maydell wrote:
> As the first step in converting the CMSDK_APB_TIMER device to the
> Clock framework, add a Clock input.  For the moment we do nothing
> with this clock; we will change the behaviour from using the pclk-frq
> property to using the Clock once all the users of this device have
> been converted to wire up the Clock.
> 
> Since the device doesn't already have a doc comment for its "QEMU
> interface", we add one including the new Clock.
> 
> This is a migration compatibility break for machines mps2-an505,
> mps2-an521, musca-a, musca-b1.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/timer/cmsdk-apb-timer.h | 9 +++++++++
>  hw/timer/cmsdk-apb-timer.c         | 7 +++++--
>  2 files changed, 14 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



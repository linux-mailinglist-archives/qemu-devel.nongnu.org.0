Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23652FF5DA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 21:29:36 +0100 (CET)
Received: from localhost ([::1]:57346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2gaF-00036J-SX
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 15:29:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2gYx-0002Ha-F3; Thu, 21 Jan 2021 15:28:16 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:41973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2gYw-0007Pt-1l; Thu, 21 Jan 2021 15:28:15 -0500
Received: by mail-ed1-x534.google.com with SMTP id bx12so4039182edb.8;
 Thu, 21 Jan 2021 12:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Oh/NnJGDSierQ7PoEE81Y5MP/2Ltap5XEIJcCO5sGlE=;
 b=ArpaNl0IIQ66K/yol85mxaGnKmixDSSzOrqGoNlWGibtLLWFViGkZQlEN0yvM9o++0
 XYhWA8tdS+PSQJhM2M/ka2KTbCy4sTOQAB5EGY4Bj6l8TFqqUi2zz6FyF1+rVHkyukGD
 9e6u1N9ymwfcyBvqtSsyH8Vb7QwkaHv1mSdPZJ0eEXE3/VCNJ7Cvqdsk4TJOyVXiMrys
 q0dDudRdpMiECXmipkMHDdXEKC2zi0+ChmvHHaE7+tw4n1PPy9mw/QqiEW5QfTzWok9A
 5CBfFbLpJBX+q5HwHhRrIV+BiHZCYFZ3qkkL8Yen/qdXnIAoQRxO6YqdfyKJq5n6wWmP
 V4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Oh/NnJGDSierQ7PoEE81Y5MP/2Ltap5XEIJcCO5sGlE=;
 b=U6M7nB0iS4/2yQrqFQFiMmOi+LNG3LFEoMQDXzdCThxBAnRWXHjUneisYvczuJiEXF
 QImC/DSvN2UqsZUKk1GLn5lwTUPfMgnGGqe02pSIPLs4yNpZJos1EV4csiFxMPwRVLXq
 zAPRs86LDaThPW+hbOsZl6LfI1bNEokAthf/IizfL3w+dhoFDRTrxESaz4ZyLXF35f2f
 Q1rtXV+otywx9ixpdReaXhtwVl6MbuG4BTrnwwRR26+WYJLEXm2D2lop4Go5Wnfd2nqP
 T+ikeiM0bNpwlWDRZQ6r1VCHjDIiw6BOVjEsqA0ScgkjmmmZ8rVsS6vltkaKJKnM4HBf
 krlA==
X-Gm-Message-State: AOAM532EgBFbmoqxSD8m+Ps1fZPPDkSscwaj5HBANVxqR6PCzeE3FRO+
 Ws5wj60VENKB46OThrbqsMk=
X-Google-Smtp-Source: ABdhPJwilVMJx5iTwQyRhTn8fUFvlSG4e5LhTM3zLnohUMmJFhwy/VS7wKjh+qTu1+n4sCLzQw3pCA==
X-Received: by 2002:aa7:c3d9:: with SMTP id l25mr761063edr.188.1611260892394; 
 Thu, 21 Jan 2021 12:28:12 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id lv13sm2686465ejb.55.2021.01.21.12.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 12:28:11 -0800 (PST)
Subject: Re: [PATCH 10/25] hw/arm/armsse: Rename "MAINCLK" property to
 "MAINCLK_FRQ"
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-11-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e36062d4-dc8e-2503-e831-2436995b96d5@amsat.org>
Date: Thu, 21 Jan 2021 21:28:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x534.google.com
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
> While we transition the ARMSSE code from integer properties
> specifying clock frequencies to Clock objects, we want to have the
> device provide both at once.  We want the final name of the main
> input Clock to be "MAINCLK", following the hardware name.
> Unfortunately creating an input Clock with a name X creates an
> under-the-hood QOM property X; for "MAINCLK" this clashes with the
> existing UINT32 property of that name.
> 
> Rename the UINT32 property to MAINCLK_FRQ so it can coexist with the
> MAINCLK Clock; once the transition is complete MAINCLK_FRQ will be
> deleted.
> 
> Commit created with:
>  perl -p -i -e 's/MAINCLK/MAINCLK_FRQ/g' hw/arm/{armsse,mps2-tz,musca}.c include/hw/arm/armsse.h
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h | 2 +-
>  hw/arm/armsse.c         | 6 +++---
>  hw/arm/mps2-tz.c        | 2 +-
>  hw/arm/musca.c          | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



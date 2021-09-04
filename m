Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2E6400A69
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 10:55:58 +0200 (CEST)
Received: from localhost ([::1]:46618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMRSv-0002G4-4Q
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 04:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMRQh-00005P-5B
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 04:53:39 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:46627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMRQe-0000QA-Nu
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 04:53:38 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso1001738wmi.5
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 01:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r3wM/V/mwPg4VAc1o8IgpGbuuAEFKB1mV+yYS1SJS5o=;
 b=UbpeWH7iEE+KOT2WZTmPQ5CXkQf+mYJRY7H3ao5IB9vxXndB+gWZNrQ4Dl1g8LXsmU
 WEDTdNSrHUyqhe/Oiy2kKwPf+8JWfbiSaIcDwoEPeg9GxpcWDc/Rqv0eChW2edSWi91w
 521X2CtvVl1DZd7H3pWMRhVRAzNzXmywwVTh9pg6lOlKw7Rlby0vHxO3W8JIF0w88Pf4
 4yS8Vtm2ZK9Wv1FvwHKVHyZYdePLH49Z4cP2P7HhFwCx4GNr7OUq590d3VFdSaPB0+xC
 nFaNAqTbXhrkaXMOE/fv6omMpexg+XZ2fCPyyIxLaWf7Zc7FAZ8F2v9RWvcNeUHwteDG
 uQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r3wM/V/mwPg4VAc1o8IgpGbuuAEFKB1mV+yYS1SJS5o=;
 b=TsWR9cyrYZPOBb/dM/gPl9OM378sb3XvyZ0MusBhE+ZVlOqBn1/P18q3dGuPUILydp
 Tc8t3xceIq1BuNtrhoH0Z+hNrPeJM4yRJbkrolorWUV4Gr6d5ha6R8nn7HfXM8vCG2Wd
 eb/zGgOa6/MBNvEASCNbsZznsT0GUk1gv1qUH6RXqVvl0/JGY2b+P3azXi62IFdPVcFl
 P55ZnbKnezHhb9IF6oU2u/Gwi0zb1dXWIy0cKp1ErThKfvJ55/7OwSQcqE8yqTDVct7f
 dvqBAy0k+EIvWxSYpas8iKrW1N3o34vCDI1GmssoIlrHh4bxDUqUK2xpZVLLtOXjmCOW
 cVwg==
X-Gm-Message-State: AOAM532IXRaKoFAzcptx0/NJICV9GyH3dvxCnGD9M9FUAEUrrQPT8+MM
 iY7oyI8zIX4wo7ZdFZpU6JCFHg==
X-Google-Smtp-Source: ABdhPJxYYfyzEbHTSNVZKoUvsHLbUoE9U35KpXL/1UQFH1eINz5dFkI8ZVUASDR3YawDMxxA+nNnvA==
X-Received: by 2002:a7b:c38a:: with SMTP id s10mr2354135wmj.109.1630745615340; 
 Sat, 04 Sep 2021 01:53:35 -0700 (PDT)
Received: from [192.168.8.107] (246.red-2-142-218.dynamicip.rima-tde.net.
 [2.142.218.246])
 by smtp.gmail.com with ESMTPSA id y1sm1539453wmq.43.2021.09.04.01.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 01:53:35 -0700 (PDT)
Subject: Re: [PATCH 3/4] hw/arm/mps2-tz.c: Mark internal-only I2C buses as
 'full'
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210903151435.22379-1-peter.maydell@linaro.org>
 <20210903151435.22379-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <84432ca3-aeed-b8fc-5cda-fac311ae23d3@linaro.org>
Date: Sat, 4 Sep 2021 10:53:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903151435.22379-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 5:14 PM, Peter Maydell wrote:
> The various MPS2 boards have multiple I2C buses: typically a bus
> dedicated to the audio configuration, one for the LCD touchscreen
> controller, one for a DDR4 EEPROM, and two which are connected to the
> external Shield expansion connector.  Mark the buses which are used
> only for board-internal devices as 'full' so that if the user creates
> i2c devices on the commandline without specifying a bus name then
> they will be connected to the I2C controller used for the Shield
> connector, where guest software will expect them.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 57 ++++++++++++++++++++++++++++++++++++------------
>   1 file changed, 43 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 057E46236A5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 23:38:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osthS-00047v-Ft; Wed, 09 Nov 2022 17:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osthR-00047c-2m
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 17:37:37 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osthP-0000vN-I3
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 17:37:36 -0500
Received: by mail-wr1-x434.google.com with SMTP id k8so28042681wrh.1
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 14:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HCoLr7NCFiPKbkTu4iOMvr8B58fb3/FLRNsP219OTJM=;
 b=W5yR2FALrFkhIU8Vgk8xuIvJT6tfORTs9SgrV6MSCubV85CWJqfl57wQoAMwi1PvcB
 eP/SCCKi9yYDxA6U+yxqXhwR5iJLmloZyQwket5w50BR9Rs74mVOKOnRgZY4iWxNali0
 hjPZ6sbmLwA9SfiMCI+EBsH23Ag+anbepC2dFGgaYEprzNTV/JYGXNDzMoW9riW4R/AZ
 7mn2AGAwNY763wG6ueGPM9Lx/ty1qfOeKmYfpcA3XwW+dhrFdacvwkYk8JkihaVfFmak
 c74YuXPBg2/dd/+oGXjoX5h/csA38NdAJZ6ZYB7cCeQWp/MiCDNMgSV5Y2FhTOPBj5K5
 +3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HCoLr7NCFiPKbkTu4iOMvr8B58fb3/FLRNsP219OTJM=;
 b=irTvcnHHAXIcHVDgBO+cd5CfOHeuMiCU8mNgnEq/2CyNf4XWsxhZ6555jOofvZQ4N6
 vnO7eooYM1HU1reyrIUmQdqfdPvA9CpZdfLf9wQMnjvFiWkm45+NWaxPzPdgUFnrrDSr
 Dhi6S/8uILBAQ21tDiBBV9kwX48ftAxhxU3ioXbVEI5WwRCzYeGN7W6GoRSnsqu06nKW
 ndThOC/6HDtR4dP9BJ6LFiGHvAp9Olzfw/9fqPEv8TRDLH6gROUbFXxrSLZpahQiuUpH
 yuvFODXVEA3cDhQ0Hji04cQ9hdz0B0sdAvMjXDbw/yR955BhlNL0N8CQnjyaDqqHUSSb
 1tjA==
X-Gm-Message-State: ACrzQf2mhg0YZ0quGeZzXBZCVwTxYJkyzowx5a5w5t69spjx+ZKxnhl/
 nIxZJvD86CI+zctfcQ/7l19pjg==
X-Google-Smtp-Source: AMsMyM7q8vq+VCALVlJNlZEEx5UNjd5mHwSQcH65nxIz/4T0ev1WQmyuHGqYJR3RXYIthW49SJMKtQ==
X-Received: by 2002:a5d:4b45:0:b0:236:501f:7a41 with SMTP id
 w5-20020a5d4b45000000b00236501f7a41mr40211655wrs.516.1668033453896; 
 Wed, 09 Nov 2022 14:37:33 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a1c741a000000b003cf71b1f66csm2843224wmc.0.2022.11.09.14.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 14:37:33 -0800 (PST)
Message-ID: <63113413-5177-87d6-310b-5a48866d3558@linaro.org>
Date: Wed, 9 Nov 2022 23:37:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0 1/9] hw/arm: Convert TYPE_ARM_SMMU to 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109161444.3397405-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/11/22 17:14, Peter Maydell wrote:
> Convert the TYPE_ARM_SMMU device to 3-phase reset.  The legacy method
> doesn't do anything that's invalid in the hold phase, so the
> conversion is simple and not a behaviour change.
> 
> Note that we must convert this base class before we can convert the
> TYPE_ARM_SMMUV3 subclass -- transitional support in Resettable
> handles "chain to parent class reset" when the base class is 3-phase
> and the subclass is still using legacy reset, but not the other way
> around.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/smmu-common.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



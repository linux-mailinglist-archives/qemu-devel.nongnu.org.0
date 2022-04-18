Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12788504B61
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 05:42:03 +0200 (CEST)
Received: from localhost ([::1]:54768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngIH0-0005IK-8K
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 23:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngIF6-0004TZ-DC
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 23:40:00 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngIF4-00061j-On
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 23:39:59 -0400
Received: by mail-pl1-x631.google.com with SMTP id s17so549258plg.9
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 20:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bAdK8We8J9GpZ0hUlwO183f9JuM1ApTgj9qTH3wxf2E=;
 b=IZvjHrwMjUDfAucHLkSiVSnhi0+C+tyl8kt7k0eae6qvoBwj0HP0VipUNtl1maAgOQ
 OsWX6pbMRUmr7nJsTCif77IUaXJatOuyjGaautFPKiO4BHvtSN+GSPEWfIEbMaS3uTQz
 6uN58bWA1CqfT/BTUnSeMtPoBW2b3wLak482nurzZooRNbEL3HIxHCxVz8px9zCOhSLJ
 Qo0WPmAdN+d7XbeUkPc6xUcGkCNUYS8JDsJZWpaGX7od5wWserUe9hjOUc89lZTs7+ch
 B5dgOKu1910rvqo/Zz4vFOlYEeRQhi+noss8CdLjJClK0YXjOuMwSqJ3CCdwCcHJOPhV
 izfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bAdK8We8J9GpZ0hUlwO183f9JuM1ApTgj9qTH3wxf2E=;
 b=5i+C3nvV51mlBL/PR5QNotsc9mUOY1Yk2neCtZhTZJg3L0jZZSiQeFoeaWJUUquRqS
 ehhesPFVTkweWHYeuRdW8x/sUVPtXl77OME2TYH6umR7ICf3WZlJN1HioY+4uGHKEyoc
 KNFUSQ2lwFqnmD5WJQG33M7iY8tTlvDJtoOUTUnIQlXB8b3pMNm0+v6zbefFnbMVhnyp
 KaouncyvGmwZ5iSiZMRJjFkbrU6g2WbToJ1Ijj2+MnE1kgGnnD2CQlL7tZb45HaF9GA5
 HHAw7t3KIvJ2gByno4vmUvgKHq8iQfpRMUi1DP9oBMtWqx282kgQ4kAN+UVXRqki7SqP
 JItg==
X-Gm-Message-State: AOAM530MOSuvkFzJh6SoUHh/TjrP0YxjEc646a1SOPk1bMMMQfrLNH3l
 rC+jusT9yPHHwJ53OvyLH0EDYA==
X-Google-Smtp-Source: ABdhPJwLCZHYKYFjI1MZU7vkv5SNSoK0yYnL5rh4agXi6q2j/QpDoTNTKAhkHGBrZuyOHm6yShcO8g==
X-Received: by 2002:a17:90a:68c3:b0:1cb:a136:76a0 with SMTP id
 q3-20020a17090a68c300b001cba13676a0mr16392198pjj.101.1650253196922; 
 Sun, 17 Apr 2022 20:39:56 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a056a0016c500b004f768db4c94sm10503141pfc.212.2022.04.17.20.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Apr 2022 20:39:56 -0700 (PDT)
Message-ID: <a7d6e302-8be5-e00f-02ef-8d09712f1967@linaro.org>
Date: Sun, 17 Apr 2022 20:39:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 34/43] hw/intc: Add LoongArch ls7a msi interrupt
 controller support(PCH-MSI)
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-35-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-35-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 02:40, Xiaojuan Yang wrote:
> This patch realize PCH-MSI interrupt controller.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/intc/Kconfig                     |  5 ++
>   hw/intc/loongarch_pch_msi.c         | 75 +++++++++++++++++++++++++++++
>   hw/intc/meson.build                 |  1 +
>   hw/intc/trace-events                |  3 ++
>   hw/loongarch/Kconfig                |  1 +
>   include/hw/intc/loongarch_pch_msi.h | 20 ++++++++
>   6 files changed, 105 insertions(+)
>   create mode 100644 hw/intc/loongarch_pch_msi.c
>   create mode 100644 include/hw/intc/loongarch_pch_msi.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


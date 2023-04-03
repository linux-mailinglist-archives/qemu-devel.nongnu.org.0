Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 554D76D3E70
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 09:53:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjEzW-0008JE-26; Mon, 03 Apr 2023 03:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjEzL-0008HF-Cw
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:52:28 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjEzJ-0002WK-Ml
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:52:26 -0400
Received: by mail-wr1-x42c.google.com with SMTP id h17so28274905wrt.8
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 00:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680508344;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZJbLbg7aoiSF0QYubSkyLZtotm17ylTrOam97ji6Uek=;
 b=vhjA0on+6/wQPNDU4ozGGs4K9w3eNcy86iBwjUapY+QPeT0MJKkWqK5ylyGB/YlAMB
 EIzBI3DQLzS9MrE2iQGG4TP/EODOOdr0pxhhPEMfJOqolb8IuqlpBPHwSL1MsvLXQ0jx
 6iVE67iebD4DCcYxK5lglueqJaSoBrYAxaKYyjPRP229mll/o3g+LLjQFT5y4aGt6coN
 rO7dC+Lky9n/OoEKAo/aNbu/934kgUaKC6O8uOYX3BbnSmTcVniN6EhOAMJHSkGGxYBB
 mcAXx0aq2AVJHSOeH2coRj8onWSdk4ujydYzBHrM7ypg48jH4kWQzEy7u3/D2N2a6hIK
 7dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680508344;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZJbLbg7aoiSF0QYubSkyLZtotm17ylTrOam97ji6Uek=;
 b=VmpkagwWNb2ANHnxhh7AVJucHII8gPSiJlKNUtMOq5Iz3i20f9DZJaeDWFkJLfcKKS
 oEFM5IcLKNNwm86oL2Dq/UMLEqCObKES/5W1van7/1IXjv949N2kBn+c6Dgo81474MxY
 kW+77JVARD7lhqU5VYE0hmp8UJYLnpatTWBpbENdT7nwbPIBzPNObG0E4Kw8yjrl8hiq
 t9DXbTJBs/YBzIqlFwVAzdsqSAonhMejVydeOVRfEi4D6pvyWpTAXjlEDAT3Fv7kBv6a
 +u3lzacLcXbqhq7TOISmaUFxdRjTOs9hqHsOjUGX9vE+1MfflTSGHUzhYFpQwZii8qwG
 ALMA==
X-Gm-Message-State: AAQBX9dYh5Hc7wEM2sZNSVpMLVC1gLH+RCEzrmFwyCalYvoxBbPaI7hG
 shycTWmxs0kxGTX4zDlSh+YpZQ==
X-Google-Smtp-Source: AKy350ZPvlEkewqiyjc40towzGviIL64i2/5q6VZeH+A2dr7f3JPFvmkmVSv5PIs1RaQxoTJjWH0Dg==
X-Received: by 2002:a5d:5742:0:b0:2cf:e3c7:5975 with SMTP id
 q2-20020a5d5742000000b002cfe3c75975mr13167971wrw.34.1680508343784; 
 Mon, 03 Apr 2023 00:52:23 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k10-20020a056000004a00b002c5691f13eesm8997203wrx.50.2023.04.03.00.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 00:52:23 -0700 (PDT)
Message-ID: <23ebf10c-804e-adc6-0d37-fe726b56f210@linaro.org>
Date: Mon, 3 Apr 2023 09:52:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 1/3] target/arm: Pass ARMMMUFaultInfo to
 merge_syn_data_abort()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230331145045.2584941-1-peter.maydell@linaro.org>
 <20230331145045.2584941-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230331145045.2584941-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.37,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 31/3/23 16:50, Peter Maydell wrote:
> We already pass merge_syn_data_abort() two fields from the
> ARMMMUFaultInfo struct, and we're about to want to use a third field.
> Refactor to just pass a pointer to the fault info.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/tlb_helper.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



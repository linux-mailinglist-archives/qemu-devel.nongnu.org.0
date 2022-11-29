Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE5E63BC50
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 09:58:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozwRF-0003eY-Og; Tue, 29 Nov 2022 03:58:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozwRD-0003e9-UZ
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 03:57:59 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozwRB-0006Xo-Vc
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 03:57:59 -0500
Received: by mail-wr1-x433.google.com with SMTP id y16so1188582wrm.2
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 00:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u2aV5Om4XNwf1xNcBjBc47KCU9CK5roblFbz8XZf9BM=;
 b=iAOYoV6c4nR3A0g8O1hbq0Vajwyth5gFg41yBFbxwT+5Pp1pX3AgmcgzwEvpx4V1H6
 RT0Y7QXrAlwVSqPhoXUw8rpWkdMHXp7tGg34d7bu2wCKTX/dMr9tMsHFaGfnbucRf8LU
 +zXqE8O/QY2Cg94WJX/TN0QA6gNgGYYRTQllB19n9A6QdXn/v+lDsleTTkqkG4G4Mwzt
 unCBEvkXMy7pn0de/Ib0fAy8d7zbF/rOciEpj70I6ngEOuUPBTq1MZnvlFx69byVjEOV
 Wk0NZMchxw33Jp/9EJlttvTN2WfuLHvupW5vwx1amLnOge8gCnQ27wh+wOE9dgsaTmEC
 4Ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u2aV5Om4XNwf1xNcBjBc47KCU9CK5roblFbz8XZf9BM=;
 b=he7m+9o/c8ETmds2evvlhsTLwpWC9jfszUptAQ1TUEdPylyf75/cpNPsFeO6Rgtzde
 OT7co3OTJObC+M24fSPaYd5jpHCOrOdoJrQUF7Ycd7T9pDc1NEFdXtOe5LSfgZQmO/Jg
 OHhKCFslQqYuC34CkJY0TARuRS/s+KkkPFawxNXer1sMxf3UUMyx87/+UOv1z4/S8CLM
 RsCPApI2EcZEqFesHFJW9R/i37PvOcsfBkiU1bid0PSYzPhuK2CpyY/embIAVyMAwL3m
 73vg2ups8GRJV9FKyVvDhM6I+KtbqvJNfUl0rL4CjIUgQ/iokM9bIfueWR2Sda+AgxlS
 zSNQ==
X-Gm-Message-State: ANoB5pk2Ya93PQ2hhV+grmD4CkvK3SBjBPhx2wGa5xBEmrtQJJywqF6J
 zJFSuOOyAsDC/2mDIo4Uqf+wijVdWVNaWz2r
X-Google-Smtp-Source: AA0mqf5zObQtDou05HWnH+S3BtLPOgHk//bfiKgbrf5BVATHd0WX7HRQtabRMmqvZuyrsmmDdubVGA==
X-Received: by 2002:a5d:6dc8:0:b0:236:53d3:5a48 with SMTP id
 d8-20020a5d6dc8000000b0023653d35a48mr33883498wrz.66.1669712276545; 
 Tue, 29 Nov 2022 00:57:56 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s30-20020adfa29e000000b00242246c2f7csm820728wra.101.2022.11.29.00.57.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 00:57:55 -0800 (PST)
Message-ID: <0198dfed-4f34-660c-706d-eab69beff81e@linaro.org>
Date: Tue, 29 Nov 2022 09:57:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v3] hw/loongarch: Add cfi01 pflash device
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn
References: <20221129085037.3589467-1-yangxiaojuan@loongson.cn>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221129085037.3589467-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 29/11/22 09:50, Xiaojuan Yang wrote:
> Add cfi01 pflash device for LoongArch virt machine
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   hw/loongarch/Kconfig        |  1 +
>   hw/loongarch/acpi-build.c   | 18 +++++++++++
>   hw/loongarch/virt.c         | 62 +++++++++++++++++++++++++++++++++++++
>   include/hw/loongarch/virt.h |  5 +++
>   4 files changed, 86 insertions(+)

> +static void virt_flash_create(LoongArchMachineState *lams)
> +{
> +    DeviceState *dev = qdev_new(TYPE_PFLASH_CFI01);
> +
> +    qdev_prop_set_uint64(dev, "sector-length", VIRT_FLASH_SECTOR_SIZE);
> +    qdev_prop_set_uint8(dev, "width", 4);
> +    qdev_prop_set_uint8(dev, "device-width", 2);
> +    qdev_prop_set_bit(dev, "big-endian", false);
> +    qdev_prop_set_uint16(dev, "id0", 0x89);
> +    qdev_prop_set_uint16(dev, "id1", 0x18);
> +    qdev_prop_set_uint16(dev, "id2", 0x00);
> +    qdev_prop_set_uint16(dev, "id3", 0x00);
> +    qdev_prop_set_string(dev, "name", "virt.flash0");
> +    object_property_add_child(OBJECT(lams), "virt.flash0", OBJECT(dev));
> +    object_property_add_alias(OBJECT(lams), "pflash0",

s/flash0/flash/?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks for the updates!

> +                              OBJECT(dev), "drive");
> +
> +    lams->flash = PFLASH_CFI01(dev);
> +}


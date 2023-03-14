Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7F26B8B40
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 07:33:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbyD2-00026q-7l; Tue, 14 Mar 2023 02:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbyD0-00026U-JN
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:32:30 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbyCy-0000z6-Vv
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:32:30 -0400
Received: by mail-wr1-x42f.google.com with SMTP id r29so5245252wra.13
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 23:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678775547;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JydG0wflcCsIHIkmoinsPUsKF3AFLzMW2HdeCY//o8M=;
 b=loYLY6T1dJ6CpoGW34hij2R1zNxtOBLW4OerVwoYERh8JguApZgVFP/71dHYsguTaW
 UU3HGvB6xBZJ3+Hq7IRH1zXZDCah2S4DLDw+T8rWgTu86OiSJb2i4AdjYPK5AhSI3TbH
 7r9CUR7GBJb4X1jpFgnANnuVhWwlZATUe68sK8zIdiVoP32DGBfqgt7EwtXLCCExijcZ
 x4NAUkVjpuAKh6CKUH8EFwLtL25WNhSGBUKrAIDQIoFoWni5onA/pdi3GDwzdnqJDog7
 RjVUsN2i3QyEBHYV5h10Vg8hN+t+dzBgY7DKsOzZ3o99WvB5zV2p7hBy3VIiO7HJKGg9
 dZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678775547;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JydG0wflcCsIHIkmoinsPUsKF3AFLzMW2HdeCY//o8M=;
 b=hNIlrYUcPsv76knQIIZAYmrkjV8h8CxY52NAjesut1uqfD+8NS9MaWMesL1VR9aZ69
 dRvDs5NYaT8yHHrs13lgEymvyOxWhvxTFipgN3JSH8OZjouB76OFSG6IV+eOu8HGbOmu
 alUwpHZJMTYqSi4exMMyiPbeF1i8SdfV6CoZPi2m5GwRXVhzmetODwuLVDjXUSNLJbYT
 7JDFe1x/HK27rYnxd/grqX1KLojY2Qg9Hovxda3UnrIGgnA2sBHkP8UUkJMzGTqYOrrv
 tFvyfJsFjfc5R1DD8QSKBDJ+YcupWdjFME6bMtoB2FANo7t3yISrI+OqorYsJ6xdXP4J
 u8Bg==
X-Gm-Message-State: AO0yUKUr4GLKUiXp4tlasDGupzjRJosmngRav4W6euCR8Qg/SxA/3Xzs
 zlmoLxfub7HemvgPSl7CIjkP2w==
X-Google-Smtp-Source: AK7set9Dj0H1pvsudsgMYC3B58XlAkWu0jszc/ksz5225KocRiesrDL79qNrt1DibhPRf4pDj0B1pA==
X-Received: by 2002:a5d:4604:0:b0:2c3:be89:7c2b with SMTP id
 t4-20020a5d4604000000b002c3be897c2bmr8982224wrq.14.1678775547181; 
 Mon, 13 Mar 2023 23:32:27 -0700 (PDT)
Received: from [192.168.150.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 i10-20020a05600c290a00b003e8dc7a03basm1766307wmd.41.2023.03.13.23.32.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 23:32:25 -0700 (PDT)
Message-ID: <ae5e2fa5-e641-f787-38e3-4de1defd0050@linaro.org>
Date: Tue, 14 Mar 2023 07:32:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 0/6] hw/cxl: Poison get, inject, clear
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>, Fan Ni <fan.ni@samsung.com>
Cc: linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Ira Weiny <ira.weiny@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Michael Roth <michael.roth@amd.com>, Dave Jiang <dave.jiang@intel.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Mike Maslenkin <mike.maslenkin@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20230303150908.27889-1-Jonathan.Cameron@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230303150908.27889-1-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

Hi Jonathan,

On 3/3/23 16:09, Jonathan Cameron wrote:
> Note there are several series ahead of this one and in particular
> the RAS error injection series needs some QAPI review.
> The QAPI stuff in this patch is similar but in essence very similar
> to what we have in that series.
> 
> Whilst I'm an always an optimist, this may well end up as 8.1 material
> now.


> Ira Weiny (2):
>    hw/cxl: Introduce cxl_device_get_timestamp() utility function
>    bswap: Add the ability to store to an unaligned 24 bit field
> 
> Jonathan Cameron (4):
>    hw/cxl: rename mailbox return code type from ret_code to CXLRetCode
>    hw/cxl: QMP based poison injection support
>    hw/cxl: Add poison injection via the mailbox.
>    hw/cxl: Add clear poison mailbox command support.
> 
>   hw/cxl/cxl-device-utils.c   |  15 ++
>   hw/cxl/cxl-mailbox-utils.c  | 283 ++++++++++++++++++++++++++++++------
>   hw/mem/cxl_type3.c          |  92 ++++++++++++
>   hw/mem/cxl_type3_stubs.c    |   6 +
>   include/hw/cxl/cxl_device.h |  23 +++

There is a '64' magic number used in various places, I haven't tried to
figure what is / where it comes from, but a CXL #definition for it could
make sense.


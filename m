Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AEC666008
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 17:09:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFddD-000737-SK; Wed, 11 Jan 2023 11:07:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFdd9-00072r-O7
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:07:11 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFdd7-0001ui-U9
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:07:11 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so14747777wmb.2
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 08:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hvMdInq1GfHSa6VurOCw33Z4fJEcoM66wnAGb8PRKag=;
 b=KUhZaGwrthKKRlNllrrY8oLuk3f01E560iYjPGObrFnKWaACNNcQ+5QBKJZjQ9sNaX
 wwQ6DnIArMalS7QeyRTbA8/g/4Ypu61BBXgtCf4Csq52SohZ9vO2IOsu/CCMTKaP7PBS
 WzIMDt6XNxfnfbGs2dHSvT6AStZ7cxC37y6wjqajMh2cbHggMhlqfYQh+I5EsZIwMUdD
 +uYdhCrgwUqJ/u4UmkG2BvTQNtk8d/4tGINF7Por5kzws7/SI1C04xK+923/jFOfFW18
 uMPgVWR2dV5JwnCMD0+/AJtKy1HFZA0QeBOqQ+vDZwq9z/D1GbyfGT4y2qXS8rOho4Gy
 apiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hvMdInq1GfHSa6VurOCw33Z4fJEcoM66wnAGb8PRKag=;
 b=Z4rmlS/npB6ZinIOMAtOgycQLGlw6Gix1t3mZ83hYFNaNLalfoIUeWRVG1FFLD94T2
 XcDaDLv0KXmkw6VI9KFzLyAdZJrj8VC5w3NA2b96vTV8Shnf6q9ffDZLIrD/X8mJ87v5
 63LTUc34SU++tXNPPe7xngGpJ0PcB2cUB2TuMDnBlJqGYUAwj9OnsLowraWgsAbzmt3X
 9nFKxyCBFo8xqVzPMeFYKsjTw8jUnDgOKpzPK/XrvLk/pdModNO2FCybQp1JfBg5hHhd
 w/fNP1SXvoV5alBhStaGOo9kwyUxmAREquaPnYu97WfV55/db6roNUnoXdogw6MIdY7x
 XLWA==
X-Gm-Message-State: AFqh2kqfPfldahKVsTH9AnOdJeAU1LWe0iTKXmYlV5zklyGM9kC2tBen
 FF9QlCfcWHs7FMCw7vKRlL1Jcw==
X-Google-Smtp-Source: AMrXdXuDYz/ZJhg0YadhHp0Bl9SBUd7tGBjhGtfPC6ArK0OMyLe7dYcXcG/2CvyUndNgn78bFGFypQ==
X-Received: by 2002:a05:600c:1d03:b0:3d3:4aa6:4fe6 with SMTP id
 l3-20020a05600c1d0300b003d34aa64fe6mr51918208wms.3.1673453228391; 
 Wed, 11 Jan 2023 08:07:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c3b1100b003cfbbd54178sm6620416wms.2.2023.01.11.08.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 08:07:07 -0800 (PST)
Message-ID: <aa007274-a787-5c93-c9b3-843a6b50f1f2@linaro.org>
Date: Wed, 11 Jan 2023 17:07:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 6/8] qemu/bswap: Add const_le64()
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>
Cc: Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>
References: <20230111142440.24771-1-Jonathan.Cameron@huawei.com>
 <20230111142440.24771-7-Jonathan.Cameron@huawei.com>
 <68f9b74a-b0e7-c5a6-7b99-ce4f96d79f36@linaro.org>
In-Reply-To: <68f9b74a-b0e7-c5a6-7b99-ce4f96d79f36@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 11/1/23 16:49, Philippe Mathieu-Daudé wrote:
> On 11/1/23 15:24, Jonathan Cameron via wrote:
>> From: Ira Weiny <ira.weiny@intel.com>
>>
>> Gcc requires constant versions of cpu_to_le* calls.
>>
>> Add a 64 bit version.
>>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
>> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> ---
>>   include/qemu/bswap.h | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Actually I thought this was already merged but apparently
this never got in:
https://lore.kernel.org/qemu-devel/20200928131934.739451-1-philmd@redhat.com/


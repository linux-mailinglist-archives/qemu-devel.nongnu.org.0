Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA08269E9E3
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 23:08:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUao1-0002t7-Cg; Tue, 21 Feb 2023 17:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUanx-0002sA-Sz
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:08:10 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUanw-0003bl-Co
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:08:09 -0500
Received: by mail-wr1-x430.google.com with SMTP id bo30so5385682wrb.0
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 14:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9hgvcP5je1zR/2MazVoMlLNzNse+MEVFrfGHS0cMg9o=;
 b=H/TWVav+m65Go5BjNw9/NyYGQIDKUfHYZGixppkd/RqEvocZpaHqVW9YMkMtdeTfRK
 zjrR7LFxvSEBaLnArmhoomYRLgtu5XheHFUHXAvs2x/ivfKUrEDr2K9z0DhGBikOsqhK
 XauQDKzMAew/KW8YJZsRoBHl+oayJ/a6GLq2lGm/CoXE7km+C8Omhy9Je5J5l6OEqKgO
 A8orPuglX0FnwIMntunzKBZCqXdgDf6VXXRhdWcCHbKsNU8FarcPESSAQ2dRSZu9cot+
 GnbQ2CjrRdDTqZdMT1oJwUcRywmetaUEo2dtQV5Uo3jMWySXpHYpFznIVvxcrv4qadSR
 ODMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9hgvcP5je1zR/2MazVoMlLNzNse+MEVFrfGHS0cMg9o=;
 b=zZZXjMUj2g3bQqqp0J523TEvlcTOusWkhVWRx4Km8vIhd88/IiJqxfrzX4JlyZJICl
 dRQ0bdqiOyCqffqvdGRaWN0gGPEBIfxroLPU6W2j9zbwy/FfmuwBOdBqTUOCSEncrbOv
 2EOySwKnwmgoC9kwO8Baz10vfNBMk62uG9OAL7we0+nfMuUd5m+pSeobN4iSjHPhslCv
 pThSrXZ71rse4H9we9pczYuxwvvHhxR5Aqc7UmQRpiLsz0LxufvP7OXteDDGNzh4FOgC
 Jnmdry+lxhkWChFlbqSPJygeFPFs1GKVMD0/ivltyE5jMsaog/96/8URqLnC66sEs/2o
 sf1g==
X-Gm-Message-State: AO0yUKXuhRsfRjcILkyVWvDGPUO6ilXR12qdL3aCiExedk3B6tieK+tm
 IwTc7eZ4YVNfJqhdGJfgXWk23Q==
X-Google-Smtp-Source: AK7set8lqxQLuA0qaQAKYxsByGrWM612GiDdZI79pIR4WGyoI6QqSgLFEpaY0ivQpvw7vaOHJ7GhjA==
X-Received: by 2002:a05:6000:1569:b0:2bf:d937:3589 with SMTP id
 9-20020a056000156900b002bfd9373589mr6587242wrz.14.1677017286749; 
 Tue, 21 Feb 2023 14:08:06 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c15-20020adffb4f000000b002c55b0e6ef1sm6244687wrs.4.2023.02.21.14.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 14:08:06 -0800 (PST)
Message-ID: <9ae252ae-db86-0e8d-c2e2-1939968121b4@linaro.org>
Date: Tue, 21 Feb 2023 23:08:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v5 7/8] hw/pci/aer: Make PCIE AER error injection facility
 available for other emulation to use.
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>
Cc: Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>,
 Mike Maslenkin <mike.maslenkin@gmail.com>, Dave Jiang
 <dave.jiang@intel.com>, Markus Armbruster <armbru@redhat.com>
References: <20230221152145.9736-1-Jonathan.Cameron@huawei.com>
 <20230221152145.9736-8-Jonathan.Cameron@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221152145.9736-8-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 21/2/23 16:21, Jonathan Cameron wrote:
> This infrastructure will be reused for CXL RAS error injection
> in patches that follow.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> ---
>   hw/pci/pci-internal.h     | 1 -
>   include/hw/pci/pcie_aer.h | 1 +
>   2 files changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



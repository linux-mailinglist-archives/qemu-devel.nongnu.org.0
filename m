Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CE43F0191
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 12:26:23 +0200 (CEST)
Received: from localhost ([::1]:43184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGIm6-0006WM-Bs
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 06:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGIk5-0004hj-0F; Wed, 18 Aug 2021 06:24:17 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:46869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGIk3-000196-Lz; Wed, 18 Aug 2021 06:24:16 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so1429052wmb.5; 
 Wed, 18 Aug 2021 03:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=giQ8mSMhuFPGoovLdha6G+J/bDJyUq+OOhgtz2p2MSo=;
 b=AU1SiIbuqfNF6SNfg3B9DxcM+HjV+JfyFgMgyrB/F6sQd059tt2BFClfPuGVpT9UQF
 PCvwQk4nLhQ/wkFysmBq+3HN2scdcjeY60NOdJsIEGN0IYj0K/mMjGuSXj4ezVeDoRRE
 7jdcs18ZjmtVB6oeH+zZ2KxPBp38TT0ekfm2e+m4ou1MwFjYscvBtp7lI4xswOszHeY5
 OOmJQP27LA50oyJwVkhP6wjt2kMkEPGI43eRDQ76l5vFKytymNE/K4N2yasFYqB+K5Bc
 AgYJWExPPisEWuO3rR57dBibmHxVw4EF+V0DNtYE4lra9nTgW4dC9A4QhA/ZMdnYMD4K
 Gnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=giQ8mSMhuFPGoovLdha6G+J/bDJyUq+OOhgtz2p2MSo=;
 b=KVO8B6jNk5UdQfir3YEht5nhdCEjImlbG9vZnY2o0M92axRsnTYzExGu8qgPhY1ROj
 2iStSCLyE5qYZ+Wby7LKfKnAmwrT739bA63QRumWR2I4VdOIvR9YWu7lBQmn+rzMIshY
 lGFw8nSLqzcsylSRDDYe/gUAa8cH5ke07tezgokgZ4FmCumkDCdtAZv7iRX4hfTztKaI
 IY0dhQEWuWOPlD6/6FM3r/JjtcHCziMTTIXPPSjskGpKk/N82E03DWgNdtk/mRBS2MNt
 wD8u9VkZ+RRgK7/y/1uuaG8PlS5mr2NnRHg/gdcwJfOOc9xs/jq1aOdiZ7X5Ci830fg7
 ngfw==
X-Gm-Message-State: AOAM5314+wcS2MCt5R2IK6WhOCEJKNqcnqAwicgmMn2YqyYO926vFaCx
 DI5A+PmzwTJ1FIJSpJV1jxk=
X-Google-Smtp-Source: ABdhPJxWn6GaJrKCN2pzJb6hkRfvsw78HRIKShqvM2j26KvHX8oFdI9K0kXfwxS+m0/lBvtSz2TpDA==
X-Received: by 2002:a1c:115:: with SMTP id 21mr7744808wmb.95.1629282253868;
 Wed, 18 Aug 2021 03:24:13 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id d8sm5663070wrv.20.2021.08.18.03.24.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 03:24:13 -0700 (PDT)
Subject: Re: [PATCH v5] hw/dma/pl330: Add memory region to replace default
To: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "i.mitsyanko@gmail.com" <i.mitsyanko@gmail.com>,
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>,
 "alistair@alistair23.me" <alistair@alistair23.me>
References: <4C23C17B8E87E74E906A25A3254A03F4FA1FEC31@SHASXM03.verisilicon.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f52d6ea0-8003-7343-79d8-4c38a6a4c62b@amsat.org>
Date: Wed, 18 Aug 2021 12:24:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4C23C17B8E87E74E906A25A3254A03F4FA1FEC31@SHASXM03.verisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Liu,
 Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Li,
 Chunming" <Chunming.Li@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 12:17 PM, Wen, Jianxian wrote:
> Add property memory region which can connect with IOMMU region to support SMMU translate.
> 
> Signed-off-by: Jianxian Wen <jianxian.wen@verisilicon.com>
> ---
> v5 (after review of Philippe Mathieu-Daudé):
>  - Refine code and use memory_region_name() to get MR name.
> v4 (after review of Philippe Mathieu-Daudé):
>  - Avoid creating new AS for system memory, add AS if we connect with IOMMU region.
> v3 (after review of Philippe Mathieu-Daudé):
>  - Refine code to comply with code style, update error message if memory link is not set.
> v2 (after review of Peter Maydell):
>  - Use dma_memory_read/write functions to do data access, update function AddressSpace* parameter.
> 
>  hw/arm/exynos4210.c  |  3 +++
>  hw/arm/xilinx_zynq.c |  3 +++
>  hw/dma/pl330.c       | 26 ++++++++++++++++++++++----
>  3 files changed, 28 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


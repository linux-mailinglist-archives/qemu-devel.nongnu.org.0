Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F05369E9DD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 23:08:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUamn-00027b-Sq; Tue, 21 Feb 2023 17:06:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUaml-00027Q-VO
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:06:56 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUame-0002Qh-Ai
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:06:51 -0500
Received: by mail-wr1-x434.google.com with SMTP id t15so6050241wrz.7
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 14:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QswolMF7JwIsaKgLxTsm84bIyCbB4xAcx+Fy7sgre/U=;
 b=kFrQRYagxLqIVhlzqppxkUSOe1RcH6sNBTHoAnykrg/QrenYPIW+Xbi634K1G5Offl
 H/KN7QjHbcAwX/zodlYzAdCPFq9+g93/wMyNFOPPqPB+8z/9gpmSBcQjlgdoI63j6FKu
 we7hMmeeCyTXkorkn1gO+3Hqs/0sr29TO/YkuM1zYcMSoKcSI6gWOrBzLW/BFcA0ArpX
 k0x4Z1TallWOtsdX812yZUncrla0zphfJ+WsgoJGOrl6rTXWaXU3HTrOVTuupGBc+jbP
 XDjemydf+jO6+RAW5ESFaB269YQBsLx9SQo6Uid26MWQFukxKxh6eXYzz/rM7y1m3x0n
 ZQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QswolMF7JwIsaKgLxTsm84bIyCbB4xAcx+Fy7sgre/U=;
 b=a0sI6cVsewMDabYA6BG9ql4V/an4BXvKGtvWaHo2nt0mOSCJiKU6xE1h/dcNhkX4sy
 WqZ5Bz0qTbvIPgSSjDVtTHxYE0R/+jaib5w9fMPdhTdTflPyZvI/Ydfr5sSVsISFwv0z
 uk/heg1CxEaJvP1g6SWMf4W5kCARKxynz9Bk2nh0P8OStiZfshX/g5ryHqz+HIDDJUib
 FkzoQ59RGy7O9XVUI9AR7WNYntTwCHdpMwvNL7ySVgS0C4pHM/6VJsA2SLErroUPk80n
 5af1OUFp1hbY6SDfSivON5z83YBFg7BwwY8DbtdKXdnQHwU/Xo/FW+t8hYH3TdnLiqQ+
 cV/g==
X-Gm-Message-State: AO0yUKXK9KvewlZnMA7OZBKOOQIhyzefGy4Pr1qDr9vV+QOGk4gJ6oK6
 2m7nejRQVFhmM5bGVse8lOgn/Q==
X-Google-Smtp-Source: AK7set817qXFh60NlBP/3akgNNtrjagi01bbBSMi2AzCOukBnE3OfBRPHmbIaWCVcSldsMETUYYBIA==
X-Received: by 2002:adf:fdce:0:b0:2c5:5ff8:6b01 with SMTP id
 i14-20020adffdce000000b002c55ff86b01mr6495017wrs.1.1677017195790; 
 Tue, 21 Feb 2023 14:06:35 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a05600001cd00b002c6d0462163sm4357405wrx.100.2023.02.21.14.06.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 14:06:35 -0800 (PST)
Message-ID: <2074f332-8f6e-95f1-6860-ba5ac2df40d0@linaro.org>
Date: Tue, 21 Feb 2023 23:06:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v5 6/8] hw/cxl: Fix endian issues in CXL RAS capability
 defaults / masks
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>
Cc: Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>,
 Mike Maslenkin <mike.maslenkin@gmail.com>, Dave Jiang
 <dave.jiang@intel.com>, Markus Armbruster <armbru@redhat.com>
References: <20230221152145.9736-1-Jonathan.Cameron@huawei.com>
 <20230221152145.9736-7-Jonathan.Cameron@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221152145.9736-7-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
> As these are about to be modified, fix the endian handle for
> this set of registers rather than making it worse.
> 
> Note that CXL is currently only supported in QEMU on
> x86 (arm64 patches out of tree) so we aren't going to yet hit
> an problems with big endian. However it is good to avoid making
> things worse for that support in the future.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> ---
>   hw/cxl/cxl-component-utils.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



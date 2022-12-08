Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A659264724B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 15:56:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3IJ3-0000lg-HM; Thu, 08 Dec 2022 09:55:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3IIs-0000gQ-Il
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:55:14 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3IIq-0006aI-TP
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:55:14 -0500
Received: by mail-wr1-x42c.google.com with SMTP id co23so1918394wrb.4
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 06:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DZd2RG4H1NGy/wuW+t18oNMTglyUCxcdD2ELNb+9q10=;
 b=vujz0/GALQutLSpryRbCVTgjeJqQw6Mj+xmUri1gGiI/sIKgin8Aj9/kREgxThVZxC
 oU/lG7R7jxTi9bxp+IUVuo3HQl/pBvWRRu14jtYQIQ58GTzhDi8q7Orq35voIVX4VqU8
 2sdy7JUzsWyYIlRQkEQOa/HNCOxbAJyJiHMzTAz7bLVGoMXRL7Fb8M9fYV+/q0N2S4om
 XbP3i6c8waNbxQkDbkxmeYpNn+eqzUCR0gPRvVN7FrYVuhtBTe2inyB1HrOVrQnQA9Yn
 cCM1FJyUs5rVj1Rk46NUwPJ/16Frq4qxeDrxjzcn/pGFkawbC1oAvL5Ogc2q1ukT2MiO
 AFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DZd2RG4H1NGy/wuW+t18oNMTglyUCxcdD2ELNb+9q10=;
 b=k5ivjsuAsh138YCD7kXcG63FRbGaBSC9hAmONB1aKXLCY5+6BZOXjOm3BIeM8r18Bm
 4J4bfXE2qt2XR+k10reTrHVVH1dcBvF9IE452LWTi57DnJ6sE/Va7HKY5BJmCZOd00OQ
 lTL2rJEeirHgd1jBSb3/v+DtYBGEXzXGXsR/J/vqOQvN+aGLw5rpvXR8gpraRFxU56XY
 yHv7ZpmEpeOXaLVlNpAqR9PPmU3t801x0pn2725NTeUUgiyUamHmpPSbqU8yjlvkX6rz
 u5K4aSYBpD9AChw8Q8jpe4wz4PNjar+P1tVtJfqoNS3L3txdfbWkzGYh+bJlQhKwH9N+
 7XRw==
X-Gm-Message-State: ANoB5pkaGzh9gUfv1xSBdc4Xussq/zj25ZmaRRAj8IKpQZD6UCXo7neE
 xnEZt4rT7iXu8PTf6NcenGmW+w==
X-Google-Smtp-Source: AA0mqf7jWs2MJyM6kGKNCSlBIgtZm66xhdcJOeBCkLrVpE03m7P/2MFAJbdaNS7p6cyntju6aeNoIQ==
X-Received: by 2002:a5d:5592:0:b0:242:72bf:8c9f with SMTP id
 i18-20020a5d5592000000b0024272bf8c9fmr1452661wrv.23.1670511310019; 
 Thu, 08 Dec 2022 06:55:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k27-20020a5d525b000000b00242269c8b8esm22149430wrc.25.2022.12.08.06.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 06:55:09 -0800 (PST)
Message-ID: <03d5046d-942c-2eb4-157d-5be3d2bd318b@linaro.org>
Date: Thu, 8 Dec 2022 15:55:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 3/3] include/hw/block: Include hw/block/block.h where
 needed
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org
References: <20221208143939.2775453-1-armbru@redhat.com>
 <20221208143939.2775453-4-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221208143939.2775453-4-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.266,
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

On 8/12/22 15:39, Markus Armbruster wrote:
> hw/block/swim.h needs BlockConf.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/hw/block/swim.h | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>




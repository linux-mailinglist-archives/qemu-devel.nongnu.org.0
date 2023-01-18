Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978C66714E0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:17:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI2gk-0007vy-M9; Wed, 18 Jan 2023 02:16:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI2gK-0007pX-Bc
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 02:16:28 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI2g3-00051d-KT
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 02:16:09 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 q10-20020a1cf30a000000b003db0edfdb74so667888wmq.1
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 23:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GwaMcY0o0vxtyWKNdUl2MAkCIcOYHCsBZpRcSthxLGg=;
 b=Kr80ZUdw9FKJllRMlALtcK2i/k6zjHX9KhiDGh60VenQmRwlM9m6N43fs0osyWWSy6
 2vSr+eWfaqPR/93sSMJM3t9SC6Yh1lbjWoMxuz0kaWTTnnzIEQWJ8Z+0MjfXA11PsnLp
 9JNEQ7BlhnajkSzCZ2ezyYwrXj01A0cKeHAi5CcSanMbabmx6pUKXQXUWrbEhw+MtQV3
 /jKydxr/3rgpYn3qk9ostJV2d4HM/OKaJzJLWemRp1pmhpj77YoOtLB/k3zMtMXH247J
 8OZrLuV8qHz9VkmD++UJgV6J/jXVxE6QTbTBZLeT56VOIZiGMyc731dXEr1H+kumMvuI
 RyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GwaMcY0o0vxtyWKNdUl2MAkCIcOYHCsBZpRcSthxLGg=;
 b=zy44Usn09gnn38tm4IgD+Xz1JKpcGxQjK4u8dFa6WHQSw0Py6Eqzr9RbDw7eG5cylZ
 ZGMuH7tRWkdRMidDpGE9iuPntKOAoPk9pdw2Cpu5PiFWN8XFdv2tzQY2WzfheRmPUOuW
 M/dksqgwKflHs28OHoHh9ldzlZsHdMwCiZMgEvnw2DX6/OMHxUoAXU51ssdmbQ3ZLiDV
 XzjM+qfOsl8UJ4fbp5KXQTMdBARipVgtaLNplNgKf843Qy6RjZJ53SL6z92FaCE5KhjM
 cGCU5OnrNgKycqi1pkoQtBSrVoWZba94iB+Gf63QVPpx3g9XJQZO3kIfmGFwxg4DjKZo
 hWTA==
X-Gm-Message-State: AFqh2koQZnHmz07XfSRs5XgVyQ2HjDqvg7x5U69ls3O9oHVCzQUC8qs2
 URoTKccg6JcJc6Is4EO9FB/yfg==
X-Google-Smtp-Source: AMrXdXsz+ah5zc20bWawA5saHwOXGYbexteaL2CmP9lzumiaV722x6Zn2/IAcaTkiitEuDT8XvkGCg==
X-Received: by 2002:a05:600c:982:b0:3da:f5b5:13ec with SMTP id
 w2-20020a05600c098200b003daf5b513ecmr5396500wmp.34.1674026162119; 
 Tue, 17 Jan 2023 23:16:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f20-20020a7bcd14000000b003da28dfdedcsm1334504wmj.5.2023.01.17.23.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 23:16:01 -0800 (PST)
Message-ID: <94540dd5-69c7-822b-2b67-f5208f37f20f@linaro.org>
Date: Wed, 18 Jan 2023 08:16:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/4] hw/misc/macio: Avoid some QOM casts
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <cover.1674001241.git.balaton@eik.bme.hu>
 <67b2d4700879c3b4cd574f1faa1a0d1950b3d0ee.1674001242.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <67b2d4700879c3b4cd574f1faa1a0d1950b3d0ee.1674001242.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 18/1/23 01:32, BALATON Zoltan wrote:
> At several places we already have the object pointer with the right
> type so we don't need to cast it back and forth. Avoiding these casts
> improves readability.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/misc/macio/macio.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



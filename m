Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE80363D375
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:31:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0KNI-0001oS-SC; Wed, 30 Nov 2022 05:31:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KMi-0001kx-5l
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:31:03 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KMe-0002st-C0
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:30:55 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso1028231wme.5
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JYsG/bwtKGZpLZhhcofbQLdp2CkQltBoFuzl257a+wg=;
 b=IUbRXtW8PwF0RWeD3SAG8XblrVUrppfrYImUVgxhuU3GG5CYTdIJHfv8IDey6/B6ub
 dl/YU/AU7VtPL0y6g5YjDP11913TpQXvLLimpUzZzZ8P4kFUj7YYvbRwHt+GNBapx9+b
 xXxVDBgmktNK6fIJDE5aFgxPwSXOqn9r/ICctpW3zb5d2j/eVbRhU8/4f3hevXjHAMbD
 81HyWz6d3P5t3Ty3nxjrpFsoQgg3XN0eDJsS9XIZfGBP8KKddaR96p3D0vebuJVKR13D
 54/O3TlH8J+lChUZ8t8mYPAIMRF4Sx0TaXhGkyw1sGgXMoltDrvNTdXTamMEuImSrtWe
 6bpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JYsG/bwtKGZpLZhhcofbQLdp2CkQltBoFuzl257a+wg=;
 b=FUz8R6hEcxgGv+8JkoyBSCFT8KaSdJIxo/R08jQ3Cv9Vx9svih7CyBQ6tXD14ks3FO
 n7wkwRAg2tSGv2RpMONYuXkE3a3H1z49yZdPEKjUfG0dVZ4KjxEo5mrG+VjljKLXPaVe
 m16QEbRIOWYFz5+LnKLdS4cieW61aYhwfeDuZQ0zW77+cNS678KjUy+FtaU7rJzwCAU/
 dtGX6t7urygSeSlq6M8K68/TzbRDVG6pqf9HwqMn/o2tMF/cY0naY8OshMZLEDo40FrG
 iPv8ILjgDohgjrB7IO7X/VCo0STauIyxWHqdD9RyJiMFNaMP934YplE1awYF+mQeCTVs
 0z0w==
X-Gm-Message-State: ANoB5pkNdomg9aqfLS4I0V/vdHj3cGOw7+Av5WlYusfwPdQ4JOuTivhq
 6h2cqBxgszDWYtYROHGSJKfR0uTJnzAqJSbP
X-Google-Smtp-Source: AA0mqf7ixkec40iCMVc7PFuOuIdKD9UT3xKtw3ixsjgaFdMnG1/bYZIRfPeGZ2LJm5arA+5eELmamg==
X-Received: by 2002:a05:600c:1e04:b0:3d0:bda:f20 with SMTP id
 ay4-20020a05600c1e0400b003d00bda0f20mr39745633wmb.105.1669804249741; 
 Wed, 30 Nov 2022 02:30:49 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m14-20020a5d624e000000b00241dd5de644sm1078939wrv.97.2022.11.30.02.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:30:49 -0800 (PST)
Message-ID: <8957a4ea-0871-b2d8-59f7-66573d484c39@linaro.org>
Date: Wed, 30 Nov 2022 11:30:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 5/9] hw/intc: Convert TYPE_ARM_GICV3_COMMON to
 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109161444.3397405-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 9/11/22 17:14, Peter Maydell wrote:
> Convert the TYPE_ARM_GICV3_COMMON parent class to 3-phase reset.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_common.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>




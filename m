Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B024C5F4C
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:03:23 +0100 (CET)
Received: from localhost ([::1]:42100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nORdS-0001q9-BL
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:03:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nORc7-0008Uw-AD
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:01:59 -0500
Received: from [2607:f8b0:4864:20::629] (port=40587
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nORc2-0008I1-8Z
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:01:59 -0500
Received: by mail-pl1-x629.google.com with SMTP id z11so726700pla.7
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7mQ/pjYoX2HRNKkdx1xSyv5jhchjeTzJirxbrkBKzw0=;
 b=LSltEpXQP5KItsED5Z1tMiLwwXG2vu8GCDIvodmHBisbHx3cK7UAMnBM+yio2MhcOU
 F1lBr/wQ0U2xugwpeO3UQsAgzdCLBj4l02iEfbp0oBznxvm/uhogHVv2M/FzOFI2Zz8S
 6TIeDCirEVP/OHyBdZDlTnlCzuHvAyo09rX+boQW1hQ3Lx4s/axo7oQI+uiyb35rpJ5h
 cVYWDAw4qaE/0ufJfzufXHkhhKVNzm0+8i4AZ82RQh/R5arGRTVALovFWEyiW/ao86w5
 VneymPD4zVFf4W5TSHXiDwqAWAFExisyWDq6We/fYIUYrO4vWGQmxO4RWE+QZSSBTQIE
 T7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7mQ/pjYoX2HRNKkdx1xSyv5jhchjeTzJirxbrkBKzw0=;
 b=uHIeOhHC3mLWhEoF20zgx9QChlibbA0jYnCj7BBhCGCPTPO1j/dvppJmT82p7HNFCa
 idlfmXUKPz3yCBC4BvBGkEjueiYJo8KgM72P9GRWFHZ7D1eTnGc9Pn1zxT1FEHx69W+t
 xzmB3Tek25mWDhY2h2SIAwSA4Wt2NLqnn83a0A+8Ldb+0K7a+Ywuq11D1j3mYD5XE55q
 U0bIRLOEaAqvnhAG0OIqO4cpQWHOGFZqPPOb4jquWa7e4JZsJdTWBXeA7TmuxG53LOS9
 cLiYOsTIArFwrr7RkMrxkd/+viCd4Kx6clTIFPdPOMh7Bjts3bIBUokNKi9jaGYFfE1c
 OxHw==
X-Gm-Message-State: AOAM5324wzyhkG8kGB03rbOxtnjGQCL4lLwFA2wyWvw0vAKQbaCumKn+
 I8JLlIO/8IAJp5LndU2q2mY=
X-Google-Smtp-Source: ABdhPJzx9R7t7KIin+ChqN0ZxvXEySy9CUnjk038hf8LJP+ZTG3i3ib0t3iMzQ9liEzVnGad3KQRrA==
X-Received: by 2002:a17:90a:c252:b0:1bc:52a8:cac8 with SMTP id
 d18-20020a17090ac25200b001bc52a8cac8mr13508083pjx.61.1645999312883; 
 Sun, 27 Feb 2022 14:01:52 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 g19-20020a056a00079300b004bca2737f34sm9933409pfu.187.2022.02.27.14.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 14:01:52 -0800 (PST)
Message-ID: <e3e52424-07e9-e3fb-fb9e-c0cadf160164@gmail.com>
Date: Sun, 27 Feb 2022 23:01:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 3/7] target/nios2: Only build mmu.c for system mode
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220227182125.21809-1-richard.henderson@linaro.org>
 <20220227182125.21809-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220227182125.21809-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/2/22 19:21, Richard Henderson wrote:
> We can thus remove an ifdef covering the entire file.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/nios2/mmu.c       | 3 ---
>   target/nios2/meson.build | 3 +--
>   2 files changed, 1 insertion(+), 5 deletions(-)

\o/

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


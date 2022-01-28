Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0531A49F1BB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 04:18:08 +0100 (CET)
Received: from localhost ([::1]:55478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDHm2-0006Yd-Ph
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 22:18:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHju-0004VU-Fo
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:15:54 -0500
Received: from [2607:f8b0:4864:20::102d] (port=54884
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHjn-0007GC-P8
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:15:53 -0500
Received: by mail-pj1-x102d.google.com with SMTP id r59so5236800pjg.4
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 19:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EZt81jaNhoY98TNkVvN44GCtkogQ8kkgDfpI9ov+V9Q=;
 b=q5Zbv0XrU1BoSXziV+SG8ZSNvb9VeORVSQJZcMJnHksMgstcya7KuiTLDCISIaCHNB
 namXrZz7SiFJ0hK7WWhc7XY/cD2r/yDVIHGdm/6yO3tTO1SRqsY8/lykTfnrp7uJC/g/
 EHHVd33MKDv/TcxLZi1qaLR3Uo38GzLY9EG6i25xJc0l+qr/zsK+CtjAN6ZbJFSaSwAj
 eNJbwBXcxaCFhJL+Tr2SbxviS/Q3Sv6iO4eGMuy1M6kPfHPzsI6lL0QYf+P7DXdRqLqb
 bau3qLn8NjUyvIgBElO8dSuTrIcxBo5bA560WOfbMsBUPzmaix1sKkdkqpRKrAno7fGX
 z5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EZt81jaNhoY98TNkVvN44GCtkogQ8kkgDfpI9ov+V9Q=;
 b=2O7MavDT1OJEi0j7gfVVDhdF89g9sBvd3TYZHaj8zTYl3M9HoQvaKKhwlcBeuwJ/iA
 kIPThhbyhs0uX+Ivty2MXL4rQz95keBzLISylsgOZXmkicx5d8W2B0RcQq6M3ieEdqY/
 lXgVF7HNzOMqsdzIZ5LFfiptkpf84fdR6NffuSYtE1rn6Ehv5CEqwTWBjA799AcnRg/T
 w5aFM9giH3bzIagFM1w4ah34c2xc/1evSIFOWowCQ0+SNeqtj7UG3qzI3g+9ThrByG1e
 mvd4Mv2tfK/LlaGGH97U8pSbK1IfokrgXWw38GAmJCOgIo29D4Gi1B7pv1zXxFMceDgW
 Rulw==
X-Gm-Message-State: AOAM533R63VqmDQgLGEGSwNp9g7mlspuWYrD4NAvVmELMHOkNUDDZdWP
 Hbi+udLvLFbzaFXizEdLQUqUVw==
X-Google-Smtp-Source: ABdhPJw91vCH+EpKLMw31KuBOKnaN8CkZ0vW0g5zW58Oyx3xuan5bRz5ewaGcrogtukwf+/sdBN6vA==
X-Received: by 2002:a17:90b:38d1:: with SMTP id
 nn17mr4581436pjb.219.1643339744429; 
 Thu, 27 Jan 2022 19:15:44 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id h9sm6769626pfe.101.2022.01.27.19.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 19:15:44 -0800 (PST)
Message-ID: <2343926c-8b5a-9210-a77a-662b35d28963@linaro.org>
Date: Fri, 28 Jan 2022 14:15:39 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/14] hw/intc/arm_gicv3_its: Sort ITS command list into
 numeric order
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/22 05:24, Peter Maydell wrote:
> The list of #defines for the ITS command packet numbers is neither
> in alphabetical nor numeric order. Sort it into numeric order.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


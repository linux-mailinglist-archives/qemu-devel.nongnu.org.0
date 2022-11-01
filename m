Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9BE615079
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:20:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprVm-0002xP-N1; Tue, 01 Nov 2022 09:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oprVk-0002wm-RR
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:41:00 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oprVj-0005mC-CT
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:41:00 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so9900114wmb.3
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 06:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1xP+i1G4s2rGRYEWE/Kzr8CS5KGg937A73Q6+O9DRoY=;
 b=cyC/jNzEfu2EfYzUaUJA5toadJR36/oMe6nGPafbgtshM65UbQOCvQaJr0pRCr1vzx
 YFePf0y3JEWnd3WvFRnLMrcU8jarEzbIucARv45eWFenBm0wEbVAHYv9vPcfeiTIuYVh
 pHbpNW1PmEYxQhA6ymzMWhu+rzmgMi3j3Qdxdba4tTkxDM7lTCJdlRiQT8eiz081iMT+
 pd2G8dfKxrNlBffgud6T+/2Hzn+fcMuSdLwHWyJSZ+G8vF/1owI5X50udRWyFWtHrDNg
 4aeyzsDu9DBe1o4mgdMLXc+BLA/km3anRNvVbU9Qzak0rd1CWS7en1hqiiyXx/VBeMVK
 xRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1xP+i1G4s2rGRYEWE/Kzr8CS5KGg937A73Q6+O9DRoY=;
 b=7BrMkRWS4ORcByAEvqc3cqek2LZzcp7npUk3NKj9IWsNl6K4bRatXNxnplpCFHkbSB
 DpFmTPbdD1lXWnRGZf8mOpB+4SHoZN2z/dy6zjNsuWa4SCmV1GtRDaiYRem/I8uSjxGU
 YfH3kEd0wnryzvwze1xBqOjt232NEymhXHdulopy0V+8g0ulAEMWxtxBP8MVNRRWX5dM
 pPXr+pOMQt68gWAzY+Xxjzn5VYON0gGeGqsGMCjSHwWWwKRbqEH6q1gAsYYPitCIIOXf
 gWAY1g8fRpJs7OvTVqb5OyDOnriaEVukJHxIx4y3cz88g79svU3AQ2TnGq58ewrtOjeV
 BFlA==
X-Gm-Message-State: ACrzQf3HEDFy0s8vIpOMWPCBJ+gpIJ1U8WZ3CHGliQG/2BBc2tjunsa4
 wZwpT68Wv00rSD9xtsV066Ya6Q==
X-Google-Smtp-Source: AMsMyM5rXdCY/QuLT+7/Jy4612zVdIFj3ui9reLoMuadu4YvgEDKsNCXEFqaYF5+uk0YjGyefKaqYA==
X-Received: by 2002:a7b:cb8d:0:b0:3cf:4969:9bc7 with SMTP id
 m13-20020a7bcb8d000000b003cf49699bc7mr22631093wmi.71.1667310057823; 
 Tue, 01 Nov 2022 06:40:57 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bp21-20020a5d5a95000000b002302dc43d77sm10282665wrb.115.2022.11.01.06.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 06:40:57 -0700 (PDT)
Message-ID: <7047769f-1655-3005-3573-bf56897ea0f0@linaro.org>
Date: Tue, 1 Nov 2022 14:40:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v4 2/3] util/main-loop: Avoid adding the same HANDLE twice
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221019102015.2441622-1-bmeng.cn@gmail.com>
 <20221019102015.2441622-2-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221019102015.2441622-2-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 19/10/22 12:20, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Fix the logic in qemu_add_wait_object() to avoid adding the same
> HANDLE twice, as the behavior is undefined when passing an array
> that contains same HANDLEs to WaitForMultipleObjects() API.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> (no changes since v3)
> 
> Changes in v3:
> - new patch: avoid adding the same HANDLE twice
> 
>   include/qemu/main-loop.h |  2 ++
>   util/main-loop.c         | 10 ++++++++++
>   2 files changed, 12 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



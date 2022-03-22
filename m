Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25AB4E4031
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 15:07:36 +0100 (CET)
Received: from localhost ([::1]:42042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWfAe-0006Lk-3x
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 10:07:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWf8O-0005Wf-LP
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:05:18 -0400
Received: from [2607:f8b0:4864:20::533] (port=34725
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWf8I-0002Fc-JF
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:05:14 -0400
Received: by mail-pg1-x533.google.com with SMTP id i184so1891575pgc.1
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 07:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AqfE+YXzQHxcRQFPAkwfE41ALnObhp3XXyp7wCWxZzo=;
 b=gtWVPuqG42PKC/3olovp/8k3JN94snCGwbiof69oZq9CTZpljX4DmroMCCcTs8bM/U
 h+dHVrL1aqOoRwSHbn3PV6DaWC/RQy++X0WHaO9WXVXSLQllCXQUKvHUXoCOYhSasbLx
 qnu1RsiePe0Hkw9KY5/nyFbL9AHBq6i9VEhmUjSS23y1YQ+fzrllao450w/nL9t+tcGa
 8fAsyVOL0NVBYgI2sWvD7FbTMcgOSbOX1V4hLVGuNUT1KDqmISYIOKEivNtGDCxXY3V1
 ZCpyYLK+TqsiI4uhW/PgKy62aDdkz0xeIdTI50uADHz2ltx+feSH3jNYQyPREj28NOfF
 xVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AqfE+YXzQHxcRQFPAkwfE41ALnObhp3XXyp7wCWxZzo=;
 b=0FivyxLJWPUzi00E9eVAPoH2fM5RL36K4vEyG6ZrR3Sldok5maqecAIunTuv9uM611
 TLZ/gL99iDarzqQsoJ4/jthFbtWjJGc2d8mnRZl1zxv7W1OBx53NClNsNfghtiml4vX9
 JHI3ZGx90SeSu3STtDZk3w+p7CHhNITXhXghe7VLgZU6kScfNiM10JOPDfdDa5+IUIyx
 zXUFrunsN86NMoSK+/kuVLy9sdFOQI30YrffOOIu2lA4XYL6am3pVqAMS6XZy5EyioGV
 M8En2TK61Xbo7HWFff1Uhfl3DIDQspILjJII7Ml9x70NzWk4v29ueePP690JC2q907oG
 rESg==
X-Gm-Message-State: AOAM533LXSh3x7wwgnKk2L1lwku9L7SGblAS87Hw2rMwvREeubcoeJpg
 t0m0J9MMaepWofyUOPjksNbgag==
X-Google-Smtp-Source: ABdhPJz6mPTOEy6sYRTQCrPUtEYwsfeIbHpy6rSEo+iU5YiuPTOno8Y9lcIXzRFJeRDfpFyXjfxCEA==
X-Received: by 2002:a63:df0d:0:b0:373:401:6818 with SMTP id
 u13-20020a63df0d000000b0037304016818mr21860898pgg.34.1647957908097; 
 Tue, 22 Mar 2022 07:05:08 -0700 (PDT)
Received: from [192.168.10.94] ([152.44.200.141])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a637050000000b00385f92b13d1sm1403418pgn.43.2022.03.22.07.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 07:05:07 -0700 (PDT)
Message-ID: <b24f3ca8-da88-3e3d-771b-74544b7b556b@linaro.org>
Date: Tue, 22 Mar 2022 07:05:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
 systems
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, qemu-devel@nongnu.org
References: <20220321172006.3014516-1-raj.khem@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220321172006.3014516-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Zhang Yi <yi.z.zhang@linux.intel.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/21/22 10:20, Khem Raj wrote:
> linux only wires MAP_SYNC and MAP_SHARED_VALIDATE for architectures
> which include asm-generic/mman.h and mips/powerpc are not including this
> file in linux/mman.h, therefore these should be defined for such
> architectures on Linux as well.

This is not precisely correct.

MAP_SHARED_VALIDATE is defined in <linux/mman.h> for all architectures.

MAP_SYNC is defined in <asm-generic/mman-common.h>, which is included by powerpc 
<asm/mman.h>.  But you are correct that this is missing for mips.

> @@ -10,14 +10,18 @@
>    * later.  See the COPYING file in the top-level directory.
>    */
>   
> +#include "qemu/osdep.h"
>   #ifdef CONFIG_LINUX
>   #include <linux/mman.h>
> -#else  /* !CONFIG_LINUX */
> +#endif  /* CONFIG_LINUX */
> +
> +#ifndef MAP_SYNC
>   #define MAP_SYNC              0x0
> +#endif /* MAP_SYNC */
> +#ifndef MAP_SHARED_VALIDATE
>   #define MAP_SHARED_VALIDATE   0x0
> -#endif /* CONFIG_LINUX */
> +#endif /* MAP_SHARED_VALIDATE */
>   
> -#include "qemu/osdep.h"

The patch is correct, just need to fix the description.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


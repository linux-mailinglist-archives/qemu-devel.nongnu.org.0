Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE88D4FAA7A
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 21:25:32 +0200 (CEST)
Received: from localhost ([::1]:38250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndGiB-0004j6-UB
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 15:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndGgO-0003Mj-R9
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 15:23:40 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:36775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndGgN-0001ED-7R
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 15:23:40 -0400
Received: by mail-pg1-x534.google.com with SMTP id r66so10697257pgr.3
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 12:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pda8nbAPsRYazZqWTdokxBj1SXupl+aJrjCtSfa3U8Y=;
 b=x1oTtfFWQI6UVFgV3BWjC8y2gEOSuC+aqoLCyyIvQvmqb6TYp+NOQgpqKkrHufmhJ/
 9P2t/YBEF89YbJfUWiozYAxUBYSgafIC6iXrIy80w7HaBVXtBgn9c9vWHww0qIxFsrzr
 TZdqONM66t1kl6g/sHkhviXZs8ipg3FysA71TPSNQ/Edqw36swK92wDWNpkC++ksY762
 JsjOzmBpR9a/tjtH/xwRIpNoZsJdvtYmBdvjudf517BtHbHFpa7dui7XKf0vlDVJd929
 /tCENSIuGX+uhKsehBAaspOYqeMEnWGTRFDYfyLwcFlJ2V9l8D5a0YkGRtKVZx82EaHl
 NK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pda8nbAPsRYazZqWTdokxBj1SXupl+aJrjCtSfa3U8Y=;
 b=gRR1RHqEV/iDah+n4sq0MKhuEZJ7GOot5TwGapmYfnr91cqT42KujCY73mEbZH5AZD
 R1DpMqbyChyB9d87+wHGUVs+DJOZA8JjG0Jb20iq2E8xCvIX4XghedbPaX5GY6N8VRM/
 IyVFW2pQBuh5g3pzW0txnD5QclYSK0KXpzAfOJsvoQK1K4aJKwDpy3784161xu2DGnN6
 IQbLNaouGeieMQYAdvIIeXTwSxisal+i+eabFl8i9w2YOurDVuTY44fKLc//24t/omqV
 xvWoxiQsdtlH1O7lFhmWk6Wh1zEXKLFp7D7Ja6MFQOISkbW2XCyn9te/Doghue3F/mTY
 gmoQ==
X-Gm-Message-State: AOAM533W7tBX45FQp6NFfKkDmylDgFDOQlfjUncHPSflDPszFjuIhhOP
 Cz5+wwyAS7CXpuO1eFv9fkt7gw==
X-Google-Smtp-Source: ABdhPJyNXhsjnDQWObhPoB/EaDuAaoLVSSekB9lLgocGayVbgvXkKNzijkd2n35ds1HFGAa60lRimQ==
X-Received: by 2002:a63:d158:0:b0:39c:c4b5:69ca with SMTP id
 c24-20020a63d158000000b0039cc4b569camr12339307pgj.187.1649532217835; 
 Sat, 09 Apr 2022 12:23:37 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 q18-20020aa78432000000b004fb0a5aa2c7sm31537034pfn.183.2022.04.09.12.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 12:23:37 -0700 (PDT)
Message-ID: <7e140f2b-207c-007d-d701-6f6dad295cea@linaro.org>
Date: Sat, 9 Apr 2022 12:23:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 26/41] hw/intc/arm_gicv3_cpuif: Don't recalculate
 maintenance irq unnecessarily
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-27-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-27-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> The maintenance interrupt state depends only on:
>   * ICH_HCR_EL2
>   * ICH_LR<n>_EL2
>   * ICH_VMCR_EL2 fields VENG0 and VENG1
> 
> Now we have a separate function that updates only the vIRQ and vFIQ
> lines, use that in places that only change state that affects vIRQ
> and vFIQ but not the maintenance interrupt.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_cpuif.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5004FAAD3
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 22:40:31 +0200 (CEST)
Received: from localhost ([::1]:38612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndHsk-0007Ba-04
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 16:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHrc-0006H0-Eh
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:39:20 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:54833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHra-0003hJ-RL
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:39:20 -0400
Received: by mail-pj1-x102a.google.com with SMTP id md4so3379004pjb.4
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 13:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ilOtw8qMiA2qqltwFUSSLccCkRnbZpgAMd/9e0E3DLY=;
 b=V6j5URpM2I6jS/WpUHpb/9faghnG35X/QNtDWXjvsSMU5mySOTm+NRH5qP3liA63uR
 aT+//cmmJ8hfUlGJ7ZE4TBXqb3YtzbsOubxlEasUKWtevVsMDxNknAhzyIGG5yihh7wc
 GrD8oc5dc6ukNMTX8MKlK5h1OMvfVZmmyx9NmNWLNhQaZl0Bd7RVb6rJQ8d6qM2i5rZJ
 /AWDJGPS3YnXj8/wj11d4W3bnDEb31RdQ8rw6a6Y4qoyU/K/L4PIk/gg+3jOn+qG09tF
 Ve0LNH8Sy1s4kKJUEz9JDcVT53HgoulWCjrDVIuTDEKG6nr0lk8L0Z1OpWuQWtVXAH/2
 PdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ilOtw8qMiA2qqltwFUSSLccCkRnbZpgAMd/9e0E3DLY=;
 b=eJpBeAguap6VO2MrOs0xxcUgTab7UE0510Rl4av9sR8/HJGvTWXfoxi5qyjA4m2XE/
 /OphkekX5Jh755WqKLsDnT4urnwCaGJ2HP46Kjz2w0ORPxS1Twi4gsv0MAJG0x3DuqFd
 xECWtPncOg45jLCRy0etBUFTw+XauhI/9Ikc+4rxF91U3nkkFF05xpdKjEbNU8f4Yutp
 0IGtotUPvzpvRvAusld7wElA2SvvtBFupijMAWBjaP0mdZer+zFn+upYVp/zeRz8mRD4
 2TkGR6tWCdTFohEr0a3oj9y5Dc6kH6GiETKoREPlCnRWzSJmQW93pcpYpEHeGmxOgerN
 BpLQ==
X-Gm-Message-State: AOAM530DrG7LMBLQAoyP7v3iNDSekL4zTRpls0nPW25FFyrg24Y02HrN
 L36WdmjREcLwOLajpC0uqZw9G3/CdclaQw==
X-Google-Smtp-Source: ABdhPJyhIiOWSYRscsC8t3nZhwtRttr3k90lPb21Nikulok7u5PcRGveXKzwqaYq/5vBqeeIvpkLJA==
X-Received: by 2002:a17:903:22c6:b0:154:4156:f397 with SMTP id
 y6-20020a17090322c600b001544156f397mr25393393plg.29.1649536757337; 
 Sat, 09 Apr 2022 13:39:17 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 v126-20020a622f84000000b004fa666a1327sm19166950pfv.102.2022.04.09.13.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:39:16 -0700 (PDT)
Message-ID: <0ac61270-c360-9bf7-b272-3ba1434a5170@linaro.org>
Date: Sat, 9 Apr 2022 13:39:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 34/41] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_mov_vlpi()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-35-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-35-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> Implement the gicv3_redist_mov_vlpi() function (previously left as a
> stub).  This function handles the work of a VMOVI command: it marks
> the vLPI not-pending on the source and pending on the destination.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_redist.c | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


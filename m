Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADC84FAAD6
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 22:41:59 +0200 (CEST)
Received: from localhost ([::1]:42078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndHuA-0001BD-Hk
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 16:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHsO-0007bY-EP
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:40:08 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:55972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHsM-0003vz-Qa
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:40:08 -0400
Received: by mail-pj1-x102f.google.com with SMTP id ll10so3242510pjb.5
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 13:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=A/jw9NQe8qwKLqVBXPT/ndO+16/ObXPyZz4yOTt7Lsg=;
 b=baeWlD3SAA4Mt6ZyG4jphMLS1pvKVrFSYaSkPwArmWM2FM1Q3YqN7gkWAv5CE77wUe
 uFJn5kWTnZW6pnun71pxVJJah4vX+HTSNJpn9XB4KD0U8GALhIwlEyfxKKnFDQzLJiix
 d2pSpV4/mcVphS1MLR0idMSEDr8rFlFMJPRieqxgaIqfkcIb3Ng7TabA+EHN9rZiT7dp
 2i3FqCbHCuKT4Py20xCtU7bPuWsuUcW3+xIfz3CCsvlX4tou3/Cl1hnbxIuJCU2MpA+U
 ykmgbcEcEWHaMd3M41hWLO1o6lVvGhkbRmacTg/20RRdyoWs05wdLsdxK4OY5NUEV5pr
 gKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A/jw9NQe8qwKLqVBXPT/ndO+16/ObXPyZz4yOTt7Lsg=;
 b=gop+bLBKQ0pkCyYUk4bZsfDq7HZ7QjoC6gvYz5z0FdbsaOV6hrzkDakgHMXSuf9pS7
 HW89P4P8IsO7+/ax2VQYHL5579X+euoFhT+3hy5nJXXTynxcmSPzq/rASxlomUp9Ednt
 0H00otUM7yq7P2UE6kdXLXcO61jd/vWnOMkhAia7oeQ4txYfREMdhYgxquFWNE6xh64y
 trEs2rxbmCF2xcR7a/55+fibltcJiBop50VpxOZgxIaZOue9+lJmBeJ7q3AqOmtCis4P
 VThnxRXn8UBtfY+FFBz2udK1uCie3/tmIGVT4g+Zumaz4Y6vCNOuvfMqDkdXq3+deUmW
 RGQw==
X-Gm-Message-State: AOAM532fjUsJludZBJkdi5nNwdlEF4uRcSF82NErHHaCvNou8MFVED7L
 B30MNnzMvBwHTJQYEXrjGQLtHA==
X-Google-Smtp-Source: ABdhPJysWPGzWkfLOsx5W6MxGeTWiZ8nzDsVCcKxcyI5zuO3iqAo6zRbQ82tVNfMZFG3l6X11CKLJw==
X-Received: by 2002:a17:90b:4f4d:b0:1c7:5324:c6a0 with SMTP id
 pj13-20020a17090b4f4d00b001c75324c6a0mr28823644pjb.160.1649536805483; 
 Sat, 09 Apr 2022 13:40:05 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 b4-20020aa78104000000b00505accf8070sm688079pfi.112.2022.04.09.13.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:40:05 -0700 (PDT)
Message-ID: <cf2ca913-1f8a-adc4-c7f0-ae2aaf94811a@linaro.org>
Date: Sat, 9 Apr 2022 13:40:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 35/41] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_vinvall()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-36-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-36-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
> Implement the gicv3_redist_vinvall() function (previously left as a
> stub).  This function handles the work of a VINVALL command: it must
> invalidate any cached information associated with a specific vCPU.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_redist.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


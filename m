Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C9B4FAA20
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 20:19:41 +0200 (CEST)
Received: from localhost ([::1]:45944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndFgS-0002C6-8j
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 14:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFe5-0008RZ-3h
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:17:13 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:36525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFe3-0000D8-F6
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:17:12 -0400
Received: by mail-pg1-x529.google.com with SMTP id r66so10602701pgr.3
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 11:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iszBu/LpQiqk1ElyZ4IlKvqyXDWwxdiW/CzhJO77gcY=;
 b=R84qbjr9rjhB4xq1HoVKNVU7gQGGbNdVGFwmivx/Fmf3DWF17zsXHIDIYxr97cFBz4
 sot9tKgXU2sECkgsMyNRmzchsfgg4YRUIJETS8eghl2VBRsMx1vZP/B4mPppxX1OskKI
 ndcLmnxKb71vwZjvcOczt/GCarmPpH+ltqiO3p+TXxxqRZomzueeRTjNLyiKevlqTRpK
 yd5tWiFEVuudg+Rfj8AqGVkhQaeh5u6lFyUTTKss9ovflZeJUFjXSPdoqKzMjjSQGteA
 UVcrE8tx8GzQ0qZuGl6php6DzO3FFwU0u+KB+7dGB74iq8s2C+97YWNKzmP5S9ODYeYb
 OwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iszBu/LpQiqk1ElyZ4IlKvqyXDWwxdiW/CzhJO77gcY=;
 b=SUHQYJaRNdW8jcPLL3X0XrA/pAflBl6dpQNTbgtG+L6qPDt36/Q9mv5XNebtSRjykm
 R9eyLUlzhrYh42o5JcneOjx/wonX40d0ykMdtsf8u86F+2li9TVKDpcM9sg/WjSO4G8G
 cN7sou77e8WLaaFIG5z7QFt1YNIm4XNowhIo6O7f43rSVipW97R0Z+5yeM9r6R2swwNf
 B2/iKGfz7RwBcckQWjamHEB7hO92ewhbVVmA2O+xVo0EdSdR0oDe1VpuLYmOKVlBsqDs
 hsAo4+kSewsqYVN/iHKlhZ6WlETPV6ClMhB7wGUtFpLCJULSCQeH/puCTAXNl4TkSVH2
 2GJA==
X-Gm-Message-State: AOAM531CbjLPdi0svo25GgU0zpaMHC9Q4sntCy/7yWGyBXeJ05GKzKFY
 dole4/oUIEQbTY/dKe4sFIucAw==
X-Google-Smtp-Source: ABdhPJz3W43lVHAHCv4/0rfisAmKUeAoBh5Yf7eimtB1lCVlqXGGIJ4p6BC9Ln6pPd4CWK1q/ixn1g==
X-Received: by 2002:a05:6a00:18a1:b0:4fb:27d:54e9 with SMTP id
 x33-20020a056a0018a100b004fb027d54e9mr25121436pfh.7.1649528229044; 
 Sat, 09 Apr 2022 11:17:09 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090ac40200b001bd0e552d27sm14746294pjt.11.2022.04.09.11.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:17:08 -0700 (PDT)
Message-ID: <fb815c4f-8148-5569-5c3a-135ab18b785b@linaro.org>
Date: Sat, 9 Apr 2022 11:17:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 17/41] hw/intc/arm_gicv3_its: Implement VSYNC
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
> The VSYNC command forces the ITS to synchronize all outstanding ITS
> operations for the specified vPEID, so that subsequent writse to
> GITS_TRANSLATER honour them.  The QEMU implementation is always in
> sync, so for us this is a nop, like the existing SYNC command.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h |  1 +
>   hw/intc/arm_gicv3_its.c  | 11 +++++++++++
>   hw/intc/trace-events     |  1 +
>   3 files changed, 13 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


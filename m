Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ED03C888D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 18:20:12 +0200 (CEST)
Received: from localhost ([::1]:48356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3hcJ-0006ZF-6s
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 12:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3hbG-0005eh-GF
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 12:19:06 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:46603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3hbE-0001pY-Sz
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 12:19:06 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso2046957pjp.5
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 09:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=74FUzAidO+W1bTmmXDJezlqzNDcF76NO+7vkwp4uXfI=;
 b=xNJXC/62oDwtInm41+p0QZnYW943UgbhuOFPGKhYACoiUGGA/FnlVn46NJdTh/YmW/
 /qAohzfSqRQx2uV1MTc/469x8jWdFqy9+BxEmfFxFNRXdlTE34oF3vFXvecPM1TGhUWy
 m4eS8UeYGB7Y+/f5OL7QkjjWZ+IOqHe4x+95jKqEK4HAVKqE2ymZkppbBD53x3hfvoSK
 yjGhj2Jruvc04YgcuZO0pramf48Cw5y2TsXXUC/d5jGZG4TVo5jiNzWdzJoVvw4RoPFc
 O0n0NvFR53eu7gASRto24XP4+m0ZR3WBvYrekyF7rrUF05hwbfIT2Gvlnzjkgru0vV08
 YtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=74FUzAidO+W1bTmmXDJezlqzNDcF76NO+7vkwp4uXfI=;
 b=GZRnFAN8S0IuP4cKl40KxkNFOGeKzPlAaaKgvHBxcgQGV/4Yxsu0BwDF6/OCaiyyIa
 yAnNJZnRpAHgao+oBXrpxGcYVEDZqpVhYSHJemvRDQh2NiBaXuvrsF0BMh8mUCJTAghv
 SySdudH7DiGT4TY6OtenXRNKzc5AGuV9XNAHHt2wg2d6BUFuuQ7Gz6BkpqCcghruzuC1
 2/Dry22/CoPQK15Tc4qDRGwomilQlbIDltiv3yMvvoPO6Dw7gMctdKC2CzA034nSstBw
 4YGBzxMVqRDn+zlCfSI9yUzsdkt/LlzcQMBwOsit+k+VsCzV7uPylAOlP61jmJ2cI+rL
 hsWA==
X-Gm-Message-State: AOAM531Fczko2SAyuuyaRY6UVk2a2SrZUGZlOlt7gU5vqDvyYDqrR6bQ
 62WAWoRpkxgtVVWU30omPmehuA==
X-Google-Smtp-Source: ABdhPJxWunW1gPD8WGAJ12egPwGXTPAEFDszzuzcZM1+K8tMMaRjzdkR6zAmYUGgssl6PPo926lCdA==
X-Received: by 2002:a17:902:8bc2:b029:12a:f6e7:c4ff with SMTP id
 r2-20020a1709028bc2b029012af6e7c4ffmr8347963plo.36.1626279543455; 
 Wed, 14 Jul 2021 09:19:03 -0700 (PDT)
Received: from [192.168.101.210] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id r15sm3803883pgk.72.2021.07.14.09.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 09:19:03 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] docs: document cubieboard, emcraft-sf2, highbank, 
 midway
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713142226.19155-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <27495ec6-f6c6-72eb-f92b-4b828b670b2a@linaro.org>
Date: Wed, 14 Jul 2021 09:19:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713142226.19155-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Beniamino Galvani <b.galvani@gmail.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 7:22 AM, Peter Maydell wrote:
> Peter Maydell (3):
>    docs: Add skeletal documentation of cubieboard
>    docs: Add skeletal documentation of the emcraft-sf2
>    docs: Add skeletal documentation of highbank and midway

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


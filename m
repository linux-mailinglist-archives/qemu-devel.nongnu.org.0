Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A09F60CD36
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 15:17:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJnO-0004Qm-2I; Tue, 25 Oct 2022 09:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onJms-0003qq-AR
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:16:14 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onJmi-0008L7-Oi
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:16:05 -0400
Received: by mail-wr1-x435.google.com with SMTP id bu30so20894374wrb.8
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 06:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v3tnjox0wcGU9VQfRsRfu3TYvHu1seevEivR6dWWAzM=;
 b=ijN05tWtwIm1hM/93NPTKCbxy30Sx8ydndpAqpawgSq7OcBSxbhvs1jmNlEMg3DoIU
 bFVgAchIhLDV1oMAVUM1YmTO8DOFWhiweSyLvwOV2jYrYsF8AnxefSvTCBRknjlnCBI0
 BCvHFd4JHoUGckd6pShOrwC2XBxKve/UYdFvtgb1pXOz88PMQt1HiDjERt/oFpW+0bSA
 9G6IgvesK1TYkSRDw77HzZO36/kxuUq8zgLs42A2vL2t0nBIxA9ARxQm5MwGhoiWMuI/
 s5A6UBfQTKzPY4FFMbCJmpPLDxrFX45b2gK37PFr87JpgXNyO8EQ+XKB1e4GMpty3MLv
 2KEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v3tnjox0wcGU9VQfRsRfu3TYvHu1seevEivR6dWWAzM=;
 b=H3zjXql+7MHGFUYm0sr5Jy/8CKydFggUyYE41H3hxni1gB9YDH5Edivnz3V+dMqLqL
 IM/qMsGEDPMb3R96rI9SYm2zCDfiwbDEjzDYl28RHpP7QzHB5h4YN+NPibV6gNGjjRlu
 so3gl1zU6sIYL5fDWnmiy8vFfQ1icA7dHwRAU7RdxgEeALrM21lTy2bRbPhOeoJapV/6
 P/UcRmakqTK7nzUErkdFwMwYqK0HB5ojhF/hl/rNDZTm21TQdSucLNj8hJHrGlUuUP1y
 1Js9nW9Ds1tpYH1rri6QV/PIYSSCvgHQPFfXN4GBilAINpE+yD+oBA0Bew0TJoL2dh8N
 /dAw==
X-Gm-Message-State: ACrzQf2Cjqaap2CVbQBiKicd2f7Oc+jx1ytVfDRTbz25HmKMz0E9gyxd
 3E2KtKWwl1IbZI+/bQyZnAuYWh6WDaWQDLXqGNc=
X-Google-Smtp-Source: AMsMyM4F4ZDtpjcBgFbS11aGQ9kuEKyKbl5WFZNng8Eg0doC154eZ9SuG1rlZZ0/tBzbyHpeGHsSUQ==
X-Received: by 2002:a05:6000:1f0f:b0:234:eb90:cf91 with SMTP id
 bv15-20020a0560001f0f00b00234eb90cf91mr20153132wrb.192.1666703758459; 
 Tue, 25 Oct 2022 06:15:58 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ay19-20020a05600c1e1300b003a1980d55c4sm11331359wmb.47.2022.10.25.06.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 06:15:58 -0700 (PDT)
Message-ID: <de3d51e6-47dd-0156-6872-3d6048a2515b@linaro.org>
Date: Tue, 25 Oct 2022 15:15:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 2/4] include/qemu/atomic: Use qemu_build_assert
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024232435.3334600-1-richard.henderson@linaro.org>
 <20221024232435.3334600-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024232435.3334600-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

On 25/10/22 01:24, Richard Henderson wrote:
> Change from QEMU_BUILD_BUG_ON, which requires ifdefs to avoid
> problematic code, to qemu_build_assert, which can use C ifs.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/atomic.h | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



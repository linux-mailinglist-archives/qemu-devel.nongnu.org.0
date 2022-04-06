Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123AC4F6015
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 15:42:07 +0200 (CEST)
Received: from localhost ([::1]:52430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc5vC-00039Y-22
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 09:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc5tD-0001ve-OQ
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:40:03 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:44022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc5tC-0000mt-9i
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:40:03 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id f3so2208750qvz.10
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 06:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JsIhCE1HfNCOoKQx4sW1hpRr4RYsON+3L+H+2XmG1Sw=;
 b=eMTDcyUqnKL8mTaHi26ic9OVeN826l0I2t+4bbrBq8o1HtdoxemJB8igORK3hHEOD1
 XDZp94u0S0TfIMN9YjtTdNs7irhnaJnQlx4q8WE/44yV08vytS0JGweNo/sdbXA2VxWU
 zBghkVKbd4mBfPS5gRgrUtSeA82JFJoYb+qFP8iAwEet53+jgWFtoA+GJXb5A7C+x58U
 4j1UlrRhViYq81a5KkK7nUbsUppk0W194WkKi+RWM6JVeAy9iRpQy+qWfdqviRb0dKB5
 MG6mMctU2Sg5iJKk6/1hynxdSKALqnK2R0vfA8TKuRPr6c4MtVelRfojGuiaEcJPfOQM
 eZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JsIhCE1HfNCOoKQx4sW1hpRr4RYsON+3L+H+2XmG1Sw=;
 b=gkAqxIiPu+elAzD7WwsF+ccmsIc/ZNjtuPV9l0frv3Sh7PoJN5wT9Gfgj4ESZVIJEo
 uZL2MokBWukSLMxZL+G9CtowoD8tNaLW8eKWnP3iaXucZ1z25tyudWdqx5UYWCFfcnWf
 cfMUvqIeD6BszDygJjHr3yj4XbvUZajdaZXlGE9Nju6mZPL2vZDkSIbGt3ZtrqjkEr/p
 YQWk2WFkfbOFsGvpYGnCqGWNbNtttGUOHSdst5gpshMTbp0VeXhOjB98BvH03Iq78lL/
 4Z5+vkqCaF3LUkvveZ2TTenwu+EMR9pJCh7aUVh5SayBUXyiufhGuulHz4FJwE56Gpbk
 Jb4Q==
X-Gm-Message-State: AOAM5302XdAOD/aHZ5Rdj8pt0zZGhPaByQJKlGmF2lTjhb/jPNIQM1yQ
 Egqls4AJD8GNW1wejpowVBbclg==
X-Google-Smtp-Source: ABdhPJydW56O4sZZlUMEGqQ7eHAHZ0oQNGzw/IkWOUyLDrgDBS1PcRMGlGYrCe/mInhux3In0Cskzg==
X-Received: by 2002:a05:6214:528b:b0:441:13b4:9523 with SMTP id
 kj11-20020a056214528b00b0044113b49523mr7243774qvb.3.1649252400845; 
 Wed, 06 Apr 2022 06:40:00 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 f19-20020a05620a409300b00680c933fb1csm11502357qko.20.2022.04.06.06.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:40:00 -0700 (PDT)
Message-ID: <6602d9c2-0f50-6ea0-c84c-786668f9bc64@linaro.org>
Date: Wed, 6 Apr 2022 08:39:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 03/18] hw/arm/exynos4210: Put a9mpcore device into
 state struct
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/4/22 10:46, Peter Maydell wrote:
> The exynos4210 SoC mostly creates its child devices as if it were
> board code.  This includes the a9mpcore object.  Switch that to a
> new-style "embedded in the state struct" creation, because in the
> next commit we're going to want to refer to the object again further
> down in the exynos4210_realize() function.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I don't propose to try to do a full conversion of every child
> device; I'm only going to do them where it makes a subsequent
> commit a bit nicer, like this one.
> ---
>   include/hw/arm/exynos4210.h |  2 ++
>   hw/arm/exynos4210.c         | 11 ++++++-----
>   2 files changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


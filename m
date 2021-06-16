Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AC83AA366
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 20:42:26 +0200 (CEST)
Received: from localhost ([::1]:55168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltaUb-00038j-Re
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 14:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaRi-0007XP-Jt
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:39:26 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:47002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaRe-00029O-Vk
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:39:26 -0400
Received: by mail-pg1-x52c.google.com with SMTP id n12so2687747pgs.13
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 11:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dXadQ5WSk57Fj8FSMnGg1LPKs4Q+DgDE5DvfHJxdaYk=;
 b=GuiNWEECbrGsG0QUZaG5eA0jLPq3cB+b4ucPJpCL88EO7S2lYHvT8na3hOamkT+/BY
 Ivl7ys/N8w/oqXB9To6+u21QYLpXPWCY6K4HxTKzklpiUq8BxjxziUEcVZQ0Qs0M9ahN
 uaApXXg23N97b6lHDJGwe285nTImNTBA7LZnvTbZLagIcd93LPlNHw60oZNjHIUnJbNv
 z2tjA5Mru6wXrqPXwJY7pblmmKyoyPqJz45KpIvVhj4iKVXYVgaes7cyBktEIRa4BzA1
 EHKLwcrtUss2rQXdwLzdFtJEcFdw4RxEHcSmKhBEw7a9F4SWka3iI9JsZ0rpceQpGTLZ
 8TUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dXadQ5WSk57Fj8FSMnGg1LPKs4Q+DgDE5DvfHJxdaYk=;
 b=LfVk8dx6wxBpEv5uGLHsSqfPgvtNFd5u3e4y2ktSGetP4k1ff26QgKDiN4SYXR/1hG
 mHu2HMNTQZtWWEuJgV/nju77vxhuc9YqyP4VMCGqSaK1DuKPOwdNI/aj4omQpdtgFpxN
 SConVOgRSPiyBydfUYd5+dGgpM81fr0XHQmofVNV6mpZeJHG/QsES8BB6NJSbbLSVGxu
 RSrs1GUlBruGQJTGhvk47/2D6oLGqgQe2GNOkopp44ukex6SoSIlNprCsgal4FP0Bd8D
 IzISvkZAvGpdAxJCfDC6E6hPqw5d5CnD11gUdA1FNz82H0BLK9hrH9CyrM0R7G5zI/99
 nZOA==
X-Gm-Message-State: AOAM531sh8izqCDKqLkZhrh9v8bTpa0W6r2YsiGamIDZguPVgY+OeyvT
 mplIr0kI8aXyiEOPQ4d6DU+NEQ==
X-Google-Smtp-Source: ABdhPJyecj+mtB7qW9XGb0IBDutpa5zOZbzoxq5M57FkwwhD6iKo9KoHb+dTGtZtLduvpWbjlxOxOg==
X-Received: by 2002:aa7:8003:0:b029:2eb:2f8f:a320 with SMTP id
 j3-20020aa780030000b02902eb2f8fa320mr1193861pfi.70.1623868761724; 
 Wed, 16 Jun 2021 11:39:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 4sm5436887pjg.30.2021.06.16.11.39.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 11:39:21 -0700 (PDT)
Subject: Re: [PATCH v3 02/13] hw/input/lm832x: Define TYPE_LM8323 in public
 header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ecb8ccde-4ff0-58e6-af5a-9eb9a9f4125f@linaro.org>
Date: Wed, 16 Jun 2021 11:39:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> Define TYPE_LM8323 in the public "hw/input/lm832x.h"
> header and use it in hw/arm/nseries.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/input/lm832x.h | 4 +++-
>   hw/arm/nseries.c          | 2 +-
>   hw/input/lm832x.c         | 1 -
>   3 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CBA39C4D3
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 03:36:03 +0200 (CEST)
Received: from localhost ([::1]:58862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpLEH-0001CZ-SF
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 21:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpLDI-0000Dz-QB
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 21:35:00 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:34571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpLDD-0005Vd-NM
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 21:35:00 -0400
Received: by mail-pg1-x52b.google.com with SMTP id l1so9242124pgm.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 18:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OU50V3pTHSUQcQ9LG58F9/C5JTGxP15zI5nz4AAJpGU=;
 b=ccqEWlA8XgqWY4GMRNGDlnfLc2lGFKlz4sr3Cz1+JFyBLbLjH0gsIWlvB+c8ILqDsX
 GrsdQEdLJ0FCjhxfi+gsdGquOmbGMy0RA88T9E/XYsYWdNoWcnDoFGvHFq+OM1KIvy7d
 OkBTHhcLcIur68SyqXGIxzHPKUKiW7KThJbhzvyHWTp3ynPbbRDA+5tBruX5dbya++fc
 oE6UAKesZ9K/lblQ80Lq+/Pnyv3YyKrovCtk7+Y1stRnJy2KP1LVDhPCx14mRw2aSZ35
 fUvkbJr5I0gB8ROU2FLwTiw17GoGJS9aFX7jrR3Q74L7LOpV6CyYKpbE4SCR/dWS+uux
 wWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OU50V3pTHSUQcQ9LG58F9/C5JTGxP15zI5nz4AAJpGU=;
 b=N27iOsNWpCdScY+OFFZ+kyzbNs9JfV+w6BIhWuqNbUHi+OYQZQV/CqRGsyzdhH9B7N
 EdsXSXAdjEPQSB17mItiVqEDotPqDF6maDNywAz6S1QYStgKFvjmxBaDebfqHqBmBLdb
 CXBYo0Yh/VQFW70CUPbhuUL8V6J9rw1Snyk9mSSCipaBNWIUnHpfaGMhxnJegiqvXslR
 yzg49/fvIOMpJq48WtoiR/2+RHRb/Ho0XJM7qEkChnXh88dY8tor+bcLZL0Rm9JRScJI
 DJMig8vLzGJuvkW+Jc2GBz0YSV8gcO1Zh1e08A2UIeDFxOXOSvNJ/dV5OFoNuFu5W9gX
 RS7Q==
X-Gm-Message-State: AOAM532ESoPotEcpzkeudzCXgJfrRugnlU/pXHTqjbZxosHseEA3oBfI
 FDQ5yFl0avBruI6RTcsNGOh8cg==
X-Google-Smtp-Source: ABdhPJzCjPmWMU3XOHwvQ7XFp8nzDK57fF8iy7tMTzf9an3BavjVq/36egk4d6m+waoAW1q2ZTjx7Q==
X-Received: by 2002:a62:2987:0:b029:2de:b564:648d with SMTP id
 p129-20020a6229870000b02902deb564648dmr7141673pfp.48.1622856893783; 
 Fri, 04 Jun 2021 18:34:53 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 q23sm3049827pgj.61.2021.06.04.18.34.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 18:34:53 -0700 (PDT)
Subject: Re: [PATCH v16 49/99] target/arm: make further preparation for the
 exception code to move
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-50-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e55bccdf-8e31-e051-2382-5a1ce3a32cbd@linaro.org>
Date: Fri, 4 Jun 2021 18:34:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-50-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> the exception code in tcg/ needs some adjustment before being exposed
> to KVM-only builds. We need to call arm_rebuild_hflags only when
> TCG is enabled, or we will error out.
> 
> The direct call to helper_rebuild_hflags_a64(env, new_el) will not
> be possible when extracting out to common code,
> it seems safe to replace it with a call to arm_rebuild_hflags, since
> the write to pstate is already done.
> 
> Also, some CONFIG_TCG needs to be extended further, so that all
> the tcg-only code is marked as such.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/tcg/helper.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


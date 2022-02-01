Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AAA4A6A76
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 04:13:21 +0100 (CET)
Received: from localhost ([::1]:43874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF65A-0006cR-7L
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 22:13:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0l1-0003Q4-NW
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:32:13 -0500
Received: from [2607:f8b0:4864:20::1031] (port=34520
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0l0-0003vU-0G
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:32:11 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 l24-20020a17090aec1800b001b55738f633so2533071pjy.1
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 13:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=goo6oaXwdm+BW3JSHRWRvsRlS0iVpGbzKTndI3ipkbY=;
 b=hAdj/Egw7m4IkCzV9rHqloLFg/gkn0l/XpsCQ8I7ryqPrb5EsqT68yfoO59YE8yrz1
 iK4tGP+VbUmcJ+ttBRP/HPUKqfBZph2D2jUEiYQgZM44pSVmbKcr+Zy1gZTAb+cCfu0Y
 oSjfC+qFE2cRzC0NW3y3IpvsSlCtvPUjd0V+D2uF9/lL/7LEXAj+xjCWG8x8n9e0wkb3
 LS3kYg2ZH1/uuN9vb+gjzhXCGYLZmCioCau/EPAGqI2Y6x/e8lNvSJnYWb1fLYRfQp95
 Ig0h7TjMLrHFZ5VivZEzKiIwlCwg9Rjz8I137YCIgrh79NtTothHUOfVxNazphO9Trrp
 dO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=goo6oaXwdm+BW3JSHRWRvsRlS0iVpGbzKTndI3ipkbY=;
 b=KPvw3z0c+t4yyffUUWS5a+xXphRy66Svthast2W+x7MNC4aBA25D4pkhW+Q0HfR1Y8
 N+SsUrkwhDh7IsA0lrmItQXSRUWLtJNKkyTzcDHZsP+zZYlAwtOHkfH2x4u5WU29y1NA
 Hra4bvV3Z8tMBM0UKqwVrWd9DrvR3q7wLkTOAP0CluztU+Nlh1wr3PPJtAUG6J/EUM6H
 NRP7Fpc6m5Ek8aIOF1U/i0sOBDE3LQzHo8ryazFWjpik/QFJVyGjqM9qwIvz5Ix4BFdZ
 yyQ76lpHSMMRSn5IIehVc/dM1kmS0TiXU4UQYIobTihV9lP2rdug/N6EIUrWm+Xsrbgf
 S9Hw==
X-Gm-Message-State: AOAM530LVAedEZa5CYHwkVX+N6jQDpMqKzGmUkHII8uQ/rBs7Jdt32eo
 fXWzbB80PC00Pc7rpTEnxYx8Hg==
X-Google-Smtp-Source: ABdhPJy3LOWPWPHv4LNU4VeQ+dNx0CNIXGcxrns2VulU8w9pJV3J2eNMQyD/SSoNsfLWfsmU4amkpA==
X-Received: by 2002:a17:902:ea07:: with SMTP id
 s7mr26651021plg.163.1643751128600; 
 Tue, 01 Feb 2022 13:32:08 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:4f14:faaf:dae:66e4?
 ([2001:8003:3a49:fd00:4f14:faaf:dae:66e4])
 by smtp.gmail.com with ESMTPSA id 69sm32686209pgc.61.2022.02.01.13.32.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 13:32:08 -0800 (PST)
Message-ID: <4db28274-78a5-c1cb-2f0c-4052d59941b4@linaro.org>
Date: Wed, 2 Feb 2022 08:32:01 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 17/22] bsd-user: introduce target.h
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-18-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-18-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>, def@FreeBSD.org, jrtc27@FreeBSD.org,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 22:14, Warner Losh wrote:
> Create target.h. This file is intended to be simple and describe basic
> things about the architecture. If something is a basic feature of the
> architecture, it belongs here. Should we need something that's per-BSD
> there will be a target-os.h that will live in the per-bsd directories.
> 
> Define regpairs_aligned to reflect whether or not registers are 'paired'
> for 64-bit arguments or not. This will be false for all 64-bit targets,
> and will be true on those architectures that pair (currently just armv7
> and powerpc on FreeBSD 14.x).
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/arm/target.h    | 21 +++++++++++++++++++++
>   bsd-user/i386/target.h   | 21 +++++++++++++++++++++
>   bsd-user/qemu.h          |  1 +
>   bsd-user/x86_64/target.h | 21 +++++++++++++++++++++
>   4 files changed, 64 insertions(+)
>   create mode 100644 bsd-user/arm/target.h
>   create mode 100644 bsd-user/i386/target.h
>   create mode 100644 bsd-user/x86_64/target.h
> 
> diff --git a/bsd-user/arm/target.h b/bsd-user/arm/target.h
> new file mode 100644
> index 00000000000..1f7ee49bfb4
> --- /dev/null
> +++ b/bsd-user/arm/target.h
> @@ -0,0 +1,21 @@
> +/*
> + * Intel general target stuff that's common to all i386 details
> + *
> + * Copyright (c) 2022 M. Warner Losh <imp@bsdimp.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef TARGET_H
> +#define TARGET_H
> +
> +/*
> + * arm EABI 'lumps' the registers for 64-bit args.
> + */
> +static inline int regpairs_aligned(void *cpu_env)

Nit: could use bool.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


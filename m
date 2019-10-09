Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730A4D13E5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 18:21:25 +0200 (CEST)
Received: from localhost ([::1]:52132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIEiJ-00088d-Sz
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 12:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45638)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1td-0001hy-Bb
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 22:40:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1DT-0003bz-Gn
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 21:56:40 -0400
Received: from mail-yw1-xc2b.google.com ([2607:f8b0:4864:20::c2b]:42488)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI1DT-0003bM-Bc
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 21:56:39 -0400
Received: by mail-yw1-xc2b.google.com with SMTP id i207so225183ywc.9
 for <qemu-devel@nongnu.org>; Tue, 08 Oct 2019 18:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rmP8vxN+KLwyGlOUXl0rLTwAlmu5jw6i0lzFceY8tvw=;
 b=nQx6yMzngvzZ7wTeenASObYb3YbPs6jsngEShRiHnx285/UZeN6tJ2ibSxel5WDPJz
 Xy2tRi6DMs/TOCSjtWASRhBD0hTvcAuQx6/8EkJRQong9Z+y3Fz6s6C1zs7tEjhddcGj
 LdxIeQoIghCBDIaL8Ouqij6rxP4dSvNKsLl4wOf5oU460efhjK7FH/vxiWBnPrPCMXIG
 zyRNABQDCFnVXGR86bwmuiUSAlgIdrguvBeWSEuGGgvtF1neOmbyrsMu0TPHS6PmTVuD
 a8k6jfbJN+aNd8hQjELRRD1EC0dqmRh23iAZZsJncTVoHJ3aM7f/cTA39AqCXjEUWQhO
 mY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rmP8vxN+KLwyGlOUXl0rLTwAlmu5jw6i0lzFceY8tvw=;
 b=R6Bow+BGB/W9WXt3sKDXmPPJ28EO+Kx75T+oHm92fV25dK5oxRPHFKODnVyEAwX4Mv
 gIYfpie0765/9veIgznLLsKWBRniqB20uXkmI8nbWUJt/NBONA24zcAeuzmsHIoqrOT6
 ke18N67v6AxAUzAfEdKU7kVM7Vnszn1iBwN7vz5hz1oBGRLF0cF5h5Ww8gArlkNQhDYi
 crKVfX6OcOFE9B4PeTPbMG5CqzIop8BK2YibVRuG0lSQORlXnnYVA7I5cFdf9DHjGxlI
 tFj0blpCGK+DrgWehlQDfAtZ/t8nkGDlqtevh7+l6qatrcOjhZXoGbOE6uUNIEVRzApv
 nHUg==
X-Gm-Message-State: APjAAAUqm7uNjQD2jCetTSOleB8QpGYe0xHWu5QurZ310uIaNH//0LIS
 Cxf9EBIzApnMaW2Y2OjXwMj8IA==
X-Google-Smtp-Source: APXvYqzc85GJoIfFSl5Qs82QoYcNOWveCcHXNvJR/3HIevfIXoNzLZGYh2KRbrErMaoP1IfONlk5UA==
X-Received: by 2002:a0d:c144:: with SMTP id c65mr991281ywd.218.1570586198422; 
 Tue, 08 Oct 2019 18:56:38 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id n185sm210648ywf.86.2019.10.08.18.56.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 18:56:37 -0700 (PDT)
Subject: Re: [PATCH v2 11/21] hw/timer/exynos4210_mct.c: Switch GFRC to
 transaction-based ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <09f5a1b0-8750-eaa4-c6a3-c395ded3167c@linaro.org>
Date: Tue, 8 Oct 2019 21:56:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c2b
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/8/19 1:17 PM, Peter Maydell wrote:
> @@ -945,7 +977,7 @@ static void exynos4210_mct_update_freq(Exynos4210MCTState *s)
>          DPRINTF("freq=%dHz\n", s->freq);
>  
>          /* global timer */
> -        ptimer_set_freq(s->g_timer.ptimer_frc, s->freq);
> +        tx_ptimer_set_freq(s->g_timer.ptimer_frc, s->freq);
>  
>          /* local timer */
>          ptimer_set_freq(s->l_timer[0].tick_timer.ptimer_tick, s->freq);

Failed to update them all, it would appear.


r~


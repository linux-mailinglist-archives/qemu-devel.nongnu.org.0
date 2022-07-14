Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DD85757FF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 01:23:35 +0200 (CEST)
Received: from localhost ([::1]:55764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC8BC-0001NY-Fg
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 19:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC899-0007Og-Ae
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 19:21:27 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:38658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oC897-0002XD-Pp
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 19:21:27 -0400
Received: by mail-io1-xd33.google.com with SMTP id u6so2702577iop.5
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 16:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RFbYg/9IZaCxbg50299r5ayxh8MKdvHZWY+gkNe5lJ8=;
 b=yZNrzS3o6Yi22O1MwkdK83UuJFUdo3JUXsD1QSWYAPQmDkbkhPoR0+2WUcyLRe76b7
 4CCS5iUIngf+06m3U0jyTGRT8hCKo5IHDh+nOYSrRVs06nqospOQHfi8I2LySSRQRBxx
 ZIIpfwqyNFsQgfZi0zyRAishHEzdy595ITWRFCTlGESObApYT9jhNblV8rjx4WeDJELj
 cRcbz5m4RNUyGhJVv7bglc4/Es1pVBpNFJXx4/niafSQlv1mETh8dTB3jb4VbIPZS+hX
 PWSSvTu2cII3rFj232/TWgHpwep+ISmqz49J3mlvGq9hWmg9edP1OebOvlbASAg8r4E+
 ZsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RFbYg/9IZaCxbg50299r5ayxh8MKdvHZWY+gkNe5lJ8=;
 b=3PgATNpBuPVEGTLu0JWMzaT+RSZ7i3JWMjheD6V2SmlSq0XuXGipzh7v+We+NryiOo
 E7sb2sRWfobH6BlRS5jspia9Z3k4vj09rtLmkYspTGDDQkO6T2AfiCPuNrN/vRmnkUSp
 LVgCz7DFBhoZhAZlhQhb8kIk8SsN1c2xPXhfs7Umy3EOXT7EQbJlKx4dfq9tWGlOoqbe
 pe11A3Gkto+PdV5WUCnVog+X/fT5sAquhFQt69J4MSsTSBmWQe1mWmKHh3NYb25oiQQs
 QFjlEYTX6ld3spIcjDxsGLJhMAmPhntEOZNDhBVnCxIBEEWYqsL6fPb+5cVmunw0A4cq
 3ADw==
X-Gm-Message-State: AJIora83GOYIDX+dlQq+EdCd+RQMC3DIYXzV0u7FNxNWf3iBz3vVKPgW
 3uOb4B6wLJKS6uZnkdbrHBJL6Q==
X-Google-Smtp-Source: AGRyM1vgykAuKXGlqghZWtiYx6B7j0t6lzF7xDqeI4a1p/nkpvCfbOYZ2ipI147DnD9DWYk/cgW2tQ==
X-Received: by 2002:a5d:9291:0:b0:669:d90b:24e0 with SMTP id
 s17-20020a5d9291000000b00669d90b24e0mr5547504iom.53.1657840884607; 
 Thu, 14 Jul 2022 16:21:24 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.185])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a02cc43000000b00339f1d1c090sm1297707jaq.113.2022.07.14.16.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 16:21:24 -0700 (PDT)
Message-ID: <0425cb63-4174-8354-79db-1dc0b34d0466@linaro.org>
Date: Fri, 15 Jul 2022 04:51:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/7] target/arm: Store VTCR_EL2, VSTCR_EL2 registers as
 uint64_t
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
References: <20220714132303.1287193-1-peter.maydell@linaro.org>
 <20220714132303.1287193-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220714132303.1287193-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd33.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/14/22 18:53, Peter Maydell wrote:
> Change the representation of the VSTCR_EL2 and VTCR_EL2 registers in
> the CPU state struct from struct TCR to uint64_t.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h       |  4 ++--
>   target/arm/internals.h |  4 ++--
>   target/arm/helper.c    |  4 +---
>   target/arm/ptw.c       | 14 +++++++-------
>   4 files changed, 12 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


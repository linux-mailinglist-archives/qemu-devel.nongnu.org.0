Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671ED8684F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 19:50:48 +0200 (CEST)
Received: from localhost ([::1]:54360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvmYp-0004e3-Ky
	for lists+qemu-devel@lfdr.de; Thu, 08 Aug 2019 13:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37595)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvmYM-0004Cr-7Z
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 13:50:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvmYL-0008ND-B2
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 13:50:18 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40837)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvmYL-0008MT-5T
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 13:50:17 -0400
Received: by mail-pf1-x442.google.com with SMTP id p184so44505901pfp.7
 for <qemu-devel@nongnu.org>; Thu, 08 Aug 2019 10:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6oPVqx1wqDYfAAeqRAV3HKmhOToqt8pYoFiLj6HRMig=;
 b=k+c43z0NgoOlW3VSx3FoceQmQ5j4J6T3sTv8/wRiRSJ+Ec8DI8w2FguVK/a+ZO8yMh
 GzdF2BZ9D9Dr5t3U2kuyS+3tRTmiHbkfvKt4yg4yiMdUOgPeBsHplo7wXJmn9bGrYMpH
 VwOJ/roaplp1z4o25hZp6jaMzUy271A2yliWOLZktmr8QaFmOldn2yRbaiXzC3tn6Iyf
 88mCU0TNNmSNh1s/pLGRLo0WsA4ztFq1NusG0rcfrSKMdBbat+vDvgXf9SNUaBpqVv3y
 AQICObR8QbyVvJVUuFeEVrH6GUtq+4RL2F5j26TUjS++D4nC8+g1LYNkousQ2kwyrk0n
 djhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6oPVqx1wqDYfAAeqRAV3HKmhOToqt8pYoFiLj6HRMig=;
 b=KcYnrCzeMY0sUoTDoFpbTTIhVfQ9DIP3Ym701MnApJbIRKD/b1snMhAJN+AqrTRRjx
 kyTQUtfYFfGi3DV6PRUjoLv0lbot2/KxFbe5i3FN2Tym3LXKI6qAT0RZeq6UWyytffwn
 lsHJAXTFT2YBIlcWCR5KvOXUWmO8FqVwxE4aPD7iLiQEh/QhPQupHEtBAH5VW/IpUZnz
 Zirxirn7U7vLddPZCrbcttl0kx5Zzmw+wAIp5eoeaPp15/oW3wemgg6C4Rob6CgtIDLW
 YL/SYHhJhhKSHat5NHR1WwUsqlR5/M4KDZPbuV5z+E42cWuzHVEUmgiBn6QzzblFTPwD
 rZ/Q==
X-Gm-Message-State: APjAAAUY/EjP+ncpnA/tOkh067To9I/T1UBTmE+MTUxDQ5S0JUkBJZgn
 ASAbKOXR4oPJ56p9a+Z4WztphA==
X-Google-Smtp-Source: APXvYqwBnhDYV6jZmZ8hf2tYIyroWoLDCZhyTHkJn1q886dpOpts+Nke5H2uti4px/oOunQXYlG2Pg==
X-Received: by 2002:a17:90a:4803:: with SMTP id
 a3mr5382096pjh.58.1565286615989; 
 Thu, 08 Aug 2019 10:50:15 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id l44sm2862273pje.29.2019.08.08.10.50.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 10:50:15 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190808164117.23348-1-alex.bennee@linaro.org>
 <20190808164117.23348-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4b6bf6d2-9416-21e9-5e3a-f6461518111c@linaro.org>
Date: Thu, 8 Aug 2019 10:50:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808164117.23348-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-devel] [PATCH v1 4/7] fpu: rename softfloat-specialize.h
 -> .inc.c
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
Cc: Peter Maydell <peter.maydell@linaro.org>, armbru@redhat.com,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/8/19 9:41 AM, Alex Bennée wrote:
> This is not a normal header and should only be included in the main
> softfloat.c file to bring in the various target specific
> specialisations. Indeed as it contains non-inlined C functions it is
> not even a legal header. Rename it to match our included C convention.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  fpu/{softfloat-specialize.h => softfloat-specialize.inc.c} | 0
>  fpu/softfloat.c                                            | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename fpu/{softfloat-specialize.h => softfloat-specialize.inc.c} (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


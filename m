Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA18A653DD
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 11:33:15 +0200 (CEST)
Received: from localhost ([::1]:39805 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlVRy-0006Cm-6E
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 05:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45369)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hlVR7-0005Rt-8k
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 05:32:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hlVR6-0004pG-8A
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 05:32:21 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35407)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hlVR5-0004md-UI
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 05:32:20 -0400
Received: by mail-wr1-x444.google.com with SMTP id y4so5510604wrm.2
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 02:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WjI2eLVEJJCNWvFVdEvzIB/WRyHw5M4MDE4KaMowrD8=;
 b=BK0QD5Uz3PBGy4dQ7T9gpd5JLrCn5tDKG/gq0ZCE6LSvnLuM5KaKL8Z08NKXnWcSCP
 aIHNUQ0f/e9tPJoCPi8CHJ2AAEZYRnhaUK14iNEBSXTAokG4JgCBI59GM0S6yP27e4r2
 CvtSsn2A9OyfeeTRtvFRAUrlhg0rjVijbO46dG8EEv1+9mUBguzsV+T8MzATGZheZX7A
 evUr/t5saDS6zdJs2Ax0WA9KxRGr0t001lmRjIfWyT979jJXJJHH/mYyEcozuBjuNKZH
 UcRs+u/oa60+5Z0OiMGUG4iyUSILH14QVn5vFmPtQRHHBy0ZORqIAULPIpwXvJRGXo/i
 HArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WjI2eLVEJJCNWvFVdEvzIB/WRyHw5M4MDE4KaMowrD8=;
 b=qXPb9e4XaR34LfWdbUTP6pY7DP/bCQJdm/GpiOhIzIigdzjRV4fXagOGo6UF10Nl/A
 nBeb4aWd9Dcd8AR9kdT7p6YhzkHiHIXQg81rOkLc665nZkuujcC7pfx6lNeQcm0v71Yl
 W3YbleFoRDkFBf4FNPDYfZ7+QFjqf+qL+vBssn2lf3+pQlFa32xkTTYfr5733YJeFaWU
 4FtBt9x5Y7XlBiLi0IpbAHP8xL5WPji/86vpOf9Wk8IjoMfwY/ORt8I+9dqjuMuNNYfG
 C89iC7pNX7kBd7bMpVujIIU2BH0s5bbJK9WTjQtF08DqafiiUMjnmfezqMdQzYW0GdcK
 lzMQ==
X-Gm-Message-State: APjAAAVaAhtcrXssqxS5Joi9aOSm0c2kLs/PQOrS0iH5EXflGvWqLTuT
 yev8MTbgNPalmHYTdyfmIeuUxw==
X-Google-Smtp-Source: APXvYqwjCVTaD4uBd89YQZQDiNY4pSEYD+LlbAqseox5f2VKDIiemHq524AYhHpruzYke3WKCyy6tA==
X-Received: by 2002:a5d:668e:: with SMTP id l14mr3874238wru.156.1562837535270; 
 Thu, 11 Jul 2019 02:32:15 -0700 (PDT)
Received: from [172.16.96.70] (mob-31-157-172-216.net.vodafone.it.
 [31.157.172.216])
 by smtp.gmail.com with ESMTPSA id j33sm8514824wre.42.2019.07.11.02.32.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 02:32:14 -0700 (PDT)
To: Jan Bobek <jan.bobek@gmail.com>, qemu-devel@nongnu.org
References: <20190701043536.26019-1-jan.bobek@gmail.com>
 <20190701043536.26019-7-jan.bobek@gmail.com>
 <9e107b82-4a51-e2ea-ee1e-19c4d4e05d01@linaro.org>
 <5f9b2e47-9fd8-8825-2169-c9398099d515@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e2f9fb4a-ef08-4630-e33f-7c827254a3d6@linaro.org>
Date: Thu, 11 Jul 2019 11:32:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5f9b2e47-9fd8-8825-2169-c9398099d515@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-devel] [RISU RFC PATCH v2 06/14] x86.risu: add MMX
 instructions
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/10/19 8:29 PM, Jan Bobek wrote:
>>> +# Arithmetic Instructions
>>> +PADDB           MMX     00001111 11111100 !emit { modrm(); mem(size => 8); }
>>> +PADDW           MMX     00001111 11111101 !emit { modrm(); mem(size => 8); }
>>> +PADDD           MMX     00001111 11111110 !emit { modrm(); mem(size => 8); }
>>> +PADDQ           MMX     00001111 11010100 !emit { modrm(); mem(size => 8); }
> 
> Not this one, at least according to the Intel docs:
> 
> NP 0F D4 /r: PADDQ mm, mm/m64          (MMX)
> 66 0F D4 /r: PADDQ xmm1, xmm2/m128     (SSE2)
> 
> The SSE2 version is added in a later patch.

That's not how I read the Intel docs.

In the CPUID feature flag column of the MMX PADDQ, I see SSE2.  While the insn
affects the mmx registers, it was not added with the original MMX instruction set.


r~


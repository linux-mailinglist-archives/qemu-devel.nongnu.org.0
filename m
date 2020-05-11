Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026661CDE7C
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 17:11:49 +0200 (CEST)
Received: from localhost ([::1]:60900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYA5s-00048m-2P
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 11:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYA4K-0002XP-0b
 for qemu-devel@nongnu.org; Mon, 11 May 2020 11:10:12 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:38833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYA4I-0004Jr-Gz
 for qemu-devel@nongnu.org; Mon, 11 May 2020 11:10:11 -0400
Received: by mail-pg1-x542.google.com with SMTP id u5so2088499pgn.5
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 08:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=q4sh32+78K30LPveBC14va56k5Z46vY/Cx/oB44XKAg=;
 b=DeCb6G7Pbhd5Z/HY7xrOl3v92d0yGQ9MCOehmPfRjUeCCymz9Qoj71fQrdWgQx62ea
 5ORKT5jhLWIj3h4XmAiCqF1/43R0DpTShCdqtkjdsXcsLTSVycbKGJrar7chZ1xatfIK
 /s7iV4ZD892cArq/SmJm6u7h+R6mwnoEZHkgxvowgi0k30Pe/bGGpZZ6z3hPsJ5JvBhK
 CztlqjKflyiAv+MtFx+PGkhAK5MZp/w9j07GrRM4bEzoY9LoHmyyMfZNPP079IHeYB4C
 WYDpdVcBIFmIO5Ua6OMNeTwO6CkAnQUqXYhPe+YGWHW/cbH1xpvuYA5ejuYDbAd9XEyH
 /Wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q4sh32+78K30LPveBC14va56k5Z46vY/Cx/oB44XKAg=;
 b=gFRwP97ys+0pN9MT7tFiQ3QmiWKaRUEiFcMUuI43uWlG5TPJj448EGlUfu2Q1ITdw2
 wXNBNovp2okvhXx0AlpDWXeJjzVIEqBYGBeft1UC08YWLHaMkU958dz44Z/INvuWXsAX
 rxiqnnmkjRYIklPwr9z2a6xwDw8cmcbXCVqQ9CvsdnHj8woubYtGJBJCWAXayYY5kRQl
 DavPF6f275POaRjeVzlVnotFjpKORGHZxqXUl3L0WVGL66nWhFOCyJ5MZAjzj6nINoM2
 Lu0dJ9IKrSQNi9GBjSeLtuemMpN7cYGRvkfMdjL6Cn1027Qy63GPQL7Nyygh9jpJ1s+C
 oo7g==
X-Gm-Message-State: AGi0PuYgh6T+3TgXI2xzMm4vGOHbeU9RIBa619nLOAjQXMjsutX+OUve
 eRE38aLctIr4H86KddT0pBNTQHdjc/Q=
X-Google-Smtp-Source: APiQypLmE2EVbaq32ovDqe8JvpmjHUx8t9Q1MdMVLYUIJybMXOj+OTpy7JIW+zxxH3ZDk0r9pcDUkQ==
X-Received: by 2002:a63:1e18:: with SMTP id e24mr14513755pge.296.1589209807941; 
 Mon, 11 May 2020 08:10:07 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id r12sm8099213pgv.59.2020.05.11.08.10.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 08:10:07 -0700 (PDT)
Subject: Re: [PATCH 0/3] tcg/s390: Support host vector operations
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20200508155745.8223-1-richard.henderson@linaro.org>
 <9c9ce42c-f283-67a5-194a-7d973ce9a3d2@redhat.com>
 <253a16ad-a964-31ed-32f7-b0eb87287249@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b93bbbfd-e363-9c40-b2d7-d2f901cc1874@linaro.org>
Date: Mon, 11 May 2020 08:10:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <253a16ad-a964-31ed-32f7-b0eb87287249@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/20 2:51 AM, David Hildenbrand wrote:
> On 11.05.20 10:50, David Hildenbrand wrote:
> I'm having issues building this due to lack of HWCAP_S390_VX.
> 
> [linux1@rhkvm01 qemu]$ cat /etc/redhat-release
> Red Hat Enterprise Linux Server release 7.7 (Maipo)
> 
Yes, I found that when I pushed the branch to shippable.

It seems there is a disconnect between glibc and the kernel, and some distros
have fixed it and some have not.  It's still broken in upstream glibc.

I have added an ifndef to the branch, but you can fix it locally by changing to
HWCAP_S390_VXRS.


r~


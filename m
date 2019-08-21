Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C755697F93
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 18:01:19 +0200 (CEST)
Received: from localhost ([::1]:49776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0T2z-0000EE-LT
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 12:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52602)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i0T0d-0006U5-Ep
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 11:58:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i0SqB-0007KF-Bx
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 11:48:04 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:38045)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i0SqA-0007Ik-8Z
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 11:48:03 -0400
Received: by mail-pf1-x443.google.com with SMTP id o70so1687583pfg.5
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 08:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4vKp2LDTy0LylhDmzkVSvSL1Aeom2wjKgXDuMDrEQOM=;
 b=IaKEK1ZFhjj4aMkHo82Le31tQMKK8XwLzZOY5tpLDj/vftfWuqu1j9V/IWwXy5BwHq
 N6f6OiXdRe1g1NVEEpCzLV/ZVP/Wt9uCv4SVI+Fy+3lPvsOFdxrcDFqNiKHxd2dPi08G
 JI0B0pPu5QDSXSwBgJDXPfmx2uEIfwHE4Fq340dzLr587QdSyebFYbO03HB/Qhy7JQZ2
 P7D6noBMCCWH7zC4Y2vhcg9oGDtt2NNyu8phchtuwlKAueaWjd6BvVBcDBqP6sqHym+Q
 CdV7/SCEl+iWkpzdD5kQBuAHjy+wXy5lh7yXzUYI0sl0SHsF158CEPwFg0dDIhjL0Aae
 RO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4vKp2LDTy0LylhDmzkVSvSL1Aeom2wjKgXDuMDrEQOM=;
 b=j4ShXcYDIvIli26kTH4817NegT3LdiAIrsA0JhmR/3aZtHoZd9VwBvc6wfDkNLF1q1
 WHnP2/yw0l1CUM+b8fDfDu2kI21ce+LILI3fncSlU2tZ+0/rtrwbDXKo7TVkQTHmY3C4
 yoIHHG4DBIqcClKrNcTSfnRVR12mqFWEbPb73N3OuiRv+p4iLf8ErjeBMZvEHFLfZDva
 OjPTAVOg0oD5dKuHftEslBwGwKkjiPIVAWTp2oDHX8TACsHOx0T3mSsJ6iNLN8Lw1/2m
 gDDfbsv5KUPlgOlyGIQstVFON1EnmsLzamJLtTxCL2Ac4tNfsMG7YIih71qtuJsZVRvY
 UTEg==
X-Gm-Message-State: APjAAAUzB6y26C3Fikz4RpKrNvFUzkzEEykvQz6LE6iw1MGaCDTYz3Gu
 B7LMHZ2MVG4cNXQFd0TW5FgFXw==
X-Google-Smtp-Source: APXvYqzHvd1UUk06Dd5UhaE1/MHHrgYobB2XUPYamBhYDDAzCC6UuIEJDR+WSGi8oXVIZM50+JnICA==
X-Received: by 2002:aa7:8257:: with SMTP id e23mr8136155pfn.160.1566402479835; 
 Wed, 21 Aug 2019 08:47:59 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 203sm35754417pfz.107.2019.08.21.08.47.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Aug 2019 08:47:59 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190821092252.26541-1-david@redhat.com>
 <20190821092252.26541-4-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7c8e4f0f-8362-f342-4e42-9ebd12fd59cb@linaro.org>
Date: Wed, 21 Aug 2019 08:47:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821092252.26541-4-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-devel] [PATCH v1 3/4] s390x/tcg: MOVE (MVC): Increment
 the length once
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
Cc: Florian Weimer <fweimer@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefano Brivio <sbrivio@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/21/19 2:22 AM, David Hildenbrand wrote:
> Let's increment the length once.
> 
> While at it, cleanup the comment. The memset() example is given as a
> programming note in the PoP, so drop the description.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/mem_helper.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5106B3A196
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jun 2019 21:45:03 +0200 (CEST)
Received: from localhost ([::1]:60152 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZhGw-0004Pl-GQ
	for lists+qemu-devel@lfdr.de; Sat, 08 Jun 2019 15:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37683)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh1V-0007Ac-MP
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:29:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh1T-0007IU-Nc
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:29:05 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37109)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh1T-0007GI-H0
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:29:03 -0400
Received: by mail-ot1-x342.google.com with SMTP id r10so4922626otd.4
 for <qemu-devel@nongnu.org>; Sat, 08 Jun 2019 12:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qOIV2hNRtghskSFtsJFnFzTh8BbWC87JcqU6YAc03N8=;
 b=g+SRTcfaagymtpwihCCAYls6TPsL1j2icTaFaiS4gaDX6Rhfv5VTIoSq2dAeT2GDUs
 NerBLIwHZy3HiBo2OJ+O3h5VuFgS1Or6/j+i06Tt5Js1O4QpZAqgM+WlHh1/pDrlWn1P
 a2KRpfRIWNgWksP2ms7wQVbkSw3waWIfOKZ/KDzshv5FIBh63oi/GclGcLt79aYcBjKb
 cYDXw6A008i6GN1QCqf6CgaV4MO6rrQMNmlxA1hL3o0rvHqEDIWrvKA3AZa7RlPfaMu2
 uUiegzKs63FcaTLm8+/23VDOCjCRpOIK5gxCpwKjwM00BhxM/6ccARiK0SgfA/FAUPVY
 QPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qOIV2hNRtghskSFtsJFnFzTh8BbWC87JcqU6YAc03N8=;
 b=BwpmP1HAevQjSpB36UzlJxCifmKea2ApZFk0EWSJ0PTFf9qUqisQZi0mLPTUlD7Ova
 UCsn8Az5De6xQZ0CXSEAURjMBQ4hLkw5lHuGAdQq5G7cYjUAxRkkXDSF0DOJKzr5pbAO
 1CXroIFWv7OxtxlC7hPrInCdJ/HgZyTMOtwngxBtGGGOz9+M9iJ2LsRkxCHt01XVd5ko
 WbAyEV5in7YyUQDcHU4mpJXKk6RBV4UGecmt3PooGd5RAVZmgdHzsBBdo6rZ3A1DGkUz
 w3JE/8oUwVGGVf+NJoaa6cxIt4P1k/qDJa1UDeQidYtziCygnHHKsUlZ+Mrkm0xVJwLa
 2G+A==
X-Gm-Message-State: APjAAAWUzrd+++P/Vowqlzvom2197eHM/aLM5w4wI7txXX3nrhUKpfHz
 Wu7UOQlu+D8weFYD0ZbPY6zJ/Fosq4SQQQ==
X-Google-Smtp-Source: APXvYqwoXDc5vXThSh9lWvJIimM73jaBBAc3kFtUgTqYkNJKEFBit1fyrBoQiScnVkmjV1cCMn1kpg==
X-Received: by 2002:a9d:174:: with SMTP id 107mr12041966otu.322.1560022140796; 
 Sat, 08 Jun 2019 12:29:00 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id g10sm2151286otg.81.2019.06.08.12.28.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:29:00 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-29-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <da80c3ea-5a33-e7e0-209e-89a8413c8f06@linaro.org>
Date: Sat, 8 Jun 2019 13:55:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-29-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH 28/42] target/arm: Convert VMOV (imm) to
 decodetree
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

On 6/6/19 12:45 PM, Peter Maydell wrote:
> +    n = (a->imm4h << 28) & 0x80000000;
> +    i = ((a->imm4h << 4) & 0x70) | a->imm4l;
> +    if (i & 0x40) {
> +        i |= 0x780;
> +    } else {
> +        i |= 0x800;
> +    }
> +    n |= i << 19;

Can we reuse vfp_expand_imm here?  Given that you don't have pure code motion
from the old code (due to field extraction) it doesn't feel wrong to go ahead
and fix this wart now.


> +VMOV_imm_sp  ---- 1110 1.11 imm4h:4 .... 1010 0000 imm4l:4 \
> +             vd=%vd_sp

We should concatenate imm4h and imm4l here, so that trans_VMOV_imm_* only needs
to do "n = vfp_expand_imm(MO_32, a->imm);".

(We can't use !function to expand the whole float constant because the
decodetree fields are "int", and we'd need to store a "uint64_t" for dp.  C.f.
the SVE trans_FDUP.)


r~


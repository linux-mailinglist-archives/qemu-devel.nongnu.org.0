Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A732410064E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 14:19:11 +0100 (CET)
Received: from localhost ([::1]:33870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWgvu-0001QZ-3f
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 08:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37403)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iWgsy-0000aG-KO
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 08:16:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iWgsw-0004G5-IH
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 08:16:08 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44494)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iWgss-0004Ds-Sk
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 08:16:04 -0500
Received: by mail-wr1-x444.google.com with SMTP id f2so19424519wrs.11
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 05:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xn74si/96LipcDXg7WwPe7l5vA0uZuF2CnVbsKg/m9g=;
 b=fwCRR1TLMmij+jcEp59+XTlPqP5y9j1zJ8WNvr0Ob+lwGKDwm9wPKLbag5N6tjYSgG
 ySqYkXoU0Rzft1nIYKzHh1+gAouVJ+vWUrpUD/3qdT9Oo0iDu6u12rCii3FZQOmlAElB
 /wyWYFYTHFi9memykJpOHEIMdebsoOCNkYNIFCfKdreOZu/q823I9IHDJTVWtk4OaLgJ
 q4h7eM15jBEfL+WKsdJv/rOXDSb1lfUf1FqAvnTdMwyzA4YjLGdGVXDFHR++tMcNmr9f
 lJKG9F/h6bVLuSnOE3c/gJ3P4DA5pGzUElGo8SFvBnd1uxqcbj2WOP9c7FYbXBgnJDQX
 dbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xn74si/96LipcDXg7WwPe7l5vA0uZuF2CnVbsKg/m9g=;
 b=DrKMIAcMTSPjBOF0ZL84215v5w4evnMHG6U+e7NrlN/xIPFRnHDuj7+5Iqu6syQ1PN
 RfmFSid4yKbCMuJx88gddSo/3m4b36ugc4xXWAubEQP316aqGb/vZcdy8FgrNcpGMyHk
 1/a1WLEocaHv98jFn/vnIG2itPdfJyO8MZ/GGWHuoqKoH01jCORE/cnk8PzdIYM0IC/y
 C/imxkf6I2ohcguvNKSZb0S55DbKF8U7X5wyZvnOOEriOvNru3IZXu9w/2hTgSr8Zahm
 nfzP8IYj++CKhA3Hs3oJDV83wrd5+EPHQMzvzc783Boy8Ml4QxC7FYJpyZWbj2xprH6B
 ZLrw==
X-Gm-Message-State: APjAAAVH3W+62+5ycW8vrKr3fi7feSDqUkOCdWUSCKPhy7tUNhT3CMur
 Z5LpfCDr2mQqoRi2YxIjsjcBKCQ5KW/u1Q==
X-Google-Smtp-Source: APXvYqw8N5bZCDWWa+kQkJJpv/2ffazC79CjcDK4+co5LRDNeL+I4yMZ+p2oUHYI8GCNqQuQcH8FIg==
X-Received: by 2002:a5d:4684:: with SMTP id u4mr28790370wrq.352.1574082961237; 
 Mon, 18 Nov 2019 05:16:01 -0800 (PST)
Received: from [192.168.8.102] (65.red-79-149-41.dynamicip.rima-tde.net.
 [79.149.41.65])
 by smtp.gmail.com with ESMTPSA id u4sm22908727wrq.22.2019.11.18.05.15.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Nov 2019 05:16:00 -0800 (PST)
Subject: Re: [PATCH 2/2] target/arm: Relax r13 restriction for ldrex/strex for
 v8.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191117090621.32425-1-richard.henderson@linaro.org>
 <20191117090621.32425-3-richard.henderson@linaro.org>
 <CAFEAcA8FdT8R4_nwUQ1QLBMBST_K0xuHABER3f8kt6JY1vYojw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f8071794-cb5f-d987-0e7d-11a70ba4d2bc@linaro.org>
Date: Mon, 18 Nov 2019 14:15:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8FdT8R4_nwUQ1QLBMBST_K0xuHABER3f8kt6JY1vYojw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/19 2:10 PM, Peter Maydell wrote:
>>      /* We UNDEF for these UNPREDICTABLE cases.  */
>>      if (a->rn == 15 || a->rt == 15
>> -        || (s->thumb && a->rt == 13)
>> +        || (!ENABLE_ARCH_8 && s->thumb && a->rt == 13)
>>          || (mop == MO_64
>>              && (a->rt2 == 15 || a->rt == a->rt2
>> -                || (s->thumb && a->rt2 == 13)))) {
>> +                || (!ENABLE_ARCH_8 && s->thumb && a->rt2 == 13)))) {
>>          unallocated_encoding(s);
>>          return true;
>>      }
> 
> These cases for r13 are indeed no longer UNPREDICTABLE in
> v8A, but they are still marked as UNPREDICTABLE for v8M...

Ho hum.  I knew I should have looked at that doc as well...


r~


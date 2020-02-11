Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1133159484
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 17:12:25 +0100 (CET)
Received: from localhost ([::1]:52492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1Y9A-0000xI-Ju
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 11:12:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52019)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1Y8F-0000RZ-AO
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 11:11:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1Y8E-0003w1-7o
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 11:11:27 -0500
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:34145)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1Y8E-0003uA-0A
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 11:11:26 -0500
Received: by mail-io1-xd41.google.com with SMTP id z193so12373263iof.1
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 08:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SDZppdxkmAYiRnWG2YyqBxj/oFqGI3q8WmeS+jpdpOg=;
 b=ktoGZlxrLVfsDUCIPGx8xV/VdXhZiF7xA3/IVJKAsxPys7oNQF25oc1bNJdZ2gZxJ7
 3lVKSDr+CFw3hxM62iku0CcS8a5p9lT3KZ3VViCEVBis9ry5iE0VJ/2iCOZs8L9VU8Ul
 ZUnV2eqL6DEedBjiOp5yqybde2wRu0DRGyNwsqhfJ0LQEYPdt0mSnl09niNS/XZQ4Lcj
 fCUtC9aPYnykMOBdA64vi22uvbKlaFBn2YCFu5sscE+nYVRQ/WoefFZexxWM7kY223EG
 R1awNpIU4SmbJcm848L19tM0bOsixUcKRwLhDkLPOmXah+2ZoghevrkVyY7RXdTOUpI4
 Zkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SDZppdxkmAYiRnWG2YyqBxj/oFqGI3q8WmeS+jpdpOg=;
 b=lhCYUrx3rZvMdJ743bAz0yD9BPfLY/ifSVKwMjq9TNOhkpB9PfZRePiVIwALTwO9Js
 0Oswn7cFAvZJ3PsBG8D+gCNkSZZfSFoNihIsKTXGxCpw3U+ZckfhN65+nbyphQ8JPovW
 0sYcr31zwZKHqqyIa1pBYeGTc7JcL16ZKC4OqR7oWyBiUlC2nFZO0VVskG0O+u603ReB
 SYbr/3qfuQIKRnXR7Vuyu3HcdZyBnvizq9pcC0tEuNh5ld0phu1M8TaXSqw/mdClaMdL
 q1d5GL52X3+S+VC2rWryoz/wVqJQMQgFIPHz4LWeq7HKgBMDKN7XfZY2EAxmMYUEcC8p
 h4rw==
X-Gm-Message-State: APjAAAWuN3pHasyyuCF52sCFxF+/y5m1dXkxez2WVcOJeW1ywur0IU1u
 NLbOSq3UKr2l3nRATo6gBXhRDgu1v/g=
X-Google-Smtp-Source: APXvYqwNuUhq+qITFMVwgwcjWrmpRvDtPl3sbGZvKHhCj7VDuKjUk0GYxg4zFX0BtHFOQ7Gis+rmhA==
X-Received: by 2002:a63:5f10:: with SMTP id t16mr7900788pgb.222.1581437484071; 
 Tue, 11 Feb 2020 08:11:24 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 i11sm3860636pjg.0.2020.02.11.08.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 08:11:23 -0800 (PST)
Subject: Re: [PATCH v4 3/4] target/riscv: support vector extension csr
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
References: <20200210081240.11481-1-zhiwei_liu@c-sky.com>
 <20200210081240.11481-4-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <23fd0388-7b52-5105-9dc1-cc359b59d881@linaro.org>
Date: Tue, 11 Feb 2020 08:11:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210081240.11481-4-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d41
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
Cc: wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/20 8:12 AM, LIU Zhiwei wrote:
> +static int vs(CPURISCVState *env, int csrno)
> +{
> +    return 0;
> +}

This should at least be testing RVV, a-la smode().

You probably want to have all of the other tests vs RVV in this file use this
function, since this will need to grow the system mode enable test.

> @@ -158,8 +167,10 @@ static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
>          return -1;
>      }
>  #endif
> -    *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
> -        | (env->frm << FSR_RD_SHIFT);
> +    *val = (env->vext.vxrm << FSR_VXRM_SHIFT)
> +            | (env->vext.vxsat << FSR_VXSAT_SHIFT)
> +            | (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
> +            | (env->frm << FSR_RD_SHIFT);
>      return 0;
>  }

While we can be perfectly happy shifting 0's into place here, it would probably
be clearer to conditionalize on vs().

> @@ -172,10 +183,60 @@ static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
>      env->mstatus |= MSTATUS_FS;
>  #endif
>      env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
> +    env->vext.vxrm = (val & FSR_VXRM) >> FSR_VXRM_SHIFT;
> +    env->vext.vxsat = (val & FSR_VXSAT) >> FSR_VXSAT_SHIFT;
>      riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
>      return 0;
>  }

You *must* test vs() here.


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C8F4B1912
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 00:10:15 +0100 (CET)
Received: from localhost ([::1]:54544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIIZq-0002dW-Fe
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 18:10:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIIWs-0001ni-2T
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:07:10 -0500
Received: from [2607:f8b0:4864:20::434] (port=45674
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIIWp-0008IK-Fp
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:07:09 -0500
Received: by mail-pf1-x434.google.com with SMTP id 9so10089305pfx.12
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 15:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=L2osRxNTzko8+kjgtDsgz3W1zAmOMqT+T8WZj+MSVe4=;
 b=S7h83yEO7jFZfOCGSYR1Aw3JOh7++5umrR6n+DLrNUFF6AWfcCxoWQMpBgot93y+30
 LDxJCsn2eXrxUFU33M0HpmgFYf9Fc99mHoAgZY9kfblM6ilohk2BDYsGKfHdr9Ju897I
 ZgE+6NRyA2BMUwTWawSbDzPk8CXtcWDU9KZIbJVocf/M0Yx4yyZpYrgzukdy6AjD8cjm
 EfPaTn5jJFzp3/kWaNFL66N/UzdGFZLw3NQ7vrGqaZigA9fl/4p0SS0+Z+Rgk6ea7vzM
 j7zRt2l2oXE34QJtbmRtACI4u3bV/0suZHwa5vO7Id3BpjYhPIOKe3SbxwJdwnt+41K1
 SI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=L2osRxNTzko8+kjgtDsgz3W1zAmOMqT+T8WZj+MSVe4=;
 b=HF5RjpXYt4xsxavJRX6MTW8g1MzG980Md0mLXlglRsgYQOdAyr4ewG7PN3xzba+P6N
 WAWPaKvT0fcrQygnnX6lD6mP2N6GKkF2rWquYmbPAC+DC/NJYs8VnxrKU1SxUQE2gvv1
 XkjjVFJhYXeNBMj9diYDJOFMfLsyGSMhfMYe4Hv2qM2r9FxVNhiFd7fEIXtTCcP87ORO
 xpV9F72Qf9UTWXHR1OTpMWrJT4cnyXuo/10rZdQEuHbPOfepO1Inn8RRSSNCCJZlskfT
 kpoIsPS0QvvIU+i1ewaub2tYEWI8mDdeONF4GtOn1OppCa90bTzY63Lf+uA6bbT0H82n
 xpXQ==
X-Gm-Message-State: AOAM533QOkLbgL6UUuctzutb/Begq8PH4MnnX4p8vUqTL3m9awkUlJT+
 Kw+sPOHvp88I8pdMOy5p0tYn7w==
X-Google-Smtp-Source: ABdhPJwI0OhXOkzC7AJvWL6VbxvxtA3KugodyiWb3N2muxHuph+7jQTGGUfNzLnPsgx62Cd0EDriIg==
X-Received: by 2002:a63:e34a:: with SMTP id o10mr7943400pgj.130.1644534425382; 
 Thu, 10 Feb 2022 15:07:05 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id f22sm25048805pfj.206.2022.02.10.15.07.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 15:07:04 -0800 (PST)
Message-ID: <aa77d2ec-7616-fe05-dae5-db9cb9fda02a@linaro.org>
Date: Fri, 11 Feb 2022 10:06:17 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 0/3] tests/tcg/ppc64le: fix the build of TCG tests
 with Clang
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220208203145.3844662-1-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220208203145.3844662-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: danielhb413@gmail.com, alex.bennee@linaro.org, groug@kaod.org,
 david@gibson.dropbear.id.au, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/22 07:31, matheus.ferst@eldorado.org.br wrote:
> The second patch addresses differences in the output of float_madds.c.
> The __builtin_fmaf used in this test emits fmadds with GCC and xsmaddasp
> with LLVM. The first insn had rounding errors fixed in
> d04ca895dc7f ("target/ppc: Add helpers for fmadds et al"), we apply
> a similar fix to xsmaddasp.

Thanks for this.  I missed those before.

There are a number of other missed vector cases, which you may have seen.
Basically, anything with "r2sp" needs updating.


r~


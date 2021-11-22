Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49EF458D39
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:18:16 +0100 (CET)
Received: from localhost ([::1]:43322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp7Kx-0005yO-LX
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:18:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp7JX-0003r3-7Y
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 06:16:47 -0500
Received: from [2a00:1450:4864:20::32d] (port=40934
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp7JV-00042y-NE
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 06:16:46 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so8509896wmj.5
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 03:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sq3AWM0kHoMFRDpvZzM2Q4p/grpRqXhu60sXjGT7CoY=;
 b=fqpYF/q4Y5NuFN6jYWbag9pVw5FPJ3yL8bT8KTX/OljiF7ljgC1dLwEDHBYtQyITBO
 ZJ56F9q2nbYD3XtDhJVm8Hy9Q4zKB2xETf5/PBqLXcYNIpSND8DbfF9c/EAp/i2zKO58
 E1BJtcasrvaXveO1wWNZC6V9kH4aMRIxdEDRkYAEJ3C33+THZymj5GBCD2cFYC1IlGjw
 rObY4YUxAHeJZOWH3bOWQqlzhNcjNtHlSY0pFN7TyL84W07rNqslk7lb70tz1ZzT9jmE
 J+OJAtdgkwke8ZOYXUsPU35IsJbBDXEGtrDfAAG8jeOfpT6SM/cgLTRgEkjM5PmCaraE
 YLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sq3AWM0kHoMFRDpvZzM2Q4p/grpRqXhu60sXjGT7CoY=;
 b=nUE+Jj6J1MweKKe5TiSEd5Jl0I8zAFofVNRGv/Lg/QTAv+k3gsHyabg8ABZIdFBf6p
 WvM4kLOGBttkBD2dMpF39dFOzq33CIr6qNPwvUXtiPzs/C9euoFLkZHddyJUX8/c1B/D
 mxGUTbReeOkqeFIcEPi9nX8JcXlQ7hyxAuQq4JhtmBDmOuKUGqIzndXzMwoZAppuPzw6
 FAED20nSCofOITNbbLfDS5uef2ghTKEdGrnivRixLewhQfOFKpypzhl9QoZLj1hf/41i
 bkaPaHFIknT4MDBGFiJtkjCtidbp5EUpv2iCItjRtwqGfyW0zOvgEaEXq0JJKc6WRBY+
 abPQ==
X-Gm-Message-State: AOAM532z4vEw/XKOGRpO1TxOxQ2DLp0TVsIw0TCNB+x8HgqP/ZyVzPcp
 jwe0L/avgOBhsY73vqdsK0pv/w==
X-Google-Smtp-Source: ABdhPJwcKFJoLEk6muC5z3FauTXz5r2bVSwYl9AglN7gfdXDS4f/CklM8ZD4Ch6Y1Wcl7Xw+CBYTWQ==
X-Received: by 2002:a05:600c:1e1c:: with SMTP id
 ay28mr29147244wmb.131.1637579804292; 
 Mon, 22 Nov 2021 03:16:44 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id k15sm8538829wrx.53.2021.11.22.03.16.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 03:16:43 -0800 (PST)
Subject: Re: [PATCH 35/35] test/tcg/ppc64le: Add float reference files
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20211119160502.17432-1-richard.henderson@linaro.org>
 <20211119160502.17432-36-richard.henderson@linaro.org>
 <41eda524-8e61-88e6-71ff-757fae97bc9b@kaod.org>
 <0e4d4227-4a67-7a6e-4f45-6416faebbc93@linaro.org>
Message-ID: <45a736de-efe4-1638-65c7-28764c93248a@linaro.org>
Date: Mon, 22 Nov 2021 12:16:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <0e4d4227-4a67-7a6e-4f45-6416faebbc93@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/22/21 10:43 AM, Richard Henderson wrote:
> On 11/21/21 6:47 PM, Cédric Le Goater wrote:
>> I am getting an error with this test. See below.
> ...
>>   ### Rounding to nearest
>>   from single: f32(-nan:0xffa00000)
>> -  to double: f64(-nan:0x00fff4000000000000) (INVALID)
>> +  to double: f64(-nan:0x00fff4000000000000) (OK)
> 
> Well that's disconcerting.
> 
> I can replicate this failure on an x86_64 host, but do not see the same error on a power9 
> ppc64le host.

Bah.  The test case is buggy.

It reads the fpscr for the flags *after* having gone through the printf for the result, at 
which point you are at the mercy of whatever other fp arithmetic libc chooses to do.

Fixed with

--- a/tests/tcg/multiarch/float_convs.c
+++ b/tests/tcg/multiarch/float_convs.c
@@ -51,8 +51,8 @@ static void convert_single_to_double(float input)

      output = input;

-    out_fmt = fmt_f64(output);
      flag_fmt = fmt_flags();
+    out_fmt = fmt_f64(output);
      printf("  to double: %s (%s)\n", out_fmt, flag_fmt);
      free(out_fmt);
      free(flag_fmt);

But this alone of course causes other "failures", because we've got some incorrect 
reference files.


r~


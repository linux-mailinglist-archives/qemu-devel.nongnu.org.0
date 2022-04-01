Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C95E24EFAB0
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 22:02:52 +0200 (CEST)
Received: from localhost ([::1]:37066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naNTv-0000RI-V0
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 16:02:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naNSx-0008Aa-R5
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 16:01:51 -0400
Received: from [2a00:1450:4864:20::52c] (port=46896
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naNSw-0000Wk-73
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 16:01:51 -0400
Received: by mail-ed1-x52c.google.com with SMTP id z92so4160268ede.13
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 13:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tZidkQFbR8OBjjrjizCgKS3hRXNFAb0S3C0Oggs2kTk=;
 b=UnGB+F4UuWJ8VbLkAt0s1PBccQUMOBVkVcBmg/rqflglq42v41pgfmuI3Dnsa7g4XI
 pZ0fpMNGHTKYYMtv59G8rIkfuRMfm5FDF5ZVGaFe/Za1XQMzqZR+y2lS6/nWukDxKAp+
 vfkWGVpqHbzFA8wHWFvzgWTtSdKO2Z4Bb/onwEHEf+duLPONCTkL+wt4F2jWDcXrqNzi
 86+fyuz9tkOTaleebHlAahrXAuRw/rI7WZR2D6XR2wpyeJJHmMpUpslw91yoDApdGN/H
 RcHTer7ZoVgYYN5rh1F2aONoS1/tXRyFt6GEeGtrVrvPmygsTLarkVfjeo2qtd/mT5pX
 p4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tZidkQFbR8OBjjrjizCgKS3hRXNFAb0S3C0Oggs2kTk=;
 b=8ExAElhS/9KQf+PrCJW4S2/d/DsgPUj8gfPWVz60386Q4OYxfiLIE/1sjT9OqzGT38
 U6XaHQwVMfBvXW1y6bETWbNGvb2oWhALSqt4CGwxkP3F2qN9JFs1VlwsXs7JjZK12rO/
 e5Q/ULTqrVbgTJwVk0PNP5icSjtGNYbjZGVTQJkxXbZpUaKlpdgK6pFQ5SR/xAJ3MnZs
 R6mb7UXVc0s2U3H1HWhi39uU0EMESf8O5XJFIPrBtaNb4NY0/qchlvzTkj6Dlj2fTcW8
 64YJ/ZOKm41kFJFYiI1/8aPYycxbOkOs4tvDmh6YqmY6lUJ++AysuRpoD1jMxSuROSno
 Azcw==
X-Gm-Message-State: AOAM530yci7VZSXcDlB4kGBJwMkpUcUgBCcrdknpdwi6gqUAuwNtSb+T
 bfWJPqprgTDU9I2di6wEbOMbsQ==
X-Google-Smtp-Source: ABdhPJxqMYdXO8QKi9gKUimbvwjIGaQiwx2Ks9O8/P6qYEpojAi/Nt4cRgRUE0fCf9PySzVe98/+qQ==
X-Received: by 2002:aa7:d398:0:b0:419:d011:fe8b with SMTP id
 x24-20020aa7d398000000b00419d011fe8bmr23003516edq.168.1648843308190; 
 Fri, 01 Apr 2022 13:01:48 -0700 (PDT)
Received: from [192.168.249.227] ([185.81.138.17])
 by smtp.gmail.com with ESMTPSA id
 eg6-20020a056402288600b0041919c78082sm1568980edb.87.2022.04.01.13.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 13:01:47 -0700 (PDT)
Message-ID: <68d09e4a-692b-7e93-a61a-cdc01dc59a71@linaro.org>
Date: Fri, 1 Apr 2022 14:01:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] softfloat: Fix declaration of partsN_compare
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220401132240.79730-1-richard.henderson@linaro.org>
 <20220401132240.79730-2-richard.henderson@linaro.org>
 <a368bfa7-484a-6adf-33c6-5d85e16524b0@linaro.org>
 <CAFEAcA-U7d6VN6XKA6oadp2mLqn2kiYY6kbCqcFhgXAYihOn_g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-U7d6VN6XKA6oadp2mLqn2kiYY6kbCqcFhgXAYihOn_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/22 12:12, Peter Maydell wrote:
> The types are compatible, but it's weird that the compiler doesn't
> warn that the prototype and definition are different types: it
> seems like the kind of "technically valid but usually a bug" that
> a warning would be nice for.

Good point. Submitted

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105131
https://github.com/llvm/llvm-project/issues/54706


r~


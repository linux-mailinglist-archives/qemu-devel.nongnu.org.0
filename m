Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CF24B1ADB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:01:26 +0100 (CET)
Received: from localhost ([::1]:53740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIKJR-00059p-Ax
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:01:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKAG-0007Gv-58
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 19:51:56 -0500
Received: from [2607:f8b0:4864:20::432] (port=39581
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKAE-0007Pq-B5
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 19:51:55 -0500
Received: by mail-pf1-x432.google.com with SMTP id r19so13346816pfh.6
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 16:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DeIGHqYgWgwFm1/NqrlusvnCR/0S15UyojP5j/XSap4=;
 b=f4tvYKQDOk6s1VasrILf+0l138+tOdH9ckpLLRQkeeUSD8ut9Q7shwR+XFq+n5dbr5
 /TC32ozP5cnZSWe3tq9lNdpn1xAmRGTfKBJZ5EcT3xssQkhM7sAx29UbGB/k4QTV09z7
 ZeXJBH4M2vWAsjNBcUdtZd+q5qFxNhYzqQ8Kml/wepg7MdOWpg2tnt7f7+lQy4QxVbw1
 eg0s9SV/LHBi/Er7UQGBl4ppa6Kpx31ErxIRBvtXRm/sH1NMmNEEvAv8ZKUBYnH9Zdf5
 8utrzooMLF4Wh/fzix/5p1jSebw3aMUFY5QAoZp3eRsrI/mUXs/FAIt0fdlHX9Ulnbia
 WB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DeIGHqYgWgwFm1/NqrlusvnCR/0S15UyojP5j/XSap4=;
 b=ajqoCzdkNX2mUHxY6XUJCWKyP5B2hET/2F9tCKmaU+CBtFeMIa+y1cywO1qWVi7kwH
 5JC7FO8ZbaeNMndjUcNuJbfWsWOeqIZ/TQ1KRz7h2QIYUq83dfbYrjWa2kK/J4fgwI4R
 ybCIjNY2yxTYC5RXsx2a9j/nQi9klNo4/slQyutz65qRkhOetkk9xH3CPTQTBfcITnuJ
 X+Amy9EfJUFNrSdnCwGbH6zPGDBc6sSdDvEl8kWrqqCmbtB48q5PH8/sxGKMOVSlcwZe
 frpy2w0C3QEG52Wn0QQDtJe848BcTyKLfUJRLV4h77h1BPBMNW7AcQ9NCMZN0RWjXKsI
 wTJQ==
X-Gm-Message-State: AOAM531/gkRW+CTj7CotLTgam9o3fzw9g2SgUWFvJCgvl0VqBbUihBbS
 ygHd7n+3GpN1w41t/+Nkd0w3WQ==
X-Google-Smtp-Source: ABdhPJwP1FQrRemylVZjvkGEcFgOOJV1PK8in23SDirYrtgNGMS+6gP3xCLfMYyrseL2wWLzZ6W6tg==
X-Received: by 2002:a63:6a87:: with SMTP id f129mr8383948pgc.0.1644540712702; 
 Thu, 10 Feb 2022 16:51:52 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id j18sm26105451pfj.13.2022.02.10.16.51.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 16:51:52 -0800 (PST)
Message-ID: <6a30fefc-aa7e-0160-11b6-63498f016930@linaro.org>
Date: Fri, 11 Feb 2022 11:51:04 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 04/12] Hexagon (target/hexagon) properly handle SNaN in
 dfmin/dfmax/sfmin/sfmax
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <20220210021556.9217-1-tsimpson@quicinc.com>
 <20220210021556.9217-5-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210021556.9217-5-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, mlambert@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 13:15, Taylor Simpson wrote:
> The float??_minnum implementation differs from Hexagon for SNaN,
> it returns NaN, but Hexagon returns the other input.  So, we add
> checks for NaN before calling it.
> 
> test cases added in a subsequent patch to more extensively test USR bits
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>

This appears to be the same as the IEEE 754-2019 minimumNumber (as opposed to the earlier 
754-2008 minNum), which a recent RISC-V revision adopted.  We added support for that 
directly in softfloat: float32_minimum_number et al.


r~


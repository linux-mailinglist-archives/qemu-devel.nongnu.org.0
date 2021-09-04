Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C345A400A68
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 10:54:31 +0200 (CEST)
Received: from localhost ([::1]:44260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMRRW-0000f7-SU
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 04:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMRQ9-0007xI-21
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 04:53:05 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMRQ7-0008Qx-LP
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 04:53:04 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n5so1925383wro.12
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 01:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y0uVp1L3jQ7n6OJNPxEBwdSFbEqnx8h8snS6dEp9aog=;
 b=UlT4raqMQlpxFaOK1Pgwe+0oC+zKMt8PFEPE6kOFooa5QNz2dlCQWRwpzZr/3b3Wsj
 mNyRgOj3pqQzOZXZQ+R/13RE5MmvXsP4eu8WdInpl7QBK+GJBqV3KnhqtXiN3rq+ux8M
 FfNJdQghCjvB+fNN3hXC9+BDy7bGFkY3AOt6TgufaZdKIJxlK3etBWkxg6MoxCptUFNJ
 PcRxk5DYvQzPSKmjlKUqm1Ubs+Q+mwt3SP9foZuC9ZRP0Le0iekjZalDE/+i3o5voduR
 ca2uuP0C03ojvXrFKUYiCA65ncXqE0ch4VI4stwLl5RkHMcq2PzEozZAyF0/iVuf6eqC
 6jXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y0uVp1L3jQ7n6OJNPxEBwdSFbEqnx8h8snS6dEp9aog=;
 b=kULMYOHukDifV1N4e+INSHTiTEy3SPQEQYG6EebEwfCshcCc6NeSp+1nAi3DBIMwBd
 Nys21HEMfj/KkVMdJg7MvrI762REvRFpFuvmmeUJQwmAMo8MzA0Ar+VjOpB3Tk/xEffj
 724WZfy0zwVA+5bQGmK0PcvNX4EouMRDgj9QoReEh3zYNPTnGMGzj1xS70FcNxw0NAVI
 Dci3lklti26QF89uHyZeYnZFAYeXfluyzDjeyGA+YCJwjbNUfWbjyN2f+VUvp5HEXO5p
 8sE2YWzfn6O74OZomFqNHrXAzsevM0+VWKtrv6ooljTDJg80W/HH/dX6uZh9uIrGiwst
 m1tA==
X-Gm-Message-State: AOAM531gbImm1gcLDiRLh3GiDpAWihpHRaHQ1LMVEpoSeU/PLo9gNaRZ
 HKeLr6a8ztL6UAWLRk9E9goxqg==
X-Google-Smtp-Source: ABdhPJzyNaFgmP9LAl3RFxX3d0VLJRzSt5oJl3IYLRT3XAyO6pzi58BfbtdRcg0xJlK+U9OTGPPduA==
X-Received: by 2002:adf:80e5:: with SMTP id 92mr3052537wrl.300.1630745581885; 
 Sat, 04 Sep 2021 01:53:01 -0700 (PDT)
Received: from [192.168.8.107] (246.red-2-142-218.dynamicip.rima-tde.net.
 [2.142.218.246])
 by smtp.gmail.com with ESMTPSA id s13sm1543638wmc.47.2021.09.04.01.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 01:53:01 -0700 (PDT)
Subject: Re: [PATCH 2/4] hw/arm/mps2-tz.c: Add extra data parameter to
 MakeDevFn
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210903151435.22379-1-peter.maydell@linaro.org>
 <20210903151435.22379-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2d19b6d1-b6ca-191c-0c9c-a5b1cf95c75b@linaro.org>
Date: Sat, 4 Sep 2021 10:52:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903151435.22379-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 5:14 PM, Peter Maydell wrote:
> The mps2-tz boards use a data-driven structure to create the devices
> that sit behind peripheral protection controllers.  Currently the
> functions which create these devices are passed an 'opaque' pointer
> which is always the address within the machine struct of the device
> to create, and some "all devices need this" information like irqs and
> addresses.
> 
> If a specific device needs more information than this, it is
> currently not possible to pass that through from the PPCInfo
> data structure. Add support for passing an extra data parameter,
> so that we can more flexibly handle the needs of specific
> device types. To provide some type-safety we make this extra
> parameter a pointer to a union (which initially has no members).
> 
> In particular, we would like to be able to indicate which of the
> i2c controllers are for on-board devices only and which are
> connected to the external 'shield' expansion port; a subsequent
> patch will use this mechanism for that purpose.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 35 ++++++++++++++++++++++-------------
>   1 file changed, 22 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


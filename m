Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5151B002A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 17:35:05 +0200 (CEST)
Received: from localhost ([::1]:52604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i84e8-0002MB-Dg
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 11:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50777)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i84EV-0007Gq-GV
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 11:08:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i84EU-0007bf-68
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 11:08:35 -0400
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:41222)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i84EI-0007Y1-Dt
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 11:08:22 -0400
Received: by mail-qk1-x742.google.com with SMTP id p10so3120565qkg.8
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 08:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V0wS7vDOtwQ0JAEDg5cRNhWhvCAfAAPTKn6GNzVSIok=;
 b=Kbb6vkNox1jabB++/XN9knaTci9j9D0viNK+opJYVa7eCtKT+oXaemwANDdKFpwmQD
 Ea2/uPtShFBzDP8LxFRHhXTsTFAd+4DDlUmdUArNf1tN3rBVvs7XRSYIHXbeR8UmKhJN
 L0Madn6/SlMaVARmEGx+H2RNrfUuy9xFytF3avUENpVhFCi6nkjpPxZWp8T+54SOgmYU
 +YFGHiyHyv2k4PsVjSsz9m6FAwh2cmFCp/BcWSU2NvGSL4n7nv76cuhRI51ip/EPyhw8
 icIAMagw0F+XAOtf696OVCvZDFytUJt0oZHQkK0QMQ36GtCp9c6D8PVoKx6XKR0IVgIf
 O+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V0wS7vDOtwQ0JAEDg5cRNhWhvCAfAAPTKn6GNzVSIok=;
 b=N/1oqGU5IOxnnIjboLusdymQfKgLKgOhaqOqhydPSvklg3QeuiB9FPiGHsftnw0j4w
 M+rlVtrvwaGi2Vz/lI/TNkM0BDzhQnKX25Olb//sYX7Ae27EmqLP5O+jhztbAwmzupk4
 bwDsLQWgK7f4+t3XuNIh5JqIS6tHnT0uW/Bj4WVmjhAj/kd/LdPxNrn32NAoDAfFO206
 VwnPfMionPz5JOnLyShBxDFGmXpunyPanAUQk3seu6H6YQkTHN6Hdv/9fBK+ScTAflaA
 Z2I+H41QEhbg/iyBv+fsaCiW9YWwHSu9BSzzZe464wYU2KSM/ivVr77PbIPZoNOvJtKX
 U3GQ==
X-Gm-Message-State: APjAAAXpu8j1tbxJ5Zy+dLtfkvqkIpUVKBgOM1OHubebT2an1Xor+JJd
 YGgYjX2o95qk2Md/sEU1aAJXJA==
X-Google-Smtp-Source: APXvYqwlBax0NrvaYR5eoiH4YRnsackPTw9d5FvUD4qSzhWJXS81hNM1P0QnRDAXkBZgrm90wLvZKQ==
X-Received: by 2002:ae9:f305:: with SMTP id p5mr34192873qkg.439.1568214500792; 
 Wed, 11 Sep 2019 08:08:20 -0700 (PDT)
Received: from [192.168.5.185] (otwaon236nw-grc-01-64-229-69-35.dsl.bell.ca.
 [64.229.69.35])
 by smtp.gmail.com with ESMTPSA id a11sm10747107qkc.123.2019.09.11.08.08.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Sep 2019 08:08:20 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190906075750.14791-1-david@redhat.com>
 <20190906075750.14791-11-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <de1d26a8-0d4b-cfa9-bb6e-3f6c3ae03a05@linaro.org>
Date: Wed, 11 Sep 2019 11:08:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906075750.14791-11-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::742
Subject: Re: [Qemu-devel] [PATCH v2 10/28] s390x/tcg: MVCS/MVCP: Check for
 special operation exceptions
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

On 9/6/19 3:57 AM, David Hildenbrand wrote:
> Let's perform the documented checks.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/mem_helper.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55F448E72
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 21:25:39 +0200 (CEST)
Received: from localhost ([::1]:51466 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcxG7-0003A7-35
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 15:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44303)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hcwub-0007zJ-UO
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 15:03:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hcwua-0002jd-Ve
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 15:03:25 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:43518)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hcwua-0002hN-LL
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 15:03:24 -0400
Received: by mail-pf1-x444.google.com with SMTP id i189so6168328pfg.10
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 12:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iZHzBIb+2T7t0rnvFVP9Ixb3KVylrfKNn21WvVXuJpw=;
 b=Kql0QhwS5l8zAR9vPZI7vrtQq1OwB8FP8vycgIHYqabKVPPUGprCKXDCBaDejKMYq+
 +FAId42zOBwxMYPIV33lY4urr4ox0XYjzi6ZqPB3yAQsC6x0Fmaimnzsi24S+SQrhwOU
 3clk7KTmJmgKXKv1cWYHgpURFmy3NMaSwBoRWad6znW/SzNWumOFyENtgR0d7WbaRmlP
 Ic+UlLH+PeeoSj3+54tIMfgpT+L7NG0gTTzBDgtwTZ75PjVLWrYlPUeeK0X2owhenxGx
 u9pi79gDW+vdUfbmkh/Wp2hIg6pnyWWvoY46AWoSZC+dFHyOCGDayUwYVvNlsnAl2Hpv
 2KSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iZHzBIb+2T7t0rnvFVP9Ixb3KVylrfKNn21WvVXuJpw=;
 b=O+mJXeTtelPgZo8mvQwAoQj0bnOIQbc/a/gb3w4HGKwN9m1lUlO007RxOvQE+YfHCz
 VO6HcH2cKqk22zJLm6iO+iUOZ4JeDV+kp/tKHEpu3sXislaZqwK4wQktmgpUM1xtwUU+
 fFtXgklB4cn1yjtvu/0x6K6nUon/rbSkJIn83zjPvZFE/2DNsi82rULFjAMr2j8SJYkf
 taA6egifBIOeaLv+Lhz5axWSacaG1LytZn0ypSSlaVgaCd1m7EFuMYi1Nuugrl/m8tpH
 dfB/zeP7VxGMUZ+T5hcWbKc6HyUp6M6tbGh0jJuPMlQScuAjcxGDZSo4dWG66BWKpM0o
 S1Ew==
X-Gm-Message-State: APjAAAUgU1Ue8WdLZZMQjXSIX+iqCMxxYW5H41Xi3g95dX4Q4wT4zpiz
 kW3slAsQAAvT5F9kMxuSt/Qr+GlzEyo=
X-Google-Smtp-Source: APXvYqyNDgz9JJ/C7T6ZwRR5SPbfhFATm8W2mur1iqN7gba+ZtgPzBxfuqo+dC/9F24XE2PHK7xgJg==
X-Received: by 2002:aa7:8dd2:: with SMTP id j18mr45558585pfr.88.1560798183183; 
 Mon, 17 Jun 2019 12:03:03 -0700 (PDT)
Received: from [192.168.1.11] (97-113-2-33.tukw.qwest.net. [97.113.2.33])
 by smtp.gmail.com with ESMTPSA id 128sm13061319pff.16.2019.06.17.12.03.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 12:03:02 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190617160130.3207-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ee659698-d2fb-8fd1-dc73-baa7b63a94ba@linaro.org>
Date: Mon, 17 Jun 2019 12:03:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617160130.3207-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-devel] [PATCH] target/arm: Check for dp support for dp
 VFM, not sp
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

On 6/17/19 9:01 AM, Peter Maydell wrote:
> In commit 1120827fa182f0e7622 we accidentally put the
> "UNDEF unless FPU has double-precision support" check in
> the single-precision VFM function. Put it in the dp
> function where it belongs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I just merged the pullreq with 1120827fa182f0e7622 an hour
> ago and then I spotted this bug in it...
> 
>  target/arm/translate-vfp.inc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Oops.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


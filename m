Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D71D1358
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 17:58:04 +0200 (CEST)
Received: from localhost ([::1]:51804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIELi-0005Av-2O
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 11:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42499)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI17S-0001cR-By
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 21:50:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI17Q-00083x-TC
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 21:50:26 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:46152)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI17Q-00083n-KI
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 21:50:24 -0400
Received: by mail-yb1-xb44.google.com with SMTP id h202so193037ybg.13
 for <qemu-devel@nongnu.org>; Tue, 08 Oct 2019 18:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pRRGey9Kw0lIsuaYgixcsQ5RUwHu18e511yZ1VzoGaw=;
 b=nsJ5KdbNIcVTWQaU2tkP6YvmGjvcPYk83PN/BgJ59Esc9XlDWXPuQV03UngQUGUJSk
 Tew/2feqXzbb0XInqmCpK1iLfewqA25ui1H2Zexg6ew13yUjViG4OP/zGy9W3NbhkZw7
 gfXnd9cEkdsxAhrHJm80/m0DvyguPmvoXxzkNk3WJqcPY38RM7g8JaON1ycBO2v6DNYX
 GG7sA0blF8C2acwtAgZL01qg79NsxSnS9UrTF2w4J6A0ZXaW8vpFiBc6T7MhMzLOEhCQ
 ScjRLJ2kwAewY09YqyNIRBYChl+jrga3t2pQM22+erQx9qTbsPEN6STmmLgvBEaSttXt
 dGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pRRGey9Kw0lIsuaYgixcsQ5RUwHu18e511yZ1VzoGaw=;
 b=RxQd0+1EFwf+loLhb4Ca4ZB6z9mWrKakVaM6cU6bRLDn49OD8F1lTD54rfbpV03Cz6
 Z8vkSeIIheMxWUlb7QUehV1WWAyva0KDP0ATZCbWNmKWwpD0g3Z3IiOs3fyIXgUurgxc
 Q2Kjb9ideQ8fSwe3v3qR9N6ZjWXXYx8nLXsCtjAP84fQR6bLrRSlj0J0JTf0yGssCjl2
 VeKUC0QO75lc/kmr01KUFbUyldL0vaC0JeQV8G23RIkU9c4BT7EoEYL0Ji8fM7n/ic8h
 T5FOr5JOorAX8AOAZBWZy9MkkwVAZLva0M8GUlDzUDbhRqKpxKkpAN4pyRuDwhwEv4bQ
 M+yg==
X-Gm-Message-State: APjAAAUjTYbRmPzjfbaoJxpYJfwGPLE0q4H7Yk0mTN4Ko8SyjpKnI8dV
 DQa25NZ/zW1CmICUB+oXL1DOlQ==
X-Google-Smtp-Source: APXvYqzEYgmsq36EX7X32jrZH4wvrUiEF7He1CshtdsV1YkpCY3aBcdrBB7veECzGF9TtvV9uhFLUQ==
X-Received: by 2002:a25:790a:: with SMTP id u10mr487573ybc.273.1570585823438; 
 Tue, 08 Oct 2019 18:50:23 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id g81sm199521ywa.46.2019.10.08.18.50.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 18:50:22 -0700 (PDT)
Subject: Re: [PATCH v2 07/21] hw/timer/arm_mptimer.c: Switch to
 transaction-based ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <dac4fae6-0cac-2f1c-43ab-fe011cb357e8@linaro.org>
Date: Tue, 8 Oct 2019 21:50:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b44
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/8/19 1:17 PM, Peter Maydell wrote:
> Switch the arm_mptimer.c code away from bottom-half based ptimers to
> the new transaction-based ptimer API.  This just requires adding
> begin/commit calls around the various places that modify the ptimer
> state, and using the new ptimer_init() function to create the timer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/arm_mptimer.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


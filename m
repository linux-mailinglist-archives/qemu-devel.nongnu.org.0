Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8547D13BF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 18:11:54 +0200 (CEST)
Received: from localhost ([::1]:52012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIEZ7-0001Nz-18
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 12:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45638)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1tV-0001hy-WE
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 22:40:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1HP-0006y9-OG
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 22:00:44 -0400
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44]:44508)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI1HP-0006xq-J7
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 22:00:43 -0400
Received: by mail-yw1-xc44.google.com with SMTP id m13so223431ywa.11
 for <qemu-devel@nongnu.org>; Tue, 08 Oct 2019 19:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8t7Tp0FgRe/wzs246savUN9OVacV+iRLVyeha9N2MLI=;
 b=qYkgqB3pSI08zesmoxD7JBTYJY0XZcWpHtYkh4/i3uZzfXA6wNTw2egl5uI2WEqxbs
 YkqPTTzpzQxTQ00AdwtjyNOZ+D8ztcelivXbHbQPfJou1PFuDfjh8miPEZE6DYNAAEwJ
 X7L6+QTMLEBQW/QzqpZXn1l9baqeAd7+cQH4ygO+31hA2Us7CNTI0IqZ0uvQtohuqXJs
 K5KyUpJiqS+/Nll598eehxcTaEehO9ic3NfDm6HeR6iMIbnwVTcORFDL+2mIKtwh6Q5M
 e0EIMsVx9lKJX+YXIuf0C/y5CdlQ8DoozqZbto3vc2bgp1wD3Tk39368epbnh2UrBK71
 UiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8t7Tp0FgRe/wzs246savUN9OVacV+iRLVyeha9N2MLI=;
 b=nDD4CFvtcCl8RiZU64bCtK3gTy3tFBnQbEVUsS74P9COOWlKhPQ26Yc5ss3XE3GbuN
 OtFQyD5SYxSFo6MDlyv/SSDgwqYPCifjBEyZD/lDlmMirnBbEJ+B7dWPFMESrAKrWD4R
 3rL1LGggujRG7t5qZh4VVkXxdZGk8hmXygVlOJGGB9lCdhzOMUhVZVxr4O6iMdVCxua8
 C3Zn9aqvMIqbYIWjNW6KK+JFDYrWMvbw0nAzDUj++5hqFZy8tJqXtwejKIiTcY4uRpTL
 6T98Z5n22QytGMO6JGBMLfdmhO7YX0pI8V/lJ8oFTS6Q5umfPqj8ZlSDpwBtgak1lJ5y
 Oa8Q==
X-Gm-Message-State: APjAAAU1SqXGAPA4MNL9y+YjArUO8/VxPDHZeZGR4oTwRAIDQiEFWXjV
 liRpbYxXZpNQYpHwg7aiefyO9g==
X-Google-Smtp-Source: APXvYqwzUqLTCxsKXiTHAoNoDD401XFbUKnMwHZWUm1rmgYg8B8Z+FGQgefvRrgHstDCVHFSsZh7fQ==
X-Received: by 2002:a81:987:: with SMTP id 129mr972875ywj.361.1570586443031;
 Tue, 08 Oct 2019 19:00:43 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id d188sm241568ywa.88.2019.10.08.19.00.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 19:00:42 -0700 (PDT)
Subject: Re: [PATCH v2 14/21] hw/timer/exynos4210_pwm.c: Switch to
 transaction-based ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c06e1998-96a6-f1fb-1951-ebdc0f66595e@linaro.org>
Date: Tue, 8 Oct 2019 22:00:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c44
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
> Switch the exynos4210_pwm code away from bottom-half based ptimers to
> the new transaction-based ptimer API.  This just requires adding
> begin/commit calls around the various places that modify the ptimer
> state, and using the new ptimer_init() function to create the timer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/exynos4210_pwm.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


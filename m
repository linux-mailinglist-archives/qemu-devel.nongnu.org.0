Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCA716016B
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Feb 2020 03:15:33 +0100 (CET)
Received: from localhost ([::1]:56564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j39T2-0005UN-5l
	for lists+qemu-devel@lfdr.de; Sat, 15 Feb 2020 21:15:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43998)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j39S6-00050w-77
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 21:14:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j39S5-00072V-DE
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 21:14:34 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:37515)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j39S5-00071g-6T
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 21:14:33 -0500
Received: by mail-pg1-x544.google.com with SMTP id z12so7194303pgl.4
 for <qemu-devel@nongnu.org>; Sat, 15 Feb 2020 18:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8eDW90H2hUqqT/nAm7OhpJSAhb2ESBKhGdR08HxPPIA=;
 b=u9QM5HIN5JAvVhllpLOziGR22GeSVQwgtuMlcE/sfiUZrJ5h+UG1IGd5t27+I8gMdI
 ed4cwh2D8bGnlgQA4z6Guk+gG26c83gLe/D2NbZ7ywZnUjvcU3bcRnBHvVrCRn1tQ5yu
 z8+DVqyWIExHxeWgpaUFl6NVAhmlF5Wf4y/UF0KsSWwm9Sq+Lpn9z2t5fOHiZS5LTD0I
 jSnUQwY0opV0KYBqscgGfXLLWdyY7kOY80Do2e9XEXJj4D7RNlcTUyGO6OsZvpNTlywu
 zSlvjg39/GS+AhRFw6/5J1MjTiZe5wuRP3oE8bhXVg226wwym495guPDCyynIf8EG65o
 dqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8eDW90H2hUqqT/nAm7OhpJSAhb2ESBKhGdR08HxPPIA=;
 b=Z1Ws+t5bTL05ig5eufQ4i3nRQ5t8Pa9SSCzgetg+3UK/2Ar4SnSKE+EoNIIQvKgzl/
 e1RlARJXKo+fc+GU5lFUMHpB+3QqEDf6JB0aZlzU2szwe6GhRA9OFFCVEXjCb5kcNwoS
 kmicmNZjoSjpZ7Nu3x0w4DM7ETcwJtQfNFb4elqL/wy0MlGnLdVoYwtnXBIj+CvtQwkY
 6JVm9SPWHk2fksz0WWjO0M3l6YKedsvmRs+1QnoBqvEMhVLXyUyZDkxJNvWzeGEpKpxH
 CEKFbIeFcpNTv+2AB7GYIPGlWB4x5vfIlgrwc9otwY8muW3IVXTWEvY1dyUeSSpz72gr
 nkgQ==
X-Gm-Message-State: APjAAAWFkuW+heKudMXS65zKl0seG7SSnP/rjdZa6VNg7ohb7UODrx6A
 9jXwQWZ+RD5uTqw9OVojcV7f8g==
X-Google-Smtp-Source: APXvYqwbdlidE1xcxQXgi2GmPFOLoY4yjjiboqwREW2WiQ+3aEbYXytywt5kNvm5meyTsfXzLq4CPw==
X-Received: by 2002:a63:a541:: with SMTP id r1mr11006821pgu.118.1581819272152; 
 Sat, 15 Feb 2020 18:14:32 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 13sm11932082pgo.13.2020.02.15.18.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Feb 2020 18:14:31 -0800 (PST)
Subject: Re: [PATCH 3/3] hw/block/pflash_cfi02: Remove unneeded variable
 assignment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200215161557.4077-1-philmd@redhat.com>
 <20200215161557.4077-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6b6993b0-26a3-4fde-8ceb-5aba42bf5d49@linaro.org>
Date: Sat, 15 Feb 2020 18:14:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200215161557.4077-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/20 8:15 AM, Philippe Mathieu-Daudé wrote:
> Fix warning reported by Clang static code analyzer:
> 
>     CC      hw/block/pflash_cfi02.o
>   hw/block/pflash_cfi02.c:311:5: warning: Value stored to 'ret' is never read
>       ret = -1;
>       ^     ~~
> 
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi02.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


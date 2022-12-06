Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54376644D2B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 21:18:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2eNp-0005kd-EO; Tue, 06 Dec 2022 15:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2eNj-0005kI-0M
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 15:17:35 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2eNh-0006ju-AE
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 15:17:34 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so1750019wmh.0
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 12:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bC/FQxgLWJGiw94KarqehJwfcHb0fCz+AnYJztz7GFU=;
 b=hp9syZzKZYYuokxs+qb9nSn1BBvpslwPaOA8kinTr5dPTMNHDdHJrL3y27I3u9Ph6D
 KFjmUZFSo2+X7VMthFWyKD0O9Z5tCFMasT2qvUG3+34nc4JCVdjzOBrucV0AtUwxsFrB
 bexPN3fCKTtMwHJGyt8EcavVdwJKo35UZku4/iLPnTupzpTseStSVROCgkhnb0RQDHJS
 NNHuvU67TjWXfKC2ttaX7v2rFoRI3cUhYTt1Tkt+91JACZSF3To0dX9z4EczPybWDWTT
 T6CKCzX89UWAXlORfYj5ewnQSBZj1PBQA19NofsFiadOxIWx9461MCQabQ1ews6mxttv
 ww1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bC/FQxgLWJGiw94KarqehJwfcHb0fCz+AnYJztz7GFU=;
 b=Cvn5jlFAi6R9qgLod5wMa/KqUcBkXCfZyrVzuhoEJIxo2BrMrweb1neiK8oC+wHGg7
 uY9n3V3IVdM6WMrNQxEcvYxay5SQ/0O2v2jHeFwWjZz4e8i1aqUGXyV71ozJ924sfw5Z
 NMJ6kKavDnvEJ2LZkJ6XFCj0QpT+jV/moQuUwYslSgoMyA8u8cj4r/V4AQ6WXpXHdo4L
 pZLCgsPpdcbGgdM3uP5FiFcF7wp21qftsZU3IWgTGuh1Y5jLVaJ1XPmmZ/OnjV6mJLla
 wwhScfcP/prI83nTs3/YfnkGlPuaBotr1RCZ3M7ygyrSlNqetJYzqd9rAeQNloKfmPJR
 foig==
X-Gm-Message-State: ANoB5pmHrcyn+Z3SGkcVlHdSVJEMXHlsjJTCdtAR71Vqu87ICgYM40Y5
 JFZeHyAmNhX4HA1lYeVzX37+YA==
X-Google-Smtp-Source: AA0mqf5OUisySkEj2RCDaXXQhUH4FWXY+JkqVk1MeWce1acWyMLFwluuQawKAs2CG4MyrPcA6vywCw==
X-Received: by 2002:a05:600c:4920:b0:3cf:8b23:549c with SMTP id
 f32-20020a05600c492000b003cf8b23549cmr55062497wmp.174.1670357851961; 
 Tue, 06 Dec 2022 12:17:31 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a056000118b00b00225307f43fbsm17954120wrx.44.2022.12.06.12.17.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 12:17:31 -0800 (PST)
Message-ID: <fd1c40b7-2fa7-999c-9d40-4c8e4958ee4f@linaro.org>
Date: Tue, 6 Dec 2022 21:17:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH for-8.0] hw/rtc/mc146818rtc: Make this rtc device target
 independent
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Cc: Michael S Tsirkin <mst@redhat.com>
References: <20221206200641.339116-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221206200641.339116-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/12/22 21:06, Thomas Huth wrote:
> The only code that is really, really target dependent is the apic-related
> code in rtc_policy_slew_deliver_irq(). By moving this code into the hw/i386/
> folder (renamed to rtc_apic_policy_slew_deliver_irq()) and passing this
> function as parameter to mc146818_rtc_init(), we can make the RTC completely
> target-independent.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   include/hw/rtc/mc146818rtc.h |  7 +++++--
>   hw/alpha/dp264.c             |  2 +-
>   hw/hppa/machine.c            |  2 +-
>   hw/i386/microvm.c            |  3 ++-
>   hw/i386/pc.c                 | 10 +++++++++-
>   hw/mips/jazz.c               |  2 +-
>   hw/ppc/pnv.c                 |  2 +-
>   hw/rtc/mc146818rtc.c         | 34 +++++++++++-----------------------
>   hw/rtc/meson.build           |  3 +--
>   9 files changed, 32 insertions(+), 33 deletions(-)

Cool!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



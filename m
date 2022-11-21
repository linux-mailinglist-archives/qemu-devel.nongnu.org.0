Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC51263204B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 12:21:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox4qI-0002be-9L; Mon, 21 Nov 2022 06:20:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4qE-0002aO-LN
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:20:00 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4qC-0002pQ-5Q
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:19:57 -0500
Received: by mail-wm1-x32b.google.com with SMTP id t4so8211996wmj.5
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 03:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=McbGuGTIXZId24UWsf3BeTEEKTkRCOO+OKN1dl3hZhk=;
 b=eWnBrh7U2REY8BSn/nyFDKjcVt5FRqmNc+CDb8m1fENkBDQ35Uk+l0AwqGLKgkyJPl
 fzAKRteJ5Es0kjxSBZWNSuzw78GRu1PnRpT5UIYK0TF0UB978gfyA9g8NVsm7wxvNjUQ
 M71F00DWVMVRBf41l/uprGXdMG5DZLrEh9Zo8DV7NMxEIy4TNIyfmvneYAIrkhw8XVP+
 NGK7/cDH6l4ebY4RnDBCAjYrSLcE3aTXJkNA673S3jIwyifcj0T0+LfsRVmVNT/Y5lFx
 tBjPcjzAk5n9pBfwygj6nwVB2iDRSPGkbI3Rc6+wP/QAg+U/xUm49XcXZonNPrOVlL3c
 WrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=McbGuGTIXZId24UWsf3BeTEEKTkRCOO+OKN1dl3hZhk=;
 b=iBvUZcwB33MPvUKv9ixeFmD5yl+IvUwtUWzKJoU+q69uUPrjYgVQ4IAVW+5Kq5UQku
 wurjDayXexmzOzpK9kld7l76yhW5fwtisaykSPSaBw6Ht/R/FFE9pi9rVBiQs+EVTXhZ
 kDWY5TiVli0q/qA5IkeFXDyHwhtt8srO0A3qWQVZH5j7ygz8PPMkuRYG5ceARmpUNcwI
 CvbcgJT+hqoGrLnt2Cev3HSBLHROwFQ0QVMDAv/jd47xCYWHN2errjdDQWHu455KZDA+
 Q8Mw6zRu6oFydK/YPXzFrLDoXzzJP7FB0AAHNwe2UP9JNFdALPrzlYmHtOgGcasrd8yC
 EGhA==
X-Gm-Message-State: ANoB5pkheWPfi3Hhg6EuQfjwQxKrmcEeT7+8zfJo+kEeUOcfhlgbcq0a
 w/4aF4VYQuU5/6cugAX6KY57Qw==
X-Google-Smtp-Source: AA0mqf4NyVehYH8uSkB0AG8qFuOBLMDPjGNYBZwYiZm+6IE6imf29zqCm117+Q3pvR+0qJ63nBctYA==
X-Received: by 2002:a7b:c8ce:0:b0:3c4:5806:104e with SMTP id
 f14-20020a7bc8ce000000b003c45806104emr12456276wml.42.1669029594308; 
 Mon, 21 Nov 2022 03:19:54 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g15-20020adff40f000000b00241db7deb57sm1245605wro.114.2022.11.21.03.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 03:19:53 -0800 (PST)
Message-ID: <83db8fcf-80c6-01d8-025e-b3ef85dd4d69@linaro.org>
Date: Mon, 21 Nov 2022 12:19:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 03/10] error: Move ERRP_GUARD() to the beginning of the
 function
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: eblake@redhat.com, vsementsov@yandex-team.ru
References: <20221121085054.683122-1-armbru@redhat.com>
 <20221121085054.683122-4-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221121085054.683122-4-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 21/11/22 09:50, Markus Armbruster wrote:
> include/qapi/error.h advises to put ERRP_GUARD() right at the
> beginning of the function, because only then can it guard the whole
> function.  Clean up the few spots disregarding the advice.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/arm/armsse.c        | 3 +--
>   hw/core/machine.c      | 3 +--
>   hw/virtio/vhost-vdpa.c | 2 +-
>   iothread.c             | 2 +-
>   monitor/qmp-cmds.c     | 4 ++--
>   5 files changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



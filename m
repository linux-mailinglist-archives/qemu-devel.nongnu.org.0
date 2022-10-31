Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CFF61357B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:14:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opTfp-000063-6U; Mon, 31 Oct 2022 08:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTfn-00004x-8G
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:13:47 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTfd-000568-Ez
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:13:46 -0400
Received: by mail-wr1-x42f.google.com with SMTP id j15so15696457wrq.3
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1G+4LwU1VKoRUxuh/kntcjDgazZy+0SjMvPNler7HnI=;
 b=ILoKRZ9avYXkhBGvtfNGLaKJpR5sscPfTZk/ghIqarvs8dWUoeStGbdlB6/NxWhmit
 Dn9j2GkUc+DqquXyNtg1xl5nXcc1lICZarIQjWeCFTRc3uQLFUfOjiDKOGkpzK5MGXuP
 CkkTswfi6w81paYwwJO6BrRUhTDm4JAqS3lJA0yGHlUNu1awxrZ8Kvi7gEicYUFJu33c
 SPUQDwfZPY7A50eXDtfpPEyZEiJs+7ujLwweqXmCf/xmrfBxVuUJ+5FoRZe4APPSVQbS
 Yz/Vr9/ETDpB1OH0R+SfIlkc7VwWiGHSocIVK3gLmyy3DhFh31mCkSKL+5VpZ2364W3f
 Uy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1G+4LwU1VKoRUxuh/kntcjDgazZy+0SjMvPNler7HnI=;
 b=u4Exutrfohg9etwp1xDRdyK4sQZNSFUr/XiUDP7DXXRzDZoFkw9Qv2OeCLoIxWmKTQ
 Dxl7wnxaL7df+2jS70YyyTg2OzRCZJ9UymYlUHpRoFHiiNpGZFgY9zPeR4wZS1+b1qnM
 jPjVKLnycwikaSbpPA0g/Ns/v+vKXTvdqOT0XHbgnzUFhLU6atUAuQ1eP9okYNeQ6l19
 BifaDpUVzVZFkysN5mTTNfmYsZ0oikkjhM8L+4I9Z7pD3vmQWgAu1yO+zfd1V6IDGQZg
 OhBY75jOnB0LmzUL1+om1EwyrSQoBHNovcGdkkzXJGOrQ8XBlVhDwX9qf3AehfKRzu4U
 BTOw==
X-Gm-Message-State: ACrzQf1QSpKMuGkK4vNK+Bmbn0PSsuhxzP+etb6Vc0eajvn2adywv9Ad
 tKHQx68v/brIeGgAW9tw5wlu5g==
X-Google-Smtp-Source: AMsMyM7afY0Xp2lpDaA8ATw4BIf6R7jqGHKKboErYCpX9pyvLjONkMra33H+auzRSJ7wy0/TKchKMQ==
X-Received: by 2002:a05:6000:156e:b0:22e:6bf3:79d0 with SMTP id
 14-20020a056000156e00b0022e6bf379d0mr8038759wrz.456.1667218415282; 
 Mon, 31 Oct 2022 05:13:35 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a5d420f000000b0022da3977ec5sm6877732wrq.113.2022.10.31.05.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:13:34 -0700 (PDT)
Message-ID: <43366a56-8268-f369-a484-ff4df0b85aca@linaro.org>
Date: Mon, 31 Oct 2022 13:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v4 0/7] ppc/e500: Add support for two types of flash,
 cleanup
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org
References: <20221018210146.193159-1-shentey@gmail.com>
 <7e76dbc2-ff48-1f08-36c3-8eae41591752@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <7e76dbc2-ff48-1f08-36c3-8eae41591752@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Daniel,

On 26/10/22 19:18, Daniel Henrique Barboza wrote:
> Hi,
> 
> Since this is being sent to qemu-ppc and has to do with e500 I decided to
> take a look. I acked the e500 related patches, 5 and 7. Patch 6 LGTM as 
> well
> but I'd rather not ack it it's SD specific code.
> 
> I'll send a PowerPC pull request this week. I can grab this series via 
> the ppc
> tree if someone with SD authority acks patch 6.

I was not very happy with the SDHCI changes and sent a counter (simpler)
proposal to Bernhard, see:
https://lore.kernel.org/qemu-devel/20221031115402.91912-1-philmd@linaro.org/

Regards,

Phil.


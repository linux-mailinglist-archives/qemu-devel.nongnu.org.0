Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE354355A9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:03:01 +0200 (CEST)
Received: from localhost ([::1]:37834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdJfo-0001BG-UT
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdJdq-0007Kt-6h; Wed, 20 Oct 2021 18:00:58 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdJdo-0007Dp-Bx; Wed, 20 Oct 2021 18:00:57 -0400
Received: by mail-wr1-x430.google.com with SMTP id g25so1129366wrb.2;
 Wed, 20 Oct 2021 15:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vDlaxMr1mPoRBGX2ftYuhPyq1lhsMun2wkk3Wqfm2ow=;
 b=lv9ZPh2NNs9iovVd6H+fHx/SfPEq2L8Vkh8h+vaQEBhwzJ5zHXws7nHjO+R+f0Jwuh
 dKhv/xTK5pIMsNaXzuHRFDY8mFEk4bAieMufo/6HB/YTbNMXlF0o5MTwJEVp11jbdZfb
 LdoRkjNKJpVn+ZjqjMwH+uAWrv4eq/1G94BW80aVSLeOR4w7+e/UtWZeYitDLS3fddPx
 qFkahjUQnnA2oUQaNzZDvckVhkg0U/F/Krtw9H35m0T8NharR6FOhHbVQ32FDPzvHYpz
 MKST8b8ic5CAw/l6BV/EhRvow4p88dU2tPb4PAotSmsmLGqVlvudu9cgMimvXh8u+OXr
 ofbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vDlaxMr1mPoRBGX2ftYuhPyq1lhsMun2wkk3Wqfm2ow=;
 b=YsM8c8YmK1tm9+F8ntglrC+NlJOFCMQooL3TXynoo8Qs4B6n37JVWp3kVsqd+IRuiE
 5aA+mgr8boq+Z6ZK+WrSOrFBWrniOYa/5P7xh6y39UPG5DcSAMQCjCFFOKPVh+WeqQ9e
 fZ5bZjzX6kkll1Bu43UQwmEzcQMPwzGWNCor1d9ZD9jRw1/gMXt2pH3GjwauT6QtZikT
 edkIpgaVCggcbyAMbNDd1QQ+1sKZp9ASWANClsm7QhS86qkyFkzTmK+/PLRPcUbtAtm0
 pog2dcJOv1cE+Y6KO+0GDRjT2A+kvI0i7f9hr9AtpPuwg8nFvqUP37IrwnH35Q/lkG20
 iCSw==
X-Gm-Message-State: AOAM5332zH/hfITMXRi8v+bPnvBorZt8CGp5Tj3/IfNVoMxTXXw9fVoH
 BYAM/tDFWkURQXnX8idU68DjnSFZByc=
X-Google-Smtp-Source: ABdhPJygn5BITJV75BHY+asM3fnB3qwIePf33R3HR66OgE+RVZnlAKAd9uAJGRBpNA+JV7OrdXindQ==
X-Received: by 2002:adf:9c02:: with SMTP id f2mr2317750wrc.201.1634767250408; 
 Wed, 20 Oct 2021 15:00:50 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u15sm3422701wmq.12.2021.10.20.15.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 15:00:49 -0700 (PDT)
Message-ID: <6ac1cadd-cebb-b7da-6879-99d492d22f4e@amsat.org>
Date: Thu, 21 Oct 2021 00:00:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 4/5] aspeed/smc: Use a container for the flash mmio
 address space
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211018132609.160008-1-clg@kaod.org>
 <20211018132609.160008-5-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211018132609.160008-5-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.267,
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 15:26, Cédric Le Goater wrote:
> Because AddressSpaces must not be sysbus-mapped, commit e9c568dbc225
> ("hw/arm/aspeed: Do not sysbus-map mmio flash region directly, use
> alias") introduced an alias for the flash mmio region.
> 
> Using a container is cleaner.
> 
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  include/hw/ssi/aspeed_smc.h |  2 +-
>  hw/ssi/aspeed_smc.c         | 11 +++++++----
>  2 files changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


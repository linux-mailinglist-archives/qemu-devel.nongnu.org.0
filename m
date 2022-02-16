Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 031234B8BF8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 16:02:12 +0100 (CET)
Received: from localhost ([::1]:35428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKLop-0002Pl-4X
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 10:02:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKLnH-0000po-4S; Wed, 16 Feb 2022 10:00:35 -0500
Received: from [2607:f8b0:4864:20::f34] (port=40735
 helo=mail-qv1-xf34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKLnE-00025j-TC; Wed, 16 Feb 2022 10:00:34 -0500
Received: by mail-qv1-xf34.google.com with SMTP id v10so2352025qvk.7;
 Wed, 16 Feb 2022 07:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qy3xZ8qT/ums2dwQPJUMHVrEiOHX4u79jkuCfY9Lj/8=;
 b=IsIlANyA+mTOsp8JUdWp6SBQkR/jpEE2c3WWZ4FzfBSixtvPMNg//zXwqRFRL6e2SI
 8WQ8gps4CXqGvcgG+i0ZC3UQsyRe7SBA7UUU1xpW6jkGG1YMq9kKBDI2n1IeM+VMJ0x5
 lgtOHU8+EFMTcHe1OpFNbbpXm93Gh/Tx8ph6u6qZZVtMtPhBgJ7yXqYZPUBy+FFe24xQ
 GBy+UNUH7Sp1D/52zX8+4M3s2qS952DgB9KhBoVdpanP6Fkf+tvID7dGQXbr7TINX/FH
 sTFnvm8XGq5E9MyTWwORjaCQAUn7DBeMZvFcHn9+0UflIWl741pdCWcy/VwWNJQAkJjQ
 IBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qy3xZ8qT/ums2dwQPJUMHVrEiOHX4u79jkuCfY9Lj/8=;
 b=pyQF0FnGVo000caz/J9E+g9I6uM46qsCfLhl4byTk84FZVisjbnCxoILw7OshNcxQN
 GnbvUF+a8gwt9N804usqkJb0X9pDpRlMmXnEImkV6Bx8I3mzPpj630Zk2tWLvWBLC2U9
 jv/n17pfji7kFeMC5puIYOxfYxJPAxGnPRyvSU0jBW2rnt+s+iJ+XuXQL9PlpbGkLl3G
 H3uV+gEv//UaLKxZx473IkRJ3JvLQzlLJepz8LJU9qqxq+SXidFFdcOAoEjuf5+WXD+7
 MPTi6/zmTiJYn7DgJN/6pB4vNH6Ma+kB5RM2iwWOX1lVg3ZgDfEl83x9613RGwzjYVl/
 XXTA==
X-Gm-Message-State: AOAM532rNGZI3f6UEA8cP0SaDS7c24VBlN6uVx+OMgW+wEsJc1M0MiU9
 K0F4UVo+YWQlDrrKyZjKaog=
X-Google-Smtp-Source: ABdhPJy5a/i3q2ZeOQMu5mzImT+o2qMRgwdGXRkeXhs0Kyk2hFAr8NhL0Mt2QBrv/V0IZap0BlnFsg==
X-Received: by 2002:a05:622a:138a:b0:2c9:efe8:72c7 with SMTP id
 o10-20020a05622a138a00b002c9efe872c7mr2244567qtk.546.1645023631391; 
 Wed, 16 Feb 2022 07:00:31 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id c21sm21366147qtx.89.2022.02.16.07.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 07:00:30 -0800 (PST)
Message-ID: <a3b91b3a-6a75-3dd8-d1dd-fca3f6762c97@amsat.org>
Date: Wed, 16 Feb 2022 16:00:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 2/6] ast2600: Add Secure Boot Controller model
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell
 <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20220216092111.237896-1-clg@kaod.org>
 <20220216092111.237896-3-clg@kaod.org>
In-Reply-To: <20220216092111.237896-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 16/2/22 10:21, Cédric Le Goater wrote:
> From: Joel Stanley <joel@jms.id.au>
> 
> Just a stub that indicates the system has booted in secure boot mode.
> Used for testing the driver:
> 
>   https://lore.kernel.org/all/20211019080608.283324-1-joel@jms.id.au/
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   include/hw/arm/aspeed_soc.h  |   3 +
>   include/hw/misc/aspeed_sbc.h |  33 ++++++++
>   hw/arm/aspeed_ast2600.c      |   9 +++
>   hw/misc/aspeed_sbc.c         | 141 +++++++++++++++++++++++++++++++++++
>   hw/misc/meson.build          |   1 +
>   5 files changed, 187 insertions(+)
>   create mode 100644 include/hw/misc/aspeed_sbc.h
>   create mode 100644 hw/misc/aspeed_sbc.c

> +++ b/include/hw/misc/aspeed_sbc.h
> @@ -0,0 +1,33 @@
> +/*
> + * sASPEED Secure Boot Controller

Typo?

> + *
> + * Copyright (C) 2021 IBM Corp.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +


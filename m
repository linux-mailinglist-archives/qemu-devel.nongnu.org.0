Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B34420706
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:07:48 +0200 (CEST)
Received: from localhost ([::1]:48268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJ0l-0006Se-F5
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXIn7-0006zL-GH; Mon, 04 Oct 2021 03:53:45 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXIn0-00048n-NH; Mon, 04 Oct 2021 03:53:41 -0400
Received: by mail-wr1-x42a.google.com with SMTP id o20so11150973wro.3;
 Mon, 04 Oct 2021 00:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r//XP1lP00GFemry2tO/FQC/7ePT3oIBKh6OtpkgF8I=;
 b=H8svKU3xJSIJm4RK84+pYQ6eNmrLTgRg7eHdjCIMu1/MBzV7s6Lrt4LG2KTyyWIeKO
 P2jM1W4WFFbzGS5l7eMqansH3DxlirLa1i8VbvRCBHstwCfN97Y08cytqTYkb+XisM4H
 yc0Vx/MKchkv1V9m5mH3JCRTtTXDanY6mndpzRWBctbUMVag9b6u3ZrCwNqKtriwnZAR
 IUWP8H8rZgdKctBSUHYp6T+nFWsX0L+1dh/iQH1J0SLd0sNXoPYe+SMuE6IdQcu/pNR1
 Vi1ElLmPlHIc0SRgjSxDAkERyx7A9SwvK8m9+f0uNRqhVU2C2IhXtaUt+CSwallairH5
 RGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r//XP1lP00GFemry2tO/FQC/7ePT3oIBKh6OtpkgF8I=;
 b=in7/PVPmsV523izc0ovapiIuYdfNLQQipoQQL7i6nSbwMVG602SH/ISt3BR3gmjIa1
 YjTUkkZTsnJVHe/yCdAyXDEEIY/9rxlATsNZyPO87QR9oJNOahBBhE+D3SswjYu409ep
 cdKRYxo/fZsKLqXQ5u1TkqRXzXze0kB5/F/B5dYK4TM0toF4w/7HpTN2M/GABVngcMCC
 GUvJtDBXGH/Z4GkY7ik4vSpJIbTXYLtz6VKrHcMbIsZd75wwQ550nghX+odl2DeaCfEB
 u5I7jm9d6QSKdG5BjMDV1PvnouZ8ZT0HxHwYE2yVfqoHZt7a+yslJmGtBJ3tVtKms+Tt
 ZpjA==
X-Gm-Message-State: AOAM531Tutpg8rvvRxbmibKCdxq7Q1/Si98iUDirJrQ6XdDe/yInhJba
 PFVqwQidZ6HtWT59g8WnzhY=
X-Google-Smtp-Source: ABdhPJz0/+JeR8/mTuHWS5cmLN0PWikRxF40R7zyTHRcHTedJRrwBSCwtaTFbj7ozVexT12/XvQbaA==
X-Received: by 2002:adf:bbc2:: with SMTP id z2mr11204655wrg.359.1633334011650; 
 Mon, 04 Oct 2021 00:53:31 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d70sm13725677wmd.3.2021.10.04.00.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 00:53:31 -0700 (PDT)
Message-ID: <f9c512eb-bada-5755-6927-3b6aa2a51fa2@amsat.org>
Date: Mon, 4 Oct 2021 09:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH] hw/arm: fix the position of vcram for raspi
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211001174243.128157-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211001174243.128157-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Bishop <cleverca22@gmail.com>, qemu-arm@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/21 19:42, Alex Bennée wrote:
> The previous calculation fell over when I tried to create a 8gb Pi 4
> because the values where only 32 bit. However the quirk of the Pi

Typo 'where' -> 'were'?

> hardware is the vcram can only appear in the first 1gb of address
> space. This also limits where the initial kernel and DTB can be
> loaded (notice the DTS for the 8gb Pi4 still only uses 32 bit sizes).
> Fix this cleaning up setup_boot to directly use vcram_base and
> documenting what is going on.
> 
> NB: the aliases are confusing.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Michael Bishop <cleverca22@gmail.com>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/bcm2835_peripherals.c | 14 +++++++++++---
>  hw/arm/bcm2836.c             |  2 ++
>  hw/arm/raspi.c               | 19 ++++++++++++-------
>  3 files changed, 25 insertions(+), 10 deletions(-)

LGTM:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


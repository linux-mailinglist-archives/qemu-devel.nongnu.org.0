Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 253C02D1774
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 18:24:02 +0100 (CET)
Received: from localhost ([::1]:53654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmKEy-0007Xe-Up
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 12:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmKCh-00064Z-6O
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:21:39 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:44471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmKCf-0006bs-8c
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:21:38 -0500
Received: by mail-ed1-x544.google.com with SMTP id p22so2501921edu.11
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 09:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lmlkXPCuHwpYDXmVHGeh8ucmUGkurYf7JRkm5hEE+bc=;
 b=qqb7wGXsx4JY8HFnrnTA6e/cTy4P50G+5cOIABYyx52zDm4f/3m64FAoE9yAnRrQ+0
 N5z+IrWiJ6olz9zB0XDH2f9x1LFmD6lZbsyq0motaAzNcSdMGceJBdV28FZJ2HYPgAgW
 eNuQxfyugA6kDBldzYh/puwZncsBF3UDJ3A5VEAJoxhE8scZUl7Chzo9n4WbclGP+t1H
 gOSaqM1CN1ALWSw8eC3KxL/s3AUZwhALal3pSwJQN3JeM3qd6wYGeslwqvIFCP4YZbZs
 lNnb771cBu8Ux8lwnKsQn9L8fJEDOIl5PrS8t/dqm2KJPZaf7i/cB3sWEzHryRRRDpLI
 qKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lmlkXPCuHwpYDXmVHGeh8ucmUGkurYf7JRkm5hEE+bc=;
 b=SvKSIqLzncg/XaPy66JHdB5jslL7/6q2rx6r/f3Q/nuTgzsTMdtTLr84ytAaOoyBpN
 K+mJa+Nf8RghCzyesMqxBZlzWwqRfTpDRm5t9fhWmj+Bzb5dYPkHQHW5oXKed5L9VrDy
 uYjONKjIjCOopSJw2t1XXT3Df2rlusr55UpWaNniKcf+RER9rNW837z2aKqRRDD/JlzL
 muoOMB4ZY/5Qf1lfJYYva+FQYDGux5boGxxu3MtpgoE6S+F+ftOTVxr0t/yLrnJmiXcq
 /Bi2OUKzPfDemiA49ZPWcJcha7YQSJzVCu2k31k5RfLoi5Crini0R+KpzBMgSwoqiuNF
 3KIw==
X-Gm-Message-State: AOAM532/o/PZvPAcxiyzzeY62eal79X4bFFMT97RIbhEngDvQH+wqwub
 QQDg9m8SX/AMRMKzVs1ampc=
X-Google-Smtp-Source: ABdhPJxI6cVXBnypFl/CH3kLJQGSOmrv6tES0Sjj0hTqnas5IpnvdnPkTgcVkGCLiZbd+GGUkqzUJw==
X-Received: by 2002:a05:6402:18:: with SMTP id
 d24mr20511085edu.382.1607361695707; 
 Mon, 07 Dec 2020 09:21:35 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id u15sm15056629edt.24.2020.12.07.09.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 09:21:34 -0800 (PST)
Subject: Re: [PATCH 0/5] MIPS Bootloader helper
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201207050231.2712-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <401260cf-7e1d-d065-d4db-42b21946eee4@amsat.org>
Date: Mon, 7 Dec 2020 18:21:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207050231.2712-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x544.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: chenhuacai@kernel.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 6:02 AM, Jiaxun Yang wrote:
> Hi all,
> 
> I'm back! Now I'm also helping CIP United, the present owner of MIPS
> in China, take care of their open-souce infrastructures.
> 
> Btw: I'd like to add kernel boot tests for boston and incoming loongson-virt.
> Where should I place kernel binaries?

The easiest way is a tag in git repository.

See commits 89368673493 ("BootLinuxConsoleTest: Run kerneltests
BusyBox on Malta") and 4fe986dd448 ("tests/acceptance: console
boot tests for quanta-gsj").

> 
> Thanks.
> 
> Jiaxun Yang (5):
>   hw/mips: Add a bootloader helper
>   hw/mips/malta: Make use of bootloader helper
>   hw/mips/fuloong2e: Make use of bootloader helper
>   hw/mips/addr: Add translation helpers for KSEG1
>   hw/mips/boston: Make use of bootloader helper
> 
>  hw/mips/addr.c            |  11 +++
>  hw/mips/bootloader.c      | 150 ++++++++++++++++++++++++++++++++++++++
>  hw/mips/boston.c          |  60 ++++-----------
>  hw/mips/fuloong2e.c       |  35 ++-------
>  hw/mips/malta.c           | 108 +++++++--------------------
>  hw/mips/meson.build       |   2 +-
>  include/hw/mips/cpudevs.h |  10 +++
>  7 files changed, 216 insertions(+), 160 deletions(-)
>  create mode 100644 hw/mips/bootloader.c
> 


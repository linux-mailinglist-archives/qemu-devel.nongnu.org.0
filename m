Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA742DC4C2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:55:32 +0100 (CET)
Received: from localhost ([::1]:45786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpa5L-0007En-GR
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:55:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZzb-0000kR-DC
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:49:35 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZzZ-0002Uo-W7
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:49:35 -0500
Received: by mail-wm1-x336.google.com with SMTP id g185so3095068wmf.3
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nSHWhj+ELcqRBYCW9V6Sfq91e9b106erlt0H+7rZY3U=;
 b=AWXW+rwald5ids+Btkcl+NF9i63zS48qQUpjZce/74Za0b7g6Ukf7gsNKjJTlSwuRo
 Z2Q6zr8FNj/qvoBHeGalFbC1YOAJU6S8nYnMC0M3vrNVoGJIWwvjbiKqgXctIXgvHRM1
 6A+QcpoGPm/MqTlYWb/q6s0GF0SyM6gwmXsTyslLWzDghbeZYGawl0EUI3EXBBjH+w85
 KI/S/Jogbhy8hLEBc1lHKvskRyTXuQfjiULKPX0GZ01nz8TPsBPr41g/S42MAHODy6F1
 KPjeAbDiJbFft920dishwKITvvLNgxKr5n3oPltiRIywmUFY2s2PSh3k+0ghtL1SEUfW
 2C1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nSHWhj+ELcqRBYCW9V6Sfq91e9b106erlt0H+7rZY3U=;
 b=HjBPOYul4f7NHiEJDliclMcMusmdyve30vo7zJ0XfC2ax97YfgILjqbfOgpafAuo4T
 GmfpC+Vw0uMPdv0khY2J4ZgOCyfhBDnx5CTMiJOLPIqZj7FEFsIdi+jCkKHWiIgmKYeu
 dUlgPFl1FgLzqRgJI0U0TZ92MvnECSz3Je55WZLWaO3iEAYpe1gGV1B6P8Nm9nNEdnuP
 Upt6SYa23kdb5IDf63nsKeuzwwqHegD/l33UiBD4CiumuYHdMHOd11ULJ621rjMkf2eJ
 ItyFJ5nxU2CgkGyXnMFINSoh2REzdjNIuGlxbENaXRcknPrkFninAa8jE5GqD0DT0R4K
 UNEg==
X-Gm-Message-State: AOAM530R+O52CIgpW//byrOW3kerLqJZQwfKt1+Z+jkhOzYYwYcXBdYb
 8NnDxE25NSKH5cSFpXA7wJikCt2mWmg=
X-Google-Smtp-Source: ABdhPJxMvsRIdYJP822Jv6EMqFLb6Sjqvrd5axStyleX94xF+gnFnbcycB/a4t56l6qM69bR15rQVQ==
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr4282918wmh.114.1608137372053; 
 Wed, 16 Dec 2020 08:49:32 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id x18sm4522694wrg.55.2020.12.16.08.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 08:49:31 -0800 (PST)
Subject: Re: [PATCH 1/7] hw/mips/fuloong2e: Remove define DEBUG_FULOONG2E_INIT
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201216022513.89451-1-jiaxun.yang@flygoat.com>
 <20201216022513.89451-2-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1b9f200d-bab1-9894-92a4-07608e6ac515@amsat.org>
Date: Wed, 16 Dec 2020 17:49:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201216022513.89451-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: chenhuacai@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 3:25 AM, Jiaxun Yang wrote:
> Seems useless....

Indeed, introduced in 051c190bce5 ("MIPS: Initial support of
fulong mini pc (machine construction)") but never used.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/mips/fuloong2e.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 9b0eb8a314..055b99e378 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -48,8 +48,6 @@
>  #include "sysemu/reset.h"
>  #include "qemu/error-report.h"
>  
> -#define DEBUG_FULOONG2E_INIT
> -
>  #define ENVP_PADDR              0x2000
>  #define ENVP_VADDR              cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
>  #define ENVP_NB_ENTRIES         16
> 


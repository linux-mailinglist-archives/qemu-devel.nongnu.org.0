Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C160B509106
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:04:15 +0200 (CEST)
Received: from localhost ([::1]:42660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGYg-0000yh-Pe
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFnw-0008Be-3g; Wed, 20 Apr 2022 15:15:59 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:43749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFns-00031a-PX; Wed, 20 Apr 2022 15:15:54 -0400
Received: by mail-oi1-x22a.google.com with SMTP id w127so3136590oig.10;
 Wed, 20 Apr 2022 12:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iAPK1UqhiqaFJpDXle9Bc1K/dWfiZbbImrOTt1WgoWU=;
 b=dEom7+tDgSPpr2Rvn+yFLTU2aNcT7AN/cyAEdQxGgkrk+Ibnjpxu63I2cuOc7bnvHQ
 kIuBiHtmnqMpyx3Z1EUOfMv+KEQGQp5zCTRE3gb5iqOnitsqlI0ZSXRg061QYlEfuNQq
 nqmn3duCCdKboU7b8w+3/xtuqsbCRr3NfrOeG1kKeMWVnA59pMPgJMoYWyEmpghoSgu8
 q+ZJccrX0aHYLnic9LjgXGx37XRZX0rNzu73Qz+v6IAQ/voUADQM/5KCAViRQPm/rV7X
 DeEAcAU9g3O/zk1kJoa/l4fVX6NUtkp7BstG0jJBsWGwsjJJPKsR+F/dlkEr4GTzTUwX
 CMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iAPK1UqhiqaFJpDXle9Bc1K/dWfiZbbImrOTt1WgoWU=;
 b=7c2IToItthJqwuWwbgTxVHmkaO2xVUdUEfLyPx1caKct80eZdN/bErbLf0bI5lD3WC
 NPWjgrJHFvtTXJ5BzVcqND4NwNEMHZ0MNh+gI1t4IgZ+Iq+bWapqN09M80VxLm7rIm6W
 lfPH4H3VyHaxYGMeAyAOY2c36A65ZjlcVm/zlsSwuqytf3B/RvD3e9MwmoK7HOUMsFcd
 JPHJNgjOtHWjpc0TzYp8VI3sv3PGzeMv1RvsKHIxkSA29K6qJ7gPu/BxGjcheyzYqiMs
 7J594OoLOxbxhYMaqF082q1qRT9rLnYY9P5PUwcezwx3z41PY/SGIlfXe5TDOHKndzSD
 bUbg==
X-Gm-Message-State: AOAM5335xu7/aq6YR4M+xHJpFGKkiX1PJQxS/omALRDeddSVLLJS4QWX
 fZgoJh5DppEauckqabSYpO0=
X-Google-Smtp-Source: ABdhPJzJgTiJPMieAhDewyslQz6A+2oqZj+KPBv1tPFZid6GkraE0D4e2BT/llhb1qrVGXfoTrBGaQ==
X-Received: by 2002:aca:5e84:0:b0:2ec:9c1d:fc77 with SMTP id
 s126-20020aca5e84000000b002ec9c1dfc77mr2431700oib.291.1650482150932; 
 Wed, 20 Apr 2022 12:15:50 -0700 (PDT)
Received: from [192.168.10.222] ([179.225.252.195])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a9d5c11000000b005b2611a13edsm6803639otk.61.2022.04.20.12.15.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 12:15:50 -0700 (PDT)
Message-ID: <70e811c4-7ade-d443-0e61-576995e28a30@gmail.com>
Date: Wed, 20 Apr 2022 16:15:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] hw/ppc/ppc405_boards: Initialize g_autofree pointer
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220405123534.3395-1-shentey@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220405123534.3395-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "open list:ppc4xx" <qemu-ppc@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 4/5/22 09:35, Bernhard Beschow wrote:
> Resolves the only compiler warning when building a full QEMU under Arch Linux:
> 
>    Compiling C object libqemu-ppc-softmmu.fa.p/hw_ppc_ppc405_boards.c.o
>    In file included from /usr/include/glib-2.0/glib.h:114,
>                     from qemu/include/glib-compat.h:32,
>                     from qemu/include/qemu/osdep.h:132,
>                     from ../src/hw/ppc/ppc405_boards.c:25:
>    ../src/hw/ppc/ppc405_boards.c: In function ‘ref405ep_init’:
>    /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: warning: ‘filename’ may be used uninitialized in this function [-Wmaybe-uninitialized]
>       28 |   g_free (*pp);
>          |   ^~~~~~~~~~~~
>    ../src/hw/ppc/ppc405_boards.c:265:26: note: ‘filename’ was declared here
>      265 |         g_autofree char *filename;
>          |                          ^~~~~~~~
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ppc/ppc405_boards.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 7e1a4ac955..3bed7002d2 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -262,13 +262,13 @@ static void ref405ep_init(MachineState *machine)
>       /* allocate and load BIOS */
>       if (machine->firmware) {
>           MemoryRegion *bios = g_new(MemoryRegion, 1);
> -        g_autofree char *filename;
> +        g_autofree char *filename = qemu_find_file(QEMU_FILE_TYPE_BIOS,
> +                                                   machine->firmware);
>           long bios_size;
>   
>           memory_region_init_rom(bios, NULL, "ef405ep.bios", BIOS_SIZE,
>                                  &error_fatal);
>   
> -        filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, machine->firmware);
>           if (!filename) {
>               error_report("Could not find firmware '%s'", machine->firmware);
>               exit(1);


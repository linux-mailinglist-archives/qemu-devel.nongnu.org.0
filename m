Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AF0446E8A
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 16:06:37 +0100 (CET)
Received: from localhost ([::1]:45720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjNHA-00031y-Fh
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 11:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjNFF-0001ji-6i; Sat, 06 Nov 2021 11:04:37 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjNFD-0000CF-3a; Sat, 06 Nov 2021 11:04:36 -0400
Received: by mail-wr1-x435.google.com with SMTP id b12so18458734wrh.4;
 Sat, 06 Nov 2021 08:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B4YkghKqFf+xv+6nSbqY8OoEy321OpAPG6QnZfy6z+o=;
 b=ghT5bFRz26MogFIu7moCqL2a5Tbn9Zxotecr4A8FR4zqsi/gFH8hQppFmjH3eiuwRt
 nuunUZSf6HGGKrYMtjALwmB02xalM4DeXKZRzR0ycghSGXr7NhtauZGJeDyJdaHveFc+
 Ek+RBlD0HoNEbD1rjYIsUEu2HNV0IAYCg+8jYyAQTivdZDfOO/xDN6n0pRm1kmeHGRPv
 0CJEvDvN6tlhpf1B+YAoJ/4oSpVeVnQfM+Ib3rYlhEbxV8CpIcKX3FYsUaD6YNEQu0RC
 SoaeZ67aPyO6NcyKDjTm5KjPd6sAGX3o7m0H2MSW8tBwnaJU2Qo/iFWwEYps1oyhIH5Z
 j2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B4YkghKqFf+xv+6nSbqY8OoEy321OpAPG6QnZfy6z+o=;
 b=NbxCCcJajqUDR4bQY6TZQkD7y4m9gIno4zty4glsGX3/YiLrDlytdWTw2ABjgzmehU
 WukSVs2Qy38b8cmJfqsL0ZYnFS0imqIiKfYEgRThwidMkmVBFa6bppfiXyRQmD4lUPiw
 Vgn3c69wjHhThjCWxmrYktU2YST5PrZ5Km8HPVS1N9dm5PhMtleU7Oh+vO6AgXsfTm/w
 Pr2bJxNFXxOheIfteMgdf+djaQ4+ojVwd8DxQjUsAns34JLLj32WSB+B2OPBg5lIqnds
 lcGhHrQL4wI2f+AOmlXxs4CbY/7RvNcc5lZaLedfoNnouNyAt5CxzKPZiovWcqxjz1oA
 I8vA==
X-Gm-Message-State: AOAM530qvPOaLafzT7B4arfppZfdgIZ91GKsztTGILe/q0Q4dGBIfDMk
 J4OCmdqjsqNrcCa/nLXSAjKxJtDJkew=
X-Google-Smtp-Source: ABdhPJxLZAeJp4XudDsvoSWuR8/KDV0qFWTi5s0fOIT1zctHgpvLaYaSMP8epzddEVDNyeuQey0k0A==
X-Received: by 2002:adf:fc90:: with SMTP id g16mr72512442wrr.53.1636211073144; 
 Sat, 06 Nov 2021 08:04:33 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z135sm17162669wmc.45.2021.11.06.08.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Nov 2021 08:04:32 -0700 (PDT)
Message-ID: <471f53ee-4f93-927b-bd95-b666a5eaebb6@amsat.org>
Date: Sat, 6 Nov 2021 16:04:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 0/4] hw/isa: Remove unuseful qemu_allocate_irqs() call
Content-Language: en-US
To: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20210511040621.2736981-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210511040621.2736981-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.407,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Zoltan

On 5/11/21 06:06, Philippe Mathieu-Daudé wrote:
> I started to fix the LeakSanitizer error in piix4_realize(),
> then looked for similar pattern and found 2 other places.
> The older is i82378 (historically the first one) which then
> spread.
> 
> Since v1:
> - rebased
> - removed vt82c686 patches
> 
> Philippe Mathieu-Daudé (4):
>   hw/isa/i82378: Name output IRQ as 'intr'
>   hw/isa/i82378: Simplify removing unuseful qemu_allocate_irqs() call
>   hw/isa/i82378: Rename output IRQ variable
>   hw/isa/piix4: Fix leak removing unuseful qemu_allocate_irqs() call
> 
>  hw/isa/i82378.c | 13 +++----------
>  hw/isa/piix4.c  | 10 +---------
>  hw/ppc/prep.c   |  4 ++--
>  3 files changed, 6 insertions(+), 21 deletions(-)
> 


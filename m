Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049EC570889
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 18:49:59 +0200 (CEST)
Received: from localhost ([::1]:52876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAwbd-0004Kr-Ja
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 12:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oAwDf-0003Ha-3G; Mon, 11 Jul 2022 12:25:11 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:44981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oAwDd-00085h-FK; Mon, 11 Jul 2022 12:25:10 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-10bd4812c29so7258135fac.11; 
 Mon, 11 Jul 2022 09:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SWM14xhdOd32Gt8Eu3iWMAeE1SZckko7zUo8HvFuqQw=;
 b=WDIPKl2+8laypXEkbDEjsFMK51cy2UoC81LE3S27p7tXPJwOg9dsI05dkVqJkNxh58
 vNtUqxfrio+hpmJ9gVDxXc3kxNxtujfhwt26O4mCCw7ewTqZoDUNTPEHP2BJeXnChUDW
 wKi+yjSbNjSTG6YKTDaBpWivwlvpHhHnm1Td+QBUKncAAc4TyG6c3zUyyLN5DQ38+wOb
 1fX6otfYcbwBA0gJ46thPD0IOFnEhYybRv9OR2hFxsU7g9u8VaLs2dT8MgXmAzTGAS/m
 dOBrhvF9/0aAcbWrsXZaebM4oPCYiUNFEePUQyit4QBjW3YbD2Edvrf0XfIjBPRBmO2j
 gTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SWM14xhdOd32Gt8Eu3iWMAeE1SZckko7zUo8HvFuqQw=;
 b=GjO+WRmIgD+xzg51KNYbLX6pjKJYa2ZccIEASuN3HHKylSzUIov6Gg/qgivFWusCQ7
 j23HTMRsrLWt5hTOvTjQ84wzHKWQxR/4U/R2CtPtOHiIJbzdedi0dgQBgFFgNdFK2Zyl
 lc9g0mWzIsG8aAOUiGzLGiEgWCSqoyosK3RSS8C/JZ6xIM4VE1jy1vvr3tn4TrXrUTT1
 et0lcWYJ7KV6TNwk0zdkckpBiR9p5bM8Q+XoYvFYFTOmvwqyFSM1QoYLarsT0oBfCTzW
 jZok7gg6fJhIbLbAnu11ljnDUlM8UhgjgiXIHmHWFZZG35sd2eikAtqzXXmBfwWAzHi7
 8fAw==
X-Gm-Message-State: AJIora/PCKmyABwzI7b16c/mh2PkWsaS2K5/j1rm6FVF9AImB1D95J4z
 X/DLNkSXEZCkb5SoUlZ5FU4=
X-Google-Smtp-Source: AGRyM1sOjDy35cMnb8TgI1kZVYiG5STypyFdl1vJMapnQ6w4kKxQjwUVIoWdANPBCc9qdCWp3/i5pQ==
X-Received: by 2002:a05:6870:1d3:b0:10b:fed2:f0cc with SMTP id
 n19-20020a05687001d300b0010bfed2f0ccmr7958890oad.216.1657556706824; 
 Mon, 11 Jul 2022 09:25:06 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j5-20020a9d7685000000b0061c1ac01051sm2726593otl.51.2022.07.11.09.25.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 09:25:06 -0700 (PDT)
Message-ID: <2985f66d-e3a5-b0ff-6092-46a070be3a74@gmail.com>
Date: Mon, 11 Jul 2022 13:25:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/5] ppc: Remove irq_inputs
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Cc: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>
References: <20220705145814.461723-1-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220705145814.461723-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 7/5/22 11:58, Cédric Le Goater wrote:
> Hello,
> 
> This replaces the IRQ array 'irq_inputs' with GPIO lines and removes
> 'irq_inputs' when all CPUs have been converted.
> 
> Thanks,
> 
> C.
> 
> Cédric Le Goater (5):
>    ppc64: Allocate IRQ lines with qdev_init_gpio_in()
>    ppc/40x: Allocate IRQ lines with qdev_init_gpio_in()
>    ppc/6xx: Allocate IRQ lines with qdev_init_gpio_in()
>    ppc/e500: Allocate IRQ lines with qdev_init_gpio_in()
>    ppc: Remove unused irq_inputs
> 
>   target/ppc/cpu.h       |  1 -
>   hw/intc/xics.c         | 10 ++++++----
>   hw/intc/xive.c         |  4 ++--
>   hw/ppc/e500.c          |  8 ++++----
>   hw/ppc/mac_newworld.c  | 16 ++++++++--------
>   hw/ppc/mac_oldworld.c  |  2 +-
>   hw/ppc/pegasos2.c      |  2 +-
>   hw/ppc/ppc.c           | 30 ++++++------------------------
>   hw/ppc/ppc405_uc.c     |  4 ++--
>   hw/ppc/ppc440_bamboo.c |  4 ++--
>   hw/ppc/prep.c          |  2 +-
>   hw/ppc/prep_systemio.c |  2 +-
>   hw/ppc/sam460ex.c      |  4 ++--
>   hw/ppc/virtex_ml507.c  | 10 +++++-----
>   target/ppc/cpu_init.c  |  5 -----
>   15 files changed, 41 insertions(+), 63 deletions(-)
> 


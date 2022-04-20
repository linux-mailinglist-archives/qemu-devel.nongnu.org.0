Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68573509100
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:01:38 +0200 (CEST)
Received: from localhost ([::1]:60650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGW9-0002Th-Hy
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFjx-0007aY-Hp; Wed, 20 Apr 2022 15:11:51 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:42367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFjv-0002OD-SA; Wed, 20 Apr 2022 15:11:49 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-e604f712ecso2982089fac.9; 
 Wed, 20 Apr 2022 12:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HOUFIW6Ee4wl7bLJE3ypAxo43Zrb5bs60GPyb6Lme4U=;
 b=KUh8iHsOxrFD270dsFJH4NVg3jB0Yp9m2GCfT6VdIxqq6uWO6WAB6bgj/Tnr3u48Ck
 zyIvwFgJQX8AOYy6Tk9rbWdb4it24Q99/NuIePQxNBERmowUzPBm2+dOUpSqPMSDME4m
 giCnKgioVQNveSPskZTyPIFaQQIwzqOi7tt4rWDQp95YAzeKCYEpDKlQ0mYn8j6VtGU5
 kvKP0fJBMyQ07+1dm+qzGZvkSpmOeZKZ2+KOlXJcm5G4LV2UGnmCsoi9MJIrunjfSoYN
 ToBWscdgvRrX8Xl/yvhwyiMQ6Eh/3S+a7NUfixC7ZAiKeFiJmAHu5zNnRC+sWKTb65gR
 ufWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HOUFIW6Ee4wl7bLJE3ypAxo43Zrb5bs60GPyb6Lme4U=;
 b=qMSTH7VSbCMUXlLqkeQihlqfoBsr09VqZP+4syfgWMizhYaTer0hGKigJJrTg5Azmg
 2eiJsW9cQx6qvUNxzsWslkoLoog35Pf3DkrY57M0lJQFBwI9KBnhxGTLaYNEDE9e1UJ2
 fdb6qzGfw7N6vKmZM05eHKcsNJ0s3htJcv612TrotSiCyWzb5HSP/FNcMhbdaAwnLRhm
 QUUNGADaJS+BppV3hQ5nfuiDXgiWM/lW/4sM9+IB5CLTXxkxqJP8AoBfWuouOjV4lp47
 dNjxtO3NbfFWCyOvN/XYyxRIdsVNHqm3GXp5yO/5g3JAofuA0AybQYL8cdnW2oCu9fUU
 C3Qw==
X-Gm-Message-State: AOAM530xDELdSSOqvzX+Y1n7aqWiYwY6XTJRTpn/SJWTGNX9QopXDFzw
 cshlLpCu+3VtP9c1iJXZdoM=
X-Google-Smtp-Source: ABdhPJymR5aoWF0oxeDs/DWgXKn1f0y8mFOrblp/C36EnN/gxbKnlDm9f/1My6NrZSm5d4HI5QZ3AQ==
X-Received: by 2002:a05:6870:9594:b0:da:b3f:2b1c with SMTP id
 k20-20020a056870959400b000da0b3f2b1cmr2420147oao.187.1650481906470; 
 Wed, 20 Apr 2022 12:11:46 -0700 (PDT)
Received: from [192.168.10.222] ([179.225.252.195])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a056808020f00b003227922d2b6sm4279787oie.11.2022.04.20.12.11.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 12:11:45 -0700 (PDT)
Message-ID: <2f05535d-4673-879b-247b-ee813a2bac00@gmail.com>
Date: Wed, 20 Apr 2022 16:11:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/5] ppc/pnv: Introduce GPIO lines to drive the PSIHB
 device
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220323072846.1780212-1-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220323072846.1780212-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/23/22 04:28, Cédric Le Goater wrote:
> Hello,
> 
> The PSIHB OCC and LPC interrupts are driven by a complex framework
> using Object links and class handlers. Simplify the whole with GPIO
> lines.
> 
> Thanks,

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

> 
> C.
> 
> Cédric Le Goater (5):
>    ppc/pnv: Fix PSI IRQ definition
>    ppc/pnv: Remove PnvLpcController::psi link
>    ppc/pnv: Remove PnvOCC::psi link
>    ppc/pnv: Remove PnvPsiClas::irq_set
>    ppc/pnv: Remove usless checks in set_irq handlers
> 
>   include/hw/ppc/pnv_lpc.h |  8 ++------
>   include/hw/ppc/pnv_occ.h |  7 ++-----
>   include/hw/ppc/pnv_psi.h |  7 +------
>   hw/ppc/pnv.c             | 30 ++++++++++++++++++------------
>   hw/ppc/pnv_lpc.c         | 19 ++++---------------
>   hw/ppc/pnv_occ.c         | 16 ++++------------
>   hw/ppc/pnv_psi.c         | 36 +++++++++++-------------------------
>   7 files changed, 42 insertions(+), 81 deletions(-)
> 


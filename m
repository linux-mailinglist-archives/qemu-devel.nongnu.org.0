Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAD44E686C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:12:47 +0100 (CET)
Received: from localhost ([::1]:53018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXRx0-0003ii-7t
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:12:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nXRmw-0004Si-HN; Thu, 24 Mar 2022 14:02:24 -0400
Received: from [2607:f8b0:4864:20::22e] (port=35359
 helo=mail-oi1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nXRmv-0000YD-30; Thu, 24 Mar 2022 14:02:22 -0400
Received: by mail-oi1-x22e.google.com with SMTP id e4so5693753oif.2;
 Thu, 24 Mar 2022 11:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SZ5BgcW6RgAQBulhzXrKyhGUdetHzVTXyYna8+0mn8I=;
 b=IOyAnhvaS93uL73S3/sT/Lg1h+Ptjydu3Bk1rsHLMpaQ2HSkupuZ+GDxnYowvhhVns
 HNHVdep1LqdugplK+dMItnkejy1NdmyJxx7TAlNLinVqTunm6A8RZFBBKzKdbmf6KHn1
 +qaMCE7FpVlRNrLrpG9/ADtg56O3sWMpj8jN1BQTXrJrHM8FDfWLamL7h04bKddUvi30
 uM3o40jif/PvXX+xFAM9bplpKYWZR6RPrJCDJK6BrN2CLAqaTJXw3ujsQ6QyFAm1iiMR
 Hg2ULds0prsqn0S93Hw9jj0cceJd+cmxClSOSiAjKpiUSWi1f7lSIrfAwdd/As7ckiUo
 jhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SZ5BgcW6RgAQBulhzXrKyhGUdetHzVTXyYna8+0mn8I=;
 b=4iFTIvEcZnIqHYtfWNJrd66U4V12OfhIBw1TVP4SfZWXH9QL7Xsqd25wpFKU/Jm1ds
 /4Tf/KRzAigTnSLcIpWGaT4wzknLH8QfBzzb4JPeIMhDgic1PSRmWedT7WcgA2H0zf7W
 QDgWTwzNv3qxfUUWwUc32U1AIpZxme7Ix36lEezSZ54Ee48392XlgKR9JPVoo7CBE2j7
 x5ire1r8ShYzcx1Z3UPKWMOLnZKgiID7Zi96Mgx6WxCZ5qetJg13ZYeqV2K7TYl/2GkN
 zuBl78tjZAJDyyxxe+6oVFg3A20xQJdL/gOV9GawkCakvuMes3X6tXyT2TCTg2HHOdK/
 WiQg==
X-Gm-Message-State: AOAM530MlhABHRiPcyZyyqHeMboUwUHvR4nGwHF3A+V6AJPxRCso3W6J
 8upfxUOA2W6wGrAw5prmmPk=
X-Google-Smtp-Source: ABdhPJwLxeKS1p2/SBpUGZqQxH9wrUUS67zYsRBCpCpVnP/nyojqrwbUyUJsJAyQjBft9/d9n/B5Vg==
X-Received: by 2002:a05:6808:f8a:b0:2da:1e9b:e85d with SMTP id
 o10-20020a0568080f8a00b002da1e9be85dmr3355050oiw.111.1648144939031; 
 Thu, 24 Mar 2022 11:02:19 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:daa8:ba9e:6f18:bac1:8a96?
 ([2804:431:c7c6:daa8:ba9e:6f18:bac1:8a96])
 by smtp.gmail.com with ESMTPSA id
 j25-20020a4ad199000000b003171dfeb5bfsm1521711oor.15.2022.03.24.11.02.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 11:02:18 -0700 (PDT)
Message-ID: <801271a9-06bd-1ebb-5d95-2fea76f95ae3@gmail.com>
Date: Thu, 24 Mar 2022 15:02:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 5/5] ppc/pnv: Remove usless checks in set_irq handlers
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220323072846.1780212-1-clg@kaod.org>
 <20220323072846.1780212-6-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220323072846.1780212-6-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Typo in the commit title: s/usless/useless




On 3/23/22 04:28, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/ppc/pnv_psi.c | 10 ----------
>   1 file changed, 10 deletions(-)
> 
> diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
> index 950ecca40573..98045ed3d249 100644
> --- a/hw/ppc/pnv_psi.c
> +++ b/hw/ppc/pnv_psi.c
> @@ -219,11 +219,6 @@ static void pnv_psi_power8_set_irq(void *opaque, int irq, int state)
>       uint32_t src;
>       bool masked;
>   
> -    if (irq > PSIHB_IRQ_EXTERNAL) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "PSI: Unsupported irq %d\n", irq);
> -        return;
> -    }
> -
>       xivr_reg = xivr_regs[irq];
>       stat_reg = stat_regs[irq];
>   
> @@ -813,11 +808,6 @@ static void pnv_psi_power9_set_irq(void *opaque, int irq, int state)
>       PnvPsi *psi = opaque;
>       uint64_t irq_method = psi->regs[PSIHB_REG(PSIHB9_INTERRUPT_CONTROL)];
>   
> -    if (irq > PSIHB9_NUM_IRQS) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "PSI: Unsupported irq %d\n", irq);
> -        return;
> -    }
> -
>       if (irq_method & PSIHB9_IRQ_METHOD) {
>           qemu_log_mask(LOG_GUEST_ERROR, "PSI: LSI IRQ method no supported\n");
>           return;


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CABD55090C5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:52:55 +0200 (CEST)
Received: from localhost ([::1]:34732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGNi-0000j0-UO
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFql-0004mi-1M; Wed, 20 Apr 2022 15:18:51 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:42744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFqj-0003Rj-2g; Wed, 20 Apr 2022 15:18:50 -0400
Received: by mail-oi1-x235.google.com with SMTP id a10so3158848oif.9;
 Wed, 20 Apr 2022 12:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vC3gCI1B9sldVtivekYxBC5/QguydtzlxXpck4pKIfE=;
 b=VBmKFL4a4W0MT5rHx/ApkpBPVVwtE2ba8tkgpeWD8HRCM6Y5TLDCo2vxiZBW2PsVrC
 W8w+vcKMSBvGxpEfj/Jw2FdK/pz4lJLWtF+6xTrXHK/YzpB+eZ/zFA0DBhCFjFDaFTjG
 lTq/Tgf5qF3LHlPCSc10ovWpwrYMzqTZG1ax5KDnkDAfUUgvpsAkWkuZ6+pw279H3uJV
 +47AUk/6BZFUSKvO85LlUs61q7ONoF0n2hK6z8t9yCVX9pGUgHndt9TPa+xJfvI6vknl
 oSHHNdisat/7EFLE6HHz7oaia5yqShLZTo+b/7LZDSFPx/h8LcG1H3jLHmI9brpCyzls
 4O1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vC3gCI1B9sldVtivekYxBC5/QguydtzlxXpck4pKIfE=;
 b=L737yEAl+Gu5sx2B4y45aEUeZ32A03bSSw9XaKeNFp5mOS8BXLCrEzbBcfm9otGLE0
 y7H+NwgWmGsgNkkgPTYtc0zr/xtFylG0ELcXd3GfwAbT6aYsmn1TSw/7ZGF9+VnjVWpn
 BSchS8sWlRXQv8qpesZhdvbk0TVtprxF0oAxRSRQgvf86BuW3VcVHkGGQJKI9Lslq0Rk
 6/ZB7+yfoAij7u6ELTN6puGVzoQ1P5D41+pWhd/VfM/oOLLN3yc3+iDthSSzPqC1TQ+Z
 t3XrLsQlrFCtuhebkIeN4eTWn4lLcXG7jQLdaSb+LaZol+5Hc7vh0Er/EilP0KDtXeFa
 r+aA==
X-Gm-Message-State: AOAM532zFNs/EcXaRBnbtoPBuNlp8welo1FlDgx5kwnai6sv+beW7nkQ
 7j8v93h8iJld7XwNENg5azg=
X-Google-Smtp-Source: ABdhPJy5tBWw7RvWzX26rHF9FImicDru1fqznKl9cOknnliTqCUre1oX+i1xZ4+vAJsnidCCYSWH4Q==
X-Received: by 2002:a05:6808:1487:b0:322:e1b6:1911 with SMTP id
 e7-20020a056808148700b00322e1b61911mr2015722oiw.88.1650482327706; 
 Wed, 20 Apr 2022 12:18:47 -0700 (PDT)
Received: from [192.168.10.222] ([179.225.252.195])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a0568080b0f00b003227735da75sm4408176oij.50.2022.04.20.12.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 12:18:47 -0700 (PDT)
Message-ID: <8ac6556b-1c7b-b734-bb37-f0bb075bd981@gmail.com>
Date: Wed, 20 Apr 2022 16:18:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] hw/ppc: change indentation to spaces from TABs
Content-Language: en-US
To: Guo Zhi <qtxuning1999@sjtu.edu.cn>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>
References: <897919466.10558377.1649695044864.JavaMail.zimbra@sjtu.edu.cn>
 <20220412021240.2080218-1-qtxuning1999@sjtu.edu.cn>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220412021240.2080218-1-qtxuning1999@sjtu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 4/11/22 23:12, Guo Zhi wrote:
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/374
> 
> There are still some files in the QEMU PPC code base that use TABs for indentation instead of using  spaces. The TABs should be replaced so that we have a consistent coding style.
> 
> Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
> ---
>   hw/ppc/ppc440_bamboo.c |  6 +++---
>   hw/ppc/spapr_rtas.c    | 18 +++++++++---------
>   include/hw/ppc/ppc.h   | 10 +++++-----
>   3 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index 7fb620b9a0..5ec3a9a17f 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -3,9 +3,9 @@
>    *
>    * Copyright 2007 IBM Corporation.
>    * Authors:
> - *	Jerone Young <jyoung5@us.ibm.com>
> - *	Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
> - *	Hollis Blanchard <hollisb@us.ibm.com>
> + *  Jerone Young <jyoung5@us.ibm.com>
> + *  Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
> + *  Hollis Blanchard <hollisb@us.ibm.com>
>    *
>    * This work is licensed under the GNU GPL license version 2 or later.
>    *
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index d7c04237fe..d58b65e88f 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -474,16 +474,16 @@ static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
>   
>       if (spapr->fwnmi_machine_check_interlock != cpu->vcpu_id) {
>           /*
> -	 * The vCPU that hit the NMI should invoke "ibm,nmi-interlock"
> +         * The vCPU that hit the NMI should invoke "ibm,nmi-interlock"
>            * This should be PARAM_ERROR, but Linux calls "ibm,nmi-interlock"
> -	 * for system reset interrupts, despite them not being interlocked.
> -	 * PowerVM silently ignores this and returns success here. Returning
> -	 * failure causes Linux to print the error "FWNMI: nmi-interlock
> -	 * failed: -3", although no other apparent ill effects, this is a
> -	 * regression for the user when enabling FWNMI. So for now, match
> -	 * PowerVM. When most Linux clients are fixed, this could be
> -	 * changed.
> -	 */
> +         * for system reset interrupts, despite them not being interlocked.
> +         * PowerVM silently ignores this and returns success here. Returning
> +         * failure causes Linux to print the error "FWNMI: nmi-interlock
> +         * failed: -3", although no other apparent ill effects, this is a
> +         * regression for the user when enabling FWNMI. So for now, match
> +         * PowerVM. When most Linux clients are fixed, this could be
> +         * changed.
> +         */
>           rtas_st(rets, 0, RTAS_OUT_SUCCESS);
>           return;
>       }
> diff --git a/include/hw/ppc/ppc.h b/include/hw/ppc/ppc.h
> index 364f165b4b..02af03ada2 100644
> --- a/include/hw/ppc/ppc.h
> +++ b/include/hw/ppc/ppc.h
> @@ -99,11 +99,11 @@ enum {
>       ARCH_MAC99_U3,
>   };
>   
> -#define FW_CFG_PPC_WIDTH	(FW_CFG_ARCH_LOCAL + 0x00)
> -#define FW_CFG_PPC_HEIGHT	(FW_CFG_ARCH_LOCAL + 0x01)
> -#define FW_CFG_PPC_DEPTH	(FW_CFG_ARCH_LOCAL + 0x02)
> -#define FW_CFG_PPC_TBFREQ	(FW_CFG_ARCH_LOCAL + 0x03)
> -#define FW_CFG_PPC_CLOCKFREQ	(FW_CFG_ARCH_LOCAL + 0x04)
> +#define FW_CFG_PPC_WIDTH        (FW_CFG_ARCH_LOCAL + 0x00)
> +#define FW_CFG_PPC_HEIGHT       (FW_CFG_ARCH_LOCAL + 0x01)
> +#define FW_CFG_PPC_DEPTH        (FW_CFG_ARCH_LOCAL + 0x02)
> +#define FW_CFG_PPC_TBFREQ       (FW_CFG_ARCH_LOCAL + 0x03)
> +#define FW_CFG_PPC_CLOCKFREQ    (FW_CFG_ARCH_LOCAL + 0x04)
>   #define FW_CFG_PPC_IS_KVM       (FW_CFG_ARCH_LOCAL + 0x05)
>   #define FW_CFG_PPC_KVM_HC       (FW_CFG_ARCH_LOCAL + 0x06)
>   #define FW_CFG_PPC_KVM_PID      (FW_CFG_ARCH_LOCAL + 0x07)


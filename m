Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8614FF759
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 15:03:41 +0200 (CEST)
Received: from localhost ([::1]:44034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1necep-0003Tq-OM
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 09:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1necbg-0001u8-Hm; Wed, 13 Apr 2022 09:00:25 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:44030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1necbe-0004Vp-Ku; Wed, 13 Apr 2022 09:00:24 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-df02f7e2c9so1875483fac.10; 
 Wed, 13 Apr 2022 06:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GGB6ud6coi5hPCgvStBiNtNpEy1kJv/k4qb6M6GQTf8=;
 b=K+xaWyFABeJ/RfNoIsjJHMdiT+kzZ8vW+3tKbhBwi+vj26sT1GXA815ug9m8Lf52fY
 1g1cfyUeswXaCrfS5dl0li47wKr6crNWdpt3m90e/xcWd3Ys7SoHUjoCyD+Ua6VB0dwk
 BmVXMzOagFgAQZJsTZe5cHyxF5iVwq0UQhEwUtyC6PoZTdpMyZQfdkAayrPvhC6TQqd8
 5L3JDpvCSOF6yr+uCp32M5/HEjI3X2o0sOrRVZgxDUZwx8KzHbqyoCeUnpU63GTnXZZE
 ZfSkk347hFUzdOX3mnqfLNEMwJk9roWxJLMn+8cg6fNJlinWtetxyi3ZlORFRzEqbV+k
 aQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GGB6ud6coi5hPCgvStBiNtNpEy1kJv/k4qb6M6GQTf8=;
 b=T5cr0S9neGwjzpeF2TjSKMcHtaW4JAA/hmTkTmZniC6vdVSdZaIfp8F+tQayg0DFea
 MDA8cRry7xhsgICfntmc3u3yrrfIzejpDg5tf/I3R7R16XL+83Ls0bbB1dkJw+duoLli
 5Gly42BIskWesd8H8cBUkpiqkF2mNcR1ey0mLFDX9VVY9sKmedjlu+gCq+fr4ExKBqG0
 kkLcRhHgdskyQI3QSsJMfsOZ9aF/u2XQ79hrpAyM7hbRpqOeq3O4UIbnCG2bch3Qx3gg
 P1baGeuvV9hdWljaykGHIn3EUbQG4f2ngyUs7E1uflFHbIMV/Igd0CLglJEhAMZc0KRh
 jN7w==
X-Gm-Message-State: AOAM531bcxQPMF1MFiDT2nmh0ciF5NsnzrhEodb5TGNti9sctWX3jifu
 ISS6ONbfIBACOHSul0lGGJLq+CtBtyE=
X-Google-Smtp-Source: ABdhPJwGtvCzldyp7omNNfEDSILv7vU2XZFvssew8/33WJgEqtW/q8V/s8hu4dvi0oJZQZcVTE2aqg==
X-Received: by 2002:a05:6870:d59b:b0:de:3ca3:3463 with SMTP id
 u27-20020a056870d59b00b000de3ca33463mr4021052oao.263.1649854820676; 
 Wed, 13 Apr 2022 06:00:20 -0700 (PDT)
Received: from [192.168.10.222] ([179.247.135.248])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a056870831600b000ccfbea4f23sm15316599oae.33.2022.04.13.06.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 06:00:20 -0700 (PDT)
Message-ID: <5b961174-4863-7e34-fce8-e910d80603ec@gmail.com>
Date: Wed, 13 Apr 2022 10:00:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
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
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
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



On 4/11/22 23:12, Guo Zhi wrote:
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/374
> 
> There are still some files in the QEMU PPC code base that use TABs for indentation instead of using  spaces. The TABs should be replaced so that we have a consistent coding style.
> 

I forgot to mention about the commit msg. Ideally we want the commit msg
to have shorter lines. If you use 'vim' you can do that by selecting
the commit msg and hitting 'G' and 'W' in non-insert mode.

I've amended it before queueing, so don't worry about it. I also moved the
'Resolves' tag to the end of the commit msg, which I also forgot to mention
about.

> Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
> ---


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>



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


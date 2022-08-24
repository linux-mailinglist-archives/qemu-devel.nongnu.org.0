Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DB55A00C5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 19:54:41 +0200 (CEST)
Received: from localhost ([::1]:58742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQuaO-0003eG-KW
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 13:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oQuEj-000261-Jt; Wed, 24 Aug 2022 13:32:26 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f]:46664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oQuEi-0003kv-4u; Wed, 24 Aug 2022 13:32:17 -0400
Received: by mail-ua1-x92f.google.com with SMTP id c1so1993907uat.13;
 Wed, 24 Aug 2022 10:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=0ohOt6pMsqXHO9KU2LLE6dd+dQY8ULwoZqsEA3OPzR0=;
 b=QPto1v4CBqVji4YcCmzk3U3jTUxvDgVPeGlhGrNAg7hEHpg/+a6hHATq4Hxuixo5Yc
 I5R9wP6fJXz6BpMk5xICzDPrIlOMWvZxacoJcMa5hBrZSDplCjhmWnnXZ57ka4rEJ+2h
 yGxGAHk4LG3YkbzkngzwZHxGfRtAOcuTGl5MRr2KZEYLgqlYpmDs6Kk8Ekq01m/k0ZaT
 WIz/+oxPbPNpgQ5B7EC5nVPm8uWVVUv7ngMQCWrkrZbV/doTfr17t23LPm9L1Kvc6V2H
 qaOAFgjHn1BnIPK6CpNc3/gPkU8aTKJfTlWaNwfxZFC414MHDaspaW490/VZS1fbv1nX
 9Kcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=0ohOt6pMsqXHO9KU2LLE6dd+dQY8ULwoZqsEA3OPzR0=;
 b=Ywm+LdFm01FsHoH/AYxdr6HA7I9Ba0gWM8fXp61o1dsZHnstB+zUTI5/0dGRgNUTFZ
 mm6vZyXC4v0/Sy8kkimdKxFNHZ6Ar4R/o6RQMgAwTvHBKPW0DxSGeING9x5embpexjqU
 0xc6ceVw++QiQaMdZ5DdGMOUq1cdwvL41piL8SJfe+1WEbqKAjesxWLClqiAKSJXi7vM
 QYtQ28+6mHFQ+By7uoh69RZ8JUcIEdvrHgNXtkcxD47ekNTv7OEyk83s/eIosRN77GBw
 TWR49pOrlTxhrXH2v/jZ36cs8Mbm6d3mkASt4OJbltDht+0636hb1Ae//ocPb33nDCDp
 rf6A==
X-Gm-Message-State: ACgBeo3Or4N6y//KpaF7GVsFTRW+d+CvqGvJ1TX2laMiPBJL73CDgdW+
 IpGPV7i9obBzGiq+/TKm06E=
X-Google-Smtp-Source: AA6agR4/Vp20Av64LONcBkGGYiLUwHaQShipz/R0jyyDB57Ye/oDjtEsBJAmjJ8JYNrnRXSGl1qgCA==
X-Received: by 2002:ab0:4a0b:0:b0:39f:27a3:e082 with SMTP id
 q11-20020ab04a0b000000b0039f27a3e082mr4921uae.41.1661362334633; 
 Wed, 24 Aug 2022 10:32:14 -0700 (PDT)
Received: from [192.168.15.61] ([179.97.170.204])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a1f7203000000b0038ccc951cd7sm2515907vkc.46.2022.08.24.10.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 10:32:14 -0700 (PDT)
Message-ID: <d91d2881-8e41-778c-f721-d9fe4fc15353@gmail.com>
Date: Wed, 24 Aug 2022 14:32:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 42/51] hw/ppc: spapr: Use qemu_vfree() to free spapr->htab
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-43-bmeng.cn@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220824094029.1634519-43-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92f.google.com
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



On 8/24/22 06:40, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> spapr->htab is allocated by qemu_memalign(), hence we should use
> qemu_vfree() to free it.
> 
> Fixes: c5f54f3e31bf ("pseries: Move hash page table allocation to reset time")
> Fixes: b4db54132ffe ("target/ppc: Implement H_REGISTER_PROCESS_TABLE H_CALL"")
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

> 
>   hw/ppc/spapr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index bc9ba6e6dc..4034f4d130 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1522,7 +1522,7 @@ int spapr_hpt_shift_for_ramsize(uint64_t ramsize)
>   
>   void spapr_free_hpt(SpaprMachineState *spapr)
>   {
> -    g_free(spapr->htab);
> +    qemu_vfree(spapr->htab);
>       spapr->htab = NULL;
>       spapr->htab_shift = 0;
>       close_htab_fd(spapr);


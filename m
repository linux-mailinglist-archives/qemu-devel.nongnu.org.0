Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428F5496331
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 17:55:06 +0100 (CET)
Received: from localhost ([::1]:42320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAxBo-00066G-Hc
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 11:55:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nAwej-0007Im-JK; Fri, 21 Jan 2022 11:20:55 -0500
Received: from [2607:f8b0:4864:20::335] (port=39506
 helo=mail-ot1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nAwei-0007Y9-1b; Fri, 21 Jan 2022 11:20:53 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 c3-20020a9d6c83000000b00590b9c8819aso12379872otr.6; 
 Fri, 21 Jan 2022 08:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nqwLTsKIGxCXsSJ+7+b/VRK6R1kLrwUnVV5H/JHQoC0=;
 b=V26sKUHbkMXbBV8mGs/b/CFXqi/YbU7lEnzBj+CC5FQToyACFScW+vow2+6pHazL2u
 uSRik0x5E55X/Rn580k+5ik3Pe/cWgBhEZ8AY+kYaNIDTAwDWt/oQWFo1361dEOZFGj1
 AodduVXkFr/ZSWK5qoz9kd/eLoKfRcoVDeIaKJ41kYrg7vvlOxsZHt00VAKaKijPhcWx
 91jdFvdOT9jqQVEYHurpAM/dhA+O3+T3EgfAy3U+DvUxXdq+j22nXGq9zyAWUiHHiYOA
 lEcUdNLY9H9YasZyrw4rXwGGmKR6taqp1FNtZKGTkPAVlWZnBdyBM3L9+oKdh3Vc3X/8
 qZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nqwLTsKIGxCXsSJ+7+b/VRK6R1kLrwUnVV5H/JHQoC0=;
 b=qTWX5viqnsS7rSHeIvQe1UulOYbg9BamnAUid9ARwKuiWJxX3o/1e9CMRvv3kX2gJC
 MV/6QtN8BVog/fBz2O58YzssshShbsUw4FjWH6bUpS8Ug4Guso9U7hWJA5Wt/wQ1ayUA
 2dtfWY9UaaWV5ldiKQ+y9Bt9jL65UzabXOYLf+iuI/2XT6gkb9Rb8JKeMkd8pvNFEkAQ
 /QgpRpRS7SAd6imUy6eTe1lylyxsxfKyOPJj7Vl1jhpMSEDZhp+8I3ub/BNhjkfMp2d3
 s1ruCQ7qRWQ16iZJey7+wxVyoEXlY3Y7nOX2Xe0mNAgWtwc1QrqydS3nT9/bveyCo4J+
 jucg==
X-Gm-Message-State: AOAM530Hrv/CDtYEBXbC4thYWNi9yL3sCTBCJ8I7iEuF5SM8gLFalTIV
 6RQNEgttxPqKlapM2JI8dGM=
X-Google-Smtp-Source: ABdhPJzr7rV1WxuGfQsAAMTxvrpxBiK2iGKw9fNVIxaPf5ltC0YAv1xHpdNmfeDF0H3+GFvdWOj6qA==
X-Received: by 2002:a9d:57ca:: with SMTP id q10mr3361525oti.180.1642782050558; 
 Fri, 21 Jan 2022 08:20:50 -0800 (PST)
Received: from [192.168.10.222] ([191.8.61.226])
 by smtp.gmail.com with ESMTPSA id g4sm1137726otl.1.2022.01.21.08.20.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 08:20:50 -0800 (PST)
Message-ID: <fcced002-83fc-14e8-8b81-4296dfc855b8@gmail.com>
Date: Fri, 21 Jan 2022 13:20:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] ppc/pnv: Fail DMA access if page permissions are not
 correct
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20220121152350.381685-1-fbarrat@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220121152350.381685-1-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::335
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: aik@ozlabs.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/21/22 12:23, Frederic Barrat wrote:
> If an iommu page has wrong permissions, an error message is displayed,
> but the access is allowed, which is odd. This patch fixes it.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/pci-host/pnv_phb3.c | 11 ++++++-----
>   hw/pci-host/pnv_phb4.c | 11 ++++++-----
>   2 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index 7fb35dc031..a757f1a58e 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -816,18 +816,19 @@ static void pnv_phb3_translate_tve(PnvPhb3DMASpace *ds, hwaddr addr,
>           }
>   
>           /* We exit the loop with TCE being the final TCE */
> -        tce_mask = ~((1ull << tce_shift) - 1);
> -        tlb->iova = addr & tce_mask;
> -        tlb->translated_addr = tce & tce_mask;
> -        tlb->addr_mask = ~tce_mask;
> -        tlb->perm = tce & 3;
>           if ((is_write & !(tce & 2)) || ((!is_write) && !(tce & 1))) {
>               phb3_error(phb, "TCE access fault at 0x%"PRIx64, taddr);
>               phb3_error(phb, " xlate %"PRIx64":%c TVE=%"PRIx64, addr,
>                          is_write ? 'W' : 'R', tve);
>               phb3_error(phb, " tta=%"PRIx64" lev=%d tts=%d tps=%d",
>                          tta, lev, tts, tps);
> +            return;
>           }
> +        tce_mask = ~((1ull << tce_shift) - 1);
> +        tlb->iova = addr & tce_mask;
> +        tlb->translated_addr = tce & tce_mask;
> +        tlb->addr_mask = ~tce_mask;
> +        tlb->perm = tce & 3;
>       }
>   }
>   
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index a78add75b0..ee56377c02 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1291,18 +1291,19 @@ static void pnv_phb4_translate_tve(PnvPhb4DMASpace *ds, hwaddr addr,
>           }
>   
>           /* We exit the loop with TCE being the final TCE */
> -        tce_mask = ~((1ull << tce_shift) - 1);
> -        tlb->iova = addr & tce_mask;
> -        tlb->translated_addr = tce & tce_mask;
> -        tlb->addr_mask = ~tce_mask;
> -        tlb->perm = tce & 3;
>           if ((is_write & !(tce & 2)) || ((!is_write) && !(tce & 1))) {
>               phb_error(ds->phb, "TCE access fault at 0x%"PRIx64, taddr);
>               phb_error(ds->phb, " xlate %"PRIx64":%c TVE=%"PRIx64, addr,
>                          is_write ? 'W' : 'R', tve);
>               phb_error(ds->phb, " tta=%"PRIx64" lev=%d tts=%d tps=%d",
>                          tta, lev, tts, tps);
> +            return;
>           }
> +        tce_mask = ~((1ull << tce_shift) - 1);
> +        tlb->iova = addr & tce_mask;
> +        tlb->translated_addr = tce & tce_mask;
> +        tlb->addr_mask = ~tce_mask;
> +        tlb->perm = tce & 3;
>       }
>   }
>   


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C884632FF5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 23:44:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxFWS-0005xc-1x; Mon, 21 Nov 2022 17:44:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oxFWP-0005sd-Hl; Mon, 21 Nov 2022 17:44:13 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oxFWK-0004Xx-D1; Mon, 21 Nov 2022 17:44:09 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-14279410bf4so13574958fac.8; 
 Mon, 21 Nov 2022 14:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KCi5TDmYQGnEKbAtZPaL/0BEzdgDAkNQrj9twbbXQjQ=;
 b=Ui4xQRXvMZNRNPfdZQYIhPUYXyOdjLLDvukqUeDRIm3OusXYwIyMZzfyoayzV5oEWA
 YNyKAe57N4x3KpPKlkfy29z7RftrCre0V3dIo3uB6+ZqivybiOPFN/WJXlHdj5qTvLw2
 CPA0clnk1OpwdHIxe7SK0q5EqHwtMMTkwtXKIijUXaVU2jKsslsXNzRyn2URgT8gelI7
 ZKY1hEctA/Iwdp6A9LwT017cgaRmBZXzXRagH4Qvsed67rLOsoTPDeRzD+n22wX1SXnd
 BFeihvMq2+O8GGIlMMEJOkfDihh+03/q25x2JLVo81+z+mU8ndOIvi/lAxTR/Z6X0EXJ
 C/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KCi5TDmYQGnEKbAtZPaL/0BEzdgDAkNQrj9twbbXQjQ=;
 b=lW3E4rHcShmwkDij0EdTzeTy0w5Vi4aupP0EVJEJKE1s6KVEi0TcaFkR0iG9xoB0AO
 7ffwOE91KzPBvbK46YqyJtI82UmZX7PcG+zAiugKMJS1KtKZaEqqZZ/rp1kEX6kdQgfH
 t3C8LI3oVpiocXmUKNo1htTewQjDYpogCZLWwKMAyRAaNBY0EyYS7Y/FORH12OnTQBEH
 BPl95zL6Vs3hvxAYACGRG2DPA6t2lWwM9sPV9FDJlhy1eSMLuNkjc4E8I9B/Zsk8eXJU
 DUgNkXz8wNX1dGKkNZRcp79sEBWtjbwwOmsL4zPyB1LT3CMrBFXq5pNCZ27G2XPgGafm
 LjCg==
X-Gm-Message-State: ANoB5plFDnDaolfnrFpruSLwRkyQPZtVPBEe5uu+b6PUAmQbzHThZvQc
 d+WzU9YQpdBzVD9rZrGREfMe/9X5x1c=
X-Google-Smtp-Source: AA0mqf7bBrqibEXKCGBdsYGPhUvG0uvinDEm0pSm2CnGo1tofLCi3k5HAV9utTd2HnVPtISRD3kAlg==
X-Received: by 2002:a05:6870:3c87:b0:13b:8822:bfbb with SMTP id
 gl7-20020a0568703c8700b0013b8822bfbbmr1610901oab.259.1669070646153; 
 Mon, 21 Nov 2022 14:44:06 -0800 (PST)
Received: from [192.168.10.102] ([191.19.173.155])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a4ad80b000000b0049be423151asm4628976oov.34.2022.11.21.14.44.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 14:44:05 -0800 (PST)
Message-ID: <5d1271b4-23d7-bcbe-e52a-3ece5b809609@gmail.com>
Date: Mon, 21 Nov 2022 19:44:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0] MAINTAINERS: downgrade PPC KVM/TCG CPUs and
 pSeries to 'Odd Fixes'
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20221117153218.182835-1-danielhb413@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221117153218.182835-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Thanks everyone! Queued for 8.0.


Daniel

On 11/17/22 12:32, Daniel Henrique Barboza wrote:
> The maintainer is no longer being paid to maintain these components. All
> maintainership work is being done in his personal time since the middle
> of the 7.2 development cycle.
> 
> Change the status of PPC KVM CPUs, PPC TCG CPUs and the pSeries machine
> to 'Odd Fixes', reflecting that the maintainer no longer has exclusive
> time to dedicate to them. It'll also (hopefully) keep expectations under
> check when/if these components are used in a customer product.
> 
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   MAINTAINERS | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index be151f0024..1d43153e5f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -264,7 +264,7 @@ R: Cédric Le Goater <clg@kaod.org>
>   R: David Gibson <david@gibson.dropbear.id.au>
>   R: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
> -S: Maintained
> +S: Odd Fixes
>   F: target/ppc/
>   F: hw/ppc/ppc.c
>   F: hw/ppc/ppc_booke.c
> @@ -389,7 +389,7 @@ M: Daniel Henrique Barboza <danielhb413@gmail.com>
>   R: Cédric Le Goater <clg@kaod.org>
>   R: David Gibson <david@gibson.dropbear.id.au>
>   R: Greg Kurz <groug@kaod.org>
> -S: Maintained
> +S: Odd Fixes
>   F: target/ppc/kvm.c
>   
>   S390 KVM CPUs
> @@ -1367,7 +1367,7 @@ R: Cédric Le Goater <clg@kaod.org>
>   R: David Gibson <david@gibson.dropbear.id.au>
>   R: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
> -S: Maintained
> +S: Odd Fixes
>   F: hw/*/spapr*
>   F: include/hw/*/spapr*
>   F: hw/*/xics*


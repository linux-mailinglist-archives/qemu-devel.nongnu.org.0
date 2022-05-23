Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1515315B8
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 21:26:33 +0200 (CEST)
Received: from localhost ([::1]:36680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntDhI-0007yz-Fl
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 15:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ntDed-0005ku-QW; Mon, 23 May 2022 15:23:47 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:35468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ntDec-000054-3D; Mon, 23 May 2022 15:23:47 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 l10-20020a9d7a8a000000b0060b151de434so2549339otn.2; 
 Mon, 23 May 2022 12:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=eBaBakdI/b+1cFABN8Z01G1AZs3ALlt+tA1oUCC/hA8=;
 b=W18TjzqxRRBLc1qcxFBWU/qsoiT6C3CwSY9rU6DLkeyGSIKkFMc4JJ5GtWNdi7EISJ
 pC557pmGFo3DGvxPgzdAeAAC48lwt6xwriE06N2vXo4xGYscEnQESrEdX5O6/xlOcUXR
 DUOkVVERWpTV2TXueiNpAUCLvDLYd3sCtiuDYlzOa5zReSTu+o1YlXtm9KU8nUbvsDJG
 OR6veyKN9lpjEWigxi/l/bUcxNaDyW6kAhJAbF872QlWZT2yLlifaem7yqqgYfHpmPrA
 kZfjKmOxX8HaH6SLbdsbscuSCK2CdrRN8/S9IgfbSGUEu7FPDp1QX1bjHQ8GOyKRhBa6
 cRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eBaBakdI/b+1cFABN8Z01G1AZs3ALlt+tA1oUCC/hA8=;
 b=GnpeUwBhHOCixLd3DGSSV3//MGxfGCbcN5pqB6FBxmCz1d/bGoI94jND5FP1m0/0Hb
 eKt3X/cK/EUpRHbsx4BfvZutlj9dwUfbeWFJWYkIgKKCki6Mgo/2/Djqxc0zyPnIKqWq
 MvoDh8HIJ9cSESpNAvhukTx1x6DayHtGCj04U9KVkYN58ebXNffPA+TiXGZamxTvIyF5
 Oci5SlOloDL78slKpvNzhoAvfFmFnVhf4fAzYAU/lw0bNqOQID1D6qy/Dw47i4OCQNJT
 /Z7VquuEX95HC+KxOpu0WmV8eQ41y7pP4abxRlwHL/UNyzKT6DDzgtYqMt81jyEfnVr0
 StlA==
X-Gm-Message-State: AOAM5330nM2hhmiBLlkMxAYGvAKJRwlZnY+TSPNGvMbLnL/suIBC5f0p
 eYz83OYvBjANQKpzph358X8=
X-Google-Smtp-Source: ABdhPJyQ7JdCG/duEjDAfS7YgNvD6c3fxHotyS7fvSa49UBeVcEUEDrd7YpaP3K+/zk62ruNnPhqpw==
X-Received: by 2002:a05:6830:3108:b0:606:581b:b7bb with SMTP id
 b8-20020a056830310800b00606581bb7bbmr9121629ots.270.1653333824491; 
 Mon, 23 May 2022 12:23:44 -0700 (PDT)
Received: from [192.168.10.102] (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 n11-20020a9d4d0b000000b0060b1fefeb52sm267666otf.66.2022.05.23.12.23.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 12:23:44 -0700 (PDT)
Message-ID: <db528d8d-4e47-3159-fa75-8efcea83ec5d@gmail.com>
Date: Mon, 23 May 2022 16:23:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] pnv/xive2: Don't overwrite PC registers when writing
 TCTXT registers
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20220523151859.72283-1-fbarrat@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220523151859.72283-1-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x336.google.com
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

On 5/23/22 12:18, Frederic Barrat wrote:
> When writing a register from the TCTXT memory region (4th page within
> the IC BAR), we were overwriting the Presentation Controller (PC)
> register at the same offset. It looks like a silly cut and paste
> error.
> 
> We were somehow lucky: the TCTXT registers being touched are
> TCTXT_ENx/_SET/_RESET to enable physical threads and the PC registers
> at the same offset are either not used by our model or the update was
> harmless.
> 
> Found through code inspection.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>   hw/intc/pnv_xive2.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
> index 87303b4064..a39e070e82 100644
> --- a/hw/intc/pnv_xive2.c
> +++ b/hw/intc/pnv_xive2.c
> @@ -1295,7 +1295,6 @@ static void pnv_xive2_ic_tctxt_write(void *opaque, hwaddr offset,
>                                        uint64_t val, unsigned size)
>   {
>       PnvXive2 *xive = PNV_XIVE2(opaque);
> -    uint32_t reg = offset >> 3;
>   
>       switch (offset) {
>       /*
> @@ -1322,8 +1321,6 @@ static void pnv_xive2_ic_tctxt_write(void *opaque, hwaddr offset,
>           xive2_error(xive, "TCTXT: invalid write @%"HWADDR_PRIx, offset);
>           return;
>       }
> -
> -    xive->pc_regs[reg] = val;
>   }
>   
>   static const MemoryRegionOps pnv_xive2_ic_tctxt_ops = {


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A5653ED4C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 19:54:37 +0200 (CEST)
Received: from localhost ([::1]:48948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyGw0-0002HL-Jb
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 13:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nyGtK-0007fV-Qs; Mon, 06 Jun 2022 13:51:51 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:45029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nyGtI-0007pr-Pn; Mon, 06 Jun 2022 13:51:50 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-f2cbceefb8so20012687fac.11; 
 Mon, 06 Jun 2022 10:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=kuEQwMeJGfo076ZIv74azWQc0dWd1lfjYK85vv6c43c=;
 b=Pn9MNAIzIghphByg7Fxzf8kC9LELfP61MBjX7mgawqGC8QyZQl+fcZOBqmXqyLzcCI
 RxzG+J2WWJSKnzt8ub8GjX3uFwi8oqtsAW/c4TbK0WXFwRxfmfEn6wQ4ZI2/EdMLMWIX
 VDAgDXm3FC242JxygYqF4jYZuLYa6+oewdUKLpH6iNYQaW1jp9T7Ql7RWZloeR9zlTfy
 4y1ITyuIvXWN2Ra1MzHBssJtBFrkX+sePEg5ASL/DHWwyNd7y9CpPSVF3OwMKSKiapJy
 ykGFMCUSX3ouwwzj3zqFsIawiXehjiTGdSxFGfGF8GGt1hPv+D+zSl/OyCsnhBW/4cRG
 tKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kuEQwMeJGfo076ZIv74azWQc0dWd1lfjYK85vv6c43c=;
 b=Tmw58Xm5vUeruvtfShGV8ZfGyYnQfttRzTVwhwQDiHaovKr4UjS1KulIf7YUcTVDA+
 3UKI5elXdoxFH2Tiu6nLETu9QX8f+G4HIWjlqMAqLDKEiSn5a81fpCsVvjEtoCT03wvn
 ZnXjDGz6NYa++aQ1kGEAgaJa3dwA4VNzozWouE63OMwaiSZTyZzqr2NHz7C2ZkMTY5Mc
 iCaFfhPZHhBL+fAe06/1iRd6Rwp4f8KBfSa4zUwkzztbXZiDAi9BgxjgD61f+Q2zGhNE
 Dfv150Xw1iJxJtdkKKWy9eIykHkjhbclny9yFvx/EUujM0IZLgu4j+y6jLap5yZBZ1aa
 9ylg==
X-Gm-Message-State: AOAM530IcioDmmwe4vQ7+xL36w2+xe2OjAXr8gbIo7EiKWnzps8RX/4j
 ePwnKpNJLuhX9cOcuH6QAAQ=
X-Google-Smtp-Source: ABdhPJy4/5Uff8dCLEybGeulasz+gzP3azboV5XTFKYcKTUts89yJ4LWMGUIsrUyma5F0mEboBmIYw==
X-Received: by 2002:a05:6870:f224:b0:e5:c30a:fa4f with SMTP id
 t36-20020a056870f22400b000e5c30afa4fmr14340432oao.252.1654537907357; 
 Mon, 06 Jun 2022 10:51:47 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.74])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a056870530900b000f33b23a030sm6886031oan.57.2022.06.06.10.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 10:51:47 -0700 (PDT)
Message-ID: <cce95347-746d-7e4f-7d0b-4856f77c9f65@gmail.com>
Date: Mon, 6 Jun 2022 14:51:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] pnv/xive2: Access direct mapped thread contexts from all
 chips
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20220602165310.558810-1-fbarrat@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220602165310.558810-1-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
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

On 6/2/22 13:53, Frederic Barrat wrote:
> When accessing a thread context through the IC BAR, the offset of the
> page in the BAR identifies the CPU. From that offset, we can compute
> the PIR (processor ID register) of the CPU to do the data structure
> lookup. On P10, the current code assumes an access for node 0 when
> computing the PIR. Everything is almost in place to allow access for
> other nodes though. So this patch reworks how the PIR value is
> computed so that we can access all thread contexts through the IC BAR.
> 
> The PIR is already correct on P9, so no need to modify anything there.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>   hw/intc/pnv_xive2.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
> index a39e070e82..f31c53c28d 100644
> --- a/hw/intc/pnv_xive2.c
> +++ b/hw/intc/pnv_xive2.c
> @@ -1574,6 +1574,12 @@ static const MemoryRegionOps pnv_xive2_ic_sync_ops = {
>    * When the TM direct pages of the IC controller are accessed, the
>    * target HW thread is deduced from the page offset.
>    */
> +static uint32_t pnv_xive2_ic_tm_get_pir(PnvXive2 *xive, hwaddr offset)
> +{
> +    /* On P10, the node ID shift in the PIR register is 8 bits */
> +    return xive->chip->chip_id << 8 | offset >> xive->ic_shift;
> +}
> +
>   static XiveTCTX *pnv_xive2_get_indirect_tctx(PnvXive2 *xive, uint32_t pir)
>   {
>       PnvChip *chip = xive->chip;
> @@ -1596,10 +1602,12 @@ static uint64_t pnv_xive2_ic_tm_indirect_read(void *opaque, hwaddr offset,
>                                                 unsigned size)
>   {
>       PnvXive2 *xive = PNV_XIVE2(opaque);
> -    uint32_t pir = offset >> xive->ic_shift;
> -    XiveTCTX *tctx = pnv_xive2_get_indirect_tctx(xive, pir);
> +    uint32_t pir;
> +    XiveTCTX *tctx;
>       uint64_t val = -1;
>   
> +    pir = pnv_xive2_ic_tm_get_pir(xive, offset);
> +    tctx = pnv_xive2_get_indirect_tctx(xive, pir);
>       if (tctx) {
>           val = xive_tctx_tm_read(NULL, tctx, offset, size);
>       }
> @@ -1611,9 +1619,11 @@ static void pnv_xive2_ic_tm_indirect_write(void *opaque, hwaddr offset,
>                                              uint64_t val, unsigned size)
>   {
>       PnvXive2 *xive = PNV_XIVE2(opaque);
> -    uint32_t pir = offset >> xive->ic_shift;
> -    XiveTCTX *tctx = pnv_xive2_get_indirect_tctx(xive, pir);
> +    uint32_t pir;
> +    XiveTCTX *tctx;
>   
> +    pir = pnv_xive2_ic_tm_get_pir(xive, offset);
> +    tctx = pnv_xive2_get_indirect_tctx(xive, pir);
>       if (tctx) {
>           xive_tctx_tm_write(NULL, tctx, offset, val, size);
>       }


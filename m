Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73112538E91
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 12:13:15 +0200 (CEST)
Received: from localhost ([::1]:53580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvysD-0001aQ-Vi
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 06:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvynv-0000r9-Sg; Tue, 31 May 2022 06:08:47 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvynu-0007Oh-75; Tue, 31 May 2022 06:08:47 -0400
Received: by mail-pf1-x429.google.com with SMTP id w21so1591130pfc.0;
 Tue, 31 May 2022 03:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RDoQHQUD8fUCmuzGrTnGGSgdpyg3INQcD/63fISsDxM=;
 b=qyf/Q8l1w4qRAwTKAJdmlr5cdGFBUb+bip8d92lK6dBx5QqJ9csnCQzRaVq8GTZpjO
 eT1pgGss5HAttHV6LwDtBtdi5erP5/pHYYe1K0tx+hMDQXwi4UdCtzCrVUAaAOmXGQEV
 p1IKKMKtxpH1ldMfB65hPDV92ChTm7YEKPmA7wikSL1djotJLr3sgdi3LWdK1ZdfYUKa
 SzjDQGTRGX9eHqR015YBsa5jswCAFuRtIqWG0v+tGtMlCh8IJYhtpxIwtE9U/9THB6YV
 NOoxBsSsaf4XERA82Gs9U6Y3YWI8L3DcmPrO62A2XiMz/lpnNeyR+d/fjKD/I6jsBjAG
 neOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RDoQHQUD8fUCmuzGrTnGGSgdpyg3INQcD/63fISsDxM=;
 b=xufg4UljxuQl9xx8KKgZ9ZCXrM3GjTFRXoYOEmyi4zZ+bmYEYs1vNDLrXIkuDk/uTE
 09SljeWjbtQRlbNvZdGDyZwWyb+U3IfPxwnJA7aJxBDfZrG78Ab7+yFPvG7IZQzWDWpD
 TMcSP6hKCRkXvkhD8AT/VRbcdFDDuKVzJ5Y06CS4cEQ/6DBR3xA1/7e1bLHp4vKPGXvB
 bDS3IoX7BQyt+/nYTGSItp3puigltzkd6NSUxQCZUdCw2+jUmts3ii0rDwNUO3hgmsgA
 /XhTampHe3FP4xvaUt3FWmFvcKts5mMLosKtE6qp7XKfaQV2um7Ueax6zFSZmviXCp5O
 S6ow==
X-Gm-Message-State: AOAM532Nl7rfJzREfxMOiBuqAorc88w9lPBxlxtq9pSZgwB+V6oZ8ugO
 POOah7Sx24dAtD0Q0g+eAas=
X-Google-Smtp-Source: ABdhPJwTndvpL8fafAJ+FLs8SRZsecQirP7phZH+hewZz4O52lKasg9l09ra76zm7gPg7zW2Ugh4ZQ==
X-Received: by 2002:a63:ec17:0:b0:3fa:74c5:32ef with SMTP id
 j23-20020a63ec17000000b003fa74c532efmr33988560pgh.505.1653991724352; 
 Tue, 31 May 2022 03:08:44 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a17090a3b4800b001e34b5ed5a7sm266555pjf.35.2022.05.31.03.08.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 03:08:43 -0700 (PDT)
Message-ID: <f15d8c9a-2a6f-1126-785f-0176eb78c3ec@amsat.org>
Date: Tue, 31 May 2022 12:08:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] hw/sd/sdhci: Block Size Register bits [14:12] is lost
Content-Language: en-US
To: Lu Gao <lu.gao@verisilicon.com>, qemu-devel@nongnu.org
Cc: Jianxian Wen <jianxian.wen@verisilicon.com>,
 Bin Meng <bin.meng@windriver.com>,
 "open list:SD (Secure Card)" <qemu-block@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Prasad J Pandit <pjp@fedoraproject.org>
References: <20220321055618.4026-1-lu.gao@verisilicon.com>
In-Reply-To: <20220321055618.4026-1-lu.gao@verisilicon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 21/3/22 06:56, Lu Gao wrote:
> Block Size Register bits [14:12] is SDMA Buffer Boundary, it is missed
> in register write, but it is needed in SDMA transfer. e.g. it will be
> used in sdhci_sdma_transfer_multi_blocks to calculate boundary_ variables.
> 
> Missing this field will cause wrong operation for different SDMA Buffer
> Boundary settings.

Fixes: d7dfca0807 ("hw/sdhci: introduce standard SD host controller")
Fixes: dfba99f17f ("hw/sdhci: Fix DMA Transfer Block Size field")

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Lu Gao <lu.gao@verisilicon.com>
> Signed-off-by: Jianxian Wen <jianxian.wen@verisilicon.com>
> ---
>   hw/sd/sdhci.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index e0bbc90344..350ceb487d 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -321,6 +321,8 @@ static void sdhci_poweron_reset(DeviceState *dev)
>   
>   static void sdhci_data_transfer(void *opaque);
>   
> +#define BLOCK_SIZE_MASK (4 * KiB - 1)
> +
>   static void sdhci_send_command(SDHCIState *s)
>   {
>       SDRequest request;
> @@ -371,7 +373,8 @@ static void sdhci_send_command(SDHCIState *s)
>   
>       sdhci_update_irq(s);
>   
> -    if (!timeout && s->blksize && (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {
> +    if (!timeout && (s->blksize & BLOCK_SIZE_MASK) &&
> +        (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {
>           s->data_count = 0;
>           sdhci_data_transfer(s);
>       }
> @@ -406,7 +409,6 @@ static void sdhci_end_transfer(SDHCIState *s)
>   /*
>    * Programmed i/o data transfer
>    */
> -#define BLOCK_SIZE_MASK (4 * KiB - 1)
>   
>   /* Fill host controller's read buffer with BLKSIZE bytes of data from card */
>   static void sdhci_read_block_from_card(SDHCIState *s)
> @@ -1137,7 +1139,8 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
>               s->sdmasysad = (s->sdmasysad & mask) | value;
>               MASKED_WRITE(s->sdmasysad, mask, value);
>               /* Writing to last byte of sdmasysad might trigger transfer */
> -            if (!(mask & 0xFF000000) && s->blkcnt && s->blksize &&
> +            if (!(mask & 0xFF000000) && s->blkcnt &&
> +                (s->blksize & BLOCK_SIZE_MASK) &&
>                   SDHC_DMA_TYPE(s->hostctl1) == SDHC_CTRL_SDMA) {
>                   if (s->trnmod & SDHC_TRNS_MULTI) {
>                       sdhci_sdma_transfer_multi_blocks(s);
> @@ -1151,7 +1154,11 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
>           if (!TRANSFERRING_DATA(s->prnsts)) {
>               uint16_t blksize = s->blksize;
>   
> -            MASKED_WRITE(s->blksize, mask, extract32(value, 0, 12));
> +            /*
> +             * [14:12] SDMA Buffer Boundary
> +             * [11:00] Transfer Block Size
> +             */
> +            MASKED_WRITE(s->blksize, mask, extract32(value, 0, 15));
>               MASKED_WRITE(s->blkcnt, mask >> 16, value >> 16);
>   
>               /* Limit block size to the maximum buffer size */



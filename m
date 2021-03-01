Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCE032939C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 22:30:52 +0100 (CET)
Received: from localhost ([::1]:37862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGq7v-0005XJ-6b
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 16:30:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGq6F-000567-BV
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 16:29:07 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:60413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGq6D-00038E-0U
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 16:29:07 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N2Dks-1lwB9T3nsk-013aVx; Mon, 01 Mar 2021 22:28:58 +0100
Subject: Re: [PATCH v2 10/42] esp: introduce esp_get_stc()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-11-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <be8fd517-b941-8927-5923-319cae2391fb@vivier.eu>
Date: Mon, 1 Mar 2021 22:28:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-11-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GmSXmSZRxjOXSZzTvnW0GKaGIVNuPMMSr7BVs/sknMSjtxQBkL+
 sp+g1Hi0MdSmPZwj7/2d8labPtTW3qvXyzZUDnWm7uXVfGUTed/yRmrdNsYPT4JaosZIrzu
 kyAHoLQ6ffJol4dVLoaZD8USPo7tipyGA2jLn6QomwLVycQ7147awn0DxzliRu8jZDrVNfo
 bIObPAxK5ePxoo/yxc0Kw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FK1z1ZgF4PM=:lijMxhW6ZPQxBVteJZxZSL
 Vm+DmkSpHUjZm2KxZdWcrPW33qh96ivPQUU6scn5hUIVcoEtSxsDvFkczuclMMe7JY43i6Ry3
 P470b9GINhin+PnMkuCGGAvAfhnKkmkjIUMH+/fuc5sYKdE5WCiDsHj6N7DJBLe76cTY7sjxk
 lPhjGLL/ADAH4AXemVgzXdAuO5jqdI0KSa924bGPRRaFCnjEuv21277r6SK5caVtvFjs8/MUb
 ArZly4NwY30JyG0hz2oddXrCBtWufkd4b6aeCfyh5YSG8m24ZGns6fIHC37S0nkV8CJEJP3Nl
 xBoe5D5cdOEMB7lFEArHpvHb8fWUcwLYWk73ac6qKwuek6WbGH2OgNr1E7BNRibQHVKDjzgEa
 J2qddmBHPIqwiez8ixyNjhEMaudk3sjlUyHT6Lx4lennk0AmMBbGu0wI3Cali
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Le 09/02/2021 à 20:29, Mark Cave-Ayland a écrit :
> This simplifies reading the STC register value without having to manually shift
> each individual 8-bit value.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 3a39450930..a1acc2c9bd 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -116,6 +116,17 @@ static void esp_set_tc(ESPState *s, uint32_t dmalen)
>      s->rregs[ESP_TCHI] = dmalen >> 16;
>  }
>  
> +static uint32_t esp_get_stc(ESPState *s)
> +{
> +    uint32_t dmalen;
> +
> +    dmalen = s->wregs[ESP_TCLO];
> +    dmalen |= s->wregs[ESP_TCMID] << 8;
> +    dmalen |= s->wregs[ESP_TCHI] << 16;
> +
> +    return dmalen;
> +}
> +
>  static void set_pdma(ESPState *s, enum pdma_origin_id origin,
>                       uint32_t index, uint32_t len)
>  {
> @@ -688,9 +699,7 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
>          if (val & CMD_DMA) {
>              s->dma = 1;
>              /* Reload DMA counter.  */
> -            s->rregs[ESP_TCLO] = s->wregs[ESP_TCLO];
> -            s->rregs[ESP_TCMID] = s->wregs[ESP_TCMID];
> -            s->rregs[ESP_TCHI] = s->wregs[ESP_TCHI];
> +            esp_set_tc(s, esp_get_stc(s));
>          } else {
>              s->dma = 0;
>          }
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


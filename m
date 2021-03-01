Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6E132937B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 22:25:18 +0100 (CET)
Received: from localhost ([::1]:33190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGq2X-0003DS-CP
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 16:25:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGq1m-0002jG-2H
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 16:24:30 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:41685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGq1k-000172-2s
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 16:24:29 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mzyi6-1m2jqu393G-00x2vP; Mon, 01 Mar 2021 22:24:18 +0100
Subject: Re: [PATCH v2 09/42] esp: introduce esp_get_tc() and esp_set_tc()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-10-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <464b5903-412a-50be-1811-f906d896779a@vivier.eu>
Date: Mon, 1 Mar 2021 22:24:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-10-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rLuMG0DlJiNpOC20xvR30kMIjG68PDl1cowFZVBrNDTHiw9JKRz
 1Rc6kihwg0HCY0l9oVme2xBnylfG+2X76lStc37mrI1kpzs9bRU3oqy8vM7UymvbevqLUNE
 lOyvWPNdUYeKY++GcUE6S8acfbaoOXuauA5VQJziG8uogCya0kJBokQ2UxpfHLCyoZHLhhX
 yQFznGUzdhcYD+3Ze/I4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZB6F1SuV+Ow=:Qg+VPfiCIsY9Uwfr+LmM+N
 PINjjTKJLpwbg1UB/3NLfLegbOnKt1gVSSQc7FrgJRY3a2nsKyy9NBX04rAWpv9Iq/UsSooU7
 Rj9FfpH9xZfFPA63MGmTc0UyExXT4DrZQVWChQ+BECARXqzwwZ8U2XeX4xfVG0l8+VNcSE1b1
 BHu523U1ip4Oh22LK2knLthRmkRIrR7yf8INT/UPF7kNTlvq2sc7EpS8o9k2rJBNTOLRRCusY
 rttltyS+kjAJVa1CC0daPRQ0sGvUH0IiWxUCLL7thEp0jGHi0doLjNm3edUV3RC1nuHGl6tR9
 7JJ5gEbf5iThqhRpPSF2G2Pgk2+r9ueJhy9gnYXDuWgbmlJ1d7c9Njm88uys/nJgUR3AN78+o
 2Rwvw4HflHrnPdmICAtJTE5LJNlTTP8XgfB1zynk53Ya3Y6DPXELNOX2aIlb17tZVCEc03wUA
 l0ufmWQ91Q==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
> This simplifies reading and writing the TC register value without having to
> manually shift each individual 8-bit value.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/scsi/esp.c | 38 +++++++++++++++++++++++---------------
>  1 file changed, 23 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index e82e75d490..3a39450930 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -98,6 +98,24 @@ void esp_request_cancelled(SCSIRequest *req)
>      }
>  }
>  
> +static uint32_t esp_get_tc(ESPState *s)
> +{
> +    uint32_t dmalen;
> +
> +    dmalen = s->rregs[ESP_TCLO];
> +    dmalen |= s->rregs[ESP_TCMID] << 8;
> +    dmalen |= s->rregs[ESP_TCHI] << 16;
> +
> +    return dmalen;
> +}
> +
> +static void esp_set_tc(ESPState *s, uint32_t dmalen)
> +{
> +    s->rregs[ESP_TCLO] = dmalen & 0xff;

The "& 0xff" is not needed as rregs is uint8_t.

> +    s->rregs[ESP_TCMID] = dmalen >> 8;
> +    s->rregs[ESP_TCHI] = dmalen >> 16;
> +}
> +
>  static void set_pdma(ESPState *s, enum pdma_origin_id origin,
>                       uint32_t index, uint32_t len)
>  {
> @@ -157,9 +175,7 @@ static uint32_t get_cmd(ESPState *s, uint8_t *buf, uint8_t buflen)
>  
>      target = s->wregs[ESP_WBUSID] & BUSID_DID;
>      if (s->dma) {
> -        dmalen = s->rregs[ESP_TCLO];
> -        dmalen |= s->rregs[ESP_TCMID] << 8;
> -        dmalen |= s->rregs[ESP_TCHI] << 16;
> +        dmalen = esp_get_tc(s);
>          if (dmalen > buflen) {
>              return 0;
>          }
> @@ -348,9 +364,7 @@ static void esp_dma_done(ESPState *s)
>      s->rregs[ESP_RINTR] = INTR_BS;
>      s->rregs[ESP_RSEQ] = 0;
>      s->rregs[ESP_RFLAGS] = 0;
> -    s->rregs[ESP_TCLO] = 0;
> -    s->rregs[ESP_TCMID] = 0;
> -    s->rregs[ESP_TCHI] = 0;
> +    esp_set_tc(s, 0);
>      esp_raise_irq(s);
>  }
>  
> @@ -536,9 +550,7 @@ static void handle_ti(ESPState *s)
>          return;
>      }
>  
> -    dmalen = s->rregs[ESP_TCLO];
> -    dmalen |= s->rregs[ESP_TCMID] << 8;
> -    dmalen |= s->rregs[ESP_TCHI] << 16;
> +    dmalen = esp_get_tc(s);
>      if (dmalen == 0) {
>          dmalen = 0x10000;
>      }
> @@ -889,9 +901,7 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
>  
>      trace_esp_pdma_write(size);
>  
> -    dmalen = s->rregs[ESP_TCLO];
> -    dmalen |= s->rregs[ESP_TCMID] << 8;
> -    dmalen |= s->rregs[ESP_TCHI] << 16;
> +    dmalen = esp_get_tc(s);
>      if (dmalen == 0 || s->pdma_len == 0) {
>          return;
>      }
> @@ -908,9 +918,7 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
>          dmalen -= 2;
>          break;
>      }
> -    s->rregs[ESP_TCLO] = dmalen & 0xff;
> -    s->rregs[ESP_TCMID] = dmalen >> 8;
> -    s->rregs[ESP_TCHI] = dmalen >> 16;
> +    esp_set_tc(s, dmalen);
>      if (s->pdma_len == 0 && s->pdma_cb) {
>          esp_lower_drq(s);
>          s->pdma_cb(s);
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


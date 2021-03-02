Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4857732AC66
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:54:48 +0100 (CET)
Received: from localhost ([::1]:44922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCyd-00082v-CV
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHCu0-00043I-3m
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:50:00 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:57337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHCty-0008K7-EI
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:49:59 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N9dkD-1ltrbe0KVZ-015cTA; Tue, 02 Mar 2021 22:49:51 +0100
Subject: Re: [PATCH v2 25/42] esp: remove CMD pdma_origin
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-26-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <53788221-594b-792b-7dfc-16c6e6aded61@vivier.eu>
Date: Tue, 2 Mar 2021 22:49:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-26-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iblyYPDHfbM8ZdAO53IaGDe2NVgNn759pyVhQz7lgRWekY7yKYA
 nh+5pPyc51o87up6uNAAt01OQh6cOzThlYHhT4AyRwYJjDyfhwWM1wmuVwIBIygr1CvWNS2
 O0ilg7DFvLR9bCY7WLBPE22H3KCIxFcNRaL3ZjMqBf/ewSE8GtC8Vt+dOrqlu+eKEESUQNr
 JRSZt2l89cyGNCgawaiFQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dATAAMUlJ2M=:LpmwKXBY8p8PWcKImoEUrG
 iS/6QJ2ikuraKfVmdVtluSuJJu0QntPoibSu5tVTfzaR47IcwSKqMZ++XWgRC6eTbRKUwY/z9
 0as7SeZ+0sEZGjlpZ5U6MRI6xAzCfvrf9/a/37ZWVJK21cu8uHYgkL6fBNVNY+0GTCZwAQewh
 N+3uPIjefyJgQr8ocde4HYcLBqb+4ejtDpCdS35mFIZorn1MoQpNCn/m8+OuNVxJTS7932syX
 RtKvZ/y2cfYGau8fyL8LULpu8OREaulS0koQZSoBxvhL/lliwqDSwv7DpTFG4c0+FvpkvaqD+
 ly9oGo5jjyvNJGHnbeYtSFoapAzg0Uqmb9B8zPoLlW8Y3YVR/T/rnA1kMnA2nwgZT+u9pQ4jq
 JnVJTYwNAl9f9Dg/z5jRas4ofkDMIByT1x9WGOC8IfRiV3t8juEiNb5ct1v9P
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

Le 09/02/2021 à 20:30, Mark Cave-Ayland a écrit :
> The cmdbuf is really just a copy of FIFO data (including extra message phase
> bytes) so its pdma_origin is effectively TI. Fortunately we already know when
> we are receiving a SCSI command since do_cmd == 1 which enables us to
> distinguish between the two cases in esp_pdma_read()/esp_pdma_write().
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c         | 22 ++++++++++++----------
>  include/hw/scsi/esp.h |  1 -
>  2 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index bff330733f..921f79ae89 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -143,10 +143,11 @@ static uint8_t esp_pdma_read(ESPState *s)
>  
>      switch (s->pdma_origin) {
>      case TI:
> -        val = s->ti_buf[s->ti_rptr++];
> -        break;
> -    case CMD:
> -        val = s->cmdbuf[s->cmdlen++];
> +        if (s->do_cmd) {
> +            val = s->cmdbuf[s->cmdlen++];
> +        } else {
> +            val = s->ti_buf[s->ti_rptr++];
> +        }
>          break;
>      case ASYNC:
>          val = s->async_buf[0];
> @@ -176,10 +177,11 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
>  
>      switch (s->pdma_origin) {
>      case TI:
> -        s->ti_buf[s->ti_wptr++] = val;
> -        break;
> -    case CMD:
> -        s->cmdbuf[s->cmdlen++] = val;
> +        if (s->do_cmd) {
> +            s->cmdbuf[s->cmdlen++] = val;
> +        } else {
> +            s->ti_buf[s->ti_wptr++] = val;
> +        }
>          break;
>      case ASYNC:
>          s->async_buf[0] = val;
> @@ -240,7 +242,7 @@ static uint32_t get_cmd(ESPState *s)
>          if (s->dma_memory_read) {
>              s->dma_memory_read(s->dma_opaque, buf, dmalen);
>          } else {
> -            set_pdma(s, CMD);
> +            set_pdma(s, TI);
>              esp_raise_drq(s);
>              return 0;
>          }
> @@ -471,7 +473,7 @@ static void esp_do_dma(ESPState *s)
>          if (s->dma_memory_read) {
>              s->dma_memory_read(s->dma_opaque, &s->cmdbuf[s->cmdlen], len);
>          } else {
> -            set_pdma(s, CMD);
> +            set_pdma(s, TI);
>              s->pdma_cb = do_dma_pdma_cb;
>              esp_raise_drq(s);
>              return;
> diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
> index 1e84b7bfb0..a8d5bf8a63 100644
> --- a/include/hw/scsi/esp.h
> +++ b/include/hw/scsi/esp.h
> @@ -17,7 +17,6 @@ typedef struct ESPState ESPState;
>  
>  enum pdma_origin_id {
>      TI,
> -    CMD,
>      ASYNC,
>  };
>  
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


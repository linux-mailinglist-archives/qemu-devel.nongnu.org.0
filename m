Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AEC32940F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 22:47:12 +0100 (CET)
Received: from localhost ([::1]:55638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGqNi-0005x2-S5
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 16:47:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGqLL-0004q9-Kk
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 16:44:43 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:41763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGqLH-0001ZF-TG
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 16:44:43 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M9npV-1lB5iX0OJR-005r4r; Mon, 01 Mar 2021 22:44:32 +0100
Subject: Re: [PATCH v2 12/42] esp: remove dma_counter from ESPState
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-13-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ceb2b81d-c370-ca18-c5bf-5055c7b5f9c4@vivier.eu>
Date: Mon, 1 Mar 2021 22:44:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-13-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LdsKMD2uN9zCibZV0MTTS9gMtUgYB3Ahd6XPbFlXTeVsZKVddip
 hGf/Nklv8ck2CLb9UBgT0BJDsk0chgHUy6pMyaIxJi8qSrZfHjoWCiNYqErNqpS7zvRvA3a
 nIUKUURDX4wTaCuEsXe2WmDUIjsjaTnmYICIL1leOPdm1gl53MJwXhlxuw0cCWd/MErjtAQ
 Jd2wKfBUEKAL5XWvFTtAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1Q63+IFDMmE=:kmKFFRxi0i+Fl5IVjnB8YM
 hSEp2tFmb8XjL+S1IhIgH/FL0V/Yd32bnZ98O+k0HymZCvwdX/bCBciYj2z7udGIsP8HFtET8
 p4GWoHX5DoAtoyPs+rUuIkLM7uCpIYhRcqJxcSR6KLVSOMME3XaamiPBX7rwRoTvKyrUPxMWV
 ZGerS3xQ47VhWV9UXsMMYtKLTe5j5uv4ZdAkN9YGlVhb4W1gbApK06RU1l1Nin0v4RZixBriI
 mMIWXukgSAhTZzH/1wFZEE0ee3dDY9hGdUBt+JDfQCclckiLeHKGPY0afHymqp05H4dNw8bzR
 GtFyqMNGEtnSriKJRSgNEXqujJoSbsqxMrHBXALYgtA1msnJp34TtSkiMXa70Ufl6MznYuaGL
 1ftR/rB/2c5x6f4zEbN2OI3RQY1de20Mewe2sTb2uJSDtzjyWBeK4qXVOGWY7T60u30C/dkgm
 kA3Ws6Fl+g==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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
> The value of dma_counter is set once at the start of the transfer and remains
> the same until the transfer is complete. This allows the check in esp_transfer_data
> to be simplified since dma_left will always be non-zero until the transfer is
> completed.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c         | 4 +---
>  include/hw/scsi/esp.h | 3 ---
>  2 files changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 02b7876394..6c495b29c0 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -229,7 +229,6 @@ static void do_busid_cmd(ESPState *s, uint8_t *buf, uint8_t busid)
>      if (datalen != 0) {
>          s->rregs[ESP_RSTAT] = STAT_TC;
>          s->dma_left = 0;
> -        s->dma_counter = 0;
>          if (datalen > 0) {
>              s->rregs[ESP_RSTAT] |= STAT_DI;
>          } else {
> @@ -543,7 +542,7 @@ void esp_transfer_data(SCSIRequest *req, uint32_t len)
>      s->async_buf = scsi_req_get_buf(req);
>      if (s->dma_left) {
>          esp_do_dma(s);
> -    } else if (s->dma_counter != 0 && s->ti_size <= 0) {
> +    } else if (s->ti_size <= 0) {
>          /*
>           * If this was the last part of a DMA transfer then the
>           * completion interrupt is deferred to here.
> @@ -562,7 +561,6 @@ static void handle_ti(ESPState *s)
>      }
>  
>      dmalen = esp_get_tc(s);
> -    s->dma_counter = dmalen;
>  
>      if (s->do_cmd) {
>          minlen = (dmalen < ESP_CMDBUF_SZ) ? dmalen : ESP_CMDBUF_SZ;
> diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
> index 7d92471c5b..b313ef27f2 100644
> --- a/include/hw/scsi/esp.h
> +++ b/include/hw/scsi/esp.h
> @@ -50,9 +50,6 @@ struct ESPState {
>  
>      /* The amount of data left in the current DMA transfer.  */
>      uint32_t dma_left;
> -    /* The size of the current DMA transfer.  Zero if no transfer is in
> -       progress.  */
> -    uint32_t dma_counter;
>      int dma_enabled;
>  
>      uint32_t async_len;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


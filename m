Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C39C32AC2E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:24:43 +0100 (CET)
Received: from localhost ([::1]:38998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCVW-00083U-Jy
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHCTo-0006ga-6t
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:22:56 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:44023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHCTm-0004SX-0r
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:22:56 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MzkK9-1m3ozW43aj-00vjkg; Tue, 02 Mar 2021 22:22:48 +0100
Subject: Re: [PATCH v2 21/42] esp: remove redundant pdma_start from ESPState
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-22-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <11f73b26-876f-ad8d-97d4-0db8cee44edd@vivier.eu>
Date: Tue, 2 Mar 2021 22:22:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-22-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ej0YzBIGftkpqHmWdU/qc6nh56cRD5QmVubMjdtX2p9v7EOHEMN
 TAmc06NCeU0pYExuqIeVatqUWo51W4423vAPgxNFMFz3Q7Lb8dE1qOlFKxeVe5kiSbRWjEI
 pZ2RYtKFNVgZTyecdySL5G2G2TIVeax9rz/4QAmdMpKTqx50ERxIabeMt0yO2TgLMINgG6O
 8lwI+ixxLTx2qlYsV/JOw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ImE/BP4gifo=:pW7sESvJ3jLC94b5FcDVc6
 a3QcRJeKXvycQbIe0Fx/5MBMJWS3PRhGPdXh6nFzIo8aG4d0wMrzsx8XstZ9//F35dgnoe9oA
 jFe6LG0cbfnj9JMqzLMo6XxkuuXXhuU2+jycZQ1OuM6W1ep0L+3sXn+ektVOH0tNngXR7SoXv
 pTCOaRMoNTT0gXUmv2ukY+twbW/0C3uUgE97BNLgmmaLo7xRqXJv/DOSJgHDoB5NulfiipOnB
 +rER3Vtr0b77przLbvq1C9+AyBUOZAKR5uhB1q75gqLA3REy6J68925JFxCJEJkWm0E7NWLOu
 dtvjb+B21n65j+E7DDp5k9CrWI+k7Q/FMlPORsJURBW5C7StRjZWabJRMqtwqw6+ARGbjEJXT
 ztugaa2KeIvCrEt3TbPdWlu+i/2OFg0Q5GtkMzYGlOKHVmFz9t9ndLiRXbkv4j//S61gfkZJr
 EKKsgQ7Z8g==
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
> Now that PDMA SCSI commands are accumulated in cmdbuf in the same way as normal
> commands, the existing logic for locating the start of the SCSI command in
> cmdbuf via cmdlen can be used. This enables the PDMA-specific pdma_start and
> also get_pdma_buf() to be removed.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c         | 19 ++-----------------
>  include/hw/scsi/esp.h |  1 -
>  2 files changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 7055520a26..91f65a5d9b 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -131,24 +131,10 @@ static void set_pdma(ESPState *s, enum pdma_origin_id origin,
>                       uint32_t index, uint32_t len)
>  {
>      s->pdma_origin = origin;
> -    s->pdma_start = index;
>      s->pdma_cur = index;
>      s->pdma_len = len;
>  }
>  
> -static uint8_t *get_pdma_buf(ESPState *s)
> -{
> -    switch (s->pdma_origin) {
> -    case TI:
> -        return s->ti_buf;
> -    case CMD:
> -        return s->cmdbuf;
> -    case ASYNC:
> -        return s->async_buf;
> -    }
> -    return NULL;
> -}
> -
>  static uint8_t esp_pdma_read(ESPState *s)
>  {
>      uint32_t dmalen = esp_get_tc(s);
> @@ -339,7 +325,7 @@ static void s_without_satn_pdma_cb(ESPState *s)
>      }
>      s->do_cmd = 0;
>      if (s->cmdlen) {
> -        do_busid_cmd(s, get_pdma_buf(s) + s->pdma_start, 0);
> +        do_busid_cmd(s, s->cmdbuf, 0);
>      }
>  }
>  
> @@ -441,7 +427,7 @@ static void esp_dma_done(ESPState *s)
>  static void do_dma_pdma_cb(ESPState *s)
>  {
>      int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
> -    int len = s->pdma_cur - s->pdma_start;
> +    int len = s->pdma_cur;
>  
>      if (s->do_cmd) {
>          s->ti_size = 0;
> @@ -868,7 +854,6 @@ static const VMStateDescription vmstate_esp_pdma = {
>      .fields = (VMStateField[]) {
>          VMSTATE_INT32(pdma_origin, ESPState),
>          VMSTATE_UINT32(pdma_len, ESPState),
> -        VMSTATE_UINT32(pdma_start, ESPState),
>          VMSTATE_UINT32(pdma_cur, ESPState),
>          VMSTATE_END_OF_LIST()
>      }
> diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
> index c323d43f70..578d936214 100644
> --- a/include/hw/scsi/esp.h
> +++ b/include/hw/scsi/esp.h
> @@ -58,7 +58,6 @@ struct ESPState {
>      void (*dma_cb)(ESPState *s);
>      int pdma_origin;
>      uint32_t pdma_len;
> -    uint32_t pdma_start;
>      uint32_t pdma_cur;
>      void (*pdma_cb)(ESPState *s);
>  
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


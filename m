Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF9C328EF9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 20:45:01 +0100 (CET)
Received: from localhost ([::1]:56424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGoTU-0000V8-7P
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 14:45:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGoSH-0008U3-N2
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 14:43:46 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:33825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGoSE-00064E-IF
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 14:43:45 -0500
Received: from [192.168.100.1] ([82.252.152.102]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mbzdn-1ln8Gd24lj-00dYwx; Mon, 01 Mar 2021 20:43:28 +0100
Subject: Re: [PATCH v2 01/42] esp: checkpatch fixes
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-2-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0047ba86-74de-20aa-7abb-47a277568f0a@vivier.eu>
Date: Mon, 1 Mar 2021 20:43:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:obAc3R8p/329COl/dOjRW4hEVVjSeu1fGNW4k3nx+MMqe5F3wCJ
 5U98UQ/POASOIksZ8DLCCdRnGa4d3qSznAItMV70EhL6gd5zS7ShtcTedMMJzYNrmu3psQ3
 8Xet97GULmt46+MyciLfzzK60W131c/91ivcuCigYidFzM77gnth9/1nMTP3DWIW4wseA5H
 YZJ8KsPDTqmoAs3YpavpA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7YNWVoM1GMg=:/MIhtbuwv6F5KQmUr5uthZ
 Cs1/5SW4NW8rT5f8AHERKT9GgxsCQmJNvutBHtCHhudRIVC1WhPeUnBEEFQaUhmBl8+bQs9xx
 Iz04GfzZa8v6GpcQkY1TKPm3/EXjUlw5V74g27rubZSumdGXen7YEU8J7YWGrFLS7cdyx020o
 OmvqpKVTOsM5VQHRew1PanXFNUzyctfjB2/g5U193hHq4eYpwh7J80PL3ZAQCitnAnH/RdoEI
 SEyxKrloflZS1hpeO0GSDL4ej8mVR7Gmp1WpdLKaBpCpwamLrxou+Yj4xPRP5EbatTzFhvhd+
 4bW1En1cIA8agoRTWJXhRndfWp5SZxHj+bvkpiWlGkt9rj7yU6EL0Q4rUWxGBzVecJL7bD9vK
 Jdtg3vPOoLWhIZo+gZNJptzLMlPHlGN8AtFjVpv57m7MzhFc6BDTPqyln/XTvki+jNDp3FldR
 ukmxoDa3bQ==
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
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/scsi/esp.c | 52 ++++++++++++++++++++++++++++++---------------------
>  1 file changed, 31 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index b84e0fe33e..7073166ad1 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -241,8 +241,9 @@ static void handle_satn(ESPState *s)
>      }
>      s->pdma_cb = satn_pdma_cb;
>      len = get_cmd(s, buf, sizeof(buf));
> -    if (len)
> +    if (len) {
>          do_cmd(s, buf);
> +    }
>  }
>  
>  static void s_without_satn_pdma_cb(ESPState *s)
> @@ -398,8 +399,8 @@ static void esp_do_dma(ESPState *s)
>           * handle_ti_cmd() with do_cmd != NULL (see the assert())
>           */
>          trace_esp_do_dma(s->cmdlen, len);
> -        assert (s->cmdlen <= sizeof(s->cmdbuf) &&
> -                len <= sizeof(s->cmdbuf) - s->cmdlen);
> +        assert(s->cmdlen <= sizeof(s->cmdbuf) &&
> +               len <= sizeof(s->cmdbuf) - s->cmdlen);
>          if (s->dma_memory_read) {
>              s->dma_memory_read(s->dma_opaque, &s->cmdbuf[s->cmdlen], len);
>          } else {
> @@ -445,15 +446,18 @@ static void esp_do_dma(ESPState *s)
>      s->dma_left -= len;
>      s->async_buf += len;
>      s->async_len -= len;
> -    if (to_device)
> +    if (to_device) {
>          s->ti_size += len;
> -    else
> +    } else {
>          s->ti_size -= len;
> +    }
>      if (s->async_len == 0) {
>          scsi_req_continue(s->current_req);
> -        /* If there is still data to be read from the device then
> -           complete the DMA operation immediately.  Otherwise defer
> -           until the scsi layer has completed.  */
> +        /*
> +         * If there is still data to be read from the device then
> +         * complete the DMA operation immediately.  Otherwise defer
> +         * until the scsi layer has completed.
> +         */
>          if (to_device || s->dma_left != 0 || s->ti_size == 0) {
>              return;
>          }
> @@ -491,7 +495,8 @@ void esp_command_complete(SCSIRequest *req, uint32_t status,
>      ESPState *s = req->hba_private;
>  
>      if (s->rregs[ESP_RSTAT] & STAT_INT) {
> -        /* Defer handling command complete until the previous
> +        /*
> +         * Defer handling command complete until the previous
>           * interrupt has been handled.
>           */
>          trace_esp_command_complete_deferred();
> @@ -513,8 +518,10 @@ void esp_transfer_data(SCSIRequest *req, uint32_t len)
>      if (s->dma_left) {
>          esp_do_dma(s);
>      } else if (s->dma_counter != 0 && s->ti_size <= 0) {
> -        /* If this was the last part of a DMA transfer then the
> -           completion interrupt is deferred to here.  */
> +        /*
> +         * If this was the last part of a DMA transfer then the
> +         * completion interrupt is deferred to here.
> +         */
>          esp_dma_done(s);
>      }
>  }
> @@ -531,17 +538,18 @@ static void handle_ti(ESPState *s)
>      dmalen = s->rregs[ESP_TCLO];
>      dmalen |= s->rregs[ESP_TCMID] << 8;
>      dmalen |= s->rregs[ESP_TCHI] << 16;
> -    if (dmalen==0) {
> -      dmalen=0x10000;
> +    if (dmalen == 0) {
> +        dmalen = 0x10000;
>      }
>      s->dma_counter = dmalen;
>  
> -    if (s->do_cmd)
> +    if (s->do_cmd) {
>          minlen = (dmalen < ESP_CMDBUF_SZ) ? dmalen : ESP_CMDBUF_SZ;
> -    else if (s->ti_size < 0)
> +    } else if (s->ti_size < 0) {
>          minlen = (dmalen < -s->ti_size) ? dmalen : -s->ti_size;
> -    else
> +    } else {
>          minlen = (dmalen < s->ti_size) ? dmalen : s->ti_size;
> +    }
>      trace_esp_handle_ti(minlen);
>      if (s->dma) {
>          s->dma_left = minlen;
> @@ -606,8 +614,10 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
>          }
>          break;
>      case ESP_RINTR:
> -        /* Clear sequence step, interrupt register and all status bits
> -           except TC */
> +        /*
> +         * Clear sequence step, interrupt register and all status bits
> +         * except TC
> +         */
>          old_val = s->rregs[ESP_RINTR];
>          s->rregs[ESP_RINTR] = 0;
>          s->rregs[ESP_RSTAT] &= ~STAT_TC;
> @@ -665,13 +675,13 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
>          } else {
>              s->dma = 0;
>          }
> -        switch(val & CMD_CMD) {
> +        switch (val & CMD_CMD) {
>          case CMD_NOP:
>              trace_esp_mem_writeb_cmd_nop(val);
>              break;
>          case CMD_FLUSH:
>              trace_esp_mem_writeb_cmd_flush(val);
> -            //s->ti_size = 0;
> +            /*s->ti_size = 0;*/

Perhaps the line can simply be removed?

>              s->rregs[ESP_RINTR] = INTR_FC;
>              s->rregs[ESP_RSEQ] = 0;
>              s->rregs[ESP_RFLAGS] = 0;
> @@ -787,7 +797,7 @@ static const VMStateDescription vmstate_esp_pdma = {
>  };
>  
>  const VMStateDescription vmstate_esp = {
> -    .name ="esp",
> +    .name = "esp",
>      .version_id = 4,
>      .minimum_version_id = 3,
>      .fields = (VMStateField[]) {
> 

Anyway:

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


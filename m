Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E96329183
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 21:32:06 +0100 (CET)
Received: from localhost ([::1]:55664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGpD3-0001Ps-Fa
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 15:32:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGpAo-0000CK-MB
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:29:46 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:56451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGpAm-0001rQ-RE
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:29:46 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MOAJt-1lRUQj0uQj-00OaQa; Mon, 01 Mar 2021 21:29:36 +0100
Subject: Re: [PATCH v2 06/42] esp: fix esp_reg_read() trace event
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-7-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2b157239-9959-5897-40d6-0d482bbbde48@vivier.eu>
Date: Mon, 1 Mar 2021 21:29:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-7-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NRKvfzAdVhgxp4doR/AmHHO/NOJLHfzs+GmCv9NkjDnQTMGZA3n
 JMKfFD5Xgmcgl3S2axYZ2QV2/GOhvbAehrhTXZkS16Fjgjo5dFEkCY2n7fMzr6yGVbdOwry
 XBVnI0jrP6VVqrBR6X0yy8Yjmb5qFIoeNYYLLK93t11mLGsjbxunx1EdVL063WOn8dfPk0O
 b8kOKivB0Vptwp0tN7xAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YCujBlGdzrw=:PtPHHunqAHnfxyhpjY7c9Z
 5eMRDpufRORyK5tCnt0nbU4OyqPDg7bo5HOXXujtvUfw2U/8Oc0g0CVndy7sN3kEiqaNOFTLv
 qgVQUyjubgXBR3WnjoWm2M2ujcypdOkucOMAkjlx53nsVvsa19x6J2CLwHNTQi+fEWmAiP5kx
 dNYJJ7wGDp7jqOAQGHNApRrQdMjEtqEsJMuC/4E+pltQDCEvIJB1zPZQXRINqol9VsZz2hEOP
 hsrPZk9QUc2CJqGbqOrZ1OWJ7MgFxJ989IQr8G2BtLpTVsL5PxUQtp5g55k/oW0hWs9POv7e1
 lcVLvmiwEdI5Xxd5cYYipxRdyoZeR/R2T4auV2FuwUI6SU+NBRxaFUcokP//t8B2NfzhhPJGG
 Tay7kX4zCo4S9oXi0A5f0yoBJGPkmmWVWWTk6SsRqtAEocihdtzrgtqfSNB0nVAblR3TPbyIi
 kr+//lEChA==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
> Move the trace event to the end of the function so that it correctly reports
> the returned value if it doesn't come directly from the rregs array.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/scsi/esp.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 9951472ee6..c36cb0f238 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -595,9 +595,8 @@ static void parent_esp_reset(ESPState *s, int irq, int level)
>  
>  uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
>  {
> -    uint32_t old_val;
> +    uint32_t val;
>  
> -    trace_esp_mem_readb(saddr, s->rregs[saddr]);
>      switch (saddr) {
>      case ESP_FIFO:
>          if ((s->rregs[ESP_RSTAT] & STAT_PIO_MASK) == 0) {
> @@ -612,13 +611,14 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
>              s->ti_rptr = 0;
>              s->ti_wptr = 0;
>          }
> +        val = s->rregs[ESP_FIFO];
>          break;
>      case ESP_RINTR:
>          /*
>           * Clear sequence step, interrupt register and all status bits
>           * except TC
>           */
> -        old_val = s->rregs[ESP_RINTR];
> +        val = s->rregs[ESP_RINTR];
>          s->rregs[ESP_RINTR] = 0;
>          s->rregs[ESP_RSTAT] &= ~STAT_TC;
>          s->rregs[ESP_RSEQ] = SEQ_CD;
> @@ -627,16 +627,22 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
>              esp_report_command_complete(s, s->deferred_status);
>              s->deferred_complete = false;
>          }
> -        return old_val;
> +        break;
>      case ESP_TCHI:
>          /* Return the unique id if the value has never been written */
>          if (!s->tchi_written) {
> -            return s->chip_id;
> +            val = s->chip_id;
> +        } else {
> +            val = s->rregs[saddr];
>          }
> +        break;
>      default:
> +        val = s->rregs[saddr];
>          break;
>      }
> -    return s->rregs[saddr];
> +
> +    trace_esp_mem_readb(saddr, val);
> +    return val;
>  }
>  
>  void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


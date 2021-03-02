Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D9F32AC72
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 23:04:37 +0100 (CET)
Received: from localhost ([::1]:57540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHD88-0005dF-CV
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 17:04:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHD6q-0004st-Hd
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 17:03:16 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:36981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHD6o-0001kB-Lo
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 17:03:16 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M76jv-1l9Doh1EGF-008a1r; Tue, 02 Mar 2021 23:03:08 +0100
Subject: Re: [PATCH v2 29/42] esp: remove pdma_origin from ESPState
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-30-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9e4515c6-8181-ed54-52c2-011c415b2e6f@vivier.eu>
Date: Tue, 2 Mar 2021 23:03:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-30-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AFCXC1SsVFxpaLxZYAnZnbYwHbtgCkXwM/BvkPB0f7aXNKwfXmw
 zIhCpwPhMFs/GZRBLP70pNsQPHyk7omFmiApaweqjrnvMWRRqdyb1piBmtOqE8C3zl/wDr2
 ffTe9jQxX3nthFecpE1mJDTrSwDghuJ3er5xZ/8pLluDajxdzh4ikI3tjPfYOLGWHF0Gtw0
 zan731fsKl8f7Ihpl6ZmA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6go2GfvasYE=:YFWbFH3uuTI4SvxdO8yU9Q
 JBY46LwA0EkQhsaHSMwzIR5rM8T3S5pw4MrcRh+PG+5xjrOzphUwkNRvGZ16JyKcN3B405mWl
 yuM7/BmTv6CskEj2xRvNn7d9HBxxKyOfLfyC9Jn/F3UcivIE4sitcydjPIfkcV1s8aIvtiTFL
 WByfEIzr13MfpjOOQX775lWs7u97p+GPcfaAF0UG53kRa7GfSSnYDJXAIu4NBx5vDSbf26Cf5
 zzGt0rhUAsN9SGQY4RtxvcEnFmO4i6l+tMuvzQFtK+F2aSPMAteRzNQ/sXmRMfsR59aVCtWmV
 T69RLop66k/SZ5sGFw40osC08VGqCZOZl1EZCgb2jcUTf8J5/x8J9UI36CKcoNb37TLxeNLh6
 A4mbyVYVjrk1579giFGJH9DrPdhNUfuB19df9ya60oxTYJVmwjfIf301Fi7qeY761TO7/dyiY
 HHZQn8PmyA==
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

Le 09/02/2021 à 20:30, Mark Cave-Ayland a écrit :
> Now that all data is transferred via the FIFO (ti_buf) there is no need to track
> the source buffer being used for the data transfer. This also eliminates the
> need for a separate subsection for PDMA state migration.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c         | 74 +++++--------------------------------------
>  include/hw/scsi/esp.h |  6 ----
>  2 files changed, 8 insertions(+), 72 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 5dcd4cd651..7671cc398d 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -127,32 +127,14 @@ static uint32_t esp_get_stc(ESPState *s)
>      return dmalen;
>  }
>  
> -static void set_pdma(ESPState *s, enum pdma_origin_id origin)
> -{
> -    s->pdma_origin = origin;
> -}
> -
>  static uint8_t esp_pdma_read(ESPState *s)
>  {
>      uint8_t val;
>  
> -    switch (s->pdma_origin) {
> -    case TI:
> -        if (s->do_cmd) {
> -            val = s->cmdbuf[s->cmdlen++];
> -        } else {
> -            val = s->ti_buf[s->ti_rptr++];
> -        }
> -        break;
> -    case ASYNC:
> -        val = s->async_buf[0];
> -        if (s->async_len > 0) {
> -            s->async_len--;
> -            s->async_buf++;
> -        }
> -        break;
> -    default:
> -        g_assert_not_reached();
> +    if (s->do_cmd) {
> +        val = s->cmdbuf[s->cmdlen++];
> +    } else {
> +        val = s->ti_buf[s->ti_rptr++];
>      }
>  
>      return val;
> @@ -166,23 +148,10 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
>          return;
>      }
>  
> -    switch (s->pdma_origin) {
> -    case TI:
> -        if (s->do_cmd) {
> -            s->cmdbuf[s->cmdlen++] = val;
> -        } else {
> -            s->ti_buf[s->ti_wptr++] = val;
> -        }
> -        break;
> -    case ASYNC:
> -        s->async_buf[0] = val;
> -        if (s->async_len > 0) {
> -            s->async_len--;
> -            s->async_buf++;
> -        }
> -        break;
> -    default:
> -        g_assert_not_reached();
> +    if (s->do_cmd) {
> +        s->cmdbuf[s->cmdlen++] = val;
> +    } else {
> +        s->ti_buf[s->ti_wptr++] = val;
>      }
>  
>      dmalen--;
> @@ -232,7 +201,6 @@ static uint32_t get_cmd(ESPState *s)
>          if (s->dma_memory_read) {
>              s->dma_memory_read(s->dma_opaque, buf, dmalen);
>          } else {
> -            set_pdma(s, TI);
>              if (esp_select(s) < 0) {
>                  return -1;
>              }
> @@ -411,7 +379,6 @@ static void write_response(ESPState *s)
>              s->rregs[ESP_RINTR] = INTR_BS | INTR_FC;
>              s->rregs[ESP_RSEQ] = SEQ_CD;
>          } else {
> -            set_pdma(s, TI);
>              s->pdma_cb = write_response_pdma_cb;
>              esp_raise_drq(s);
>              return;
> @@ -522,7 +489,6 @@ static void esp_do_dma(ESPState *s)
>          if (s->dma_memory_read) {
>              s->dma_memory_read(s->dma_opaque, &s->cmdbuf[s->cmdlen], len);
>          } else {
> -            set_pdma(s, TI);
>              s->pdma_cb = do_dma_pdma_cb;
>              esp_raise_drq(s);
>              return;
> @@ -545,7 +511,6 @@ static void esp_do_dma(ESPState *s)
>          if (s->dma_memory_read) {
>              s->dma_memory_read(s->dma_opaque, s->async_buf, len);
>          } else {
> -            set_pdma(s, TI);
>              s->pdma_cb = do_dma_pdma_cb;
>              esp_raise_drq(s);
>              return;
> @@ -562,7 +527,6 @@ static void esp_do_dma(ESPState *s)
>              s->async_len -= len;
>              s->ti_size -= len;
>              esp_set_tc(s, esp_get_tc(s) - len);
> -            set_pdma(s, TI);
>              s->pdma_cb = do_dma_pdma_cb;
>              esp_raise_drq(s);
>  
> @@ -899,24 +863,6 @@ static bool esp_mem_accepts(void *opaque, hwaddr addr,
>      return (size == 1) || (is_write && size == 4);
>  }
>  
> -static bool esp_pdma_needed(void *opaque)
> -{
> -    ESPState *s = opaque;
> -    return s->dma_memory_read == NULL && s->dma_memory_write == NULL &&
> -           s->dma_enabled;
> -}
> -
> -static const VMStateDescription vmstate_esp_pdma = {
> -    .name = "esp/pdma",
> -    .version_id = 2,
> -    .minimum_version_id = 2,
> -    .needed = esp_pdma_needed,
> -    .fields = (VMStateField[]) {
> -        VMSTATE_INT32(pdma_origin, ESPState),
> -        VMSTATE_END_OF_LIST()
> -    }
> -};
> -
>  static bool esp_is_before_version_5(void *opaque, int version_id)
>  {
>      ESPState *s = ESP(opaque);
> @@ -971,10 +917,6 @@ const VMStateDescription vmstate_esp = {
>          VMSTATE_UINT32_TEST(mig_dma_left, ESPState, esp_is_before_version_5),
>          VMSTATE_END_OF_LIST()
>      },
> -    .subsections = (const VMStateDescription * []) {
> -        &vmstate_esp_pdma,
> -        NULL
> -    }
>  };
>  
>  static void sysbus_esp_mem_write(void *opaque, hwaddr addr,
> diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
> index a8d5bf8a63..6618f4e091 100644
> --- a/include/hw/scsi/esp.h
> +++ b/include/hw/scsi/esp.h
> @@ -15,11 +15,6 @@ typedef void (*ESPDMAMemoryReadWriteFunc)(void *opaque, uint8_t *buf, int len);
>  
>  typedef struct ESPState ESPState;
>  
> -enum pdma_origin_id {
> -    TI,
> -    ASYNC,
> -};
> -
>  #define TYPE_ESP "esp"
>  OBJECT_DECLARE_SIMPLE_TYPE(ESPState, ESP)
>  
> @@ -55,7 +50,6 @@ struct ESPState {
>      ESPDMAMemoryReadWriteFunc dma_memory_write;
>      void *dma_opaque;
>      void (*dma_cb)(ESPState *s);
> -    int pdma_origin;
>      void (*pdma_cb)(ESPState *s);
>  
>      uint8_t mig_version_id;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


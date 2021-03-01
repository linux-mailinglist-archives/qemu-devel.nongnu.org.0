Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0916E3291CA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 21:33:52 +0100 (CET)
Received: from localhost ([::1]:59108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGpEl-0002yJ-2t
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 15:33:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGpDd-0002X5-Kq
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:32:41 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:53935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGpDa-00038S-BI
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:32:41 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MyseA-1m3r802Rta-00vw7k; Mon, 01 Mar 2021 21:32:30 +0100
Subject: Re: [PATCH v2 07/42] esp: add PDMA trace events
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-8-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0e14f9eb-66f7-852f-d53e-5f55e4499d1d@vivier.eu>
Date: Mon, 1 Mar 2021 21:32:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-8-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MjkUbzmCkBDbr2d0sFTSnLAW2FMrhFsoH5Dl2OWGoLiEg/RfUa5
 tOs0Q38gRa38LImuTbavljV4uDLTSd678oFGxV4ju9QgphsG6dfDyeEBkoTNvN3gzEdkJEi
 pzW4ANr2HoaKvrD8H9HpcYXpLSZvIvWAulBvQ436jnJt0vVbG1AkbjDjRkSalbQ8WqA99ZQ
 R3FnguNb73ORu1NzIvEeQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UAp0uNEM3tY=:Cb0QU5z36cl7Br25x/WVz0
 TPgJYl+rVMxOjDXNtGxDQpojESHcksqHpDvVQaIDDs8kk1toM+2hJEN9Uo8Rr8bf+VQDUSIps
 taJUz9TD+Y6h+BMZ8CnOzWdA7xAaK20/vsLOZ3VAiS/uLGX3o+oPPY17F3AQz0+ZLT6AzBnOz
 ZoXUee6cESWUyGj2TtcSjYAhjBJ5rMm+hFlA5BUqDQGWnzq6uj1NScmqj/uLtGEqmttN577Sg
 XSSJrVSfZbZk0fl5rJ4Ds5iIqSC9gQKGmEF8wEADYhbACBZL1SWsHDyCRyWy17866iEytP7cs
 9V8B2j1NUG86PbFWwHaXMIOev2ESXNFyEiE0BE/FO4nSHMlEgCOKdq20+gm2LYnE7te2lxOYl
 QHNVZIQ0K9JofhiMbAOUtM4zCxsAi8m3hJrYKjHhPKthdt0My74Yd5utWLTtDHdaK+jn0x9I3
 srwxj3A+Gg==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
> This will become more useful later when trying to debug mixed FIFO and PDMA
> requests.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/scsi/esp.c        | 6 ++++++
>  hw/scsi/trace-events | 4 ++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index c36cb0f238..db2ea02549 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -63,11 +63,13 @@ static void esp_lower_irq(ESPState *s)
>  static void esp_raise_drq(ESPState *s)
>  {
>      qemu_irq_raise(s->irq_data);
> +    trace_esp_raise_drq();
>  }
>  
>  static void esp_lower_drq(ESPState *s)
>  {
>      qemu_irq_lower(s->irq_data);
> +    trace_esp_lower_drq();
>  }
>  
>  void esp_dma_enable(ESPState *s, int irq, int level)
> @@ -886,6 +888,8 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
>      uint32_t dmalen;
>      uint8_t *buf = get_pdma_buf(s);
>  
> +    trace_esp_pdma_write(size);
> +
>      dmalen = s->rregs[ESP_TCLO];
>      dmalen |= s->rregs[ESP_TCMID] << 8;
>      dmalen |= s->rregs[ESP_TCHI] << 16;
> @@ -923,6 +927,8 @@ static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
>      uint8_t *buf = get_pdma_buf(s);
>      uint64_t val = 0;
>  
> +    trace_esp_pdma_read(size);
> +
>      if (s->pdma_len == 0) {
>          return 0;
>      }
> diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
> index 762849c7b6..dff986a643 100644
> --- a/hw/scsi/trace-events
> +++ b/hw/scsi/trace-events
> @@ -159,8 +159,12 @@ esp_error_unhandled_command(uint32_t val) "unhandled command (0x%2.2x)"
>  esp_error_invalid_write(uint32_t val, uint32_t addr) "invalid write of 0x%02x at [0x%x]"
>  esp_raise_irq(void) "Raise IRQ"
>  esp_lower_irq(void) "Lower IRQ"
> +esp_raise_drq(void) "Raise DREQ"
> +esp_lower_drq(void) "Lower DREQ"
>  esp_dma_enable(void) "Raise enable"
>  esp_dma_disable(void) "Lower enable"
> +esp_pdma_read(int size) "pDMA read %u bytes"
> +esp_pdma_write(int size) "pDMA write %u bytes"
>  esp_get_cmd(uint32_t dmalen, int target) "len %d target %d"
>  esp_do_busid_cmd(uint8_t busid) "busid 0x%x"
>  esp_handle_satn_stop(uint32_t cmdlen) "cmdlen %d"
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


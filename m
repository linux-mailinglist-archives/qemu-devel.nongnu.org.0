Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D103F32A721
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:07:20 +0100 (CET)
Received: from localhost ([::1]:55272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH8UR-0007aL-Tm
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lH8RI-00055c-QA
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:04:04 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:50087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lH8RG-0006mC-Tv
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:04:04 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MkEdF-1lfhXV1rBp-00kbvK; Tue, 02 Mar 2021 18:03:52 +0100
Subject: Re: [PATCH v2 20/42] esp: remove the buf and buflen parameters from
 get_cmd()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-21-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <8a63ff80-368a-2b73-18a8-d7b0c140755d@vivier.eu>
Date: Tue, 2 Mar 2021 18:03:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-21-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SI5+9VA5KWmJeHDt7lFvIv38+MLFBJq7rf7cnT2dAZBhtv+6LjK
 vMMix25W8IGOhUyDqc+5PtD5LuAMJ5k3DeW8qpuwtZ0jwptjLSMKlyclVgyHa9yHzBvrFOb
 B2qJqmRKgEwM0vQqp9dYjw4tYXAKOytrsj6Nj7BP5XL623P1BbcuDrUTu1rgU1/in83VdOL
 bBXCe1azUXKnQsvJjgMyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9FidfGebjTo=:Po2ldxcgF5VqYPqv8WoTKm
 OTIO5u7NQW62n7it5wRkx+Kk4/cmDtWQ0z5nQkEhTHynv/Cbl28xb6n0tOghEzVobqeRuH0FE
 zTDy7mZn542Mc8FadWWIHjm+fsVeiITv0NFcT/EJ0tTUqVq6DHI6urV7omvDdmgdtIJMVyQn8
 7WK/12OCInsX3xQ7nTHrdtN8B83c9ZV0PoaFghTNlVnq6gAc+sOVtk3R5M9eivn5iE+JIhSZh
 VgMOglnoWoHFCAandUcpjsYyBzmJLmd45D6KPveTx0XmAuuT2WjiJIcw2768Kq3uuvpsrWznU
 f4bOGa7Z+oXExNwMMoc0t5I31rj7CIEUyySg1r4dvYpCj6EZr9PUKvUNEcRmAX36ePKOYWjJ3
 p5htua3W4/O07ChT/mGcc5ntF4oqGfpgRgs4pedbrikuzTxOefSjX2EG0KIZD
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
> Now that all SCSI commands are accumulated in cmdbuf, remove the buf and buflen
> parameters from get_cmd() since these always reference cmdbuf and ESP_CMDBUF_SZ
> respectively.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index bb467fbcdf..7055520a26 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -236,15 +236,16 @@ static int get_cmd_cb(ESPState *s)
>      return 0;
>  }
>  
> -static uint32_t get_cmd(ESPState *s, uint8_t *buf, uint8_t buflen)
> +static uint32_t get_cmd(ESPState *s)
>  {
> +    uint8_t *buf = s->cmdbuf;
>      uint32_t dmalen;
>      int target;
>  
>      target = s->wregs[ESP_WBUSID] & BUSID_DID;
>      if (s->dma) {
>          dmalen = esp_get_tc(s);
> -        if (dmalen > buflen) {
> +        if (dmalen > ESP_CMDBUF_SZ) {
>              return 0;
>          }
>          if (s->dma_memory_read) {
> @@ -323,7 +324,7 @@ static void handle_satn(ESPState *s)
>          return;
>      }
>      s->pdma_cb = satn_pdma_cb;
> -    s->cmdlen = get_cmd(s, s->cmdbuf, sizeof(s->cmdbuf));
> +    s->cmdlen = get_cmd(s);
>      if (s->cmdlen) {
>          do_cmd(s);
>      } else {
> @@ -349,7 +350,7 @@ static void handle_s_without_atn(ESPState *s)
>          return;
>      }
>      s->pdma_cb = s_without_satn_pdma_cb;
> -    s->cmdlen = get_cmd(s, s->cmdbuf, sizeof(s->cmdbuf));
> +    s->cmdlen = get_cmd(s);
>      if (s->cmdlen) {
>          do_busid_cmd(s, s->cmdbuf, 0);
>      } else {
> @@ -380,7 +381,7 @@ static void handle_satn_stop(ESPState *s)
>          return;
>      }
>      s->pdma_cb = satn_stop_pdma_cb;
> -    s->cmdlen = get_cmd(s, s->cmdbuf, sizeof(s->cmdbuf));
> +    s->cmdlen = get_cmd(s);
>      if (s->cmdlen) {
>          trace_esp_handle_satn_stop(s->cmdlen);
>          s->do_cmd = 1;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


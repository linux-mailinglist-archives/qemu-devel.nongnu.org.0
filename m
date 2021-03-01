Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD80A329499
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 23:12:10 +0100 (CET)
Received: from localhost ([::1]:60660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGqlt-0007Sm-O5
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 17:12:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGqeS-0008Bk-Te
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 17:04:28 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:40953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lGqeQ-0001dD-RG
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 17:04:28 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MGiF0-1l4BSj2m26-00DqeW; Mon, 01 Mar 2021 23:04:19 +0100
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-15-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2 14/42] esp: remove minlen restriction in handle_ti
Message-ID: <568fa1b9-8595-ccb2-98db-15ecc799f67a@vivier.eu>
Date: Mon, 1 Mar 2021 23:04:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-15-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:T3HbKXZ7UNp7rABeOwNDxeGYDYq1DJUYoD/lhWjxwMHjd05cWi8
 LsiwCsF7AnjXHVLsFteYohiiIuVx3Z0ZhjOpiuIUJ1s/A2z/N7HHViSsb9mFySOEh2p7ovZ
 cLPSb4OL7xe/oXUgtNtsnKFBAiLQf3BVfsErm/YypXoykh8ctAT8BwxPOnL4/Ojym+hW4aA
 ygIz/R6+ATxdo4158DyEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qkDRNwgNDR8=:WW7kwOt57Rh1/JxnX8dVoq
 TCWf86fQuWzJce+e+vXaZou6llSo5gcEabww6jaS0pHsI2Ohvu06e3dEa3PhU5bAHhG+naiwG
 lGBTngZeb/pTst1oZn0rgrnoYpmHh6LuogDK0jWyyUAtVtwiJJcHZk2q76sbr6bNxA0X5Xz4X
 Nm5IV9YzppW+BgAfhODIfFPr5WQfSLcmMPkJItSpmApTgAVbrJz3i1NutnJI0E+F3rJ0Uu+5y
 gfCsL1q0KqD9vBJg2EhuaXO9Ya8X4lvfS30WgYkCGGM9DBAOn6Z2uT/7gIQuqm2Atv6TMAXGg
 zj/u4aUv6SIretz+4gjVO1XODKb/X72DdPBi3Xt0J9P7J/kkdawoVmGKWFZB3GeqW8G1b7czv
 iP8tZhWqinZNQq6TVeFWudJru57e+mX18XPRrD5/6MyDkquVpVXQVWlVrSlZ64eN4s559Xtfe
 1A77326Uyg==
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
> The limiting of DMA transfers to the maximum size of the available data is already
> handled by esp_do_dma() and do_dma_pdma_cb().
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index fcc99f5fe4..e7cf36f4b8 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -553,7 +553,7 @@ void esp_transfer_data(SCSIRequest *req, uint32_t len)
>  
>  static void handle_ti(ESPState *s)
>  {
> -    uint32_t dmalen, minlen;
> +    uint32_t dmalen;
>  
>      if (s->dma && !s->dma_enabled) {
>          s->dma_cb = handle_ti;
> @@ -561,16 +561,8 @@ static void handle_ti(ESPState *s)
>      }
>  
>      dmalen = esp_get_tc(s);
> -
> -    if (s->do_cmd) {
> -        minlen = (dmalen < ESP_CMDBUF_SZ) ? dmalen : ESP_CMDBUF_SZ;
> -    } else if (s->ti_size < 0) {
> -        minlen = (dmalen < -s->ti_size) ? dmalen : -s->ti_size;
> -    } else {
> -        minlen = (dmalen < s->ti_size) ? dmalen : s->ti_size;
> -    }
> -    trace_esp_handle_ti(minlen);
>      if (s->dma) {
> +        trace_esp_handle_ti(dmalen);
>          s->rregs[ESP_RSTAT] &= ~STAT_TC;
>          esp_do_dma(s);
>      } else if (s->do_cmd) {
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


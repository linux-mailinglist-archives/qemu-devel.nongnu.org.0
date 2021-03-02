Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B451832A720
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:07:06 +0100 (CET)
Received: from localhost ([::1]:54190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH8UD-00078V-QT
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:07:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lH8QV-0003m7-Bh
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:03:18 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:37293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lH8QQ-0006f3-Fn
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:03:15 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MKKER-1lV4dl0s63-00LlNn; Tue, 02 Mar 2021 18:03:02 +0100
Subject: Re: [PATCH v2 19/42] esp: remove buf parameter from do_cmd()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-20-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <562279ab-1839-3217-c021-ed910a542cf8@vivier.eu>
Date: Tue, 2 Mar 2021 18:03:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-20-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lhHizTqWP2Pz7ToMfVHcnTtaMgi0jYXiHeoTVCRQzkQWPHLx5po
 UWGWq4lxqTBC+K2gAd2vYA9bzAefWgjFTAwVSZqWS7+ptJxM2Dben8Y7f2Hj4LlOfn1mlw8
 LHX9GuDhLnHCpV7eB2NNZGQ4/GGQjpVErtsp2EAf5CLqEr7+2OT6ZdBJNbK2l5zBKKDKTZ7
 g3fQtjHez4XxpBDTUAjsw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jKd8xipGKy0=:1Nsf4rlGJFD/v9TXhyHKg2
 iB1xMuAbaTO24thsMGcDxenPQPN8s4KLbNhvJssajU5gwyaGzWTgruGZIFQDl+wQykq7RHFDu
 p8iVLVn8lwcKWjxROmz878q2Q039b1K74lNZMpi42JPrb669bFjIFkD08YMBRpzxIhe09thOg
 oAn29TbjbgTmlMujc4Jrzl0VbPsTmEI27mFHpgmt4jwbUhiJCLEsYHvDlX9hVsLqMlM4rERZf
 DpwSE/jlQQGXWMlSh4qo/2Ug6n6i7WWI5qzWVRVsM+PaKxuI6A6M2BDBhmtdeJDmYvwCbRBNa
 FVwdhmbWyp/4kIKDIUHJPgpmqqRS9Z+dYwEd0FhC/r3dgFsjYtqlG7dW77vHBeKQRxODy8/x3
 eJSJWZ6YaOxjt24/+UPM+/+xTJqcp7uP1SrP2AJWmSW3BFejyxC3GTx0y78fIcn8wY/6rqfGR
 w5wyVYfgfg==
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
> Now that all SCSI commands are accumulated in cmdbuf, remove the buf parameter
> from do_cmd() since this always points to cmdbuf.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index b846f022fb..bb467fbcdf 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -297,8 +297,9 @@ static void do_busid_cmd(ESPState *s, uint8_t *buf, uint8_t busid)
>      esp_raise_irq(s);
>  }
>  
> -static void do_cmd(ESPState *s, uint8_t *buf)
> +static void do_cmd(ESPState *s)
>  {
> +    uint8_t *buf = s->cmdbuf;
>      uint8_t busid = buf[0];
>  
>      do_busid_cmd(s, &buf[1], busid);
> @@ -311,7 +312,7 @@ static void satn_pdma_cb(ESPState *s)
>      }
>      s->do_cmd = 0;
>      if (s->cmdlen) {
> -        do_cmd(s, s->cmdbuf);
> +        do_cmd(s);
>      }
>  }
>  
> @@ -324,7 +325,7 @@ static void handle_satn(ESPState *s)
>      s->pdma_cb = satn_pdma_cb;
>      s->cmdlen = get_cmd(s, s->cmdbuf, sizeof(s->cmdbuf));
>      if (s->cmdlen) {
> -        do_cmd(s, s->cmdbuf);
> +        do_cmd(s);
>      } else {
>          s->do_cmd = 1;
>      }
> @@ -445,7 +446,7 @@ static void do_dma_pdma_cb(ESPState *s)
>          s->ti_size = 0;
>          s->cmdlen = 0;
>          s->do_cmd = 0;
> -        do_cmd(s, s->cmdbuf);
> +        do_cmd(s);
>          return;
>      }
>      s->async_buf += len;
> @@ -497,7 +498,7 @@ static void esp_do_dma(ESPState *s)
>          s->ti_size = 0;
>          s->cmdlen = 0;
>          s->do_cmd = 0;
> -        do_cmd(s, s->cmdbuf);
> +        do_cmd(s);
>          return;
>      }
>      if (s->async_len == 0) {
> @@ -628,7 +629,7 @@ static void handle_ti(ESPState *s)
>          s->ti_size = 0;
>          s->cmdlen = 0;
>          s->do_cmd = 0;
> -        do_cmd(s, s->cmdbuf);
> +        do_cmd(s);
>      }
>  }
>  
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 093B832AC65
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:53:44 +0100 (CET)
Received: from localhost ([::1]:42602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCxb-0006rr-3s
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHCvd-0005mT-Sg
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:51:43 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:38809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHCvZ-0000E8-Jd
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:51:41 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M4ahC-1lFYlZ0JJW-001gz6; Tue, 02 Mar 2021 22:51:31 +0100
Subject: Re: [PATCH v2 26/42] esp: rename get_cmd_cb() to esp_select()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-27-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9536274c-d17e-2538-3774-fc7717103400@vivier.eu>
Date: Tue, 2 Mar 2021 22:51:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-27-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jTCJzFLsTsuHP4L9TFvMTL7qZA19DcVbuvIV9VeZdAyRBfed1mD
 IUWqAbHOs03pxmSeNT9/lNGwjo/r3Tq9DsMI8wX6F4aKF+5K/hVmJPm8H9qkMYcxj7W7F/u
 F4QGXv3gXtBTUr207qbHh6pKn9LR8bS0vymnT/ffqt/7UxeVHA5pv3DTq/Mx9inB1YTvQAZ
 8JwC8Ul01VdQm3br8p1dw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mCz5OhO0gCY=:a/jDpMbbcmQF5lWysVklxc
 b4MmrEmGNIE69E9FydXNeD0T6/FrAHk23yMG9KCsffCZLtIKK7+wxWQikL9qLC8O+QHn33tV5
 tlRG0Z0DKzZ5N8/RkHgiIStvPo1948ceSKRWzkWbVqdiTjCVpwYVhDPlxJyW32pi7HM37Vvkv
 VXV+wqX3NDrNfScv5k6f4RkU3iMO5KONiwXJ8NiKL0OiYmAsZRPLJR4ZowHef0xobDeTW67Y8
 fAicJPRpbthFOVuZxo74KrKjlp81gXlmN6M6/9bP/ylEZJtfRgjkURw7uk8316G2Gwa38ZhuD
 kCz1F5bCArRzhcTLhPaqmO/6QCF6qVE1FGEK7QdE0j4yTKKoXRGAWsKTOXLjA022CbaHXRnot
 P2r8uq5Tsjk/vyvkMj+2674dzgnikIomNi0gMeah5ZHk8T87SR1C1ESR/yXpIV3uaeq+Mnt3w
 UNaITqct9Q==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
> This better describes the purpose of the function.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/scsi/esp.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 921f79ae89..6736e7142c 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -199,7 +199,7 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
>      esp_set_tc(s, dmalen);
>  }
>  
> -static int get_cmd_cb(ESPState *s)
> +static int esp_select(ESPState *s)
>  {
>      int target;
>  
> @@ -256,7 +256,7 @@ static uint32_t get_cmd(ESPState *s)
>      }
>      trace_esp_get_cmd(dmalen, target);
>  
> -    if (get_cmd_cb(s) < 0) {
> +    if (esp_select(s) < 0) {
>          return 0;
>      }
>      return dmalen;
> @@ -299,7 +299,7 @@ static void do_cmd(ESPState *s)
>  
>  static void satn_pdma_cb(ESPState *s)
>  {
> -    if (get_cmd_cb(s) < 0) {
> +    if (esp_select(s) < 0) {
>          return;
>      }
>      s->do_cmd = 0;
> @@ -325,7 +325,7 @@ static void handle_satn(ESPState *s)
>  
>  static void s_without_satn_pdma_cb(ESPState *s)
>  {
> -    if (get_cmd_cb(s) < 0) {
> +    if (esp_select(s) < 0) {
>          return;
>      }
>      s->do_cmd = 0;
> @@ -351,7 +351,7 @@ static void handle_s_without_atn(ESPState *s)
>  
>  static void satn_stop_pdma_cb(ESPState *s)
>  {
> -    if (get_cmd_cb(s) < 0) {
> +    if (esp_select(s) < 0) {
>          return;
>      }
>      s->do_cmd = 0;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


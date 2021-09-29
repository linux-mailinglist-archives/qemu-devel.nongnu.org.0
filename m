Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ACF41C6AB
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 16:29:20 +0200 (CEST)
Received: from localhost ([::1]:52234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVaaE-0001xl-WB
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 10:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mVaW2-0000cf-UI
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:24:58 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:53230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mVaW0-00008y-EA
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:24:58 -0400
Received: from [192.168.15.226] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 5EC0320779;
 Wed, 29 Sep 2021 14:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632925492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tlYUCeQvsB+uh/nRg0yiVwINYNvcCUoMPY23Aq57/IY=;
 b=jy8nGpFGIMVxfmqWHLObctxJlvBk+K7lkRN8ovK8soWuIPVKFE9JOyn7SJiURWN/WCdYiV
 UvbkoDiFcfAcXOj9FKVrML5UYrGDO/vKh8oYu+nQdd+7fjkk0PwfiozU+F5dlog35TPPPq
 Z4Q7lJy7O3G9OMs0D/agQ45gLyECsU4=
Message-ID: <307ae3c0-de82-da34-6443-c087c4c6cc71@greensocs.com>
Date: Wed, 29 Sep 2021 16:24:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/3] hw/input/lasips2: Fix typos in function names
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210920064048.2729397-1-f4bug@amsat.org>
 <20210920064048.2729397-2-f4bug@amsat.org>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20210920064048.2729397-2-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.03,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/20/21 08:40, Philippe Mathieu-Daudé wrote:
> Artist is another device, this one is the Lasi PS/2.
> Rename the functions accordingly.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   hw/input/lasips2.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
> index e7faf24058b..68d741d3421 100644
> --- a/hw/input/lasips2.c
> +++ b/hw/input/lasips2.c
> @@ -96,7 +96,7 @@ typedef enum {
>       LASIPS2_STATUS_CLKSHD = 0x80,
>   } lasips2_status_reg_t;
>   
> -static const char *artist_read_reg_name(uint64_t addr)
> +static const char *lasips2_read_reg_name(uint64_t addr)
>   {
>       switch (addr & 0xc) {
>       case REG_PS2_ID:
> @@ -116,7 +116,7 @@ static const char *artist_read_reg_name(uint64_t addr)
>       }
>   }
>   
> -static const char *artist_write_reg_name(uint64_t addr)
> +static const char *lasips2_write_reg_name(uint64_t addr)
>   {
>       switch (addr & 0x0c) {
>       case REG_PS2_RESET:
> @@ -145,7 +145,7 @@ static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
>       LASIPS2Port *port = opaque;
>   
>       trace_lasips2_reg_write(size, port->id, addr,
> -                            artist_write_reg_name(addr), val);
> +                            lasips2_write_reg_name(addr), val);
>   
>       switch (addr & 0xc) {
>       case REG_PS2_CONTROL:
> @@ -239,7 +239,7 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
>           break;
>       }
>       trace_lasips2_reg_read(size, port->id, addr,
> -                           artist_read_reg_name(addr), ret);
> +                           lasips2_read_reg_name(addr), ret);
>   
>       return ret;
>   }
> 


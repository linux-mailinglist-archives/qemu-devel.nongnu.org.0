Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D67141C6BE
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 16:34:13 +0200 (CEST)
Received: from localhost ([::1]:56484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVaey-000523-9o
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 10:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mVaYh-0002Fk-79
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:27:43 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:53276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mVaYf-0002YP-Lz
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:27:42 -0400
Received: from [192.168.15.226] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 72A2021EB6;
 Wed, 29 Sep 2021 14:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632925659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LbFjHth4qcs8w48Y1TwAMxd4U2J0XQ5wAnbiyneSSFE=;
 b=5QZQsvEGOjr4+8HRJY0LEeC96kHYQr0WuZHWNpgMv0MlUSltnzJsLDBOXwcl7xqOg/r5Lq
 p8+tAn5Fsd4iVqYd5bwgzAHEg18zwLn8sdh1yuQLMvUWpFT+v5TFu/zEwm4Z+ROffvgtWW
 P2DkWf6EyAgluU97fRp+DWGWe/10OTE=
Message-ID: <37f86c44-b057-a434-a0a1-13af68d4c78f@greensocs.com>
Date: Wed, 29 Sep 2021 16:27:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/3] hw/input/lasips2: Move LASIPS2State declaration to
 'hw/input/lasips2.h'
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210920064048.2729397-1-f4bug@amsat.org>
 <20210920064048.2729397-3-f4bug@amsat.org>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20210920064048.2729397-3-f4bug@amsat.org>
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
> We want to use the OBJECT_DECLARE_SIMPLE_TYPE() macro to QOM'ify
> this device in the next commit. To make its review simpler, as a
> first step move the LASIPS2State and LASIPS2Port declarations to
> 'hw/input/lasips2.h'
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

> ---
>   include/hw/input/lasips2.h | 18 ++++++++++++++++++
>   hw/input/lasips2.c         | 18 ------------------
>   2 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
> index 0cd7b59064a..c88f1700162 100644
> --- a/include/hw/input/lasips2.h
> +++ b/include/hw/input/lasips2.h
> @@ -11,6 +11,24 @@
>   
>   #define TYPE_LASIPS2 "lasips2"
>   
> +struct LASIPS2State;
> +typedef struct LASIPS2Port {
> +    struct LASIPS2State *parent;
> +    MemoryRegion reg;
> +    void *dev;
> +    uint8_t id;
> +    uint8_t control;
> +    uint8_t buf;
> +    bool loopback_rbne;
> +    bool irq;
> +} LASIPS2Port;
> +
> +typedef struct LASIPS2State {
> +    LASIPS2Port kbd;
> +    LASIPS2Port mouse;
> +    qemu_irq irq;
> +} LASIPS2State;
> +
>   void lasips2_init(MemoryRegion *address_space, hwaddr base, qemu_irq irq);
>   
>   #endif /* HW_INPUT_LASIPS2_H */
> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
> index 68d741d3421..0f8362f17bc 100644
> --- a/hw/input/lasips2.c
> +++ b/hw/input/lasips2.c
> @@ -33,24 +33,6 @@
>   #include "hw/irq.h"
>   
>   
> -struct LASIPS2State;
> -typedef struct LASIPS2Port {
> -    struct LASIPS2State *parent;
> -    MemoryRegion reg;
> -    void *dev;
> -    uint8_t id;
> -    uint8_t control;
> -    uint8_t buf;
> -    bool loopback_rbne;
> -    bool irq;
> -} LASIPS2Port;
> -
> -typedef struct LASIPS2State {
> -    LASIPS2Port kbd;
> -    LASIPS2Port mouse;
> -    qemu_irq irq;
> -} LASIPS2State;
> -
>   static const VMStateDescription vmstate_lasips2 = {
>       .name = "lasips2",
>       .version_id = 0,
> 


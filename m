Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 541F14C2DE0
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 15:07:33 +0100 (CET)
Received: from localhost ([::1]:35670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNEmK-0002Tk-DN
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 09:07:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nNEjy-0008DH-51
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:05:06 -0500
Received: from [2607:f8b0:4864:20::1036] (port=36663
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nNEjw-0006XC-IN
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:05:05 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 g7-20020a17090a708700b001bb78857ccdso5809451pjk.1
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 06:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=d6aE8/wpNGRLwLavE3kxGOfMx4c6V5rNQ56ra4BWONM=;
 b=TwYkO6QER2we6UURM23rsNC//v/zOw0dE7YMqRsnayrMmxsWgGB8x/u9ml/lozOybl
 +Ysnevi13ZMXy9XkSRRWrW0lC4Owac8Vqtd6vEujckkWzCgcXSOtQF2gXZjltyvarlGf
 Ow2agnBVKfHblKNuinwhC23gAPTLHbanyE4ilmbvinoCsPl5hcEHIPJthNh8QcXSwH2M
 vJwRj0Gm09U/7IFpCluu5SuTH5Z2c8ZRAZJrZ9xRQKTx2VC5y111mYwwyHon86P0SXd4
 rM0LYGHzVvcMK/T2WxpbUWV4N0EbnueQpRRqHid2OX3/mIGZ04oBecXoH9h/mDlJSF9Z
 ofFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d6aE8/wpNGRLwLavE3kxGOfMx4c6V5rNQ56ra4BWONM=;
 b=1zUsuEvwBMoU4VodGsj+FLk3lcIZ6A5cyd97gr2gs0JfVZ+JGAyTMlDf74UkxAcE2s
 mN64HDutIPPgMx9BOIU8vysohQGBavPVXy6NWx7St7Xeu/sfXkuM+Xf8DlYQ60H4wQJJ
 H+BvYBfHi3MT1yNslE1ClKpeoCM0lOv0Afa6/gPn5Gz7DEO31MixaH1KIH/7yrkQ17hN
 C5xUI/YsKLeh/lwrl+eGW4Joq+u1I7i5DCtiGMD9h3QU5vATpsc5XbvrSS4K3AZx0ZXn
 TeWKx1G/e2ihdiZAdl/r7XDkgVd2GjLCT8twNwcF4ENC7x5m0kW03icqYdx+PLUGou+5
 lyeA==
X-Gm-Message-State: AOAM530k8lsS28rzW9dnAGnLT+t12mgmOYEMk/Ec6RMuYIgTQcgVxe/q
 VZ5fJ9pLtg72k8+Otw/pshY=
X-Google-Smtp-Source: ABdhPJz35SMgCBKn89U2TeR3wAO1A5BYzDKuYFiHM28UBV3LJTNt30dV7RfWFccz4LEYY7RMeNW9Kw==
X-Received: by 2002:a17:902:7204:b0:14f:b325:7658 with SMTP id
 ba4-20020a170902720400b0014fb3257658mr2675535plb.110.1645711502881; 
 Thu, 24 Feb 2022 06:05:02 -0800 (PST)
Received: from [192.168.223.175] (140.red-193-152-126.dynamicip.rima-tde.net.
 [193.152.126.140])
 by smtp.gmail.com with ESMTPSA id t15sm2647302pgu.13.2022.02.24.06.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 06:05:02 -0800 (PST)
Message-ID: <739406f5-56a7-c94f-c800-0c050c8c936f@gmail.com>
Date: Thu, 24 Feb 2022 15:04:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 07/12] mos6522: add register names to register
 read/write trace events
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 qemu-devel@nongnu.org
References: <20220224115956.29997-1-mark.cave-ayland@ilande.co.uk>
 <20220224115956.29997-8-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220224115956.29997-8-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 24/2/22 12:59, Mark Cave-Ayland wrote:
> This helps to follow how the guest is programming the mos6522 when debugging.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/misc/mos6522.c    | 10 ++++++++--
>   hw/misc/trace-events |  4 ++--
>   2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index 093cc83dcf..aaae195d63 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -36,6 +36,12 @@
>   #include "qemu/module.h"
>   #include "trace.h"
>   

I'd feel safer adding:

   #define MOS6522_IOSIZE 0x10

> +static const char *mos6522_reg_names[16] = {

Then here:

    ... mos6522_reg_names[MOS6522_IOSIZE] ...

> +    "ORB", "ORA", "DDRB", "DDRA", "T1CL", "T1CH", "T1LL", "T1LH",
> +    "T2CL", "T2CH", "SR", "ACR", "PCR", "IFR", "IER", "ANH"
> +};
> +
>   /* XXX: implement all timer modes */
>   
>   static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
> @@ -310,7 +316,7 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
>       }
>   
>       if (addr != VIA_REG_IFR || val != 0) {
> -        trace_mos6522_read(addr, val);
> +        trace_mos6522_read(addr, mos6522_reg_names[addr], val);
>       }

And finally:

-- >8 --
@@ -478,7 +478,8 @@ static void mos6522_init(Object *obj)
      MOS6522State *s = MOS6522(obj);
      int i;

-    memory_region_init_io(&s->mem, obj, &mos6522_ops, s, "mos6522", 0x10);
+    memory_region_init_io(&s->mem, obj, &mos6522_ops, s, "mos6522",
+                          MOS6522_IOSIZE);
      sysbus_init_mmio(sbd, &s->mem);
      sysbus_init_irq(sbd, &s->irq);

---

Regardless:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


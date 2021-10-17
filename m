Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6144309F3
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Oct 2021 17:10:47 +0200 (CEST)
Received: from localhost ([::1]:39524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mc7oE-0003sh-AD
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 11:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mc7lw-0002oY-UR; Sun, 17 Oct 2021 11:08:25 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mc7lt-0006iE-WE; Sun, 17 Oct 2021 11:08:24 -0400
Received: by mail-wr1-x436.google.com with SMTP id e3so36100536wrc.11;
 Sun, 17 Oct 2021 08:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i+u8FRU7kdRK4Ee8DvlELkVGjRjvfkFu9EXe/Z9ecZs=;
 b=phUkSHl/oaRD8X92M2Le6z1opyjOQjeRpVcltW4afkH1MoO+vuD5gk3wtxD3L0W330
 asytJ3GX5jlNpr98WT3BU5qWTs71lQNJUJVTDLRIWepne4qQfP7IaHr2JHNp99feHlyv
 xPF8UDBlHOQA0VU/5lHuuDy01Yp/YDGi9M1oCkcU6wJHxg9UXJX21Dw1u38rndJvSmad
 uryRP81UtsiW3OuS+s7TCXhPOnUEfrjluvjRFzOELQqLB9L4QPC/isEosEgyw84m2zfz
 g/65ffChdMqVc5zG4Tk7m4PgMaLdoNyaeHhDz1okEuQe/8pQ+2lNqo23pXy8GSJXjhNx
 MkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i+u8FRU7kdRK4Ee8DvlELkVGjRjvfkFu9EXe/Z9ecZs=;
 b=5gn5BPqIhzDgG/97Op8gbwJ268wyddFZYe+q92mtchl9qiUZoZx20PyYjnu5O/yrsb
 98U2NSXj38lxGho9OxnpPyOZR0+kb6YmEVWBRC/I3dhM9uzxDJtk09CacFwWGzt0CzMP
 wAb2Sw0sBro/A84JEureN5fnbjxUKHBoTwPH17Qc84wLCiaXQoB7ySIyiEWQNq414S82
 UHCVVLoPML7wMr/bvQ/ZxuzTTDsfkm+0vrY8+yF5yzNPwZc4bQuftPIACnhDekAR/00o
 2uxzSvzI3WadOebO5pEPX5La0bhdTxUjgIe9NSCPxUkjIcw11831KCJ/Mf0eCI6DUxXA
 vhMQ==
X-Gm-Message-State: AOAM533ONVJVPUEoT1JZ2SuBZYeBDkj8P1WFTw0P+bZPSSWKpnLh6sS6
 C6Z2jbMXzma4S1jYg7LiROY=
X-Google-Smtp-Source: ABdhPJxVdjiAUK76n/EJK/Q+7CRlPm4Bvzx+3F7t2getEza//JHFO91UWXSjhAcUqms4sM0rfD890Q==
X-Received: by 2002:adf:e749:: with SMTP id c9mr19241327wrn.272.1634483299605; 
 Sun, 17 Oct 2021 08:08:19 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id c7sm12577112wmq.13.2021.10.17.08.08.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 08:08:18 -0700 (PDT)
Message-ID: <0615f4a3-fba0-bb59-2405-4e1a080f8166@amsat.org>
Date: Sun, 17 Oct 2021 17:08:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] hw/misc/bcm2835_property: Fix framebuffer with recent
 RPi kernels
Content-Language: en-US
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <5283e2811498034cc2de77f10eb16b9cd67a0698.camel@kernel.crashing.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <5283e2811498034cc2de77f10eb16b9cd67a0698.camel@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Benjamin,

On 10/17/21 09:48, Benjamin Herrenschmidt wrote:
> The framebuffer driver fails to initialize with recent Raspberry Pi
> kernels, such as the ones shipped in the current RaspiOS images
> (with the out of tree bcm2708_fb.c driver)

Which particular version?

> 
> The reason is that this driver uses a new firmware call to query the
> number of displays, and the fallback when this call fails is broken.
> 
> So implement the call and claim we have exactly one display
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>  hw/misc/bcm2835_property.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index 73941bdae9..b958fa6a5c 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -269,6 +269,10 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>              stl_le_phys(&s->dma_as, value + 12, 0);
>              resplen = 4;
>              break;
> +        case 0x00040013: /* Get num displays */
> +            stl_le_phys(&s->dma_as, value + 12, 1);
> +            resplen = 4;
> +            break;
>  
>          case 0x00060001: /* Get DMA channels */
>              /* channels 2-5 */
> 

I carry (among others) this patch for the raspi4:

-- >8 --
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 3b3f5a804d9..8bd149211af 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -36,6 +36,7 @@ static void
bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
      */
     BCM2835FBConfig fbconfig = s->fbdev->config;
     bool fbconfig_updated = false;
+    int fbconfig_idx = 0;

     value &= ~0xf;

@@ -290,6 +291,25 @@ static void
bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             resplen = 4;
             break;

+        case 0x00040013: /* Get number of displays */
+            stl_le_phys(&s->dma_as, value + 12, 0 /* old fw: unique
display */);
+            resplen = 4;
+            break;
+
+        case 0x00048013: /* Select display  */
+            fbconfig_idx = ldl_le_phys(&s->dma_as, value + 12);
+            if (fbconfig_idx) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "bcm2835_property: Only one display
implemented,"
+                              " requested display #%d\n", fbconfig_idx);
+            }
+            resplen = 4;
+            break;
+
+        case 0x00040014: /* Get display settings */
+            resplen = 0; /* as old fw we don't support that */
+            break;
+
         case 0x00060001: /* Get DMA channels */
             /* channels 2-5 */
             stl_le_phys(&s->dma_as, value + 12, 0x003C);
---

FYI I plan to respin Alex's recent series with these patches:
https://lore.kernel.org/qemu-devel/20211004134742.2044280-1-alex.bennee@linaro.org/
as soon as I get some time...


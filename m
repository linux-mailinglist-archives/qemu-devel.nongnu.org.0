Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C17F65F62D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 22:49:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDY6a-0002jb-AL; Thu, 05 Jan 2023 16:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDY6S-0002j1-Ey
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:48:48 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDY6Q-0004aL-II
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:48:47 -0500
Received: by mail-wr1-x42f.google.com with SMTP id m7so2990094wrn.10
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 13:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yqdC+oc99KuiOltyxQMY22Jo2Lp2DJsDJqSD7vgv+9g=;
 b=CTQsT9Liucj5YTWeubRmS9PnRuhBHySJqqCFJrcy0yxh7Ql1tW8FL7nX2L0I68vdrb
 P/xnQCjhYbuuQAS/kuQjo1yQ8Z5IEWGE9TIrGOGjNe3viVmGEY46KngOGxq3y/BZ357p
 GwqlN5VbFAUahL7wtWD1l0dVWN6XFqp8qjo0jQP+XKeED5bIo6Ibgvci8T9ZzAxx76H+
 +pTzP4LAPUYKVDGfcMOrX+cLP6KrPYtk13KRHQ0R09IhkfOzBa0bhEdxIqwlaTzCe3K4
 4KepN99Q8BrklcI3sOJVNNC3gCoJ4Iw7Z13vRxWiomiw7AQvL7gbYCAmZofoUJnuSyU+
 lg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yqdC+oc99KuiOltyxQMY22Jo2Lp2DJsDJqSD7vgv+9g=;
 b=KMFiYwMs1ow2ZAUMWX/D2OzCBE52tKq77ODvwXAS4uJsGdzcpFwD/xjC4NahY22xtY
 lPGtC2ZP+NeN3YYYPzYTFlH4i3bPNeqZnNLu/Vvv024+GK6hJ47WM+YlqLzSv6e5aYn1
 7vSGG8H9aoF5Nn3IuVg55YDPwOUMoYNsTlmDK6ftq/B9uIX6v6HqGeeRsuL+8la+fHLk
 387MshpbXXkKz3fkM6awCj/xK5QB3i4xr2B6UQAhG9oTVR8/Nl6/8+lO23JJcmWiZOND
 J62x9fYOcFSWq6xHeyxSVjMeO1qHdC0KaM57ufr9mSBobx0eTxgJtOfRE7svY9nmdpFW
 +JzA==
X-Gm-Message-State: AFqh2kqW/TwmNBQ+Gi2eeaHYseaoiBFeu+BA+Bt1WVFRhKVchzG6KTiX
 a11KQ01wGpxqLEaMdn+Z7KrOXA==
X-Google-Smtp-Source: AMrXdXsV5Vp+w3ajdXlP2TYoFTXxHsfniq/NlnE2HazBf5228HiRhAWrxhhMu9fFZAy7C+rJ01SHow==
X-Received: by 2002:adf:f983:0:b0:2b9:28ef:24d8 with SMTP id
 f3-20020adff983000000b002b928ef24d8mr631644wrr.51.1672955324556; 
 Thu, 05 Jan 2023 13:48:44 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a056000124600b0029100e8dedasm17726221wrx.28.2023.01.05.13.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 13:48:44 -0800 (PST)
Message-ID: <611df9d8-b3d6-9879-5d51-cc63aff1c807@linaro.org>
Date: Thu, 5 Jan 2023 22:48:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 13/40] hw/arm/bcm2836: Set mp-affinity property in
 realize
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103181646.55711-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/1/23 19:16, Richard Henderson wrote:
> There was even a TODO comment that we ought to be using a cpu
> property, but we failed to update when the property was added.
> Use ARM_AFF1_SHIFT instead of the bare constant 8.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/arm/bcm2836.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 24354338ca..abbb3689d0 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -130,8 +130,11 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
>           qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-fiq", 0));
>   
>       for (n = 0; n < BCM283X_NCPUS; n++) {
> -        /* TODO: this should be converted to a property of ARM_CPU */
> -        s->cpu[n].core.mp_affinity = (bc->clusterid << 8) | n;
> +        if (!object_property_set_int(OBJECT(&s->cpu[n].core), "mp-affinity",
> +                                     (bc->clusterid << ARM_AFF1_SHIFT) | n,
> +                                     errp)) {
> +            return;
> +        }
>   
>           /* set periphbase/CBAR value for CPU-local registers */
>           if (!object_property_set_int(OBJECT(&s->cpu[n].core), "reset-cbar",

Eh I have almost the same patch locally:

-- >8 --
$ git show 5f675655c844154f3760967296e82adf5d8d7c24
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 24354338ca..6f964a3b31 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -130,8 +130,8 @@ static void bcm2836_realize(DeviceState *dev, Error 
**errp)
          qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-fiq", 0));

      for (n = 0; n < BCM283X_NCPUS; n++) {
-        /* TODO: this should be converted to a property of ARM_CPU */
-        s->cpu[n].core.mp_affinity = (bc->clusterid << 8) | n;
+        object_property_set_int(OBJECT(&s->cpu[n].core), "mp-affinity",
+                                (bc->clusterid << 8) | n, &error_abort);

          /* set periphbase/CBAR value for CPU-local registers */
          if (!object_property_set_int(OBJECT(&s->cpu[n].core), 
"reset-cbar",
---

Yours is better (ARM_AFF1_SHIFT & checks return value).

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



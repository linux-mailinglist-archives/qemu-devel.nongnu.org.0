Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A508131A00D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 14:47:39 +0100 (CET)
Received: from localhost ([::1]:42822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAYnK-0008Q0-9K
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 08:47:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAYlH-0007Yw-BT
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 08:45:31 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:42876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAYlA-0002jX-CR
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 08:45:31 -0500
Received: by mail-ej1-x631.google.com with SMTP id z19so2466506eju.9
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 05:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=9cKkSa7m+8IPtWG/STQauGhQz7dudn/gIsTyWpHKE+Y=;
 b=rI1g7imPM0ocCtlsaZ6g71qJaRsvvZmqXxbC7K5zRLgY6du5Ktsr3mxCEXq0sLeA2Y
 8IaeFb87rs1wa5lF7Fi/wAmZ3o4lUvE0kqxEK/omHetuCXEbPkgDi+A5ic0P5bmBYO29
 5f1YvsH3xFc2+gqDNhB9D5mlkLH2zo72KNC/bjTpfWsOM/FB4G8Dgd4/rm8BnMte/xVx
 1vZLWJiYEO3kxVOYfX33Z6ZhcLYBWCb7GQ4OXTw0Fl4eeAHVLUqpRaB+Rgj8KgLCdvZN
 HvA96h6ZXKS5M2Ez+k4jM1Zsvs6TJpV1LMoT8mXQVrjPK11XNMHJHezKDucx7JCP1OBm
 B2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=9cKkSa7m+8IPtWG/STQauGhQz7dudn/gIsTyWpHKE+Y=;
 b=dwNhYgeYQpVXjrg+xbRBfSXDI2SF99vocpaw9AD3JYbq7FPbqUijfh1PTlCJ/gKBEQ
 lBuR7L4zPOerQr9adTI4y/KOZBamGAhZMUVucUW+Y9vux7TSvKwdsuVIBzHp+0eRmcbj
 EIDGB4jNQ/AWZYeZhPE2OoTVYWBqN+RX67gQqaR/NVJG7INk1rYraisAL0w8ilYWm7Nu
 11xYuDHHZZdg/CjCRa0Crs/rBNdOXSuxzr9ZZv+rSDyFuDpKcMeMEjZCkIVUYGLrPP8G
 FUGB5H6+/syM4uo6YwNcIE2fOGp012dqJrcATX1QyMwU/qYoW82R2vQpLRt2FKsOz0Kj
 WljA==
X-Gm-Message-State: AOAM530gBjX9E4ELg2Rl0yGSs9t3y7H3xOMROZgkeqVLfKsb/QvfD3nA
 XwCs5u8GF6PD5sMlWoCVsUukn1pOCfbEcpDKYEW2Uw==
X-Google-Smtp-Source: ABdhPJzUgKVwHB7XLB3t5iTlXOlQQ2/7tr0Inv8nCRVbkHMqMKIOwo5R+05PDxM/+8jnGKiBvQwxakiouiuhSVVSypk=
X-Received: by 2002:a17:907:98c3:: with SMTP id
 kd3mr3152486ejc.482.1613137522538; 
 Fri, 12 Feb 2021 05:45:22 -0800 (PST)
MIME-Version: 1.0
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-7-peter.maydell@linaro.org>
In-Reply-To: <20210205170019.25319-7-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Feb 2021 13:45:11 +0000
Message-ID: <CAFEAcA-YqMQATkQXFZHQNy0-JeO2cFvmuHdnhF1+TWAHgf+tcQ@mail.gmail.com>
Subject: Re: [PATCH 06/24] hw/misc/mps2-fpgaio: Support SWITCH register
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 5 Feb 2021 at 17:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> MPS3 boards have an extra SWITCH register in the FPGAIO block which
> reports the value of some switches.  Implement this, governed by a
> property the board code can use to specify whether whether it exists.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/misc/mps2-fpgaio.h |  1 +
>  hw/misc/mps2-fpgaio.c         | 10 ++++++++++
>  2 files changed, 11 insertions(+)

I changed my mind about the property/struct field name here, I think
"has" is what we tend to use rather than "have". Trivial change
to squash into this patch:

diff --git a/include/hw/misc/mps2-fpgaio.h b/include/hw/misc/mps2-fpgaio.h
index 83c6e18a4ee..0d3c8eef56c 100644
--- a/include/hw/misc/mps2-fpgaio.h
+++ b/include/hw/misc/mps2-fpgaio.h
@@ -38,7 +38,7 @@ struct MPS2FPGAIO {
     MemoryRegion iomem;
     LEDState *led[MPS2FPGAIO_MAX_LEDS];
     uint32_t num_leds;
-    bool have_switches;
+    bool has_switches;

     uint32_t led0;
     uint32_t prescale;
diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index b54657a4f07..acbd0be9f4b 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -158,7 +158,7 @@ static uint64_t mps2_fpgaio_read(void *opaque,
hwaddr offset, unsigned size)
         r = s->pscntr;
         break;
     case A_SWITCH:
-        if (!s->have_switches) {
+        if (!s->has_switches) {
             goto bad_offset;
         }
         /* User-togglable board switches. We don't model that, so report 0. */
@@ -327,7 +327,7 @@ static Property mps2_fpgaio_properties[] = {
     DEFINE_PROP_UINT32("prescale-clk", MPS2FPGAIO, prescale_clk, 20000000),
     /* Number of LEDs controlled by LED0 register */
     DEFINE_PROP_UINT32("num-leds", MPS2FPGAIO, num_leds, 2),
-    DEFINE_PROP_BOOL("have-switches", MPS2FPGAIO, have_switches, false),
+    DEFINE_PROP_BOOL("has-switches", MPS2FPGAIO, has_switches, false),
     DEFINE_PROP_END_OF_LIST(),
 };

thanks
-- PMM


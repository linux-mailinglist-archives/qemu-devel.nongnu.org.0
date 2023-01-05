Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867DE65EACF
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 13:39:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDPFn-0001x7-1Y; Thu, 05 Jan 2023 07:21:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDPFk-0001vC-UC
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:21:48 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDPFi-0004pE-C6
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:21:47 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 n65-20020a17090a2cc700b0021bc5ef7a14so1885417pjd.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 04:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wSbohjQFOFcZIW8WgzeUD31/UXv5Ig2v5luEIJLWhr0=;
 b=GhFZentPZIggZxK/p0xAg+7hdvpqBeudsXWz04dUJPDJ29eARcUZ6Oql88BP+OYGcJ
 aExI9HmlAfkwmVJGMtrLDbNNW7KXCcVWk4IlO2bAXg+DlSepp9vG6nvoqo+AOHQ/9I2y
 +P3MtjJijtuSp96pPX3IN/KdtsmQPtqH9mvBq2EnbF6aW97d0QpodkQZWzeMH7RNjCxr
 bO505itQQWGk9cgG/4nNL1gJs1UnU//H4A4wX5fy7jD7KVYke0iSWsMBhKCLG+wAEI4f
 CevS/7cNtM4dD6gNZcsS+MKu2oTD1T+FSRzIM7r0IiyZY5dPUKm32Y7agaVmmc9PvkU4
 ZahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wSbohjQFOFcZIW8WgzeUD31/UXv5Ig2v5luEIJLWhr0=;
 b=IGhoIoVEYDjlqYGSVMYTpBxSJN/zGgHK8hMtGOADFx6gFX+68hJwufou4d8orBHiwW
 iVjTTA0ZWMkny/8ZIk1HmoN6EkFBSMh3mxp1DakyIdh/SUrY3vqKgz+2FbhsNz2erQvP
 SoREtOPiXkHThw2zRBLq+rnpTE0xTRnODe2ZgglHovR9QHhPZdUBw1oF4OvdlOBTLF7L
 y7ChScdz1CvTwKmxtm5WgIziMIvIBfK8rAy1cqDK3cPQrw4WTAqPCHjJd/HEClaLHtP7
 BD+lx6q9X0sGYzhC8kcND9IjTjkXPiLlT2zraKEdKtu6bcECEyUOshrcYn8FJWxjU/IC
 GN7w==
X-Gm-Message-State: AFqh2koz71i8H0CaovEBJYrasngqdxdh0as0cEoRSybeXiHdBri+/2qx
 5T7CjHOZPz3pcl49b9Z08BqDcOxb3PGQWwzYprHCPg==
X-Google-Smtp-Source: AMrXdXta2gDNv1TGJYjj0R7SN4PqlJZJWXyO94gD/jzek3XhxwyF12hnfKiQhDHGUlbEZlu1w8i/i2iDc7yFViSNQeI=
X-Received: by 2002:a17:903:2653:b0:189:cdc8:7261 with SMTP id
 je19-20020a170903265300b00189cdc87261mr3436441plb.168.1672921304388; Thu, 05
 Jan 2023 04:21:44 -0800 (PST)
MIME-Version: 1.0
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <166990932074.29941.8709118178538288040-8@git.sr.ht>
In-Reply-To: <166990932074.29941.8709118178538288040-8@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 12:21:32 +0000
Message-ID: <CAFEAcA8u-RdHJGw61tN=qkWwwLsDgm0o=BZsEhBKA__cnmw9yw@mail.gmail.com>
Subject: Re: [PATCH qemu.git v3 8/8] hw/timer/imx_epit: fix compare timer
 handling
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 1 Dec 2022 at 15:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> - fix #1263 for CR writes
> - rework compare time handling
>   - The compare timer has to run even if CR.OCIEN is not set,
>     as SR.OCIF must be updated.
>   - The compare timer fires exactly once when the
>     compare value is less than the current value, but the
>     reload values is less than the compare value.
>   - The compare timer will never fire if the reload value is
>     less than the compare value. Disable it in this case.
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>

There's a couple of minor code-style issues here (block comment
format, variable declarations in the middle of a block); rather
than asking you to re-roll the series I'll just squash in the
fixes for those:

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 663907f9cf9..f63d3a20830 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -161,7 +161,8 @@ static void imx_epit_update_compare_timer(IMXEPITState *s)
 {
     uint64_t counter = 0;
     bool is_oneshot = false;
-    /* The compare timer only has to run if the timer peripheral is active
+    /*
+     * The compare timer only has to run if the timer peripheral is active
      * and there is an input clock, Otherwise it can be switched off.
      */
     bool is_active = (s->cr & CR_EN) && imx_epit_get_freq(s);
@@ -233,19 +234,22 @@ static void imx_epit_write_cr(IMXEPITState *s,
uint32_t value)
          */
         imx_epit_reset(s, false);
     } else {
-        ptimer_transaction_begin(s->timer_cmp);
-        ptimer_transaction_begin(s->timer_reload);
-        uint32_t freq = imx_epit_get_freq(s);
-        if (freq) {
-            ptimer_set_freq(s->timer_reload, freq);
-            ptimer_set_freq(s->timer_cmp, freq);
-        }
+        uint32_t freq;
         uint32_t toggled_cr_bits = oldcr ^ s->cr;
         /* re-initialize the limits if CR.RLD has changed */
         bool set_limit = toggled_cr_bits & CR_RLD;
         /* set the counter if the timer got just enabled and CR.ENMOD is set */
         bool is_switched_on = (toggled_cr_bits & s->cr) & CR_EN;
         bool set_counter = is_switched_on && (s->cr & CR_ENMOD);
+
+        ptimer_transaction_begin(s->timer_cmp);
+        ptimer_transaction_begin(s->timer_reload);
+        freq = imx_epit_get_freq(s);
+        if (freq) {
+            ptimer_set_freq(s->timer_reload, freq);
+            ptimer_set_freq(s->timer_cmp, freq);
+        }
+
         if (set_limit || set_counter) {
             uint64_t limit = (s->cr & CR_RLD) ? s->lr : EPIT_TIMER_MAX;
             ptimer_set_limit(s->timer_reload, limit, set_counter ? 1 : 0);

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


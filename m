Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0C06379D6
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 14:22:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyCAn-0004dP-Aw; Thu, 24 Nov 2022 08:21:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyCAO-0004a4-S8
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 08:21:27 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyCAM-0002Qd-0S
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 08:21:24 -0500
Received: by mail-pl1-x634.google.com with SMTP id w23so1437859ply.12
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 05:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RwHzreGyIzzdCuWhTrQISP4P1Fj6K6m2SLtpLnUL9Rw=;
 b=JNSykzfkF9B84QcSbzkhD4XHXijFKPbEKv14qgiDvxHyEewsgI9HKD1V0+GPW/1h3u
 Bkv35LQ0AgjyFdXBa16u6F4MTWG7d/A03QVgFTO0ofVsgiQfch/mNUShnM6PwvixRggK
 842AXDTsSfxXn5yWg80MZa4lIy1/y089E4qhQcOFVKzprn7cW6SJ0TESTOJuFtJ1r15x
 ooizfJIwv5xJynIZhhxkcb8IxUoKLGSRbLvljA79QFJb4KPc545F1oiP5hY80wvLzB1F
 y75Qq5y60Uavxi3zYxJ5lEbIoZyvx6p01neKcbc7Jz9eBUX92CcWuO3cE2Kzww20YDea
 FHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RwHzreGyIzzdCuWhTrQISP4P1Fj6K6m2SLtpLnUL9Rw=;
 b=6qfEoNzsJcEr3XBsAh5fVVJ084WzPuLfCGz2vn5P2AK42vy02d+az+JsrJBu/D4XAK
 4PuuwGMfypWLE1hIQCGhon4olAbRZ9TTWzFtmR0gxaH3/lugJ/HMaAe8xsyN9tWpAHF6
 qHfZUCXpJMHclrRjUwCIUoPnG5EfYqYBVWHdgJSVkDFfsqfnFf9zCJd+1d+8Ln/hX7Bv
 7zDKB4X36TTD6JRrGv6HXWhgxQKxXrvMJP85FcTY56yPKE3NMJXAXkPa1WxSLpYMMWzj
 Suych2xZ3Fc79EaiFz0YjDQNpxSOZrWGkt64nUuh0jhqTjyPV0JcWqkibyCBKyMKamPj
 xYNw==
X-Gm-Message-State: ANoB5pljl9N0V6PrE/rwPvZuH6jbzDyy2ewywSy3KkuF6bM0s1OjPSdx
 S2FGjAUbpmJ9Enyob7VYPUmD7phtpwfTgGHu1YV/Gg==
X-Google-Smtp-Source: AA0mqf7GPw+M2VO97K1D1E31uIyH9xv35tVnL4+TBKbvDuvRcNwF/7b/s0RnnUYb0sC6jIzhcWHAchIYIfqxh9Pioe4=
X-Received: by 2002:a17:90a:7003:b0:212:f169:140e with SMTP id
 f3-20020a17090a700300b00212f169140emr34622513pjk.215.1669296075775; Thu, 24
 Nov 2022 05:21:15 -0800 (PST)
MIME-Version: 1.0
References: <20221123095445.31970-1-mark.cave-ayland@ilande.co.uk>
 <20221123095445.31970-2-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20221123095445.31970-2-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Nov 2022 13:21:04 +0000
Message-ID: <CAFEAcA-3sfsCDA7O8y_fa=amKSCBO0CW6y4=ci_rrqkm=D8xaw@mail.gmail.com>
Subject: Re: [PATCH 1/1] tcg: convert tcg/README to rst
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, 23 Nov 2022 at 09:54, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Convert tcg/README to rst and move it to docs/devel as a new "TCG Intermediate
> Representation" page. There are a few minor changes to improve the aesthetic
> of the final output which are as follows:
>
>   - Rename the title from "Tiny Code Generator - Fabrice Bellard" to "TCG
>     Intermediate Representation"
>
>   - Remove the section numbering
>
>   - Add the missing parameters to the ssadd_vec operations in the "Host
>     vector operations" section
>
>   - Change the path to the Atomic Operations document to use a proper
>     reference
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>



> +   * - ctpop_i32/i64 *t0*, *t1*
> +
> +     - .. line-block::
> +          *t0* = number of bits set in *t1*
> +
> +          With *ctpop* short for "count population", matching
> +          the function name used in ``include/qemu/host-utils.h``.

Because we're using line-block, any newline is a literal newline.
This causes some odd looking linebreaks because you get a linebreak
both where it is in the input (after "matching") and again when
the browser auto-wraps long lines. I think it would be better
to not use line-block at all. Instead, we can just put in a blank
line when we want a line break, like this:

diff --git a/docs/devel/tcg-ops.rst b/docs/devel/tcg-ops.rst
index 0d90f3f7a00..e8a51ed1459 100644
--- a/docs/devel/tcg-ops.rst
+++ b/docs/devel/tcg-ops.rst
@@ -252,8 +252,9 @@ Arithmetic

    * - rem_i32/i64 *t0*, *t1*, *t2*

-     - .. line-block::
+     -
           *t0* = *t1* % *t2* (signed)
+
           Undefined behavior if division by zero or overflow.

    * - remu_i32/i64 *t0*, *t1*, *t2*
@@ -339,8 +340,9 @@ Shifts/Rotates

    * - shl_i32/i64 *t0*, *t1*, *t2*

-     - .. line-block::
+     -
           *t0* = *t1* << *t2*
+
           Unspecified behavior if *t2* < 0 or *t2* >= 32 (resp 64)

    * - shr_i32/i64 *t0*, *t1*, *t2*

This will result in slightly more whitespace between lines
in a few places, but I think it's nicer than the mis-wrapped
paragraphs.

If you really want to keep the line-block formatting, I think
you need to use the vertical-bar version, which lets you
specify which lines of the source are really new lines
(they have a '|' at the start), and which are just continuations
of the same line (they start with a ' ' instead), like this:

@@ -325,11 +325,11 @@ Logical

    * - ctpop_i32/i64 *t0*, *t1*

-     - .. line-block::
-          *t0* = number of bits set in *t1*
-
-          With *ctpop* short for "count population", matching
-          the function name used in ``include/qemu/host-utils.h``.
+     -
+       |   *t0* = number of bits set in *t1*
+       |
+       |   With *ctpop* short for "count population", matching
+           the function name used in ``include/qemu/host-utils.h``.


But I'm not sure it's really worth the effort.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


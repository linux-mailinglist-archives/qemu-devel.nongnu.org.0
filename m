Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8786D2FB596
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 12:14:37 +0100 (CET)
Received: from localhost ([::1]:44294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1oy4-0005s1-4i
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 06:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1owy-0005Jj-VA
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 06:13:28 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:43364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1oww-0005LI-4J
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 06:13:28 -0500
Received: by mail-ej1-x62e.google.com with SMTP id a10so11297822ejg.10
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 03:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Va2ToqzuZXjLYTsrbZlOjg9ZDsVIJQMzTwvNuZq3HZY=;
 b=x40L2mUUILLpCyFJxOTslHgDR5TQOztFfbS9hrrx1LLz3sDUCFQQKGHxSLmgs26Q/1
 h37m5PxmJ90zHXZa8cWEykSmn2bOGPhUmM9TQs8mE0vPVxN4dvg1c+geIlD3J65fxWKq
 lcutKiv8akQkiu67TZ2c2LTgRoF2aYwM8zVucN/3/QIPwEqEQ8F41hSPSP3M2n5pCQV+
 bLLcr8M+3jenP8+70Z1yS1UUCFWiflu7M2mJM4nL9PMwayR1qkChpQFQ7IFd+dxPEOSr
 fdQnHESyzmQEnbnlQp7BVsi3dg15h2hB+h1/DWBiINHw2heXsm/iFLC9ZUaN9WbpJ0fy
 y18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Va2ToqzuZXjLYTsrbZlOjg9ZDsVIJQMzTwvNuZq3HZY=;
 b=WMeEzVih3ePfA2ZzSt7K4Y4Lv1kGwPhpCcB4UJnJd12rBKkwUSB79/x4kbTek6tGwU
 K8T581Jc2ZfDDRRsdO+Ui+l2loLgv+Ve6iHH1F08X4w1LzvJHGyjO1vyPqvJ1ljZL6vO
 oFCePU0CHdl/5KZ41vJOiz83imtPI5bX+M3VC5rxcTlS7xrwQPn1uBPRt+aGNfd5EqlK
 qHcyj/1zCWty7a76VCWOb28VDmRXiI+8+Hv8wy0sKkjkdLbQCZ5KTwzS5v3utLf3qM1b
 NNBjgi/7WTLnMnGdYHdxGVJfeGTYbpsrjc8BFUkS1i0Frmva2qYgcbDMq3VQFzl9PjVA
 12Vw==
X-Gm-Message-State: AOAM532ylTxiY3ugrwHeS2ZsKVRtAGfTSVG8wEqqrsDYynzh1ikmogpq
 NkHmhDuCc/9I9ommZP83E7JN9bi1mRufntUyhxo8bw==
X-Google-Smtp-Source: ABdhPJwyX2kKTa7Q9KQ0cgG99w7SHSB70vUN6mUhZB/w39G4U5fwq0ddottFpWIZByx8DNUrtSrckdzuLbUMRBvGK48=
X-Received: by 2002:a17:906:b215:: with SMTP id
 p21mr2578993ejz.407.1611054804458; 
 Tue, 19 Jan 2021 03:13:24 -0800 (PST)
MIME-Version: 1.0
References: <12681824.uLZWGnKmhe@basile.remlab.net>
In-Reply-To: <12681824.uLZWGnKmhe@basile.remlab.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 11:13:13 +0000
Message-ID: <CAFEAcA-S2-rvrKnH7Ew5OC7XHUmAX=VU5HKfFibaL_yCkj1Ejw@mail.gmail.com>
Subject: Re: [PATCHv5 00/19] ARMv8.4-A Secure EL2
To: =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Jan 2021 at 10:59, R=C3=A9mi Denis-Courmont
<remi.denis.courmont@huawei.com> wrote:
>
>         Hi,
>
> This adds Secure  EL2.
>
> Changes since version 4:
> - Fix NS unitialised in secure state stage 2 translation.
> - Remove EEL2 translation block flag in 32-bit mode.
> - Clarify comments on arm_is_el2_enabled().

Looking through this patchset, it's practically ready and only
needs a couple of very tiny tweaks, so rather than asking you to
roll a v6, I'm just going to apply it to target-arm.next and
make the tweaks in the process:

 * patch 6 needed adjustment on rebase as commit 00a92832f4532
   has already added definitions of the ID_AA64PFR0 fields;
   I dropped the now-duplicate part of the patch and adjusted
   the commit message to match

 * patch 17: added the change requested by RTH:
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2837,7 +2837,8 @@ static bool
msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
              */
             TCGv_i32 tcg_el;

-            if (dc_isar_feature(aa64_sel2, s)) {
+            if (arm_dc_feature(s, ARM_FEATURE_AARCH64) &&
+                dc_isar_feature(aa64_sel2, s)) {
                 /* Target EL is EL<3 minus SCR_EL3.EEL2> */
                 tcg_el =3D load_cpu_field(cp15.scr_el3);
                 tcg_gen_sextract_i32(tcg_el, tcg_el, ctz32(SCR_EEL2), 1);

    and corrected the patch subject line to
    "target/arm: Implement SCR_EL2.EEL2"

thanks
-- PMM


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C97C330CCA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 12:54:48 +0100 (CET)
Received: from localhost ([::1]:56950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJETH-0001q7-4r
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 06:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJERm-0001Ou-RI
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:53:15 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:35086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJERi-0001tp-M5
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:53:14 -0500
Received: by mail-ed1-x534.google.com with SMTP id p1so14294144edy.2
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 03:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=FU01dX9dJfxLKqnw6E1zpjQeCIbsLRweArcbI9YKZdM=;
 b=xw4AyXPtkRa0L0fU5K2gYKQWAhIhweTlnHY6w961k53DLl2fwHjYDghKFNip+4qP7l
 6ms6DAz2bImLj0xnIpK+95/bjmZYEZh2IQczJBpTcxGUhkWfZ65hE+zoDsOV4VHMnK/N
 BBm8feQ6XiRqmEhWiUjG5SBOw00T0SEQZxWbdwp1cMXuUOL1tPhiOoK1ZymYPexaPgqh
 ITGGPbQShb86gEl50C/iQSYAu2gA/k5v04yU/EtIVil2kxlXaBEMoPSQdvmQCu2UPPLZ
 yw+vd5BqorSMHuGzQsowBMNSd2JTRIIre264bLi+8NgBBLzNcHiylhZuPSd5B9th7Hpm
 M0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=FU01dX9dJfxLKqnw6E1zpjQeCIbsLRweArcbI9YKZdM=;
 b=BDZ9PXYk47rh6vc9ui9+5IFxtWbYzFbVj6koEt7nIkD2LAJzxbTSKdkEld3bQ5Z+JN
 h0e3pdQeNA4Zcv0ADlVbs7SOQi3gqxzPBFveyI2q7Y38pYx6ndJwKldqcwIgDFZ/ap9B
 E6OwvKeQ2Yy7wc/nsM685rLThzv/UUW/em3lvt+xs3koFOlptf4YuSnaEn6ENhuqIp7b
 MQpqBM49bD6KgNuRh6sIUQ+mjTzNtSW0nysQdUYkA63O/2xteyA6UwnteBrbAd1KTYIv
 qrVoo6bpDO2HW6RN5pfQ+LE0vAagQYO0+7ObsPWXpauv87MdaiFUiNZJIiGKfE8nV/1x
 im4A==
X-Gm-Message-State: AOAM533S5V4nEaG7pSPdPbQ5dz1XDMXZ7yTXSuHJy3wbAbsIYzWfvep9
 0dWVIBbRgK4Ew7TSH2RagWbSmjs9v6wk07wNrhuVs1LmrEKwhg==
X-Google-Smtp-Source: ABdhPJxg1oaslPJeMQjS0IFMGCPftUq5rhTslB4CsfQhNdd9Kp3qN9GI/bqS087RS0wckDGHmoLJw1QkkgAQOOEEjk4=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr21255872edt.251.1615204388538; 
 Mon, 08 Mar 2021 03:53:08 -0800 (PST)
MIME-Version: 1.0
References: <20210306135106.4961-1-peter.maydell@linaro.org>
In-Reply-To: <20210306135106.4961-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 11:52:52 +0000
Message-ID: <CAFEAcA_JYDvkPRtR0S=GAXk7ahU+YzeVFHReQY30N=zJ-Yk-Rw@mail.gmail.com>
Subject: Re: [PULL v2 00/49] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, 6 Mar 2021 at 13:51, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> v2: don't delete is_surface_bgr() definition, the ppc patches
> that drop use of it from sm501 haven't hit master yet.

I forgot about the "32 bit hosts don't allow guests to have 2GB
of RAM" thing; this minor fixup needs squashing into the 'add the
mps3-an524' patch. v3 coming up...

--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -155,6 +155,16 @@ OBJECT_DECLARE_TYPE(MPS2TZMachineState,
MPS2TZMachineClass, MPS2TZ_MACHINE)
 /* Slow 32Khz S32KCLK frequency in Hz */
 #define S32KCLK_FRQ (32 * 1000)

+/*
+ * The MPS3 DDR is 2GiB, but on a 32-bit host QEMU doesn't permit
+ * emulation of that much guest RAM, so artificially make it smaller.
+ */
+#if HOST_LONG_BITS == 32
+#define MPS3_DDR_SIZE (1 * GiB)
+#else
+#define MPS3_DDR_SIZE (2 * GiB)
+#endif
+
 static const uint32_t an505_oscclk[] = {
     40000000,
     24580000,
@@ -230,7 +240,7 @@ static const RAMInfo an524_raminfo[] = { {
     }, {
         .name = "DDR",
         .base = 0x60000000,
-        .size = 2 * GiB,
+        .size = MPS3_DDR_SIZE,
         .mpc = 2,
         .mrindex = -1,
     }, {


thanks
-- PMM


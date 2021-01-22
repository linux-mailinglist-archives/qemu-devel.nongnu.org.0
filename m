Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFB630110D
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 00:36:11 +0100 (CET)
Received: from localhost ([::1]:34668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l35yM-0005ZA-6e
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 18:36:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l35wy-00054y-U4
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 18:34:45 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:34032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l35wx-0007zY-B5
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 18:34:44 -0500
Received: by mail-ed1-x532.google.com with SMTP id d22so8492300edy.1
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 15:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fzwjDCDCUjioHSOa1u93wcSColF6PrwSaefAYbjDPL0=;
 b=XniOpDHQKj4ykCP0u3bqYAFYF3Oouu/vVh+60ZHgJEE3QZwAwJ3ZNIEk0EeJzJ8Xyn
 7jrKwFa91m8OcQPgGDNspIS/jANg5FRwhtUZodH6X7s/gnRbUUY1BS46xRJ64AHAiv9T
 G4vc9TMG8/7u2KVOZDdRK4IWEMeF1kMSoQbvQrK/KNKqCnYnARW9Xf7FqaWGQJCiH6OO
 hzzsorWYFfwEFC7qycC7cvX7A30rAHNMv/bjUTbl8p33HhgEkfUBzTDnySfMTp+FTG5F
 EdxXL9JWTToXHa43Wq+b4/N7ylRyqQKpTBb/njHzM91Nn+mQ9jgjQZ+lW7liwHh8CVSW
 IBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fzwjDCDCUjioHSOa1u93wcSColF6PrwSaefAYbjDPL0=;
 b=gTqKlUq3xw7qvICbRbnTyMWyTN4k/QQugRS7gWmPBzZZ0VKmUTpSMlWzlz/fmsZhfg
 TsUndmcplw2dg8f4lzQ0JIkxPdh/oXZk4W1MxpN3AFngJOGPrHDdMRFy7zHf5YVDk19y
 Bi+xM2/SN22sWivPW7Hp3cFR2wp51/Ax+xSCZU+tqoU8zQo/6Zc8kH2vFG/4Snlc+PzQ
 G2/YzrebNnFpv6QCgmkKrflYiENO+YRA5xAi8GcsroQo1iBOjnugEpQBrkL+r/TdXnB0
 9g3ZRWCTP1oQ/GagMMMP7fFJuWsg0s4uvR5yvLilc5TTR5eNTv9gvIUyCCJpX/xq1gfR
 dT/w==
X-Gm-Message-State: AOAM533l4NaAukNBW/fcISZi8Z6GgcGfkiiQ1ruUpjSj3G76ewIeWR9x
 2wddtdIENLmYSnK38sVT10gMD02KPvM6dxy1k6UWIA==
X-Google-Smtp-Source: ABdhPJxz0SULBZvj1V+a/bo03SdgZ847pc/GFIwk+ZHRqds2yIx/rfANH2AvwZicE7TF6SX8+qL9+p8v7FAJqaLaRFA=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr4877739edv.100.1611358480704; 
 Fri, 22 Jan 2021 15:34:40 -0800 (PST)
MIME-Version: 1.0
References: <20210122215222.8320-1-maxim.uvarov@linaro.org>
In-Reply-To: <20210122215222.8320-1-maxim.uvarov@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 23:34:29 +0000
Message-ID: <CAFEAcA87xy8uqUuJYugi3PO-n--7ntSAa7oqmKPS=ywf1PGxCw@mail.gmail.com>
Subject: Re: [PATCHv9 0/3] arm-virt: add secure pl061 for reset/power down
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Jose Marinho <Jose.Marinho@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Jan 2021 at 21:52, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
>  v9: - cosmetic changes (move if from patch2 to patch3, rename function n=
ame
>        and define).
>  v8: - use gpio 0 and 1, align dtb with kernel gpio-restart, gpio-powerof=
f,
>        change define names, trigger on upper front. (Peter Maydell).
>  v7: - same as v6, but resplit patches: patch 2 no function changes and r=
efactor
>         gpio setup for virt platfrom and patch 3 adds secure gpio.
>  v6: - 64k align gpio memory region (Andrew Jones)
>      - adjusted memory region to map this address in the corresponding at=
f patch
>  v5: - removed vms flag, added fdt  (Andrew Jones)
>      - added patch3 to combine secure and non secure pl061. It has to be
>        more easy to review if this changes are in the separate patch.
>  v4: rework patches accodring to Peter Maydells comments:
>         - split patches on gpio-pwr driver and arm-virt integration.
>         - start secure gpio only from virt-6.0.
>         - rework qemu interface for gpio-pwr to use 2 named gpio.
>         - put secure gpio to secure name space.
>  v3: added missed include qemu/log.h for qemu_log(..
>  v2: replace printf with qemu_log (Philippe Mathieu-Daud=C3=A9)
>
> This patch works together with ATF patch:
>         https://github.com/muvarov/arm-trusted-firmware/commit/886965bddb=
0624bdf85103efb2b39fd4eb73d89b
>
> Maxim Uvarov (3):
>   hw: gpio: implement gpio-pwr driver for qemu reset/poweroff
>   arm-virt: refactor gpios creation
>   arm-virt: add secure pl061 for reset/power down

Applied to target-arm.next, thanks. I realized we forgot the
documentation, so I'm going to squash this change in to patch 3:

--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -43,6 +43,8 @@ The virt board supports:
 - Secure-World-only devices if the CPU has TrustZone:

   - A second PL011 UART
+  - A second PL061 GPIO controller, with GPIO lines for triggering
+    a system reset or system poweroff
   - A secure flash memory
   - 16MB of secure RAM

-- PMM


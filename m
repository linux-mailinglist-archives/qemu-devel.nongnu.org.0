Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE405461D2C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 18:57:04 +0100 (CET)
Received: from localhost ([::1]:48294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrktj-0005cw-I2
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 12:57:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrkKx-0001zH-Hd
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:21:07 -0500
Received: from [2a00:1450:4864:20::330] (port=53921
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrkKw-0002K6-0s
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:21:07 -0500
Received: by mail-wm1-x330.google.com with SMTP id y196so15285869wmc.3
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 09:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5RrnYjNMt38EJB6I9tXoBQKMy+6wT5h2njOgbzJBwd0=;
 b=ve6f10yyfIQAajee46Efl3X9FRP/B3/jDbW7NHdz3uC/WvQZ7b+5a/6704E/Oryz1f
 mRF91v6g32NFlYmztfYlZAAjO2WjCXeN1nwqOYXB33T0My0ZdiRZK9D9AIV1K5ct4WZ6
 pM7kQTlG28fdn8hVZzXYvnCjM8R/5fXS6HC0sfWkHHwbTAjHyLLU33PbdWCZtNb6qOZd
 bwz3zRS1K6LN5x9WNUksjN58YOse0AjG99FV057fnv5FTcpybL2mdd9/U1EYEq6NHxlx
 hchc+IoXCD2TaN8QWyQ9nGXhoCyddBRVe3bsJDpEOWLUCsrs6q5kuTT2wBgPHA3AVPWL
 UA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5RrnYjNMt38EJB6I9tXoBQKMy+6wT5h2njOgbzJBwd0=;
 b=sau5QJFoEr4g8m4460YnnlIT4E4Eb/B3SD4c2Q3uObN0hyb7Ybq45egES8ZSxxaUBV
 qpKrXiojUhmF6RE4EMMF3U5tRItZeZq6jQabOV9I0tQtTWT7nh35K0v8fBiCS4Tl529Y
 rWFJy7m5JBXsNzbu4ykibMgAyuIo0Kdo17b2GCaeU7EsyQG6HrvkzicMeRe9xAtWKsmw
 XWyCZpz12CHkAkTBvwSUNxOQivWUt4KuAnM/cLk/F8JMnNg+XPiF3LCXt2wPxMOzEQ2X
 2JC5Z4p1sjszosg2DRb3zZHoB2MJHBBEkWnjeMigRgc8KEl9pdWmB9scQAOePhzBSjRr
 /L4w==
X-Gm-Message-State: AOAM533NbaRe9eN9vsfWRFrLpKQfjv0KiGEksTl44QEth5E8uZyby2qH
 ELE6tSNB6dI7N0eR30TACA2BfjpshiYHZjbQfV86sw==
X-Google-Smtp-Source: ABdhPJxNmiKxYn/R8VlLdk4hediVc95gkPE2ply1IaCEKnPaQ2csNxyrpU7kI+PVSbimdzOnmoyle7rTbB30AEvi89o=
X-Received: by 2002:a05:600c:1993:: with SMTP id
 t19mr38942533wmq.21.1638206464454; 
 Mon, 29 Nov 2021 09:21:04 -0800 (PST)
MIME-Version: 1.0
References: <253794259.1853610.1636478714403.ref@mail.yahoo.com>
 <253794259.1853610.1636478714403@mail.yahoo.com>
In-Reply-To: <253794259.1853610.1636478714403@mail.yahoo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 17:20:53 +0000
Message-ID: <CAFEAcA-0KLYpEVzaok77kyzq2BGfXtzTSrH3JFcTU_gKvFnQ5w@mail.gmail.com>
Subject: Re: SME : Please review and merge : hw/arm/aspeed: Added eMMC boot
 support for AST2600 image.
To: Shitalkumar Gandhi <shital_909@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_XBL=0.375,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Nov 2021 at 18:04, Shitalkumar Gandhi <shital_909@yahoo.com> wrote:
>
> Hi SME's,
>
> Please see the attached patch, which has been added to the boot eMMC image for AST2600 machine on QEMU.
>
> qemu should be run as follows:
>
> ./qemu-system-arm -m 1G -M ast2600-evb -nographic -drive
> file=mmc-evb-ast2600.img,format=raw,if=sd,index=2
>
> Tested: Booted AST2600 eMMC image on QEMU.
>
> Suggested-by: Troy Lee leetroy@gmail.com
> Reviewed-by: Troy Lee leetroy@gmail.com
> Reviewed-by: Andrew Jeffery andrew@aj.id.au
> Signed-off-by: Shitalkumar Gandhi shitalkumar.gandhi@seagate.com

Hi; thanks for this patch.

Fishing the patch out of the attachment, the diff is:

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index ba5f1dc5af..6a890adb83 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -148,7 +148,7 @@ struct AspeedMachineState {
         SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))

 /* AST2600 evb hardware value */
-#define AST2600_EVB_HW_STRAP1 0x000000C0
+#define AST2600_EVB_HW_STRAP1 (0x000000C0 | AST26500_HW_STRAP_BOOT_SRC_EMMC)
 #define AST2600_EVB_HW_STRAP2 0x00000003

 /* Tacoma hardware value */
-- 

I've CC'd the aspeed maintainers, but since this has Andrew's R-by tag already
I'll put this into my set of patches to apply via target-arm.next for 7.0
unless somebody objects.

thanks
-- PMM


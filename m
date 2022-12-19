Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07A4651047
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 17:24:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Iw4-0001Oe-5o; Mon, 19 Dec 2022 11:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7Iw2-0001LF-4O
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 11:24:14 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7Iw0-00071i-J8
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 11:24:13 -0500
Received: by mail-pg1-x530.google.com with SMTP id r18so6482314pgr.12
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 08:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qQOgQNEfd1WzX5EPD2Cgkpof9TAOJVzvD/fygDNgqxE=;
 b=Cod84tors/iJPKXPAPDtc2buRZOzLUos1cke/OJBUXKhJS/vlTFBjusO28JryZR4Po
 ZkeSy/KPGwQShSak1VTcopmErfVURbKah4zgFcIZH9tz7MzVJgZmTI+mgsrVVxYh8ibP
 +07I4UfjOATt6+5QhzoNvnlMxVuZlJah1pgdSGI0STkCKHklwT5L3ci2T68/p+CwgCJg
 hmkXRX0CB1Syb1SP5V2isOlImqvQjTDxNhvvy5mKmwuKdBZmFn0Ri11dEPvV4EiJKt8a
 wqX/aFnxrL5BEaVcyviJNK/SyYNQ14wjjsJP52+SjbW+UmIHeq1WFCLgsaXrCoOjpbNt
 fonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qQOgQNEfd1WzX5EPD2Cgkpof9TAOJVzvD/fygDNgqxE=;
 b=qNeh5NjKB74M0H587rnGOskI+skfpBE92y3h1MOxDHxccBtyIgmpMaJQ8HE4GIFzot
 AtLRP7RFohUcowsEA9q+WdHMawniyRKUneigCHsGVqsME48/riTRWCLgZdZHk6ORmW62
 W7Ut5y7zIPAGDlcU8D889DTgLs0yDf51yRMMUy45rOE96RNDKoZnEVNiL6wSIEtfuKXm
 pjrest+KSj+F/KpMzTMeSewyRFosu9Y6M5FROAle16yjSm5pkiHpPb7pBkVqo4LRIVR1
 NhaDLJiY67lYe/7PHOSyzpAgb790UXN3Jzau9kj3vsKOGBbmCBSqcfQ4wIdJcYrpW2Fr
 mJOA==
X-Gm-Message-State: ANoB5pm+8WEsPaRH5RNlEPwBCwjBmw0PcPBOJwBibo3W01FYsH0BmKfm
 gxNOxMNAnWPrpErMBu0/z9/eGG/8AAemlVJt1mjCug==
X-Google-Smtp-Source: AA0mqf6g9qvGLV7v0xFvf4a+3NRqQLnC5b6/fS6V4NmpGw94e3eSguqWxKeDcmuEbx0xwg5u0gk9+LktldUTTp8utyc=
X-Received: by 2002:a63:d20d:0:b0:479:18a:8359 with SMTP id
 a13-20020a63d20d000000b00479018a8359mr6668121pgg.105.1671467051177; Mon, 19
 Dec 2022 08:24:11 -0800 (PST)
MIME-Version: 1.0
References: <20221207021322.16165-1-vikram.garhwal@amd.com>
 <20221207021322.16165-4-vikram.garhwal@amd.com>
In-Reply-To: <20221207021322.16165-4-vikram.garhwal@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Dec 2022 16:24:00 +0000
Message-ID: <CAFEAcA-kiS3RJNVFuR=fnKQ6Dg5pWtqcW1zyJ4vnPpJtOjJ8Aw@mail.gmail.com>
Subject: Re: [QEMU][PATCH v3 3/4] xlnx-versal: Connect Xilinx VERSAL CANFD
 controllers
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, francisco.iglesias@amd.com, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x530.google.com
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

On Wed, 7 Dec 2022 at 02:13, Vikram Garhwal <vikram.garhwal@amd.com> wrote:
>
> Connect CANFD0 and CANFD1 on the Versal-virt machine and update xlnx-versal-virt
> document with CANFD command line examples.
>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  docs/system/arm/xlnx-versal-virt.rst | 31 ++++++++++++++++++
>  hw/arm/xlnx-versal-virt.c            | 48 ++++++++++++++++++++++++++++
>  hw/arm/xlnx-versal.c                 | 37 +++++++++++++++++++++
>  include/hw/arm/xlnx-versal.h         | 12 +++++++
>  4 files changed, 128 insertions(+)


> @@ -163,6 +170,11 @@ struct Versal {
>  #define MM_UART1                    0xff010000U
>  #define MM_UART1_SIZE               0x10000
>
> +#define MM_CANFD0                   0xff060000
> +#define MM_CANFD0_SIZE              0x10000
> +#define MM_CANFD1                   0xff070000
> +#define MM_CANFD1_SIZE              0x10000
> +
>  #define MM_GEM0                     0xff0c0000U
>  #define MM_GEM0_SIZE                0x10000
>  #define MM_GEM1                     0xff0d0000U
> --
> 2.17.1

I see this file is rather inconsistent about whether it
wants to use a 'U' suffix for 32-bit hex values where bit
31 is set. I don't think it makes a difference in practice.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


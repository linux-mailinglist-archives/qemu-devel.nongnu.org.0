Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383DB2B4B90
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:46:35 +0100 (CET)
Received: from localhost ([::1]:35286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keheD-0005bX-LZ
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:46:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kehQA-0008Ic-7k; Mon, 16 Nov 2020 11:32:05 -0500
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:38996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kehQ7-00078e-R6; Mon, 16 Nov 2020 11:32:01 -0500
Received: by mail-io1-xd44.google.com with SMTP id j23so2145161iog.6;
 Mon, 16 Nov 2020 08:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K0XipTWujXiNWwh8ZYB969l148TX9roKPYYgxCYiaik=;
 b=soqM/SeiBjs1po98yFsEc6eZjJaHud0shZWqp4lVZCNybDmDUQ+StFMJbEEth1PopS
 GSFNQiymVlRx+LFcszxLgJ1KbXin5Em1w0IMRi1781t87YCDwoOxtX/UEW5Byv2LNEu9
 LyUn0EdCkpXwLVp5nYBEwxgMOnhdJaN/cTre+cV8VGMDSatW1fgI+Aaor1qzTkzK8z/g
 k0cjTDOMldIiavVoUUiLh4fvhGZoP8acowCEDqBx16hmJI3mX8RSDRmXHLaG7++ZoTbV
 yLnr1ok+BOb8To0v0taPWdW49eqd0V9G9+Shs2EA+1N4m/G1QxwyKKw2LGXV8Et1pSJ4
 HUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K0XipTWujXiNWwh8ZYB969l148TX9roKPYYgxCYiaik=;
 b=JQYIl/FWgAVWRNHHMtoIuKeM9lKxSLNVR05iD62Vq//9NrLr+45NhjqLv7UznRqi+C
 xNWjvUONtzGxj0DtW8ckZ1+eu96zG8Pr15xmDT5KeByf8RyLuO5BFnUEy95jWZ5hkJ5u
 UhN/47paRxFLnlj5RD20K2otXdSXd6/LQbIpmETB2oZ2kyM3c5lYvrvXvM0yx02lUfZa
 TY4w64PUZeJnPvTcG1Aru7RFlfKZb4/SaImXr4RmSAG2IxXqhGtJzofQbc+oTqA6fdsg
 u5lb8gFkdzUncenKR6Lwi07fDIbZgc7Nq+3gqFpC5DwcAfUHFmfBVfMBZqsfwJ/PGDbp
 CJgg==
X-Gm-Message-State: AOAM530ZL+XFCEEB9/9CPjYBuO3j1UFVyn72xg8XR47L5mN/XYU4GxNO
 4sMmcDYlfprXsYL/R/lW5xvXlB5IkVvsAy48N08=
X-Google-Smtp-Source: ABdhPJw4Tt0gontzi6TchllUZw0PVS/DJrgBVTdeVT0Zid42pI+f0O7X9ZUSeTM6i0rBj9vi2Jjx36ZuIWWxWf2CMiM=
X-Received: by 2002:a02:ce26:: with SMTP id v6mr230044jar.91.1605544316239;
 Mon, 16 Nov 2020 08:31:56 -0800 (PST)
MIME-Version: 1.0
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-13-ganqixin@huawei.com>
In-Reply-To: <20201115184903.1292715-13-ganqixin@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Nov 2020 08:19:41 -0800
Message-ID: <CAKmqyKO_bfuvYx_Cr_9zEX9afVubBu=E-9XRm5FfgZ6weyMeJg@mail.gmail.com>
Subject: Re: [PATCH 12/13] SPI flash devices: put them into the 'storage'
 category
To: Gan Qixin <ganqixin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 16, 2020 at 1:30 AM Gan Qixin <ganqixin@huawei.com> wrote:
>
> SPI flash devices have no category, put them into the 'storage' category.
>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: Alistair Francis <alistair@alistair23.me>
> ---
>  hw/block/m25p80.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 483925f57a..8dd3ef8559 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -1397,6 +1397,7 @@ static void m25p80_class_init(ObjectClass *klass, void *data)
>      device_class_set_props(dc, m25p80_properties);
>      dc->reset = m25p80_reset;
>      mc->pi = data;
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  }
>
>  static const TypeInfo m25p80_info = {
> --
> 2.23.0
>
>


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B249130AD68
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 18:08:00 +0100 (CET)
Received: from localhost ([::1]:43036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6cgA-0007TQ-WC
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 12:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6cdU-0005MI-L7
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:05:12 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:35450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6cdS-0002WI-Ql
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:05:12 -0500
Received: by mail-ej1-x62f.google.com with SMTP id a9so7133897ejr.2
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 09:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RZoHEYVo0xh/lfhruzq5ozEj/oB5CoO8KyeG7Y+GapY=;
 b=kpvw560f/vnGrYUq7divnC6Wde73zRDbPq5q6qqWQKsiola07hpcZmU45cQu7fnMq6
 yYJVpAlIZd2bOiJXf3nc7ULRJyikDbxaP0yncg7/rd3N/2rpIk4ogj/KLtZBXaL9dtO4
 SdIK5iTmW6O0EUc1IhCmgC261NFBqNgz460daWwUk5tX1GjAOX5pJ1TEc5HmcrSWYbDE
 uEa8Wibl8lU2Vs0hrUsxTMtFoDjKO7UZqL0P+Uf+08IH31SWvSrk8q5yxqyQfQm3SuMQ
 Qjgd2mdbBnvtd2wjMpayXYUOX+KhAwWsdrPNKlVhbsyu15RWciQuJQ4AElbvhuoAixPG
 WoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RZoHEYVo0xh/lfhruzq5ozEj/oB5CoO8KyeG7Y+GapY=;
 b=HDdg1UYp0v2BeRW4jPsJbSOURnf77LMMbHvjgK9RgyDmq/+CuOlkP8wHvF2djjzGO5
 lIjCPUPq112nPTXHsMh6ovmuKPcuKaBDndjWuS9DuN0/oaZx/CjhL7r+zm31sr5WRFYO
 azx4I0PtueB7zn35qe9LLS+AqyYwRXW1cT91JMWVqIIW/mL4o33sREfMyO+Qb2hc9Mg4
 /z+VeGZocSjygb6r3No4S+z4x1gAmqAZixOs06wRe58B7DY3vOhQQdHkMAH97ZXf3e+k
 oJAxpv8kYotzPVWngtMK8lbuziXwcI0c0ATa8JUG2gHcSmur/ZyoFQ+XqlmmUsVlFHHU
 jQSA==
X-Gm-Message-State: AOAM533Dxzhxg4+EWVvvRMesxNyoVw/vC8dTJP+oBJcPlv97C6D83Nst
 Wib3j8JsIVD51RgOLJYJWiD8RLziicQ2McAxRZ70hhbQFe0WZw==
X-Google-Smtp-Source: ABdhPJxJRrTbm7z08l3lzbNTrUZw4CQ3TYMY4ZCWwtf+NWwwupspynbaeEwGsyKU9Zz0mQvdcsSK3jhP835PylmJGv4=
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr18684581ejc.482.1612199108593; 
 Mon, 01 Feb 2021 09:05:08 -0800 (PST)
MIME-Version: 1.0
References: <20210128185300.2875-1-alex.bennee@linaro.org>
In-Reply-To: <20210128185300.2875-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Feb 2021 17:04:56 +0000
Message-ID: <CAFEAcA_R3phXwOtj-v-6-oCN891SjGSyAGwcx3_zDf+GFPWLqg@mail.gmail.com>
Subject: Re: [PATCH] docs/system: document an example vexpress-a15 invocation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Anders Roxell <anders.roxell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 18:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The wiki and the web are curiously absent of the right runes to boot a
> vexpress model so I had to work from first principles to work it out.
> Use the more modern -drive notation so alternative backends can be
> used (unlike the hardwired -sd mode).
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>  docs/system/arm/vexpress.rst | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/docs/system/arm/vexpress.rst b/docs/system/arm/vexpress.rst
> index 7f1bcbef07..30b1823b95 100644
> --- a/docs/system/arm/vexpress.rst
> +++ b/docs/system/arm/vexpress.rst
> @@ -58,3 +58,29 @@ Other differences between the hardware and the QEMU mo=
del:
>    ``vexpress-a15``, and have IRQs from 40 upwards. If a dtb is
>    provided on the command line then QEMU will edit it to include
>    suitable entries describing these transports for the guest.
> +
> +Booting a Linux kernel
> +----------------------
> +
> +Building a current Linux kernel with ``multi_v7_defconfig`` should be
> +enough to get something running.
> +
> +.. code-block:: bash
> +
> +  $ export ARCH=3Darm
> +  $ export CROSS_COMPILE=3Darm-linux-gnueabihf-
> +  $ make multi_v7_defconfig
> +  $ make

We probably shouldn't be recommending in-tree kernel builds, or
polluting the user's environment with random variables. Try:

$ make O=3Dbuilddir ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- multi_v=
7_defconfig
$ make O=3Dbuilddir ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf-

> +By default you will want to boot your rootfs of the sdcard interface.

"off"

> +Your rootfs will need to be padded to the right size. With a suitable
> +DTB you could also add devices to the virtio-mmio bus.
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-arm -cpu cortex-a15 -smp 4 -m 4096 \
> +      -machine type=3Dvexpress-a15 -serial mon:stdio \
> +      -drive if=3Dsd,driver=3Dfile,filename=3Darmel-rootfs.ext4 \
> +      -kernel zImage  \
> +      -dtb vexpress-v2p-ca15-tc1.dtb \
> +      -append "console=3DttyAMA0 root=3D/dev/mmcblk0 ro"

thanks
-- PMM


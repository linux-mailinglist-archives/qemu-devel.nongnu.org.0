Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F9C5A45F1
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 11:20:00 +0200 (CEST)
Received: from localhost ([::1]:51364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSaw2-0004Yd-BD
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 05:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oSaqZ-0001k2-Um; Mon, 29 Aug 2022 05:14:19 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:42901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oSaqY-0005CD-4b; Mon, 29 Aug 2022 05:14:19 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 n65-20020a17090a5ac700b001fbb4fad865so7930808pji.1; 
 Mon, 29 Aug 2022 02:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=8gl1R2dDAsi+CH13sbOyWzIoKnt02pu0jiIjs+l7Exc=;
 b=XLbIRz4iyKX22Z6AbBhUDyWWJCvd9yixdY0qtr26UHvtLUJcw6DyZQcZrj+q086AxT
 65780wQQxoGDcL3fNJb8T2cKx+vQ/TG7tlcc7ebo77s+xjOmL3MLspszSSL4P9R+0lwe
 Ot89tnp0EmR82uqtS1uMBqeOIhMww9F6Ke965x6VgdTzIHFDDnLYoBd0pAGWFWTrM4MT
 SZgkC1OyKFpOiusqrXgPeHiKJqeISHMaNdrD9pjRPTdy+SM0BPlw1/BAzxOhsfq8wu5z
 pCFS5urEukw/lEYtjo9FDPO8dbKEB5olYoQY4CSnQQY8uAJQW/D1sGvDL/bCnTfG9omd
 Ezfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=8gl1R2dDAsi+CH13sbOyWzIoKnt02pu0jiIjs+l7Exc=;
 b=n0F2xrGRMN6UYJyyDc1fQi2XRPWUH+X0iiD9F46BDCBUbhxtsOyW+dHokiu0E7tJDH
 lizeGlVNvS5Et4pkn16oRxNox2Hn+5oxxnnw2qvswft1nYOvdLaYotJ30H9b+O2hC8hN
 gRRCMxmQrJSruT60Qm7mNefPVZLZAtK46tEGxvJrRVuSstNCVcDqG7PTL2fN5X56WNGU
 E5iaYb7lSaBcFWIFz/IT9chgbSZuKWDE4M1Cj6QsyHktSX49XHCttmzSNoz9WbcBcff1
 VSCqCKzpufj/Q+zkHfBHhZ/IMBy1wlsrR6N+KGvKIvsjIjVssAyB8CZJlcuyGIEvChej
 8V8A==
X-Gm-Message-State: ACgBeo2BJY5f8SDHWz77EC0Rc2MVGUfs27/+6P/1N8udLBVc2wHMyoYL
 9BKJSWPTIH3X7nyo78B+0glzFvG7klYZJ16GpG8=
X-Google-Smtp-Source: AA6agR72/auenAVphmhqHfk28vjFC1LxzVuaoxs7tCa59PLpbbcBpo6D6nZodEr6r4iO3sYKE2zmmdj8++ZCkyVeenU=
X-Received: by 2002:a17:902:b413:b0:172:a628:7915 with SMTP id
 x19-20020a170902b41300b00172a6287915mr15683418plr.99.1661764455831; Mon, 29
 Aug 2022 02:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220829080940.110831-1-thuth@redhat.com>
In-Reply-To: <20220829080940.110831-1-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Aug 2022 11:13:49 +0200
Message-ID: <CAKmqyKNv0sjNFvTe_ALDuP7HVksLY=YoM=77zF-7FTvpi1Uadg@mail.gmail.com>
Subject: Re: [PATCH for-7.2] tests/avocado/boot_linux_console: Fix the
 test_aarch64_xlnx_versal_virt test
To: Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 29, 2022 at 10:10 AM Thomas Huth <thuth@redhat.com> wrote:
>
> The assets that this test tries to download have been removed from the
> server. Update to a newer version to get it working again.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tests/avocado/boot_linux_console.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index 6b1533c17c..f26e036ab5 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -335,13 +335,13 @@ def test_aarch64_xlnx_versal_virt(self):
>          """
>          images_url = ('http://ports.ubuntu.com/ubuntu-ports/dists/'
>                        'bionic-updates/main/installer-arm64/'
> -                      '20101020ubuntu543.15/images/')
> +                      '20101020ubuntu543.19/images/')
>          kernel_url = images_url + 'netboot/ubuntu-installer/arm64/linux'
> -        kernel_hash = '5bfc54cf7ed8157d93f6e5b0241e727b6dc22c50'
> +        kernel_hash = 'e167757620640eb26de0972f578741924abb3a82'
>          kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
>
>          initrd_url = images_url + 'netboot/ubuntu-installer/arm64/initrd.gz'
> -        initrd_hash = 'd385d3e88d53e2004c5d43cbe668b458a094f772'
> +        initrd_hash = 'cab5cb3fcefca8408aa5aae57f24574bfce8bdb9'
>          initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
>
>          self.vm.set_console()
> --
> 2.31.1
>
>


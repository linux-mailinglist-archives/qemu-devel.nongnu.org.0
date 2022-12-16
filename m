Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B449B64E9FC
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 12:07:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p68XW-0003jt-5I; Fri, 16 Dec 2022 06:06:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p68XT-0003jV-KG
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:06:03 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p68XQ-0001qq-VV
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:06:03 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso5755089pjt.0
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 03:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TNN1Lwj9oUu+SRPkrk8oHxVGSEWLKpNEs9hevHnxj7o=;
 b=Y4viZyI7R3weTKutbIsm5AbIDGieJdaxQei98ZfMvnUk463SJYj8t/wJqYLpAwsCPj
 Iq17ITYehvtaS5Q10Sdy4Lz9jaZIM993rkxPr7rH0SGXsZWKx29/AmuNv/fruNhJ9Bs5
 4wpy3/iDo3Y9/CLah6Qptb/JHo/LHZJjoYZSYW74FDQAkx2kycfU5+05p7IqTKytlSmI
 RYKsnE3OdF7xLpd9I1uKmuIZJ2StA1AJRAunDk0B6EGOeQ745zsG1FKfQOSKYnf4eV4/
 cMKKEPAaU56mM2R24/pxggofDKsvk2ckz+do8yPGKg6ujLiTgCpFq2R6649voY0Xg6d6
 vC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TNN1Lwj9oUu+SRPkrk8oHxVGSEWLKpNEs9hevHnxj7o=;
 b=uRePl64XpuAEyvfbYWD5sU1NuzZLL7wX39R/ilg6g/voejIMYpOQcpB3ohrqXkx2f4
 PJGvqMR7i8QuNr4grl5cklBZTSq/1ZAUcnSCniqNucZgWC+pHH8s5gDNIcXe88IUYz7w
 arGO8Me9L83TEXkP69DEVQD8qD5WzH0Tjr9jVdSs1w8kJ1SaYVJUJcSLvQcdfj/9hGQI
 pEv9OQhyInDdNZm9vPkzoQUe4hgrfdjis9muu8Qifg9m0Gw56u1CcjhquON2HZPWuZ91
 CxbzAShGU1WXIP31gMFCAhkH5frYbbF0fSnPNlzWgbuClob2pRKNo2e95DgMcZF5XaKQ
 AAcA==
X-Gm-Message-State: ANoB5pkYyWDqm1gC64sX5jKDQMbKIEuj3dtL9Cj7sTKFlgLO94wEyR95
 RGpUxp7iEmQ7wslu8UBiFKX57eJUPO6GwzGwJ0ld5g==
X-Google-Smtp-Source: AA0mqf7tEDLj7U77+VWnixo61t1bkclYRjwXYNCCNFxVfO8ZtfuRtrFCwzMefPwrEMBHITWUDlRg6HffcYM1XULMqnc=
X-Received: by 2002:a17:902:70c5:b0:189:b0a3:cf4a with SMTP id
 l5-20020a17090270c500b00189b0a3cf4amr36592323plt.60.1671188758418; Fri, 16
 Dec 2022 03:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20221216101234.2202009-1-kraxel@redhat.com>
 <20221216101234.2202009-2-kraxel@redhat.com>
In-Reply-To: <20221216101234.2202009-2-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Dec 2022 11:05:46 +0000
Message-ID: <CAFEAcA8Sfft6hB2hRyht9vRg3xYq3kTWjqd4s2GreYZqH3O3=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm: allow flash images being smaller than the
 available space
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>,
 qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
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

On Fri, 16 Dec 2022 at 10:12, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Query block device backing flash for size and use that instead of
> requiring the block device being exactly 64M in size.  This allows
> to use edk2 firmware builds without padding, i.e. use QEMU_EFI.fd
> (which is /way/ smaller than 64M) as-is.
>
> -rw-r--r--. 1 root root 67108864 Dec 12 23:45 QEMU_EFI-pflash.raw
> -rw-r--r--. 1 root root  2097152 Dec 12 23:45 QEMU_EFI.fd
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/arm/virt.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b87135085610..c71ae2cd73f7 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -43,6 +43,7 @@
>  #include "hw/vfio/vfio-amd-xgbe.h"
>  #include "hw/display/ramfb.h"
>  #include "net/net.h"
> +#include "sysemu/block-backend.h"
>  #include "sysemu/device_tree.h"
>  #include "sysemu/numa.h"
>  #include "sysemu/runstate.h"
> @@ -1134,6 +1135,21 @@ static void virt_flash_map1(PFlashCFI01 *flash,
>                              MemoryRegion *sysmem)
>  {
>      DeviceState *dev = DEVICE(flash);
> +    BlockBackend *blk;
> +
> +    blk = pflash_cfi01_get_blk(flash);
> +    if (blk) {
> +        hwaddr blksize = blk_getlength(blk);
> +
> +        if (blksize == 0 || blksize > size ||
> +            !QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE)) {
> +            error_report("system firmware block device %s"
> +                         " has invalid size %" PRId64,
> +                         blk_name(blk), size);
> +            exit(1);
> +        }
> +        size = blksize;
> +    }
>
>      assert(QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE));
>      assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
> --
> 2.38.1

We've had at least three threads about this already, attempting
various approaches. Please read up on them and the discussions
that ensued from those patches before having another go at it.

The problem with this idea is that the size of the flash device
exposed to the guest should not depend on the size of the backing
file the user provides -- it's a fact about the machine and
also if it varies it's easy for the user to back themselves into
a corner where they can't migrate to a destination where the
backing file is larger, or they can't add new variables to the
EFI store because the backing file is too small.

thanks
-- PMM


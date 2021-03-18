Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E8B341084
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 23:53:26 +0100 (CET)
Received: from localhost ([::1]:33618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN1W9-0005hE-Nx
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 18:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lN1U7-0003vi-89; Thu, 18 Mar 2021 18:51:19 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lN1U4-0000Af-Mo; Thu, 18 Mar 2021 18:51:18 -0400
Received: by mail-wr1-x435.google.com with SMTP id x13so7201235wrs.9;
 Thu, 18 Mar 2021 15:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sfwNSbhMiNN7Q6ZTR4qgp1UHFwulqiUCdhSlDaE8vAc=;
 b=h8rNGP/y1JUPpJbqBbhI+ZaaK0QrMHQOw0m79DxYEOXMntkD0hxt6vZuwSZyH//7mW
 JKILsvD7HOjst6XjfDMC104IXrbkv1AkKx+ErPLpPdFNcZF91vtTHvueV1FgMhGQhI1v
 wVo8q7bs3HkdYVWyukzWPNUWlg9+rCT1FhP2DYzA6+de+/xw9jWkLI1gXObLUOR/PKxK
 exRvHsHoeAhV1m6lVQtBJmXtZETXMgtBHzhciXKDqUFLLRoGHwtTo75PzGO6PBy7CEr2
 Esnm1oaIvzW4yvcfEfo7LWf+ePONabOjS5bmpgb/BDAWaDNqD+z0cB6fUv/TP7/l6+xo
 AFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sfwNSbhMiNN7Q6ZTR4qgp1UHFwulqiUCdhSlDaE8vAc=;
 b=OsXm/0lyvHcJ+3fuXA1VxJGtmG+Uw8yEDC9hB17WF0hLCvhGq8QtH3Atr6mCXGKFZZ
 d6I/UMSGhsUTDIs2YC3bU2p0mRX6Hdfv03AwMNEEz+bqq4rWxpsHGMOtHqkRpw8PF2lY
 0bRq3qBQcnM/F5hc8+ncCJFBQr8PqAQncr6O5g+EQUeKn3b5DBI3EVr9U+K27T2K4RBh
 O8Wp+G8kk0qaJyjYdZvHfKGr3ECmhyBoPUFLzt8CFYNMYW8B6AjbpMTwpMEeAlQ0wPMr
 k9pG7zEOkrh1oLZrZwpeb51ls0YBONbLyXCfy0vqOVxK/PaV7ronT8P0HVLoqAVH9EZZ
 8J7A==
X-Gm-Message-State: AOAM530jeet0we8e8QLwzkahxDXxnpkxAqiH7EdvuE41iBT2oabRyrvF
 isOEsU1H8ujfGIiJn6QCCwCV8FNFFnUTjw==
X-Google-Smtp-Source: ABdhPJxy9fqTe77F6EvWZEx0JY+OtiaNb96R5kOhSIR5zC7HJ4/Ne8izip4yBXl0X3nvz7h2lpSVbg==
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr1365638wrw.289.1616107873960; 
 Thu, 18 Mar 2021 15:51:13 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u23sm3966632wmn.26.2021.03.18.15.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 15:51:13 -0700 (PDT)
Subject: Re: [PATCH 1/4] m68k: add the virtio devices aliases
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210318223907.1344870-1-laurent@vivier.eu>
 <20210318223907.1344870-2-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cca7fd52-a97c-fa8d-3fbd-16702a43cb58@amsat.org>
Date: Thu, 18 Mar 2021 23:51:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318223907.1344870-2-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 11:39 PM, Laurent Vivier wrote:
> Similarly to 5f629d943cb0 ("s390x: fix s390 virtio aliases"),
> define the virtio aliases.
> 
> This allows to start machines with virtio devices without
> knowledge of the implementation type.
> 
> For instance, we can use "-device virtio-scsi" on
> m68k, s390x or PC, and the device will be

+"respectively"

> "virtio-scsi-device", "virtio-scsi-ccw" or "virtio-scsi-pci".
> 
> This already exists for s390x and -ccw interfaces, adds them

"add"?

> for m68k and MMIO (-device) interfaces.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  softmmu/qdev-monitor.c | 46 +++++++++++++++++++++++++++---------------
>  1 file changed, 30 insertions(+), 16 deletions(-)
> 
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 8dc656becca9..262d38b8c01e 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -42,6 +42,8 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/clock.h"
>  
> +#define QEMU_ARCH_NO_PCI (QEMU_ARCH_S390X | QEMU_ARCH_M68K)
> +
>  /*
>   * Aliases were a bad idea from the start.  Let's keep them
>   * from spreading further.
> @@ -60,34 +62,46 @@ static const QDevAlias qdev_alias_table[] = {
>      { "ES1370", "es1370" }, /* -soundhw name */
>      { "ich9-ahci", "ahci" },
>      { "lsi53c895a", "lsi" },
> +    { "virtio-9p-device", "virtio-9p", QEMU_ARCH_M68K },
>      { "virtio-9p-ccw", "virtio-9p", QEMU_ARCH_S390X },
> -    { "virtio-9p-pci", "virtio-9p", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> +    { "virtio-9p-pci", "virtio-9p", QEMU_ARCH_ALL & ~QEMU_ARCH_NO_PCI },

TIL QEMU_ARCH_NO_PCI :)

> +    { "virtio-balloon-device", "virtio-balloon", QEMU_ARCH_M68K },
>      { "virtio-balloon-ccw", "virtio-balloon", QEMU_ARCH_S390X },
> -    { "virtio-balloon-pci", "virtio-balloon",
> -            QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> +    { "virtio-balloon-pci", "virtio-balloon", QEMU_ARCH_ALL &
> +                                             ~QEMU_ARCH_NO_PCI },
> +    { "virtio-blk-device", "virtio-blk", QEMU_ARCH_M68K },
>      { "virtio-blk-ccw", "virtio-blk", QEMU_ARCH_S390X },
> -    { "virtio-blk-pci", "virtio-blk", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> +    { "virtio-blk-pci", "virtio-blk", QEMU_ARCH_ALL & ~QEMU_ARCH_NO_PCI },
>      { "virtio-gpu-ccw", "virtio-gpu", QEMU_ARCH_S390X },
> -    { "virtio-gpu-pci", "virtio-gpu", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> +    { "virtio-gpu-device", "virtio-gpu", QEMU_ARCH_M68K },
> +    { "virtio-gpu-pci", "virtio-gpu", QEMU_ARCH_ALL & ~QEMU_ARCH_NO_PCI },
> +    { "virtio-input-host-device", "virtio-input-host", QEMU_ARCH_M68K },
>      { "virtio-input-host-ccw", "virtio-input-host", QEMU_ARCH_S390X },
> -    { "virtio-input-host-pci", "virtio-input-host",
> -            QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> -    { "virtio-iommu-pci", "virtio-iommu", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> +    { "virtio-input-host-pci", "virtio-input-host", QEMU_ARCH_ALL &
> +                                                   ~QEMU_ARCH_NO_PCI },
> +    { "virtio-iommu-pci", "virtio-iommu", QEMU_ARCH_ALL & ~QEMU_ARCH_NO_PCI },
> +    { "virtio-keyboard-device", "virtio-keyboard", QEMU_ARCH_M68K },
>      { "virtio-keyboard-ccw", "virtio-keyboard", QEMU_ARCH_S390X },
> -    { "virtio-keyboard-pci", "virtio-keyboard",
> -            QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> +    { "virtio-keyboard-pci", "virtio-keyboard", QEMU_ARCH_ALL &
> +                                               ~QEMU_ARCH_NO_PCI },
> +    { "virtio-mouse-device", "virtio-mouse", QEMU_ARCH_M68K },
>      { "virtio-mouse-ccw", "virtio-mouse", QEMU_ARCH_S390X },
> -    { "virtio-mouse-pci", "virtio-mouse", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> +    { "virtio-mouse-pci", "virtio-mouse", QEMU_ARCH_ALL & ~QEMU_ARCH_NO_PCI },
> +    { "virtio-net-device", "virtio-net", QEMU_ARCH_M68K },
>      { "virtio-net-ccw", "virtio-net", QEMU_ARCH_S390X },
> -    { "virtio-net-pci", "virtio-net", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> +    { "virtio-net-pci", "virtio-net", QEMU_ARCH_ALL & ~QEMU_ARCH_NO_PCI },
> +    { "virtio-rng-device", "virtio-rng", QEMU_ARCH_M68K },
>      { "virtio-rng-ccw", "virtio-rng", QEMU_ARCH_S390X },
> -    { "virtio-rng-pci", "virtio-rng", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> +    { "virtio-rng-pci", "virtio-rng", QEMU_ARCH_ALL & ~QEMU_ARCH_NO_PCI },
> +    { "virtio-scsi-device", "virtio-scsi", QEMU_ARCH_M68K },
>      { "virtio-scsi-ccw", "virtio-scsi", QEMU_ARCH_S390X },
> -    { "virtio-scsi-pci", "virtio-scsi", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> +    { "virtio-scsi-pci", "virtio-scsi", QEMU_ARCH_ALL & ~QEMU_ARCH_NO_PCI },
> +    { "virtio-serial-device", "virtio-serial", QEMU_ARCH_M68K },
>      { "virtio-serial-ccw", "virtio-serial", QEMU_ARCH_S390X },
> -    { "virtio-serial-pci", "virtio-serial", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> +    { "virtio-serial-pci", "virtio-serial", QEMU_ARCH_ALL & ~QEMU_ARCH_NO_PCI},
> +    { "virtio-tablet-device", "virtio-tablet", QEMU_ARCH_M68K },
>      { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_S390X },
> -    { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> +    { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_ALL & ~QEMU_ARCH_NO_PCI },
>      { }
>  };

This could be easier to split this patch in 2:
1/ QEMU_ARCH_S390X -> QEMU_ARCH_NO_PCI
2/ complete QEMU_ARCH_M68K aliases

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


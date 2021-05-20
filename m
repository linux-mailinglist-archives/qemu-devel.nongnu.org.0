Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE408389EBD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 09:17:21 +0200 (CEST)
Received: from localhost ([::1]:43732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljcvo-00028f-F7
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 03:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljct8-0008NB-Mh
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:14:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljct5-0002bj-LZ
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:14:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621494869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RZe6UgMLFVUrkWePv4M5ScY8fLr7qNGOoDxVrX47eU4=;
 b=gozTT1gLWpQ6vZUi+uU/zxAyRHD0XYn/qrBZD+SRGHE5JboEGwtjtxxrgRVjJVCPliwlgb
 SXlTi2gGKCwiccoZKpktX5HRaw0el09AVJpZjCuoKyBdUlQpcDmweLyqA0V0K+dgZB8Lpd
 cDZwqdBKO5YPOSI7SN01KULqKznq6iM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-M75ukUnrMj--BY6uX0kUFw-1; Thu, 20 May 2021 03:14:27 -0400
X-MC-Unique: M75ukUnrMj--BY6uX0kUFw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9741D803621
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 07:14:26 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-71.ams2.redhat.com [10.36.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C9A25D74D;
 Thu, 20 May 2021 07:14:25 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210519163448.2154339-1-philmd@redhat.com>
 <20210519163448.2154339-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v6 1/5] hw/isa/Kconfig: Fix missing dependency ISA_SUPERIO
 -> FDC
Message-ID: <919d2a45-2f01-4758-54f5-54c15bbbf052@redhat.com>
Date: Thu, 20 May 2021 09:14:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210519163448.2154339-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On 19/05/2021 18.34, Philippe Mathieu-Daudé wrote:
> isa_superio_realize() calls isa_fdc_init_drives(), which is defined
> in hw/block/fdc.c, so ISA_SUPERIO needs to select the FDC symbol.
> 
> Add a isa_fdc_init_drives() stub for when FDC is not selected.
> 
> Reported-by: John Snow <jsnow@redhat.com>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Fixes: c0ff3795143 ("Introduce a CONFIG_ISA_SUPERIO switch for isa-superio.c")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/block/fdc-isa-stubs.c | 22 ++++++++++++++++++++++
>   MAINTAINERS              |  1 +
>   hw/block/meson.build     |  5 ++++-
>   hw/isa/Kconfig           |  1 +
>   4 files changed, 28 insertions(+), 1 deletion(-)
>   create mode 100644 hw/block/fdc-isa-stubs.c
> 
> diff --git a/hw/block/fdc-isa-stubs.c b/hw/block/fdc-isa-stubs.c
> new file mode 100644
> index 00000000000..60180531e11
> --- /dev/null
> +++ b/hw/block/fdc-isa-stubs.c
> @@ -0,0 +1,22 @@
> +/*
> + * QEMU Floppy disk emulator (Intel 82078) stubs
> + *
> + * Copyright (c) 2021 Red Hat, Inc.
> + *
> + * Author:
> + *   Philippe Mathieu-Daudé <philmd@redhat.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/block/fdc.h"
> +#include "hw/isa/isa.h"
> +
> +void isa_fdc_init_drives(ISADevice *fdc, DriveInfo **fds)
> +{
> +    g_assert_not_reached();
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eab178aeee5..8fa85e40a52 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1659,6 +1659,7 @@ M: John Snow <jsnow@redhat.com>
>   L: qemu-block@nongnu.org
>   S: Supported
>   F: hw/block/fdc.c
> +F: hw/block/fdc-isa-stubs.c
>   F: include/hw/block/fdc.h
>   F: tests/qtest/fdc-test.c
>   T: git https://gitlab.com/jsnow/qemu.git ide
> diff --git a/hw/block/meson.build b/hw/block/meson.build
> index 8b0de54db1f..bb5b331d86a 100644
> --- a/hw/block/meson.build
> +++ b/hw/block/meson.build
> @@ -4,7 +4,8 @@
>     'hd-geometry.c'
>   ))
>   softmmu_ss.add(when: 'CONFIG_ECC', if_true: files('ecc.c'))
> -softmmu_ss.add(when: 'CONFIG_FDC', if_true: files('fdc.c'))
> +softmmu_ss.add(when: 'CONFIG_FDC', if_true: files('fdc.c'),
> +                                       if_false: files('fdc-isa-stubs.c'))
>   softmmu_ss.add(when: 'CONFIG_NAND', if_true: files('nand.c'))
>   softmmu_ss.add(when: 'CONFIG_ONENAND', if_true: files('onenand.c'))
>   softmmu_ss.add(when: 'CONFIG_PFLASH_CFI01', if_true: files('pflash_cfi01.c'))
> @@ -18,3 +19,5 @@
>   specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c'))
>   
>   subdir('dataplane')
> +
> +softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('fdc-isa-stubs.c'))
> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> index 55e0003ce40..7216f66a54a 100644
> --- a/hw/isa/Kconfig
> +++ b/hw/isa/Kconfig
> @@ -17,6 +17,7 @@ config ISA_SUPERIO
>       bool
>       select ISA_BUS
>       select PCKBD
> +    select FDC

Adding both, the stub and the select FDC here, does not make much sense ... 
I thought that there would be some superio chips where the FDC is always 
disabled, so I expected the "select FDC" to show up at the individual 
superio implementations instead.

However, looking more closely at the code, it seems like there is always the 
possibility to attach a FDC to all of them. So seems like I gave you a bad 
advice, sorry - the first version of your patch (without the stub) makes 
more sense, I think.

  Thomas




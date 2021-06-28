Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE6E3B6905
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 21:23:34 +0200 (CEST)
Received: from localhost ([::1]:59838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxwqy-0005M2-QB
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 15:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxwpe-0004Z9-0v
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 15:22:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxwpb-00060R-0s
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 15:22:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624908125;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+3h4oQwWEHc1xzvSPDfJQNKDJ5ITrZ4Ra3bDY5Dr+B0=;
 b=dDTIUXzSht/hePtwZfO5HPtcZSX5HFRxWF5GnTKv1bssDw1H+anDX7xb8C5VqjT2xIW1ld
 dAdylBnfJgL1eWtbM+4lkWGJqa/wX3k2Zm2NAXMHhomglRFfXahUUw/vQlPoVXSlkib/YV
 4yW6RKNDiGWjeXaa7rx0i3w3skWKFZ0=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-YOlOgPkqNiOZFrk4OW69Bw-1; Mon, 28 Jun 2021 15:21:57 -0400
X-MC-Unique: YOlOgPkqNiOZFrk4OW69Bw-1
Received: by mail-pf1-f198.google.com with SMTP id
 7-20020a6215070000b0290301d427d4baso9892985pfv.11
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 12:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=+3h4oQwWEHc1xzvSPDfJQNKDJ5ITrZ4Ra3bDY5Dr+B0=;
 b=eD8PbREHRFElZTnO0xm+zqU53aSNjENOt9cLQAcki+fHnpQE1SdtTgLpyK3xEYGN/H
 QdbxuoRNvV1OAPQ6l3ujpRDQYHcRPXcXiD014ZVy6QQl7PsuWDVm2YaH0Jxq0xoL5zxP
 2Rig1ZfpRbcMxcPvvowO8HRCPNjemP7207f9MiqljTdnmpeJJty/jH2a6F5Q4+Ci/a6x
 WXT+HPM3q/CG/xcbGWbSaBVqgdv8e/k3mEVdLO1bp7Tqe9cSCwRvq1Eh7u2+oEqhZI09
 fxWYYsb5cS6sqvmETcHEWuVHX1I0obYtWsLXDe7JozIOA6rjGw+4UEBtRtjhULrk3x7c
 /pzg==
X-Gm-Message-State: AOAM532b9BDd3TM8wYw3oy3iYguvZNK+zheu/8N944KxQc37/qP1qqCq
 i0piGqhxws7T45Bz9JlS2Cq10aU42xadScNKjyzmG0le3+rbMQ8imMPZ7PoDYvWcxNYDJOMzXW9
 jQA9PFgR+pYVCr+4=
X-Received: by 2002:a17:903:49:b029:128:cec5:3472 with SMTP id
 l9-20020a1709030049b0290128cec53472mr8745382pla.54.1624908116477; 
 Mon, 28 Jun 2021 12:21:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNQxsWbyo6FAq/s7haemTDy1Amsb86yjvhHxQk9gRb1WRG2EroFOGkCBbD1RS6e8b9qxJzeA==
X-Received: by 2002:a17:903:49:b029:128:cec5:3472 with SMTP id
 l9-20020a1709030049b0290128cec53472mr8745361pla.54.1624908116223; 
 Mon, 28 Jun 2021 12:21:56 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id md10sm291981pjb.42.2021.06.28.12.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 12:21:55 -0700 (PDT)
Subject: Re: [PATCH 4/5] tests/acceptance: Test Linux on the Fuloong 2E machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210624202747.1433023-1-f4bug@amsat.org>
 <20210624202747.1433023-5-f4bug@amsat.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <8c11cc61-d1af-5daa-4d8d-43423e895993@redhat.com>
Date: Mon, 28 Jun 2021 16:21:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624202747.1433023-5-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Reply-To: wainersm@redhat.com
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Cleber Rosa <crosa@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/24/21 5:27 PM, Philippe Mathieu-Daudé wrote:
> Test the kernel from Lemote rescue image:
> http://dev.lemote.com/files/resource/download/rescue/rescue-yl
> Once downloaded, set the RESCUE_YL_PATH environment variable
> to point to the downloaded image and test as:
>
>    $ RESCUE_YL_PATH=~/images/fuloong2e/rescue-yl \
>      AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
>      avocado --show=app,console run tests/acceptance/machine_mips_fuloong2e.py
>    Fetching asset from tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_linux_kernel_isa_serial
>     (1/1) tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_linux_kernel_isa_serial:
>    console: Linux version 2.6.27.7lemote (root@debian) (gcc version 4.1.3 20080623 (prerelease) (Debian 4.1.2-23)) #6 Fri Dec 12 00:11:25 CST 2008
>    console: busclock=33000000, cpuclock=-2145008360,memsize=256,highmemsize=0
>    console: console [early0] enabled
>    console: CPU revision is: 00006302 (ICT Loongson-2)
>    PASS (0.16 s)
>    JOB TIME   : 0.51 s
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   MAINTAINERS                                |  1 +
>   tests/acceptance/machine_mips_fuloong2e.py | 42 ++++++++++++++++++++++
>   2 files changed, 43 insertions(+)
>   create mode 100644 tests/acceptance/machine_mips_fuloong2e.py

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1a041eaf864..1c515b4ba14 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1176,6 +1176,7 @@ F: hw/isa/vt82c686.c
>   F: hw/pci-host/bonito.c
>   F: hw/usb/vt82c686-uhci-pci.c
>   F: include/hw/isa/vt82c686.h
> +F: tests/acceptance/machine_mips_fuloong2e.py
>   
>   Loongson-3 virtual platforms
>   M: Huacai Chen <chenhuacai@kernel.org>
> diff --git a/tests/acceptance/machine_mips_fuloong2e.py b/tests/acceptance/machine_mips_fuloong2e.py
> new file mode 100644
> index 00000000000..0ac285e2af1
> --- /dev/null
> +++ b/tests/acceptance/machine_mips_fuloong2e.py
> @@ -0,0 +1,42 @@
> +# Functional tests for the Lemote Fuloong-2E machine.
> +#
> +# Copyright (c) 2019 Philippe Mathieu-Daudé <f4bug@amsat.org>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or later.
> +# See the COPYING file in the top-level directory.
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import os
> +
> +from avocado import skipUnless
> +from avocado_qemu import Test
> +from avocado_qemu import wait_for_console_pattern
> +
> +class MipsFuloong2e(Test):
> +
> +    timeout = 60
> +
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
> +    @skipUnless(os.getenv('RESCUE_YL_PATH'), 'RESCUE_YL_PATH not available')
> +    def test_linux_kernel_isa_serial(self):
> +        """
> +        :avocado: tags=arch:mips64el
> +        :avocado: tags=machine:fuloong2e
> +        :avocado: tags=endian:little
> +        :avocado: tags=device:bonito64
> +        :avocado: tags=device:via686b
> +        """
> +        # Recovery system for the Yeeloong laptop
> +        # (enough to test the fuloong2e southbridge, accessing its ISA bus)
> +        # http://dev.lemote.com/files/resource/download/rescue/rescue-yl
> +        kernel_hash = 'ec4d1bd89a8439c41033ca63db60160cc6d6f09a'
> +        kernel_path = self.fetch_asset('file://' + os.getenv('RESCUE_YL_PATH'),
> +                                       asset_hash=kernel_hash)
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-kernel', kernel_path)
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'Linux version 2.6.27.7lemote')
> +        cpu_revision = 'CPU revision is: 00006302 (ICT Loongson-2)'
> +        wait_for_console_pattern(self, cpu_revision)



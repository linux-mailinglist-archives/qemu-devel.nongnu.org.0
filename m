Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B70430A614
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:02:18 +0100 (CET)
Received: from localhost ([::1]:38492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6WyH-0003EI-EH
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:02:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Ww6-0002gB-Uw
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:00:04 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Ww1-0003VX-EH
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:00:01 -0500
Received: by mail-wm1-x329.google.com with SMTP id f16so12234954wmq.5
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 02:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KE6pn1XLuZ35zO3PqK0E652tTHU9fRPfHroHeNP+mqs=;
 b=k8M1PI5PBfrYYPekh/jrTDQwU/rOaxV2QKr0Hn6vWm+QG3GeFyY7H+sJuPhHsBw2wa
 wulgnY4lgkmywg979X9tkQveWnWgx4/Jt/qV+qMmZ1PsIoFXPINHPBTw/7m0rAnAMbMD
 T3ej0P6cCJYXUx9iIp5mCI3ID9Z8bI7r/t6BMgf2hxRoTtrCOF8Ng4IFTgHzylfKKBQO
 TRJllt+Ux3Fruw84BDcCZhFNvzDwKTQj3QkF3ahTxr+AHG+11xPZ4pW499AJ3AE9n8Mu
 HgS4B1h0wM1kGKL69Q/u3dzajqNgLUbGAsm7feYngoDKeSZ1cEHuuB38xbZp02SjJlvS
 PNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KE6pn1XLuZ35zO3PqK0E652tTHU9fRPfHroHeNP+mqs=;
 b=etroDkaCRKp1HRm2b9/VwrLCEOUwGnwX9p0JqpSRYsGNUD8N+ABRNYFWhEZnIlgQ6S
 zsjCmsax3FC9WejTaR3LzOLv9EuDwCJOwWB7NW223bSxiq5hvgI63ZwKtkgSt7A9aHw6
 MPMDbbesO4wnfCyl+ZZXyPPq/LLax3Qx1DB5J7lnZ+D++YAT4FmTUlGtggzFvetJF+OI
 ZiQkkwh+YG+Ci7DO+iv6yeu99/UM1KgUT6BG/gQEm1ckLEoUe990iJyusG9CEX3R5G8t
 CHAGVNlqX2oQ9Y4cpFcHwYFh1t1TsLwucs9PuHgF0mT0MU3dTQ/P8Tkw8gm1Wg75QH+K
 fNog==
X-Gm-Message-State: AOAM533GrVwQ86oA3Qngc6pB2W24ZM3rndnMDj1ZKfMATz+RuGXLXdYP
 QQiJ1nsBpVnIdf1Bu0OdFHQ=
X-Google-Smtp-Source: ABdhPJx1kGiUfZp6OECVM9HcEU2ro/EqkyZTE/nUfkUseg0RWzzAejKdnqSZZFYlYi0EmovqBovjXA==
X-Received: by 2002:a05:600c:4f07:: with SMTP id
 l7mr9122348wmq.111.1612177195926; 
 Mon, 01 Feb 2021 02:59:55 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id o17sm26583745wrm.52.2021.02.01.02.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 02:59:55 -0800 (PST)
Subject: Re: [PATCH v2 3/4] hw/xen/Kconfig: Introduce XEN_PV config
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210131141810.293186-1-f4bug@amsat.org>
 <20210131141810.293186-4-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d3ad42eb-42bd-2e63-4c99-8eed91216fc5@amsat.org>
Date: Mon, 1 Feb 2021 11:59:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210131141810.293186-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.079,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/21 3:18 PM, Philippe Mathieu-Daudé wrote:
> xenpv machine requires USB, IDE_PIIX and PCI:
> 
>   /usr/bin/ld:
>   libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function `xen_be_register_common':
>   hw/xen/xen-legacy-backend.c:757: undefined reference to `xen_usb_ops'
>   libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `unplug_disks':
>   hw/i386/xen/xen_platform.c:153: undefined reference to `pci_piix3_xen_ide_unplug'
>   libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `pci_unplug_nics':
>   hw/i386/xen/xen_platform.c:137: undefined reference to `pci_for_each_device'
>   libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `xen_platform_realize':
>   hw/i386/xen/xen_platform.c:483: undefined reference to `pci_register_bar'
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/Kconfig     | 1 +
>  hw/xen/Kconfig | 7 +++++++
>  2 files changed, 8 insertions(+)
>  create mode 100644 hw/xen/Kconfig
> 
> diff --git a/hw/Kconfig b/hw/Kconfig
> index 5ad3c6b5a4b..f2a95591d94 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -39,6 +39,7 @@ source usb/Kconfig
>  source virtio/Kconfig
>  source vfio/Kconfig
>  source watchdog/Kconfig
> +source xen/Kconfig
>  
>  # arch Kconfig
>  source arm/Kconfig
> diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
> new file mode 100644
> index 00000000000..0b8427d6bd1
> --- /dev/null
> +++ b/hw/xen/Kconfig
> @@ -0,0 +1,7 @@
> +config XEN_PV
> +    bool
> +    default y if XEN
> +    depends on XEN
> +    select PCI
> +    select USB
> +    select IDE_PIIX

Well this is not enough, --without-default-devices fails:

/usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_physmem.c.o: in
function `cpu_physical_memory_set_dirty_range':
include/exec/ram_addr.h:333: undefined reference to
`xen_hvm_modified_memory'
/usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_physmem.c.o: in
function `ram_block_add':
softmmu/physmem.c:1873: undefined reference to `xen_ram_alloc'
/usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_physmem.c.o: in
function `cpu_physical_memory_set_dirty_range':
include/exec/ram_addr.h:333: undefined reference to
`xen_hvm_modified_memory'
/usr/bin/ld: include/exec/ram_addr.h:333: undefined reference to
`xen_hvm_modified_memory'
/usr/bin/ld: libqemu-x86_64-softmmu.fa.p/softmmu_memory.c.o: in function
`cpu_physical_memory_set_dirty_range':
include/exec/ram_addr.h:333: undefined reference to
`xen_hvm_modified_memory'
collect2: error: ld returned 1 exit status
ninja: build stopped: subcommand failed.


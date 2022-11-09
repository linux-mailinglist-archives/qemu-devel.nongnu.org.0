Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073F262368F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 23:28:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ostYD-0007QY-2y; Wed, 09 Nov 2022 17:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ostYB-0007QP-Qp
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 17:28:03 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ostY9-00084Y-RM
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 17:28:03 -0500
Received: by mail-wr1-x433.google.com with SMTP id cl5so27949529wrb.9
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 14:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0sa3R2ihF5Dy5IUz9+ql6rd3GqWrMn8/HMbYdDYx/jQ=;
 b=BLkqEW89AVbgkJflL82bclIgdD2Eyu1GRzuhSCv8nZU5g+0VWkBVaGEkkiyhUnFN8r
 Q3yoJcrAcrkqTIjh8KZ86rzbkz3YurDQwpWzCoGM3TP5cEMLHbgNZ2nyghKHGzT+Bs38
 mbRbt3cBHM0lH0DK7e9WpiOxHYZ3wVUKHX9kZsWQPkT0JQkUJcclsXSCgySnTZDzBHYX
 Q35WiKPF2pdeTkTzcrc7KqE0+9i7mhnClNa10Q9TLWwKq7iKXYZtYUSPeYmMfsu/BFWl
 gi9yPTuKgIAFcjiWsvYlmpKe7JwC93Ghg8smJvjdqAFpuaRNeR+WHA+urTgXoPLW4COo
 zJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0sa3R2ihF5Dy5IUz9+ql6rd3GqWrMn8/HMbYdDYx/jQ=;
 b=RF65nyTEzHVCrYGkQAlQEhunlevnN9bWsiQENKSq9neQMbOvF0VJ5VUhUVbf8Fo+wS
 RejqgG73UZBw71KbS3UH6XJXjuL1YhvStULgyaMgYNGxj9sEZlq6f6VE29zmyrzsfWS7
 AqW5j8QdSYjeh2MH/cRPxF/2Xzxh+KKcXXBrGweMsbjYo1D0k6ZxVbDFMLfn0HxoJwGP
 7sd9kc6LrfgpK8w4ACgGxtCXjPFlO8rIIViqreRZeMdqfgOuXydsEzeXc9U88dx9mmLd
 /fT6un+9qzI5jAtUsxYLhm8T8A3vB5LLvyk2mPaDPTQtvidD4IHhhY40++7RGpaGFytu
 8juQ==
X-Gm-Message-State: ACrzQf0zZf17vJjMR/tsN4LufV5tfqjaNOioiZ+RefLjKheeLnFqUnP/
 XQYs3FQ9UJYtXibTDsvOhnJWOA==
X-Google-Smtp-Source: AMsMyM46UyYZUrFQb6Z/Xbw6qFUNztv864RI09fgUld6VACEbGHqpaA3AxBG69x862Tl6NTQwxLiRQ==
X-Received: by 2002:a05:6000:1887:b0:236:7b1a:b14c with SMTP id
 a7-20020a056000188700b002367b1ab14cmr40151909wri.173.1668032876714; 
 Wed, 09 Nov 2022 14:27:56 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a1c5441000000b003b4868eb71bsm2930720wmi.25.2022.11.09.14.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 14:27:56 -0800 (PST)
Message-ID: <7a1fb7fe-22e5-f7cf-6593-630e11bf556a@linaro.org>
Date: Wed, 9 Nov 2022 23:27:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] display: include dependencies explicitly
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Miroslav Rezanina
 <mrezanin@redhat.com>, Frederic Bezies <fredbezies@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20221109222112.74519-1-mst@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109222112.74519-1-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 9/11/22 23:21, Michael S. Tsirkin wrote:
> acpi-vga-stub.c pulls in vga_int.h
> However that currently pulls in ui/console.h which
> breaks e.g. on systems without pixman.
> It's better to remove ui/console.h from vga_int.h
> and directly include it where it's used.
> 

Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
Reported-by: Frederic Bezies <fredbezies@gmail.com>
Reported-by: Laurent Vivier <lvivier@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1308
Fixes: cfead31326 ("AcpiDevAmlIf interface to build VGA device descs")

> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   hw/display/vga_int.h        | 1 -
>   include/qemu/typedefs.h     | 2 ++
>   hw/display/ati_2d.c         | 1 +
>   hw/display/cirrus_vga.c     | 1 +
>   hw/display/cirrus_vga_isa.c | 1 +
>   hw/display/vga-isa.c        | 1 +
>   hw/display/vga-mmio.c       | 1 +
>   hw/display/vga-pci.c        | 1 +
>   hw/display/vga.c            | 1 +
>   hw/display/vmware_vga.c     | 1 +
>   10 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
> index 330406ad9c..7cf0d11201 100644
> --- a/hw/display/vga_int.h
> +++ b/hw/display/vga_int.h
> @@ -27,7 +27,6 @@
>   
>   #include "exec/ioport.h"
>   #include "exec/memory.h"
> -#include "ui/console.h"
>   
>   #include "hw/display/bochs-vbe.h"
>   #include "hw/acpi/acpi_aml_interface.h"
> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
> index 6d4e6d9708..688408e048 100644
> --- a/include/qemu/typedefs.h
> +++ b/include/qemu/typedefs.h
> @@ -132,6 +132,8 @@ typedef struct Visitor Visitor;
>   typedef struct VMChangeStateEntry VMChangeStateEntry;
>   typedef struct VMStateDescription VMStateDescription;
>   typedef struct DumpState DumpState;
> +typedef struct GraphicHwOps GraphicHwOps;
> +typedef struct QEMUCursor QEMUCursor;

Besides the "Please keep this list in case-insensitive alphabetical
order." in this file header,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   /*
>    * Pointer types
> diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
> index 692bec91de..7d786653e8 100644
> --- a/hw/display/ati_2d.c
> +++ b/hw/display/ati_2d.c
> @@ -12,6 +12,7 @@
>   #include "ati_regs.h"
>   #include "qemu/log.h"
>   #include "ui/pixel_ops.h"
> +#include "ui/console.h"
>   
>   /*
>    * NOTE:
> diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
> index 2577005d03..4cc3567c69 100644
> --- a/hw/display/cirrus_vga.c
> +++ b/hw/display/cirrus_vga.c
> @@ -45,6 +45,7 @@
>   #include "ui/pixel_ops.h"
>   #include "cirrus_vga_internal.h"
>   #include "qom/object.h"
> +#include "ui/console.h"
>   
>   /*
>    * TODO:
> diff --git a/hw/display/cirrus_vga_isa.c b/hw/display/cirrus_vga_isa.c
> index 96144bd690..84be51670e 100644
> --- a/hw/display/cirrus_vga_isa.c
> +++ b/hw/display/cirrus_vga_isa.c
> @@ -31,6 +31,7 @@
>   #include "hw/isa/isa.h"
>   #include "cirrus_vga_internal.h"
>   #include "qom/object.h"
> +#include "ui/console.h"
>   
>   #define TYPE_ISA_CIRRUS_VGA "isa-cirrus-vga"
>   OBJECT_DECLARE_SIMPLE_TYPE(ISACirrusVGAState, ISA_CIRRUS_VGA)
> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
> index 46abbc5653..2a5437d803 100644
> --- a/hw/display/vga-isa.c
> +++ b/hw/display/vga-isa.c
> @@ -32,6 +32,7 @@
>   #include "qemu/timer.h"
>   #include "hw/loader.h"
>   #include "hw/qdev-properties.h"
> +#include "ui/console.h"
>   #include "qom/object.h"
>   
>   #define TYPE_ISA_VGA "isa-vga"
> diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
> index 75dfcedea5..cd2c46776d 100644
> --- a/hw/display/vga-mmio.c
> +++ b/hw/display/vga-mmio.c
> @@ -27,6 +27,7 @@
>   #include "hw/sysbus.h"
>   #include "hw/display/vga.h"
>   #include "hw/qdev-properties.h"
> +#include "ui/console.h"
>   #include "vga_int.h"
>   
>   /*
> diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
> index 9a91de7ed1..df23dbf3a0 100644
> --- a/hw/display/vga-pci.c
> +++ b/hw/display/vga-pci.c
> @@ -30,6 +30,7 @@
>   #include "migration/vmstate.h"
>   #include "vga_int.h"
>   #include "ui/pixel_ops.h"
> +#include "ui/console.h"
>   #include "qemu/module.h"
>   #include "qemu/timer.h"
>   #include "hw/loader.h"
> diff --git a/hw/display/vga.c b/hw/display/vga.c
> index 50ecb1ad02..0cb26a791b 100644
> --- a/hw/display/vga.c
> +++ b/hw/display/vga.c
> @@ -31,6 +31,7 @@
>   #include "vga_int.h"
>   #include "vga_regs.h"
>   #include "ui/pixel_ops.h"
> +#include "ui/console.h"
>   #include "qemu/timer.h"
>   #include "hw/xen/xen.h"
>   #include "migration/vmstate.h"
> diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
> index cedbbde522..53949d2539 100644
> --- a/hw/display/vmware_vga.c
> +++ b/hw/display/vmware_vga.c
> @@ -33,6 +33,7 @@
>   #include "hw/qdev-properties.h"
>   #include "migration/vmstate.h"
>   #include "qom/object.h"
> +#include "ui/console.h"
>   
>   #undef VERBOSE
>   #define HW_RECT_ACCEL



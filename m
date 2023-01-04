Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAD465D5EB
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 15:37:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD4te-00019B-9b; Wed, 04 Jan 2023 09:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD4tb-00018e-Pp
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:37:35 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD4tZ-0000kk-QJ
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:37:35 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d4so25199864wrw.6
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 06:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gTb9A3lhT0EjGZNi4vC4Vq3NJ/QUy1/fJ4TjSuDqF9E=;
 b=p9sJYC3QMOtbjjvKYY72tqSEOucbdUwOsZeVwflSIsWpgEmt8/9tdS4tn+f+a+72cO
 yWNcrpA/ouK0GUJ9vjGxFMiWos6x2BUpOh8geK2PgKRDB5RZwna2LN1xOtIqcOQKQKrC
 dDpjqwastEcayxl1MCL9+bJiOkBIFHrHdmVGe1K/KLIhK8/nAd6xp4q/jz1+bhnzvjht
 F6skg0iguVC4wELtC604b9SmR3dLS2E/qQU4LkAFjlqXeTB6hpbyYqdcjA2gnFVnKqJy
 ibzawlBtV3sRUIb/Lk43lWoig47EJZ9izQzGJhK4L91X0LyO9j89DlK3f6Rtl/a+Pyqz
 qR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gTb9A3lhT0EjGZNi4vC4Vq3NJ/QUy1/fJ4TjSuDqF9E=;
 b=mdkLnOse3IMiUjy6QUtSUqkgK2tMtUV8jfx1oITYhJ0QvDbMGaU+f9lW3qFDXm+KPB
 WtBlbztUkipg6DbjSVVhn81qZoP+mWNm2z+mbX1ZUS8IX6u7fRtX1XBvPTH5JJd9YbYj
 E9zcDccFlvlpKD9UFWEs8KHx2YPsCX/k6O0NAIJDl7MQqxqpH6BucwjLT2fxrsidTG8C
 1Svo5nYWgOJJyvSGZVrycXH9yUGhEkl15AzwdbPHjp36hKbe84yuwdTG1kUsRiWmTv4f
 tFf/6LdTbUi9wOvbCbybtstb+rPiO/14Hww/clVCz3OUiOdGWV6xqZd2KPc/0JiDRl4R
 8gBQ==
X-Gm-Message-State: AFqh2kqqOJIlGyjacjkhDmDj1TzJKO3IWigv+By6fDbkrR025kq0YqOY
 IX+YShk11vNZG+PxsUqKIBNphg==
X-Google-Smtp-Source: AMrXdXsCc36tYQHuC7Yxdk9PQ98lMb0qu8tQeuKsWboZRSoynMmAAotO6BNY4kouHYdiCPTI2pwvdA==
X-Received: by 2002:a5d:6890:0:b0:2a3:3ece:bf5a with SMTP id
 h16-20020a5d6890000000b002a33ecebf5amr1613239wru.61.1672843051912; 
 Wed, 04 Jan 2023 06:37:31 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t4-20020a5d42c4000000b002876ab9debcsm24008458wrr.36.2023.01.04.06.37.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 06:37:31 -0800 (PST)
Message-ID: <3986f4f2-d6bd-9abe-42ef-18311de53bf6@linaro.org>
Date: Wed, 4 Jan 2023 15:37:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 12/30] hw/core: Introduce proxy-pic
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
 <20221221170003.2929-13-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221170003.2929-13-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 21/12/22 17:59, Bernhard Beschow wrote:
> Having a proxy PIC allows for ISA PICs to be created and wired up in
> southbridges. This is especially useful for PIIX3 for two reasons:
> First, the southbridge doesn't need to care about the virtualization
> technology used (KVM, TCG, Xen) due to in-IRQs (where devices get
> attached) and out-IRQs (which will trigger the IRQs of the respective
> virtzalization technology) are separated. Second, since the in-IRQs are
> populated with fully initialized qemu_irq's, they can already be wired
> up inside PIIX3.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Message-Id: <20221022150508.26830-15-shentey@gmail.com>
> ---
>   MAINTAINERS                 |  2 ++
>   hw/core/Kconfig             |  3 ++
>   hw/core/meson.build         |  1 +
>   hw/core/proxy-pic.c         | 70 +++++++++++++++++++++++++++++++++++++
>   include/hw/core/proxy-pic.h | 54 ++++++++++++++++++++++++++++
>   5 files changed, 130 insertions(+)
>   create mode 100644 hw/core/proxy-pic.c
>   create mode 100644 include/hw/core/proxy-pic.h

Please enable scripts/git.orderfile.

> diff --git a/include/hw/core/proxy-pic.h b/include/hw/core/proxy-pic.h
> new file mode 100644
> index 0000000000..0eb40c478a
> --- /dev/null
> +++ b/include/hw/core/proxy-pic.h
> @@ -0,0 +1,54 @@
> +/*
> + * Proxy interrupt controller device.
> + *
> + * Copyright (c) 2022 Bernhard Beschow <shentey@gmail.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.

This is the MIT license right? Do you mind adding a SPDX tag along?

  * SPDX-License-Identifier: MIT

> + */
> +
> +#ifndef HW_PROXY_PIC_H
> +#define HW_PROXY_PIC_H
> +
> +#include "hw/qdev-core.h"
> +#include "qom/object.h"
> +#include "hw/irq.h"
> +
> +#define TYPE_PROXY_PIC "proxy-pic"
> +OBJECT_DECLARE_SIMPLE_TYPE(ProxyPICState, PROXY_PIC)
> +
> +#define MAX_PROXY_PIC_LINES 16
> +
> +/**
> + * This is a simple device which has 16 pairs of GPIO input and output lines.
> + * Any change on an input line is forwarded to the respective output.
> + *
> + * QEMU interface:
> + *  + 16 unnamed GPIO inputs: the input lines
> + *  + 16 unnamed GPIO outputs: the output lines
> + */

Why restrict to 16 and not use a class property and allocate
on the heap? See TYPE_SPLIT_IRQ for example.

> +struct ProxyPICState {
> +    /*< private >*/
> +    struct DeviceState parent_obj;
> +    /*< public >*/
> +
> +    qemu_irq in_irqs[MAX_PROXY_PIC_LINES];
> +    qemu_irq out_irqs[MAX_PROXY_PIC_LINES];
> +};
> +
> +#endif /* HW_PROXY_PIC_H */



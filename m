Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D2C1BB91B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 10:48:12 +0200 (CEST)
Received: from localhost ([::1]:46524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTLuU-0006Sy-Vm
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 04:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50988)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTLqy-0003cY-BV
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 04:45:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTLnf-0000Gv-IG
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 04:44:31 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTKxh-0007zF-8E; Tue, 28 Apr 2020 03:47:25 -0400
Received: by mail-wr1-x443.google.com with SMTP id d17so23440785wrg.11;
 Tue, 28 Apr 2020 00:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KFOfqikoEDaFU0QanQWnrZou41WM3WSERbHHJspAm2M=;
 b=mQ4iGMFqRpf1dFbbTaw6HYEPsFHrAkWlWZMjxn7TasqR83QPJ9XL+6AiwMUXU+PmbQ
 8wq4JoP/YcIRy4M7bWJF9G3PjCDQT2PfPSUXXKeXvek4boUkFhGidEj3/0inJbCfqWF6
 XS3ZmRa053StDOuPOk4DWD5MP1bmmUM9VaGcOo5SXkYw6+lNwZmvl329NWf1JvAOlWmv
 Re4CSkDXrSGL07pgUvrbwGDuXzPle7CV4tqchPp00V6gzQTTgzVvzui9a9Skv/42aS15
 QsDcEHDzR8Nkvf6XeeGV1QNaomEaR5y4m9XYlc6T+egBWJpIMckBa4YFPA3FMfr5/oHV
 2WRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KFOfqikoEDaFU0QanQWnrZou41WM3WSERbHHJspAm2M=;
 b=Fd2VSXy0o+xw/GFNxBB9h1C3ENgDgUQyrr7s9muOIR8L1hLQIGq66mOM/eYgIIKumH
 5M2auaQp6DoTnS3nQ5uU2FO9Fu+jMf3eZbMD2DYZ9Jr0Qu/1qgcLpYlK2HB9d5mEKmpU
 qF3Sx97yFUcjTGkS3kS3GeeMOep2NUA0lB+DyW/KoS9W/T7tKS2I1Cv4OHmdmjHVxpJ/
 ER0LnKe9JGx8d7Iq173xRJkf7+UtmOEsI3sTrwebl8TX6TXuSOk777c2Yx4sIciPwobG
 VxXCl/aewMbbtZgBV/BNcEn0y/Kd5kPMhO0OmaUUiXfcg96lVQdLBpgRrxfUV4Cp+i+t
 dohA==
X-Gm-Message-State: AGi0PuYmgydJWcRhBTeZeArCcJF8YrRAPGaseLh2OOV7O2PF1IBTh6jA
 Dy6NtdlSYgd3v6H9Cpf2YN4=
X-Google-Smtp-Source: APiQypLqtdMSt8lbBETVC7spIhei0voQf8SGUw8OvHRj+K9KFbIZgl34lZXwv+UGii+hnzdFoWzBdg==
X-Received: by 2002:adf:d091:: with SMTP id y17mr30819861wrh.418.1588060042776; 
 Tue, 28 Apr 2020 00:47:22 -0700 (PDT)
Received: from [192.168.1.39] (137.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.137])
 by smtp.gmail.com with ESMTPSA id m8sm25643628wrx.54.2020.04.28.00.47.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2020 00:47:22 -0700 (PDT)
Subject: Re: [PATCH v1 04/11] hw/arm: versal: Embedd the UARTs into the SoC
 type
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200427181649.26851-1-edgar.iglesias@gmail.com>
 <20200427181649.26851-5-edgar.iglesias@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <2f5ece4e-2a11-fe91-9b18-d9fbcbed79dc@amsat.org>
Date: Tue, 28 Apr 2020 09:47:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200427181649.26851-5-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::443
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/20 8:16 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Embedd the UARTs into the SoC type.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/arm/xlnx-versal.c         | 12 ++++++------
>  include/hw/arm/xlnx-versal.h |  3 ++-
>  2 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index cc696e44c0..dbde03b7e6 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -21,7 +21,6 @@
>  #include "kvm_arm.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/arm/xlnx-versal.h"
> -#include "hw/char/pl011.h"
>  
>  #define XLNX_VERSAL_ACPU_TYPE ARM_CPU_TYPE_NAME("cortex-a72")
>  #define GEM_REVISION        0x40070106
> @@ -144,16 +143,17 @@ static void versal_create_uarts(Versal *s, qemu_irq *pic)
>          DeviceState *dev;
>          MemoryRegion *mr;
>  
> -        dev = qdev_create(NULL, TYPE_PL011);
> -        s->lpd.iou.uart[i] = SYS_BUS_DEVICE(dev);
> +        sysbus_init_child_obj(OBJECT(s), name,
> +                              &s->lpd.iou.uart[i], sizeof(s->lpd.iou.uart[i]),
> +                              TYPE_PL011);
> +        dev = DEVICE(&s->lpd.iou.uart[i]);
>          qdev_prop_set_chr(dev, "chardev", serial_hd(i));
> -        object_property_add_child(OBJECT(s), name, OBJECT(dev), &error_fatal);
>          qdev_init_nofail(dev);
>  
> -        mr = sysbus_mmio_get_region(s->lpd.iou.uart[i], 0);
> +        mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
>          memory_region_add_subregion(&s->mr_ps, addrs[i], mr);
>  
> -        sysbus_connect_irq(s->lpd.iou.uart[i], 0, pic[irqs[i]]);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[irqs[i]]);

Cleaner :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>          g_free(name);
>      }
>  }
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 6c0a692b2f..a3dfd064b3 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -15,6 +15,7 @@
>  #include "hw/sysbus.h"
>  #include "hw/arm/boot.h"
>  #include "hw/intc/arm_gicv3.h"
> +#include "hw/char/pl011.h"
>  
>  #define TYPE_XLNX_VERSAL "xlnx-versal"
>  #define XLNX_VERSAL(obj) OBJECT_CHECK(Versal, (obj), TYPE_XLNX_VERSAL)
> @@ -49,7 +50,7 @@ typedef struct Versal {
>          MemoryRegion mr_ocm;
>  
>          struct {
> -            SysBusDevice *uart[XLNX_VERSAL_NR_UARTS];
> +            PL011State uart[XLNX_VERSAL_NR_UARTS];
>              SysBusDevice *gem[XLNX_VERSAL_NR_GEMS];
>              SysBusDevice *adma[XLNX_VERSAL_NR_ADMAS];
>          } iou;
> 


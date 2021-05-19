Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D2B3894CC
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 19:51:36 +0200 (CEST)
Received: from localhost ([::1]:44876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljQM3-0004pS-S4
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 13:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljQL4-0003O3-D6
 for qemu-devel@nongnu.org; Wed, 19 May 2021 13:50:34 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljQL1-0000Ez-Ew
 for qemu-devel@nongnu.org; Wed, 19 May 2021 13:50:33 -0400
Received: by mail-wr1-x436.google.com with SMTP id x8so14914961wrq.9
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 10:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vnYauArMHj9AzcLtC5n+BY58D07AADNrIyDbweHqaN4=;
 b=ID7k3gBCvWfGu7Cb8yo9XoW4T8HMxQfefD/SJTm9SV9YNAuOKN188VVeD4Un1sVkl8
 UZ8sEwEwtvgljRQypV4TENcvxeXdUwT2b9HxTf/Ay9CO2SVOH5avEysr9vBSHi5eU17O
 r1Mk2vO3EASIdZjhYhDpktfcBPnuS8H55WJQgiImmU0aAZE4A5op1GgsafXvo7WOnSVK
 tEU9PeGJSRwYo2x9u5QsJxo+arMOrwA4oGMqr03YyIyEsws2AZ8vXkc4GtF6Oa8opPuI
 8xw4BOM8wJAWMNW6hbjviI3WD6lpo52fP6qmlJaLa1Yd0NcZYnWZSmzv1VKkAzCyY2kc
 slvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vnYauArMHj9AzcLtC5n+BY58D07AADNrIyDbweHqaN4=;
 b=XVuPeDbXRQHm+cEmcSdd5pH2maQw/yZ9AYEkorhk4t06t0ZwNIyRdBa4P7L3rY9Pep
 XtOvxMYCEZxtfhQ6sfj5frEb3OlKShYn3JICSInm+1W5pWbooBooErhsJLm4W+zH2igX
 XC9N59ycrRNjToCyG0G+Wh1PBUw3JI0Sue7IBhgUCOa6b1xgf6ScKrMkjsPwiN+ROzAd
 gDOLMrSE4zRXLmxXkcBg/EEydkbEb43XSupD7e7+ge/BWvqZ0aGzH3LyW4xlugXR04UJ
 D8OpGBC/Q7WZcdqA0Xh/BNgTeP4hRMU0hsuY7+6VYMmmWu3YLz6KRQYXRNF6tzFZpVeH
 9/Rw==
X-Gm-Message-State: AOAM531IpCx7c33Br6XbbJXCkJyoxVGykOgua12Rp63rqX0jvTdXxJFS
 XoEaLrL3Tiyeb+1pXoP0S90=
X-Google-Smtp-Source: ABdhPJxZiAuzm8niRsARn58KrjhDikl/fN79Tkr/mxNROmDkZt0dw6iD3WmegxHFyCGjiHLhim2shQ==
X-Received: by 2002:a5d:5257:: with SMTP id k23mr131477wrc.328.1621446629469; 
 Wed, 19 May 2021 10:50:29 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id l8sm65012wry.55.2021.05.19.10.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 10:50:28 -0700 (PDT)
Subject: Re: [PULL 23/33] hw/arm/xilinx_zynq: Fix USB port instantiation
To: qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
References: <20200228163840.23585-1-peter.maydell@linaro.org>
 <20200228163840.23585-24-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eef5d731-5d2f-b165-15dd-066f8b5389ea@amsat.org>
Date: Wed, 19 May 2021 19:50:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20200228163840.23585-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/20 5:38 PM, Peter Maydell wrote:
> From: Guenter Roeck <linux@roeck-us.net>
> 
> USB ports on Xilinx Zync must be instantiated as TYPE_CHIPIDEA to work.
> Linux expects and checks various chipidea registers, which do not exist
> with the basic ehci emulation. This patch series fixes the problem.
> 
> Without this patch, USB ports fail to instantiate under Linux.
> 
> ci_hdrc ci_hdrc.0: doesn't support host
> ci_hdrc ci_hdrc.0: no supported roles
> 
> With this patch, USB ports are instantiated, and it is possible
> to boot from USB drive.
> 
> ci_hdrc ci_hdrc.0: EHCI Host Controller
> ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus number 1
> ci_hdrc ci_hdrc.0: USB 2.0 started, EHCI 1.00
> usb 1-1: new full-speed USB device number 2 using ci_hdrc
> usb 1-1: not running at top speed; connect to a high speed hub
> usb 1-1: config 1 interface 0 altsetting 0 endpoint 0x81 has invalid maxpacket 512, setting to 64
> usb 1-1: config 1 interface 0 altsetting 0 endpoint 0x2 has invalid maxpacket 512, setting to 64
> usb-storage 1-1:1.0: USB Mass Storage device detected
> scsi host0: usb-storage 1-1:1.0
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> Message-id: 20200215122354.13706-2-linux@roeck-us.net
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/xilinx_zynq.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 3d439a45d57..571cdcd599e 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -29,6 +29,7 @@
>  #include "hw/loader.h"
>  #include "hw/misc/zynq-xadc.h"
>  #include "hw/ssi/ssi.h"
> +#include "hw/usb/chipidea.h"
>  #include "qemu/error-report.h"
>  #include "hw/sd/sdhci.h"
>  #include "hw/char/cadence_uart.h"
> @@ -225,8 +226,8 @@ static void zynq_init(MachineState *machine)
>      zynq_init_spi_flashes(0xE0007000, pic[81-IRQ_OFFSET], false);
>      zynq_init_spi_flashes(0xE000D000, pic[51-IRQ_OFFSET], true);
>  
> -    sysbus_create_simple("xlnx,ps7-usb", 0xE0002000, pic[53-IRQ_OFFSET]);
> -    sysbus_create_simple("xlnx,ps7-usb", 0xE0003000, pic[76-IRQ_OFFSET]);
> +    sysbus_create_simple(TYPE_CHIPIDEA, 0xE0002000, pic[53 - IRQ_OFFSET]);
> +    sysbus_create_simple(TYPE_CHIPIDEA, 0xE0003000, pic[76 - IRQ_OFFSET]);

FYI this patch makes the xilinx-zynq-a9 crash when built with
--without-default-devices:

./qemu-system-arm -M xilinx-zynq-a9
**
ERROR:qom/object.c:714:object_new_with_type: assertion failed: (type !=
NULL)
Bail out! ERROR:qom/object.c:714:object_new_with_type: assertion failed:
(type != NULL)

(gdb) bt
#0  0x00007ffff52dd7d5 in raise () at /lib64/libc.so.6
#1  0x00007ffff52c6895 in abort () at /lib64/libc.so.6
#2  0x00007ffff6dc4b6c in g_assertion_message_expr.cold () at
/lib64/libglib-2.0.so.0
#3  0x00007ffff6e229ff in g_assertion_message_expr () at
/lib64/libglib-2.0.so.0
#4  0x00005555558d3f01 in object_new_with_type (type=<optimized out>) at
qom/object.c:714
#5  0x00005555558d3f59 in object_new
(typename=typename@entry=0x555555ad4545 "usb-chipidea") at qom/object.c:747
#6  0x00005555558cd526 in qdev_new (name=name@entry=0x555555ad4545
"usb-chipidea") at hw/core/qdev.c:153
#7  0x0000555555739fc6 in sysbus_create_varargs
(name=name@entry=0x555555ad4545 "usb-chipidea",
addr=addr@entry=3758104576) at hw/core/sysbus.c:234
#8  0x0000555555796b57 in sysbus_create_simple (irq=<optimized out>,
addr=3758104576, name=0x555555ad4545 "usb-chipidea") at
/home/phil/source/qemu/include/hw/sysbus.h:104
#9  zynq_init (machine=0x555555de07a0) at hw/arm/xilinx_zynq.c:254
#10 0x000055555573707c in machine_run_board_init
(machine=machine@entry=0x555555de07a0) at hw/core/machine.c:1238
#11 0x0000555555838cff in qemu_init_board () at softmmu/vl.c:2513
#12 qmp_x_exit_preconfig (errp=<optimized out>) at softmmu/vl.c:2587
#13 0x000055555583cbfb in qmp_x_exit_preconfig (errp=<optimized out>) at
softmmu/vl.c:3609
#14 qemu_init (argc=<optimized out>, argv=<optimized out>,
envp=<optimized out>) at softmmu/vl.c:3609
#15 0x0000555555684749 in main (argc=<optimized out>, argv=<optimized
out>, envp=<optimized out>) at softmmu/main.c:49

This is because TYPE_CHIPIDEA is only built when an IMX machine is
selected:

softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('chipidea.c'))

I'll send a fix later.


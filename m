Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6784A2F8CD5
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 11:36:59 +0100 (CET)
Received: from localhost ([::1]:33454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0iwz-0001rd-Rr
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 05:36:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l0ivN-0001DE-UK
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 05:35:18 -0500
Received: from mail-ed1-f50.google.com ([209.85.208.50]:43226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l0ivL-0005wY-Mb
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 05:35:17 -0500
Received: by mail-ed1-f50.google.com with SMTP id by27so12296307edb.10
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 02:35:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Sq4KQSi5IU6hPxw/X+SknXIVRCgYBAOgXdcaY9+zFk=;
 b=Y4D5GMlkcUtGqvEkYKIGm6Ww2MH2yGpyBPsp6xfCaykYDjYSEOFJQ6AMqQY0s6EdPu
 jli9rDAk1UQEhIrvOkSO3VDMYfw+/odjYIiRm/2nJRB9s1BWPQ4eh4HhC3ybdtxYaHQc
 Y5eeG0krHy/2y2xe+/8pSPx1pKQRDC3i0bNOXa8ctO6pwqdv8o5m9Tn++CfGsYVKAJzz
 9VARQZIlOEO+4J3DaaKdEdRr71Q16XaDW4eLaECFyMVRG14aWfTjBjRJXJIP8i4W35U7
 lR9dS2vuiLnR53KPme96VQiYGz6SiVwgbU1Sy32HZi2JciKYPIHVcsiPAsfH18Uxvgf5
 FFYg==
X-Gm-Message-State: AOAM5306G8GsBTp3hQj3eKpGPBI8C1oY7T3J2CV3kQmlH20dSQeU46yT
 s5ZMsnMEhvz0GBVCXK8QATY=
X-Google-Smtp-Source: ABdhPJx+rOMGwDX5LMVDY1HV8aQdXEwmZsLXy1XVPM6ivUkFPTuyjttmQQNISU0yTL335cFBSGQH7w==
X-Received: by 2002:a50:d6dc:: with SMTP id l28mr13211707edj.105.1610793314321; 
 Sat, 16 Jan 2021 02:35:14 -0800 (PST)
Received: from localhost (pd9e83641.dip0.t-ipconnect.de. [217.232.54.65])
 by smtp.gmail.com with ESMTPSA id w18sm3200527ejq.59.2021.01.16.02.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jan 2021 02:35:13 -0800 (PST)
Date: Sat, 16 Jan 2021 11:35:10 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 08/11] hw/m68k/next-cube: Move rtc into NeXTPC struct
Message-ID: <20210116113510.4c414402@tuxfamily.org>
In-Reply-To: <20210115201206.17347-9-peter.maydell@linaro.org>
References: <20210115201206.17347-1-peter.maydell@linaro.org>
 <20210115201206.17347-9-peter.maydell@linaro.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.208.50; envelope-from=th.huth@gmail.com;
 helo=mail-ed1-f50.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am Fri, 15 Jan 2021 20:12:03 +0000
schrieb Peter Maydell <peter.maydell@linaro.org>:

> Move the rtc into the NeXTPC struct. Since this is the last
> use of the 'backdoor' NextState pointer we can now remove that.
> 
> Probably the RTC should be its own device at some point: in hardware
> there is a separate MCS1850 RTC chip connected to the Peripheral
> Controller via a 1-bit serial interface.  That goes beyond the remit
> of the current refactoring, though.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/m68k/next-cube.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
> index 5a8fc24ed35..3c83b874c56 100644
> --- a/hw/m68k/next-cube.c
> +++ b/hw/m68k/next-cube.c
> @@ -78,8 +78,6 @@ struct NeXTState {
>      qemu_irq scsi_dma;
>      qemu_irq scsi_reset;
>      qemu_irq *fd_irq;
> -
> -    NextRtc rtc;
>  };
>  
>  #define TYPE_NEXT_PC "next-pc"
> @@ -88,9 +86,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(NeXTPC, NEXT_PC)
>  struct NeXTPC {
>      SysBusDevice parent_obj;
>  
> -    /* Temporary until all functionality has been moved into this
> device */
> -    NeXTState *ns;
> -
>      M68kCPU *cpu;
>  
>      MemoryRegion mmiomem;
> @@ -102,6 +97,8 @@ struct NeXTPC {
>      uint8_t scsi_csr_2;
>      uint32_t int_mask;
>      uint32_t int_status;
> +
> +    NextRtc rtc;
>  };
>  
>  /* Thanks to NeXT forums for this */
> @@ -130,7 +127,7 @@ static void nextscr2_write(NeXTPC *s, uint32_t
> val, int size) static int phase;
>      static uint8_t old_scr2;
>      uint8_t scr2_2;
> -    NextRtc *rtc = &s->ns->rtc;
> +    NextRtc *rtc = &s->rtc;
>  
>      if (size == 4) {
>          scr2_2 = (val >> 8) & 0xFF;
> @@ -864,6 +861,11 @@ static void next_pc_reset(DeviceState *dev)
>      /*     0x0000XX00 << vital bits */
>      s->scr1 = 0x00011102;
>      s->scr2 = 0x00ff0c80;
> +
> +    s->rtc.status = 0x90;
> +
> +    /* Load RTC RAM - TODO: provide possibility to load contents
> from file */
> +    memcpy(s->rtc.ram, rtc_ram2, 32);
>  }
>  
>  static void next_pc_realize(DeviceState *dev, Error **errp)
> @@ -920,7 +922,6 @@ static void next_cube_init(MachineState *machine)
>      MemoryRegion *bmapm2 = g_new(MemoryRegion, 1);
>      MemoryRegion *sysmem = get_system_memory();
>      const char *bios_name = machine->firmware ?: ROM_FILE;
> -    NeXTState *ns = NEXT_MACHINE(machine);
>      DeviceState *dev;
>      DeviceState *pcdev;
>  
> @@ -940,13 +941,6 @@ static void next_cube_init(MachineState *machine)
>      pcdev = qdev_new(TYPE_NEXT_PC);
>      object_property_set_link(OBJECT(pcdev), "cpu", OBJECT(cpu),
> &error_abort); sysbus_realize_and_unref(SYS_BUS_DEVICE(pcdev),
> &error_fatal);
> -    /* Temporary while we refactor this code */
> -    NEXT_PC(pcdev)->ns = ns;
> -
> -    ns->rtc.status = 0x90;
> -
> -    /* Load RTC RAM - TODO: provide possibility to load contents
> from file */
> -    memcpy(ns->rtc.ram, rtc_ram2, 32);
>  
>      /* 64MB RAM starting at 0x04000000  */
>      memory_region_add_subregion(sysmem, 0x04000000, machine->ram);

Reviewed-by: Thomas Huth <huth@tuxfamily.org>



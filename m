Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4834858F2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 20:13:17 +0100 (CET)
Received: from localhost ([::1]:47896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Bik-0007ip-NL
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 14:13:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5BZU-0002Nc-8h
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 14:03:41 -0500
Received: from [2607:f8b0:4864:20::102a] (port=39577
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5BZQ-00085Q-OH
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 14:03:39 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso3826838pjm.4
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 11:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ygz8JvX4AF/h5uL2rfQTOT0nX+s76/UF6JPuF7UERu8=;
 b=a4lyVYptn2EwFIjdMcEy+02stFjpSuvO16m6MACY49yTjJ6osmYpzfNbp6EzRwEMbt
 uYcbuAKgC8i8aP3e1UtjVYT+/dDwpq4ysbz6aJ31uGKrKzI3m2xGZaU5jP2AlpQnC0dB
 YXG7VyhzePqkMCzgYUpcnQMy1MeHZ6KgI5gA2y9fs9dRhR/adBJcmQBpu4bEUQKZUr5S
 6o7dXzTmPYxDdB+SLyhleAZxS89b8+bIZTqDK46g146in+ZYdDrYjfbpLMGx1NqHszjV
 k1or02u0mkCkwPL6n9jenXNF+CcimdgKqi/NCITb2wfkzZuwKG5KEMG3/r4CrnnBy6VB
 X0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ygz8JvX4AF/h5uL2rfQTOT0nX+s76/UF6JPuF7UERu8=;
 b=tFF+49xwqTUYepNQWaTMqL6QEoqHZSnGysRiPFwOJ0wh4r5FBNztUGSyHVSsCn4PWC
 3qGbSF89LPpOapx0pcn+CY4Zw1uhOY3L9Jl1GiM2/ojgu5bBWBmJ8xO2xigaapneRyA5
 dNSYe0vfGdqJbqVDut+HaZIu39CnBOxmxQU1xL9e81heuTymHIx2DSXJC/tEsAgtkGYS
 aplqyNXIOYXVD+AypTQVHTdkaUDqzVWyNUBffxvgOopf/8Gfp4KE5sjibDAiYKExtLiE
 kdII2KtiFmwkrQy6xDRJcddCWDXnASN66IBySGJA0bj49cgLHpTTqXLzqBj/qAYs0afi
 XjIg==
X-Gm-Message-State: AOAM532e9ME6YwbcZDwcKud6PRM2v65brSkiU9N4u2yIOC+vmAZIOfR2
 2ykTbpvk3AQESsEbXU28X8w=
X-Google-Smtp-Source: ABdhPJymZHkEJWH5VBBrCOT1qDxta618UZYE4fpjLcyIYWGtCFvcrNq/80DfjZvPtH/7Kvx/MU8j4A==
X-Received: by 2002:a17:90a:de8b:: with SMTP id
 n11mr5809944pjv.98.1641409400960; 
 Wed, 05 Jan 2022 11:03:20 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id p37sm43950400pfh.97.2022.01.05.11.03.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 11:03:20 -0800 (PST)
Message-ID: <fbc66bb0-2c15-d789-bbaa-f9c3ba6f81e4@amsat.org>
Date: Wed, 5 Jan 2022 20:03:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: Trying to understand QOM object creation and property linking
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Daniel P. Berrange"
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <87czl6jb79.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <87czl6jb79.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 5/1/22 19:03, Alex Bennée wrote:
> Hi,
> 
> I'm having a hell of a time trying to create a new SoC+Board model from
> scratch. The problem comes down to trying to expose some properties to
> the underlying CPU from my board model. So I have:
> 
>    static const TypeInfo pipico_machine_types[] = {
>        {
>            .name           = TYPE_PIPICO_MACHINE,
>            .parent         = TYPE_MACHINE,
>            .instance_size  = sizeof(PiPicoMachineState),
>            .class_size     = sizeof(PiPicoMachineClass),
>            .class_init     = pipico_machine_class_init,
>        }
>    };
> 
> and the class init sets:
> 
>      MachineClass *mc = MACHINE_CLASS(oc);
>      ...
>      mc->desc = g_strdup_printf("Raspberry Pi Pico");
>      mc->init = pipico_machine_init;
>      ...
> 
> and finally when I init the machine I do the following:
> 
> static void pipico_machine_init(MachineState *machine)
> {
>      PiPicoMachineState *s = PIPICO_MACHINE(machine);
>      ...
>      MemoryRegion *system_memory = get_system_memory();
> 
>      ...
>      
>      /* initialize external Flash device */
>      memory_region_init_rom(&s->flash, NULL,
>                             "pico.flash0", 256 * KiB, &error_fatal);
>      memory_region_add_subregion(system_memory, 0, &s->flash);
> 
>      /* Setup the SOC */
>      object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RP2040);
> 
>      /* link properties from machine the SoC needs */
>      object_property_set_link(OBJECT(&s->soc), "memory",
>                               OBJECT(system_memory), &error_fatal);
> 
>      sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
> 
> 
> The initialisation of the SoC is simple because I can't do much until
> things are realised:
> 
> static void rp2040_init(Object *obj)
> {
>      RP2040State *s = RP2040(obj);
>      int n;
> 
>      fprintf(stderr, "%s: %p\n", __func__, obj);
> 
>      for (n = 0; n < RP2040_NCPUS; n++) {
>          object_initialize_child(obj, "cpu[*]", &s->armv7m[n], TYPE_ARMV7M);
>          qdev_prop_set_string(DEVICE(&s->armv7m[n]), "cpu-type",
>                               ARM_CPU_TYPE_NAME("cortex-m0"));

Here for each core you need to initialize a MemoryRegion container, ...

>      }
> }
> 
> 
> However when I get to realize the SoC itself:
> 
> static void rp2040_realize(DeviceState *dev, Error **errp)
> {
>      RP2040State *s = RP2040(dev);
>      Object *obj = OBJECT(dev);
>      int n;
> 
>      if (!s->board_memory) {
>          error_setg(errp, "%s: memory property was not set", __func__);
>          return;
>      }
> 
>      /* initialize internal 16 KB internal ROM */
>      memory_region_init_rom(&s->rom, obj, "rp2040.rom0", 16 * KiB, errp);
>      memory_region_add_subregion(s->board_memory, 0, &s->rom);
> 
>      /* SRAM (Main 256k bank + two 4k banks)*/
>      memory_region_init_ram(&s->sram03, obj, "rp2040.sram03", 256 * KiB, errp);
>      memory_region_add_subregion(s->board_memory, RP2040_SRAM_BASE, &s->sram03);
> 
>      memory_region_init_ram(&s->sram4, obj, "rp2040.sram4", 4 * KiB, errp);
>      memory_region_add_subregion(s->board_memory, RP2040_SRAM4_BASE, &s->sram4);
> 
>      memory_region_init_ram(&s->sram5, obj, "rp2040.sram5", 4 * KiB, errp);
>      memory_region_add_subregion(s->board_memory, RP2040_SRAM5_BASE, &s->sram5);
> 
>      ...
> 
>      for (n = 0; n < RP2040_NCPUS; n++) {
>          /* DeviceState *cpudev = DEVICE(&s->armv7m[i]); */
>          Object *cpuobj = OBJECT(&s->armv7m[n]);

then you add the board_memory in the per-CPU container as subregion, ...

>          object_property_set_link(cpuobj, "memory",
>                                   OBJECT(&s->board_memory), errp);

and finally each CPU links its container as its memory bus.

> And this passing of the link down to the CPU I segfault:
> 
>    rp2040_init: 0x555556d08710
> 
>    Thread 1 "qemu-system-arm" received signal SIGSEGV, Segmentation fault.
>    object_get_canonical_path_component (obj=0x555556d0ea28) at ../../qom/object.c:1999
>    1999        g_hash_table_iter_init(&iter, obj->parent->properties);
>    (gdb) bt
>    #0  object_get_canonical_path_component (obj=0x555556d0ea28) at ../../qom/object.c:1999
>    #1  0x0000555555fb27ea in object_get_canonical_path (obj=0x555556d0ea28) at ../../qom/object.c:2025
>    #2  0x0000555555fb1250 in object_property_set_link (obj=0x555556d087a0, name=0x5555563190a2 "memory", value=0x555556d0ea28, errp=0x7fffffffe0f0) at ../../qom/object.c:1445
>    #3  0x0000555555cf3c23 in rp2040_realize (dev=0x555556d08710, errp=0x7fffffffe0f0) at ../../hw/arm/rp2040.c:85
>    #4  0x0000555555fa9323 in device_set_realized (obj=0x555556d08710, value=true, errp=0x7fffffffe200) at ../../hw/core/qdev.c:532
>    #5  0x0000555555fb300d in property_set_bool (obj=0x555556d08710, v=0x555556dced10, name=0x5555563822b9 "realized", opaque=0x555556a3a6d0, errp=0x7fffffffe200) at ../../qom/object.c:2268
>    #6  0x0000555555fb1054 in object_property_set (obj=0x555556d08710, name=0x5555563822b9 "realized", v=0x555556dced10, errp=0x7fffffffe200) at ../../qom/object.c:1403
>    #7  0x0000555555fb53ff in object_property_set_qobject (obj=0x555556d08710, name=0x5555563822b9 "realized", value=0x555556e79bc0, errp=0x555556918de0 <error_fatal>) at ../../qom/qom-qobject.c:28
>    #8  0x0000555555fb13b9 in object_property_set_bool (obj=0x555556d08710, name=0x5555563822b9 "realized", value=true, errp=0x555556918de0 <error_fatal>) at ../../qom/object.c:1472
>    #9  0x0000555555fa8beb in qdev_realize (dev=0x555556d08710, bus=0x555556d0f240, errp=0x555556918de0 <error_fatal>) at ../../hw/core/qdev.c:334
>    #10 0x00005555559f0e28 in sysbus_realize (dev=0x555556d08710, errp=0x555556918de0 <error_fatal>) at ../../hw/core/sysbus.c:256
>    #11 0x0000555555cf3f0e in pipico_machine_init (machine=0x555556d08600) at ../../hw/arm/raspi_pico.c:74
>    #12 0x00005555559ed71b in machine_run_board_init (machine=0x555556d08600) at ../../hw/core/machine.c:1184
>    #13 0x0000555555e67f2c in qemu_init_board () at ../../softmmu/vl.c:2655
>    #14 0x0000555555e6814a in qmp_x_exit_preconfig (errp=0x555556918de0 <error_fatal>) at ../../softmmu/vl.c:2743
>    #15 0x0000555555e6a811 in qemu_init (argc=3, argv=0x7fffffffe6b8, envp=0x7fffffffe6d8) at ../../softmmu/vl.c:3778
>    #16 0x0000555555884ebd in main (argc=3, argv=0x7fffffffe6b8, envp=0x7fffffffe6d8) at ../../softmmu/main.c:49
> 
> So have I discovered a bug in QOM handling or misunderstood the way
> properties are meant to be shared from the main machine to the
> underlying CPU?
> 
> Follow-up questions, does only creating the main memory aliases as part
> of the SoC make sense? My rational is most of the memory is part of the
> SoC not the board. I assume later RP2040 based boards may have different
> flash configs or even external memory.
> 
> The current (messy) state of my tree can be seen at:
> 
>    https://gitlab.com/stsquad/qemu/-/commits/arm/picopi-rfc
> 



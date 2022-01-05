Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADE1485818
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 19:22:39 +0100 (CET)
Received: from localhost ([::1]:56810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Avl-0006kh-Pe
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 13:22:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5AuG-00061j-OA
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 13:21:04 -0500
Received: from [2a00:1450:4864:20::432] (port=41886
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5AuE-0006OE-4g
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 13:21:04 -0500
Received: by mail-wr1-x432.google.com with SMTP id v6so23091993wra.8
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 10:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9EgDiNI7k/SuvpHNI3BTwNfdGugtHwDvZ93+BxoOMa8=;
 b=D3JNot8+TP1ZUnagXRDLDbKJx+o+sKIaKM5PLn+WK6MlAxF6EyXzEzRaqKumXgTlRt
 GKv9Gm7IuZjA8g1hA9/WyxNeTaNuEqg2ZwQEGFT9nhTMnMeKgPm9gpdHX9EvGNFWXmbS
 s9+JJIPrT8iawKlqvRQkVCjFO06Y2gsSDavWHmkcrECTJN+jjiPnUJM7vmRs93X/Qb24
 5koYa/QlmRnFlAJ4g7cjsnRACVuuqUG2nhJMhblKJqp0lV9M/s8i9qi9Vg3HowTY081s
 +aA8YMQSH4y2ZV1fUGG+b3Ze6dc9QsNv4KyjicO0xttOJ7VAOVylCqug/lWZ1yZGKmHx
 iyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=9EgDiNI7k/SuvpHNI3BTwNfdGugtHwDvZ93+BxoOMa8=;
 b=060WQgkngPcc7z9B4ZamfNNqvXFL0vzO6XjxzOkvWY5ExlPrazuGx3v8o3T3xRUVGq
 dG6utXpIlgXcJDz6awZjs9RT5RXahXnC3Krlbsp7dOIT4Cv/pnPcY5uIE9E4eY7Mr/Th
 qlZ/IxBQ4GJCPyVjzC6zQRUUYOwBOtxhj9Ct/XpSj2tJ6sbDrqrdw/oSxfPl8SDAs3Ky
 NEXGmGmDuvh48DU22Na33AvM4sqYLw95K0CHLz8N1hszxIa3oEjOdP/ex6KMRRwyEIgl
 8Nq0pqnbMCE4cymM9rgjAbuU8EX9RJELf0fxXsgpwnXU08G8ep2VbN5wjo05Mq3a+Nnj
 +2uQ==
X-Gm-Message-State: AOAM5333i6a11akDttPUUZAOLUF/dVPkoJaW6UqJz3q44/IK+/6gfW1c
 1zgnLnnbaTJol3ZyTNJdnZuB8w==
X-Google-Smtp-Source: ABdhPJxjiG3BwPAYdCu25G4rR7zeHkDOzerV3evj3dGiSa5abiLjDb132IcyIxHbcsKZ7be220mzJQ==
X-Received: by 2002:adf:e94c:: with SMTP id m12mr47965694wrn.239.1641406860076; 
 Wed, 05 Jan 2022 10:21:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g5sm42528070wru.48.2022.01.05.10.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 10:20:59 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8CB331FFB7;
 Wed,  5 Jan 2022 18:20:58 +0000 (GMT)
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Daniel P. Berrange
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Trying to understand QOM object creation and property linking
Date: Wed, 05 Jan 2022 18:03:46 +0000
Message-ID: <87czl6jb79.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi,

I'm having a hell of a time trying to create a new SoC+Board model from
scratch. The problem comes down to trying to expose some properties to
the underlying CPU from my board model. So I have:

  static const TypeInfo pipico_machine_types[] =3D {
      {
          .name           =3D TYPE_PIPICO_MACHINE,
          .parent         =3D TYPE_MACHINE,
          .instance_size  =3D sizeof(PiPicoMachineState),
          .class_size     =3D sizeof(PiPicoMachineClass),
          .class_init     =3D pipico_machine_class_init,
      }
  };

and the class init sets:

    MachineClass *mc =3D MACHINE_CLASS(oc);
    ...
    mc->desc =3D g_strdup_printf("Raspberry Pi Pico");
    mc->init =3D pipico_machine_init;
    ...

and finally when I init the machine I do the following:

static void pipico_machine_init(MachineState *machine)
{
    PiPicoMachineState *s =3D PIPICO_MACHINE(machine);
    ...
    MemoryRegion *system_memory =3D get_system_memory();

    ...
=20=20=20=20
    /* initialize external Flash device */
    memory_region_init_rom(&s->flash, NULL,
                           "pico.flash0", 256 * KiB, &error_fatal);
    memory_region_add_subregion(system_memory, 0, &s->flash);

    /* Setup the SOC */
    object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RP2040);

    /* link properties from machine the SoC needs */
    object_property_set_link(OBJECT(&s->soc), "memory",
                             OBJECT(system_memory), &error_fatal);

    sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);


The initialisation of the SoC is simple because I can't do much until
things are realised:

static void rp2040_init(Object *obj)
{
    RP2040State *s =3D RP2040(obj);
    int n;

    fprintf(stderr, "%s: %p\n", __func__, obj);

    for (n =3D 0; n < RP2040_NCPUS; n++) {
        object_initialize_child(obj, "cpu[*]", &s->armv7m[n], TYPE_ARMV7M);
        qdev_prop_set_string(DEVICE(&s->armv7m[n]), "cpu-type",
                             ARM_CPU_TYPE_NAME("cortex-m0"));
    }
}


However when I get to realize the SoC itself:

static void rp2040_realize(DeviceState *dev, Error **errp)
{
    RP2040State *s =3D RP2040(dev);
    Object *obj =3D OBJECT(dev);
    int n;

    if (!s->board_memory) {
        error_setg(errp, "%s: memory property was not set", __func__);
        return;
    }

    /* initialize internal 16 KB internal ROM */
    memory_region_init_rom(&s->rom, obj, "rp2040.rom0", 16 * KiB, errp);
    memory_region_add_subregion(s->board_memory, 0, &s->rom);

    /* SRAM (Main 256k bank + two 4k banks)*/
    memory_region_init_ram(&s->sram03, obj, "rp2040.sram03", 256 * KiB, err=
p);
    memory_region_add_subregion(s->board_memory, RP2040_SRAM_BASE, &s->sram=
03);

    memory_region_init_ram(&s->sram4, obj, "rp2040.sram4", 4 * KiB, errp);
    memory_region_add_subregion(s->board_memory, RP2040_SRAM4_BASE, &s->sra=
m4);

    memory_region_init_ram(&s->sram5, obj, "rp2040.sram5", 4 * KiB, errp);
    memory_region_add_subregion(s->board_memory, RP2040_SRAM5_BASE, &s->sra=
m5);

    ...

    for (n =3D 0; n < RP2040_NCPUS; n++) {
        /* DeviceState *cpudev =3D DEVICE(&s->armv7m[i]); */
        Object *cpuobj =3D OBJECT(&s->armv7m[n]);

        object_property_set_link(cpuobj, "memory",
                                 OBJECT(&s->board_memory), errp);

And this passing of the link down to the CPU I segfault:

  rp2040_init: 0x555556d08710

  Thread 1 "qemu-system-arm" received signal SIGSEGV, Segmentation fault.
  object_get_canonical_path_component (obj=3D0x555556d0ea28) at ../../qom/o=
bject.c:1999
  1999        g_hash_table_iter_init(&iter, obj->parent->properties);
  (gdb) bt
  #0  object_get_canonical_path_component (obj=3D0x555556d0ea28) at ../../q=
om/object.c:1999
  #1  0x0000555555fb27ea in object_get_canonical_path (obj=3D0x555556d0ea28=
) at ../../qom/object.c:2025
  #2  0x0000555555fb1250 in object_property_set_link (obj=3D0x555556d087a0,=
 name=3D0x5555563190a2 "memory", value=3D0x555556d0ea28, errp=3D0x7fffffffe=
0f0) at ../../qom/object.c:1445
  #3  0x0000555555cf3c23 in rp2040_realize (dev=3D0x555556d08710, errp=3D0x=
7fffffffe0f0) at ../../hw/arm/rp2040.c:85
  #4  0x0000555555fa9323 in device_set_realized (obj=3D0x555556d08710, valu=
e=3Dtrue, errp=3D0x7fffffffe200) at ../../hw/core/qdev.c:532
  #5  0x0000555555fb300d in property_set_bool (obj=3D0x555556d08710, v=3D0x=
555556dced10, name=3D0x5555563822b9 "realized", opaque=3D0x555556a3a6d0, er=
rp=3D0x7fffffffe200) at ../../qom/object.c:2268
  #6  0x0000555555fb1054 in object_property_set (obj=3D0x555556d08710, name=
=3D0x5555563822b9 "realized", v=3D0x555556dced10, errp=3D0x7fffffffe200) at=
 ../../qom/object.c:1403
  #7  0x0000555555fb53ff in object_property_set_qobject (obj=3D0x555556d087=
10, name=3D0x5555563822b9 "realized", value=3D0x555556e79bc0, errp=3D0x5555=
56918de0 <error_fatal>) at ../../qom/qom-qobject.c:28
  #8  0x0000555555fb13b9 in object_property_set_bool (obj=3D0x555556d08710,=
 name=3D0x5555563822b9 "realized", value=3Dtrue, errp=3D0x555556918de0 <err=
or_fatal>) at ../../qom/object.c:1472
  #9  0x0000555555fa8beb in qdev_realize (dev=3D0x555556d08710, bus=3D0x555=
556d0f240, errp=3D0x555556918de0 <error_fatal>) at ../../hw/core/qdev.c:334
  #10 0x00005555559f0e28 in sysbus_realize (dev=3D0x555556d08710, errp=3D0x=
555556918de0 <error_fatal>) at ../../hw/core/sysbus.c:256
  #11 0x0000555555cf3f0e in pipico_machine_init (machine=3D0x555556d08600) =
at ../../hw/arm/raspi_pico.c:74
  #12 0x00005555559ed71b in machine_run_board_init (machine=3D0x555556d0860=
0) at ../../hw/core/machine.c:1184
  #13 0x0000555555e67f2c in qemu_init_board () at ../../softmmu/vl.c:2655
  #14 0x0000555555e6814a in qmp_x_exit_preconfig (errp=3D0x555556918de0 <er=
ror_fatal>) at ../../softmmu/vl.c:2743
  #15 0x0000555555e6a811 in qemu_init (argc=3D3, argv=3D0x7fffffffe6b8, env=
p=3D0x7fffffffe6d8) at ../../softmmu/vl.c:3778
  #16 0x0000555555884ebd in main (argc=3D3, argv=3D0x7fffffffe6b8, envp=3D0=
x7fffffffe6d8) at ../../softmmu/main.c:49

So have I discovered a bug in QOM handling or misunderstood the way
properties are meant to be shared from the main machine to the
underlying CPU?

Follow-up questions, does only creating the main memory aliases as part
of the SoC make sense? My rational is most of the memory is part of the
SoC not the board. I assume later RP2040 based boards may have different
flash configs or even external memory.

The current (messy) state of my tree can be seen at:

  https://gitlab.com/stsquad/qemu/-/commits/arm/picopi-rfc

--=20
Alex Benn=C3=A9e


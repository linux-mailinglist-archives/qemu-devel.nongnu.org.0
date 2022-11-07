Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83221620226
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:09:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAHk-00041I-HB; Mon, 07 Nov 2022 17:08:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1osAHj-00040w-AL
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:08:03 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1osAHh-0007VJ-KC
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:08:03 -0500
Received: by mail-ej1-x636.google.com with SMTP id d26so33817460eje.10
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aPGycMxlw7xLqRul0YuoEEpi5mm2ORE1XsbpN0O/7Yc=;
 b=cF242lgaBnno2t53hjsbyFdS5DZWQLmbXc9slSnl2csZS9ehKYzzOQs6YUkl6O46sW
 TYeDHMHGO6tjlXeu6xgtuuV6sC5V856Ru73vdFp78X6xUqAl99AgwGtkrtulrUSWVFaz
 hbhQHxB/mEMLPZCHAxQkXBbn08xDS4mQ/6e1eJN6bsZxcQYO3oIecxjuGXsk6JtGW2ny
 rDuWt8TSnF7mMeaFHwrzO1XHhFBhYxRT4KiJCKUr9+wlnxuj8PWnlvkmeJKjSy6cr+jU
 pAE79/WvzvHLN7WKTuT4d0IdC0hTslSSJSuVL2WdS3ueijCPnLFPGgQrto1D3fXiAh4W
 xQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aPGycMxlw7xLqRul0YuoEEpi5mm2ORE1XsbpN0O/7Yc=;
 b=Abh4r979HIW73FQO5PFwJCHgF65ynd3VRiCqzj4cKnoaLp45JGI1aQFscsQb754Qyt
 Q7bCGRUZ/+4q3SUfu2kxuxMLoL8U/SuT6YLZtPBvByO94SYkUWVR/o6uQYrmo1l6xQTJ
 ADczmB07x9RMBAwfhQF7AJRhz7gl817U1W83Mr8Gv408g2v6dDVmeLN0iylLmvGEg+wO
 Qj6IkV65t1Jo7gHwTtOPpT+PNqlzmJaKxpqfdmik9Up4kBMmlU+5WzRKApHyGe9+LuAE
 YSL9QqGBver1wCxOx24x0gOWv8UqUwWpoxFOSQNHcMM+BQQexBECBUjMCatt2Fx5XV8e
 eJwg==
X-Gm-Message-State: ACrzQf20xD2BcKKOjXmVte8O+mePc65yWJhXAr1FJv48YOMNzU50G1GE
 GO3bxV7Jf0URT7TginfvZjc=
X-Google-Smtp-Source: AMsMyM44zJTd7tD/Ib5q+txr+c/WqceB5povwIxiGqHA4qcPyqC9vjyLbibOtAu5GjdTm8MfaVUdHg==
X-Received: by 2002:a17:907:3f93:b0:7ae:3241:da1 with SMTP id
 hr19-20020a1709073f9300b007ae32410da1mr18705847ejc.177.1667858879397; 
 Mon, 07 Nov 2022 14:07:59 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-055-089-197.78.55.pool.telefonica.de.
 [78.55.89.197]) by smtp.gmail.com with ESMTPSA id
 bq3-20020a170906d0c300b007ad84cf1346sm3896486ejb.110.2022.11.07.14.07.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 14:07:59 -0800 (PST)
Date: Mon, 07 Nov 2022 22:07:52 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>
CC: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: =?US-ASCII?Q?Re=3A_=5BPULL_v3_49/81=5D_acpi=3A_pc=3A_vga=3A_use_AcpiDev?=
 =?US-ASCII?Q?AmlIf_interface_to_build_VGA_device_descriptors?=
In-Reply-To: <20221107080023-mutt-send-email-mst@kernel.org>
References: <20221105171116.432921-1-mst@redhat.com>
 <20221105171116.432921-50-mst@redhat.com>
 <CAG4p6K6ZgVmKAfRoaaD99RqtEjU0+qwUncb2=n+8GhNAezgKjg@mail.gmail.com>
 <20221107073158-mutt-send-email-mst@kernel.org>
 <CAARzgwwEayuzcrcSWRmK5UBG56R1SbfHJ0XoV9=T91=wqLMSAg@mail.gmail.com>
 <20221107080023-mutt-send-email-mst@kernel.org>
Message-ID: <489F21DE-0D51-4559-8067-2C096A2DC828@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Am 7=2E November 2022 13:00:36 UTC schrieb "Michael S=2E Tsirkin" <mst@redh=
at=2Ecom>:
>On Mon, Nov 07, 2022 at 06:16:25PM +0530, Ani Sinha wrote:
>> On Mon, Nov 7, 2022 at 6:03 PM Michael S=2E Tsirkin <mst@redhat=2Ecom> =
wrote:
>> >
>> > On Sun, Nov 06, 2022 at 10:16:41PM +0100, Bernhard Beschow wrote:
>> > >
>> > >
>> > > On Sat, Nov 5, 2022 at 6:45 PM Michael S=2E Tsirkin <mst@redhat=2Ec=
om> wrote:
>> > >
>> > >     From: Igor Mammedov <imammedo@redhat=2Ecom>
>> > >
>> > >     Signed-off-by: Igor Mammedov <imammedo@redhat=2Ecom>
>> > >     Message-Id: <20221017102146=2E2254096-2-imammedo@redhat=2Ecom>
>> > >     Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>> > >     Signed-off-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>> > >     NB: we do not expect any functional change in
>> > >     any ACPI tables with this change=2E It's only a refactoring=2E
>> > >
>> > >     Reviewed-by: Ani Sinha <ani@anisinha=2Eca>
>> > >     ---
>> > >      hw/display/vga_int=2Eh       |  2 ++
>> > >      hw/display/acpi-vga-stub=2Ec |  7 +++++++
>> > >      hw/display/acpi-vga=2Ec      | 26 ++++++++++++++++++++++++++
>> > >      hw/display/vga-pci=2Ec       |  4 ++++
>> > >      hw/i386/acpi-build=2Ec       | 26 +-------------------------
>> > >      hw/display/meson=2Ebuild     | 17 +++++++++++++++++
>> > >      6 files changed, 57 insertions(+), 25 deletions(-)
>> > >      create mode 100644 hw/display/acpi-vga-stub=2Ec
>> > >      create mode 100644 hw/display/acpi-vga=2Ec
>> > >
>> > >
>> > > With this "qemu:qtest+qtest-hppa / qtest-hppa/display-vga-test" fai=
ls due to
>> > > the symbol "aml_return" being undefined:
>> > >
>> > > # starting QEMU: exec =2E/qemu-system-hppa -qtest unix:/tmp/qtest-5=
15650=2Esock
>> > > -qtest-log /dev/null -chardev socket,path=3D/tmp/qtest-515650=2Eqmp=
,id=3Dchar0 -mon
>> > > chardev=3Dchar0,mode=3Dcontrol -display none -vga none -device virt=
io-vga -accel
>> > > qtest
>> > > ----------------------------------- stderr ------------------------=
-----------
>> > > Failed to open module: qemu/build/qemu-bundle/usr/lib/qemu/
>> > > hw-display-virtio-vga=2Eso: undefined symbol: aml_return
>> > > qemu-system-hppa: -device virtio-vga: 'virtio-vga' is not a valid d=
evice model
>> > > name
>> > > Broken pipe
>> > > =2E=2E/src/tests/qtest/libqtest=2Ec:179: kill_qemu() tried to termi=
nate QEMU process
>> > > but encountered exit status 1 (expected 0)
>> > >
>> > > (test program exited with status code -6)
>> > >
>> > > Best regards,
>> > > Bernhard
>> >
>> > It's unfortunate that it doesn't reproduce for me :(
>>=20
>> To reproduce:
>>=20
>> - docker pull registry=2Egitlab=2Ecom/qemu-project/qemu/qemu/centos8:la=
test
>> - configure line:
>>=20
>> =2E=2E/configure --enable-werror --disable-docs --disable-nettle
>> --enable-gcrypt --enable-fdt=3Dsystem --enable-modules
>> --enable-trace-backends=3Ddtrace --enable-docs --enable-vfio-user-serve=
r
>> --target-list=3D"ppc64-softmmu or1k-softmmu s390x-softmmu x86_64-softmm=
u
>> rx-softmmu sh4-softmmu nios2-softmmu"
>
>
>I suspect --enable-modules is the difference=2E

Indeed, I'm building with --enable-modules and got the undefined symbol=2E

Perhaps we could use the -Wl,--no-undefined linker option when building wi=
th modules to catch these errors at link time already?

Best regards,
Bernhard

>
>> - # make
>> - # QTEST_QEMU_BINARY=3D=2E/qemu-system-or1k  =2E/tests/qtest/qos-test
>> failed to open module:
>> /build/qemu/qemu/build/qemu-bundle/usr/local/lib64/qemu/hw-display-virt=
io-vga=2Eso:
>> undefined symbol: aml_return
>> qemu-system-or1k: =2E=2E/util/error=2Ec:59: error_setv: Assertion `*err=
p =3D=3D
>> NULL' failed=2E
>> Broken pipe
>> =2E=2E/tests/qtest/libqtest=2Ec:188: kill_qemu() detected QEMU death fr=
om
>> signal 6 (Aborted) (core dumped)
>> Aborted (core dumped)
>



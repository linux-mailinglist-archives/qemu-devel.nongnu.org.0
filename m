Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CF6621E9D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 22:36:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osWFH-00062F-Rj; Tue, 08 Nov 2022 16:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1osWFF-00061n-Rw
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:34:57 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1osWFD-0004eG-Qy
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 16:34:57 -0500
Received: by mail-ed1-x536.google.com with SMTP id a13so24555278edj.0
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 13:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w2jgdFwEZt2cK3qZyW579znerWyUJrU+xFNDPoeXTbk=;
 b=ZkyYdGUonF76nS+ueAeUSTeDUC7arq7J9+S2/yvI+UPcAa9Uxe1IKJfN9Pqmr4tEOd
 T6jcpPe9SMhlIKaqPtUUYKqch5kAT3zrZ+ejJSzqNv3WYUW+HtVEZY7EZCpnych8QW8w
 se0pjDEshVsQ8RmAKjaeBJ3I48B6hwivenABykNSdx+rCOQxzp2FEPXdaZ0+ZyJkV7/X
 BbXk7epU9WPZPDRgkFGjBS0UG6jMf0ctyHl/DlGP3g8dv25PvHBf19CQjtS4ul1Lf3G5
 +2u9vmny8y3RGfTMXefQrwL+jPVCNgIVZgcGzPn+tv7/OuoX/5uePjuzrjT4O1Ueo3Cg
 8T2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w2jgdFwEZt2cK3qZyW579znerWyUJrU+xFNDPoeXTbk=;
 b=pzzHyehwT3g2OWxs4gMgKciYV1+rR076XUt/5ipP0ApRsMRmU8sm7ULioUOdJwWxVV
 1OhBckx9VPmoeErm1LsV5j/EnF5+HDhAPSK6FE7HBz2OpR3pAczY4notUYtSSZOj9Qhu
 UjtRmib51juMeNekGYi3Iccr1LynDhfAObcneeSKO/3D5yMKE5kHjvJqmsm8RU4OfDaq
 7ejLA7bEz0sqk13XEvpOqB0txNS6o1YAHfqZ9qRysNVLcxrXO9M7ZgZDAJ5bYyTK0hls
 emv3Z7nGyBpYmWbiz99zt1+M89oGQK4gBE+iQgptseI7e91U5+mn1sKTXqqko58fqCkP
 h+sA==
X-Gm-Message-State: ACrzQf1N3eUHmMbtlIVrWpK1WOYfoCVEhWu8psIZ5aCxlTHssGAfGh/Q
 YduU+3o9/Frzdc16et6hbLQ=
X-Google-Smtp-Source: AMsMyM5Ip55A1yltKs1cIqXkLau8qrpvncXqOqB0f4QwHlIoX7XiH8plB4unzZFdZzwgaKNhlYWv3Q==
X-Received: by 2002:a05:6402:2893:b0:461:59fd:9b4 with SMTP id
 eg19-20020a056402289300b0046159fd09b4mr57340231edb.389.1667943294167; 
 Tue, 08 Nov 2022 13:34:54 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-013-156-164.77.13.pool.telefonica.de.
 [77.13.156.164]) by smtp.gmail.com with ESMTPSA id
 g20-20020aa7c594000000b00451319a43dasm6079042edq.2.2022.11.08.13.34.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Nov 2022 13:34:53 -0800 (PST)
Date: Tue, 08 Nov 2022 21:34:50 +0000
From: B <shentey@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: =?US-ASCII?Q?Re=3A_=5BPULL_v3_49/81=5D_acpi=3A_pc=3A_vga=3A_use_AcpiDev?=
 =?US-ASCII?Q?AmlIf_interface_to_build_VGA_device_descriptors?=
In-Reply-To: <20221107172548-mutt-send-email-mst@kernel.org>
References: <20221105171116.432921-1-mst@redhat.com>
 <20221105171116.432921-50-mst@redhat.com>
 <CAG4p6K6ZgVmKAfRoaaD99RqtEjU0+qwUncb2=n+8GhNAezgKjg@mail.gmail.com>
 <20221107073158-mutt-send-email-mst@kernel.org>
 <CAARzgwwEayuzcrcSWRmK5UBG56R1SbfHJ0XoV9=T91=wqLMSAg@mail.gmail.com>
 <20221107080023-mutt-send-email-mst@kernel.org>
 <489F21DE-0D51-4559-8067-2C096A2DC828@gmail.com>
 <20221107172548-mutt-send-email-mst@kernel.org>
Message-ID: <28F262F9-D1F6-4CA3-8DCB-878E198512F6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
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



Am 7=2E November 2022 22:28:31 UTC schrieb "Michael S=2E Tsirkin" <mst@red=
hat=2Ecom>:
>On Mon, Nov 07, 2022 at 10:07:52PM +0000, Bernhard Beschow wrote:
>> Am 7=2E November 2022 13:00:36 UTC schrieb "Michael S=2E Tsirkin" <mst@=
redhat=2Ecom>:
>> >On Mon, Nov 07, 2022 at 06:16:25PM +0530, Ani Sinha wrote:
>> >> On Mon, Nov 7, 2022 at 6:03 PM Michael S=2E Tsirkin <mst@redhat=2Eco=
m> wrote:
>> >> >
>> >> > On Sun, Nov 06, 2022 at 10:16:41PM +0100, Bernhard Beschow wrote:
>> >> > >
>> >> > >
>> >> > > On Sat, Nov 5, 2022 at 6:45 PM Michael S=2E Tsirkin <mst@redhat=
=2Ecom> wrote:
>> >> > >
>> >> > >     From: Igor Mammedov <imammedo@redhat=2Ecom>
>> >> > >
>> >> > >     Signed-off-by: Igor Mammedov <imammedo@redhat=2Ecom>
>> >> > >     Message-Id: <20221017102146=2E2254096-2-imammedo@redhat=2Eco=
m>
>> >> > >     Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>> >> > >     Signed-off-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>> >> > >     NB: we do not expect any functional change in
>> >> > >     any ACPI tables with this change=2E It's only a refactoring=
=2E
>> >> > >
>> >> > >     Reviewed-by: Ani Sinha <ani@anisinha=2Eca>
>> >> > >     ---
>> >> > >      hw/display/vga_int=2Eh       |  2 ++
>> >> > >      hw/display/acpi-vga-stub=2Ec |  7 +++++++
>> >> > >      hw/display/acpi-vga=2Ec      | 26 +++++++++++++++++++++++++=
+
>> >> > >      hw/display/vga-pci=2Ec       |  4 ++++
>> >> > >      hw/i386/acpi-build=2Ec       | 26 +------------------------=
-
>> >> > >      hw/display/meson=2Ebuild     | 17 +++++++++++++++++
>> >> > >      6 files changed, 57 insertions(+), 25 deletions(-)
>> >> > >      create mode 100644 hw/display/acpi-vga-stub=2Ec
>> >> > >      create mode 100644 hw/display/acpi-vga=2Ec
>> >> > >
>> >> > >
>> >> > > With this "qemu:qtest+qtest-hppa / qtest-hppa/display-vga-test" =
fails due to
>> >> > > the symbol "aml_return" being undefined:
>> >> > >
>> >> > > # starting QEMU: exec =2E/qemu-system-hppa -qtest unix:/tmp/qtes=
t-515650=2Esock
>> >> > > -qtest-log /dev/null -chardev socket,path=3D/tmp/qtest-515650=2E=
qmp,id=3Dchar0 -mon
>> >> > > chardev=3Dchar0,mode=3Dcontrol -display none -vga none -device v=
irtio-vga -accel
>> >> > > qtest
>> >> > > ----------------------------------- stderr ---------------------=
--------------
>> >> > > Failed to open module: qemu/build/qemu-bundle/usr/lib/qemu/
>> >> > > hw-display-virtio-vga=2Eso: undefined symbol: aml_return
>> >> > > qemu-system-hppa: -device virtio-vga: 'virtio-vga' is not a vali=
d device model
>> >> > > name
>> >> > > Broken pipe
>> >> > > =2E=2E/src/tests/qtest/libqtest=2Ec:179: kill_qemu() tried to te=
rminate QEMU process
>> >> > > but encountered exit status 1 (expected 0)
>> >> > >
>> >> > > (test program exited with status code -6)
>> >> > >
>> >> > > Best regards,
>> >> > > Bernhard
>> >> >
>> >> > It's unfortunate that it doesn't reproduce for me :(
>> >>=20
>> >> To reproduce:
>> >>=20
>> >> - docker pull registry=2Egitlab=2Ecom/qemu-project/qemu/qemu/centos8=
:latest
>> >> - configure line:
>> >>=20
>> >> =2E=2E/configure --enable-werror --disable-docs --disable-nettle
>> >> --enable-gcrypt --enable-fdt=3Dsystem --enable-modules
>> >> --enable-trace-backends=3Ddtrace --enable-docs --enable-vfio-user-se=
rver
>> >> --target-list=3D"ppc64-softmmu or1k-softmmu s390x-softmmu x86_64-sof=
tmmu
>> >> rx-softmmu sh4-softmmu nios2-softmmu"
>> >
>> >
>> >I suspect --enable-modules is the difference=2E
>>=20
>> Indeed, I'm building with --enable-modules and got the undefined symbol=
=2E
>>=20
>> Perhaps we could use the -Wl,--no-undefined linker option when building=
 with modules to catch these errors at link time already?
>>=20
>> Best regards,
>> Bernhard
>
>I don't see how it can work but sure, send a patch :)

Sounds like circular dependencies=2E Don't count on me any time soon then =
;)

Best regards,
Bernhard
>
>> >
>> >> - # make
>> >> - # QTEST_QEMU_BINARY=3D=2E/qemu-system-or1k  =2E/tests/qtest/qos-te=
st
>> >> failed to open module:
>> >> /build/qemu/qemu/build/qemu-bundle/usr/local/lib64/qemu/hw-display-v=
irtio-vga=2Eso:
>> >> undefined symbol: aml_return
>> >> qemu-system-or1k: =2E=2E/util/error=2Ec:59: error_setv: Assertion `*=
errp =3D=3D
>> >> NULL' failed=2E
>> >> Broken pipe
>> >> =2E=2E/tests/qtest/libqtest=2Ec:188: kill_qemu() detected QEMU death=
 from
>> >> signal 6 (Aborted) (core dumped)
>> >> Aborted (core dumped)
>> >
>


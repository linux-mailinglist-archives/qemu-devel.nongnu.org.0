Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD7C61F3A7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 13:48:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os1Wc-0004MW-H5; Mon, 07 Nov 2022 07:46:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1os1WS-0004HM-9F
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 07:46:47 -0500
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1os1WQ-0004wo-3p
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 07:46:39 -0500
Received: by mail-io1-xd2f.google.com with SMTP id h206so8669171iof.10
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 04:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Oo1wH3fZBZZSKbhUUfZptE5vCEzmQEuTDe+fm6D6rmA=;
 b=TTDQni1ZFDQqUa13it89eEwtq17ZK+51FFJem4qvjLzpnxzlpTCegxRAxokQHSyW9A
 l43cMEE8AhsSlLk6ZnHZPGvcEoIiMlH04oItwz1mqmrbdxwbkhfiNaol6xqBBeR/VTvn
 madkNLnWMuLBtTGQ3LK9WGLgdYG+PSB5WYA58s3J47jhi5jGh79xkzBlaA9yizUKLspE
 FpabVd6kHG42NKRx9S2qoyRMF6X+145Op1E+gismRIwZYS5yh1oW9mm+xhpId4CGn3WD
 Cl6LK6iiBRXdlrjx5/txzvOkbG4xaXLvOp1HDGWa8OvYkpKfkD/RUDiksCQLhHmEgLaG
 ffUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Oo1wH3fZBZZSKbhUUfZptE5vCEzmQEuTDe+fm6D6rmA=;
 b=Gq9ySLupbCZzDiNTr7zjt1sM7SHSwie1iEicq2jF1trpDaX8J2Kk03/EW2SXv3WQCD
 cFiFmm+Ok6WipE7Xmn2My0y6SKyTqg6owm+FpB/DBzZNaV5pRMw2Wiz1fSgtxj2yfRmz
 h0z2iTYr4uKUPmNBtjTr1kFrN60PhKUnIovkPUvk9YbSUuUJ+gR0AWreKbdvGlvmMtcp
 eIu48+JvkU6Le2jK3WWPTts6zaCoOMqcCDSse+d+rrfKidGwmbDbSmadoSloaMya5++9
 RhmikADVXdt9jKYeV6jnQODgJUTbAUVIscZLQxvOjk5I97NBODgDFyC3a96BRqVKy6F1
 bC/g==
X-Gm-Message-State: ACrzQf2GSi6yh+IAAjOdvU7I6/nExBjB3LNq66BxizAWtRxn6y6EquR+
 Dh/WW93Wtf0kYZdN7x3zsyCScWGpP2CwJ9gnhwE7mA==
X-Google-Smtp-Source: AMsMyM5QKb0Gcug7T2qcYotv70P/+7bod+X3EjtSxNMSMJ+WluPnxSLlMQqVx1H0l/r69RhpGj6g9VTltOkTZAL1b5Y=
X-Received: by 2002:a05:6602:1681:b0:6d5:ede:f95e with SMTP id
 s1-20020a056602168100b006d50edef95emr15536475iow.28.1667825196589; Mon, 07
 Nov 2022 04:46:36 -0800 (PST)
MIME-Version: 1.0
References: <20221105171116.432921-1-mst@redhat.com>
 <20221105171116.432921-50-mst@redhat.com>
 <CAG4p6K6ZgVmKAfRoaaD99RqtEjU0+qwUncb2=n+8GhNAezgKjg@mail.gmail.com>
 <20221107073158-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221107073158-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 7 Nov 2022 18:16:25 +0530
Message-ID: <CAARzgwwEayuzcrcSWRmK5UBG56R1SbfHJ0XoV9=T91=wqLMSAg@mail.gmail.com>
Subject: Re: [PULL v3 49/81] acpi: pc: vga: use AcpiDevAmlIf interface to
 build VGA device descriptors
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov <imammedo@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Mon, Nov 7, 2022 at 6:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Sun, Nov 06, 2022 at 10:16:41PM +0100, Bernhard Beschow wrote:
> >
> >
> > On Sat, Nov 5, 2022 at 6:45 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> >     From: Igor Mammedov <imammedo@redhat.com>
> >
> >     Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> >     Message-Id: <20221017102146.2254096-2-imammedo@redhat.com>
> >     Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >     NB: we do not expect any functional change in
> >     any ACPI tables with this change. It's only a refactoring.
> >
> >     Reviewed-by: Ani Sinha <ani@anisinha.ca>
> >     ---
> >      hw/display/vga_int.h       |  2 ++
> >      hw/display/acpi-vga-stub.c |  7 +++++++
> >      hw/display/acpi-vga.c      | 26 ++++++++++++++++++++++++++
> >      hw/display/vga-pci.c       |  4 ++++
> >      hw/i386/acpi-build.c       | 26 +-------------------------
> >      hw/display/meson.build     | 17 +++++++++++++++++
> >      6 files changed, 57 insertions(+), 25 deletions(-)
> >      create mode 100644 hw/display/acpi-vga-stub.c
> >      create mode 100644 hw/display/acpi-vga.c
> >
> >
> > With this "qemu:qtest+qtest-hppa / qtest-hppa/display-vga-test" fails due to
> > the symbol "aml_return" being undefined:
> >
> > # starting QEMU: exec ./qemu-system-hppa -qtest unix:/tmp/qtest-515650.sock
> > -qtest-log /dev/null -chardev socket,path=/tmp/qtest-515650.qmp,id=char0 -mon
> > chardev=char0,mode=control -display none -vga none -device virtio-vga -accel
> > qtest
> > ----------------------------------- stderr -----------------------------------
> > Failed to open module: qemu/build/qemu-bundle/usr/lib/qemu/
> > hw-display-virtio-vga.so: undefined symbol: aml_return
> > qemu-system-hppa: -device virtio-vga: 'virtio-vga' is not a valid device model
> > name
> > Broken pipe
> > ../src/tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU process
> > but encountered exit status 1 (expected 0)
> >
> > (test program exited with status code -6)
> >
> > Best regards,
> > Bernhard
>
> It's unfortunate that it doesn't reproduce for me :(

To reproduce:

- docker pull registry.gitlab.com/qemu-project/qemu/qemu/centos8:latest
- configure line:

../configure --enable-werror --disable-docs --disable-nettle
--enable-gcrypt --enable-fdt=system --enable-modules
--enable-trace-backends=dtrace --enable-docs --enable-vfio-user-server
--target-list="ppc64-softmmu or1k-softmmu s390x-softmmu x86_64-softmmu
rx-softmmu sh4-softmmu nios2-softmmu"

- # make
- # QTEST_QEMU_BINARY=./qemu-system-or1k  ./tests/qtest/qos-test
failed to open module:
/build/qemu/qemu/build/qemu-bundle/usr/local/lib64/qemu/hw-display-virtio-vga.so:
undefined symbol: aml_return
qemu-system-or1k: ../util/error.c:59: error_setv: Assertion `*errp ==
NULL' failed.
Broken pipe
../tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from
signal 6 (Aborted) (core dumped)
Aborted (core dumped)


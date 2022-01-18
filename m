Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2DD492EB4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 20:49:27 +0100 (CET)
Received: from localhost ([::1]:49098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9uTu-00043c-9n
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 14:49:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9uMt-00067J-L6
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 14:42:11 -0500
Received: from [2a00:1450:4864:20::333] (port=54124
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9uMr-0002Va-Pv
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 14:42:11 -0500
Received: by mail-wm1-x333.google.com with SMTP id n8so399569wmk.3
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 11:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bVxUUPk+/IN4XX9Y+l2cv7mBXCaWlv920qPi2CqZPZE=;
 b=sGzzfyTUeryJ4dxMv+qbRTpXzBS7GYnzE4VMJ17ev9tFUY3/FrxGB2I+ICNeix2+1J
 G3c+ZKPNBn8uNXQA6wUAqbVQz5Dg5eOy/g1oIPPdE7YYpsIkkYsRtllnClKPJ7MWt1fN
 Tl0hzDkxcYUxeqJAhaPqdkHF5bDxp0U4epubfhZ2AQg/D0RjW3Za13cheU/CGRIqMbGM
 H70I5JL+LgwVItN8cQvvPbR+IaGTBXej4IJtxhfeiu8PxARXnDXHwfVUyjj9OThjCWOI
 /CMfc9mOfvEsUEvDfA2PuBgsnYWWmMZ5F1qz16u2IH1rVUn3gGasHU+Z55NQXUrckMjJ
 /Ycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bVxUUPk+/IN4XX9Y+l2cv7mBXCaWlv920qPi2CqZPZE=;
 b=Mdfzg7S9IBlbuhwFJI7es04GtojwE3xvizFGoUtOVh+iPLglTnqoGN1oE1C2gEZ4nB
 mJdHK23i2Dnt+hfwDJRX39kAseVPaK08URgYVgZoqQTTh4K+QFOIitLd20/IdMpGcryZ
 fUpuceTWITRVV5LPB6RJsIYP9HEQoS/3S/rq+b/0A3AI6FApcZ6yL/9+MDBaN5oKp8Ss
 1ACv4rUYxcbw+lzjfgUjpmlMVa25NcKPRl74IKH0+YqDTa5gS7+KJvg5K82UXDFwckUa
 sm0S+pP4wqIn9SvnOppdwGT5+ssvnyjaQkLLPCGtkG5VQEXlWosoHjWJKMAwYMvI3FBS
 PLSQ==
X-Gm-Message-State: AOAM530+UZZyrp4ZbQQjOgePv1QXZH3gbvwvMg1r6AqiWFlOsxs5OSnr
 FFmJOiHAe+DmYg+WRAINPJNrYRllXBL0YonEgoh3Hw==
X-Google-Smtp-Source: ABdhPJxfh+oHSuA2nPWFWybQqziZnkTy91zjXMm0DxwdYJwUnpAMZ8UEW56WO6QfdQ+027n5iuhMWrYAaEbqczFrCpw=
X-Received: by 2002:a05:600c:3544:: with SMTP id i4mr84579wmq.21.1642534927973; 
 Tue, 18 Jan 2022 11:42:07 -0800 (PST)
MIME-Version: 1.0
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <87pmop7xfw.fsf@linaro.org>
In-Reply-To: <87pmop7xfw.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jan 2022 19:41:56 +0000
Message-ID: <CAFEAcA-ncYCtpH2aCjd4GWuN9SLcxGMQUOutBWyNHByD6_gG0w@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] arm gicv3 ITS: Various bug fixes and refactorings
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, andre.przywara@arm.com,
 Shashi Mallela <shashi.mallela@linaro.org>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Jan 2022 at 17:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > I've been working on the ITS to add support for the GICv4 functionality=
.
> > In the course of that I found a handful of bugs in it and also some
> > places where the code benefited from refactoring to make it a better
> > base to put in the GICv4 parts. This patchset is just the bugfixes
> > and cleanups, because there are enough patches here that I figured it
> > made sense to send them out now rather than holding on to them.
> >
> > Most of these patches were in v1 and have been reviewed already.
>
> I've reviewed the patches and they look good to me. kvm-unit-tests is
> still failing some tests but the ones it fails hasn't changed from
> before this patch:
>
>   =E2=9C=97  env QEMU=3D$HOME/lsrc/qemu.git/builds/arm.all/qemu-system-aa=
rch64 ./run_tests.sh -g gic
>   PASS gicv2-ipi (3 tests)
>   PASS gicv2-mmio (17 tests, 1 skipped)
>   FAIL gicv2-mmio-up (17 tests, 2 unexpected failures)
>   FAIL gicv2-mmio-3p (17 tests, 3 unexpected failures)
>   PASS gicv3-ipi (3 tests)
>   PASS gicv2-active (1 tests)
>   PASS gicv3-active (1 tests)
>
> That said running with -d unimp,guest_errors there are some things that
> should probably be double checked, e.g.:

Almost all of the logging seems to be where the test code is
doing stuff that the GIC spec says isn't valid. Also, this
test is gicv2, which is unrelated to either the gicv3 code
or to the ITS...

>   /home/alex/lsrc/qemu.git/builds/arm.all/qemu-system-aarch64 -nodefaults=
 -machine virt -accel tcg -cpu cortex-a57 -device virtio-serial-device -dev=
ice virtconsole,chardev=3D
>   ctd -chardev testdev,id=3Dctd -device pci-testdev -display none -serial=
 stdio -kernel arm/gic.flat -machine gic-version=3D2 -smp 1 -append "mmio" =
-d unimp,guest_errors
>   PASS: gicv2: mmio: all CPUs have interrupts
>   gic_dist_readb: Bad offset 8
>   gic_dist_readb: Bad offset 9
>   gic_dist_readb: Bad offset a
>   gic_dist_readb: Bad offset b

This is GICD_IIDR, which is a 32-bit register. The test looks like it's
trying to read it as 4 separate bytes, which is out of spec, and
is why our implementation is warning about it.

>   INFO: gicv2: mmio: IIDR: 0x00000000
>   gic_dist_writeb: Bad offset 4
>   gic_dist_writeb: Bad offset 5
>   gic_dist_writeb: Bad offset 6
>   gic_dist_writeb: Bad offset 7
>   gic_dist_writeb: Bad offset 4
>   gic_dist_writeb: Bad offset 5
>   gic_dist_writeb: Bad offset 6
>   gic_dist_writeb: Bad offset 7
>   gic_dist_writeb: Bad offset 4
>   gic_dist_writeb: Bad offset 5
>   gic_dist_writeb: Bad offset 6
>   gic_dist_writeb: Bad offset 7

These complaints are because the test is trying to write
to GICD_TYPER, which is not permitted.

>   PASS: gicv2: mmio: GICD_TYPER is read-only
>   gic_dist_readb: Bad offset 8
>   gic_dist_readb: Bad offset 9
>   gic_dist_readb: Bad offset a
>   gic_dist_readb: Bad offset b

More attempts to do byte accesses to a word-only register.

>   gic_dist_writeb: Bad offset 8
>   gic_dist_writeb: Bad offset 9
>   gic_dist_writeb: Bad offset a
>   gic_dist_writeb: Bad offset b
>   gic_dist_readb: Bad offset 8
>   gic_dist_readb: Bad offset 9
>   gic_dist_readb: Bad offset a
>   gic_dist_readb: Bad offset b
>   gic_dist_writeb: Bad offset 8
>   gic_dist_writeb: Bad offset 9
>   gic_dist_writeb: Bad offset a
>   gic_dist_writeb: Bad offset b
>   gic_dist_readb: Bad offset 8
>   gic_dist_readb: Bad offset 9
>   gic_dist_readb: Bad offset a
>   gic_dist_readb: Bad offset b
>   PASS: gicv2: mmio: GICD_IIDR is read-only
>   gic_dist_writeb: Bad offset fe8
>   gic_dist_writeb: Bad offset fe9
>   gic_dist_writeb: Bad offset fea
>   gic_dist_writeb: Bad offset feb
>   gic_dist_writeb: Bad offset fe8
>   gic_dist_writeb: Bad offset fe9
>   gic_dist_writeb: Bad offset fea
>   gic_dist_writeb: Bad offset feb
>   gic_dist_writeb: Bad offset fe8
>   gic_dist_writeb: Bad offset fe9
>   gic_dist_writeb: Bad offset fea
>   gic_dist_writeb: Bad offset feb

Writing bytes to a register that is both read-only and also 32-bit only.

>   PASS: gicv2: mmio: ICPIDR2 is read-only
>   INFO: gicv2: mmio: value of ICPIDR2: 0x0000002b
>   PASS: gicv2: mmio: IPRIORITYR: consistent priority masking
>   INFO: gicv2: mmio: IPRIORITYR: priority mask is 0xffffffff
>   PASS: gicv2: mmio: IPRIORITYR: implements at least 4 priority bits
>   INFO: gicv2: mmio: IPRIORITYR: 8 priority bits implemented
>   PASS: gicv2: mmio: IPRIORITYR: clearing priorities
>   gic_dist_readb: Bad offset 520
>   gic_dist_readb: Bad offset 521
>   gic_dist_readb: Bad offset 522
>   gic_dist_readb: Bad offset 523
>   gic_dist_writeb: Bad offset 520
>   gic_dist_writeb: Bad offset 521
>   gic_dist_writeb: Bad offset 522
>   gic_dist_writeb: Bad offset 523
>   gic_dist_readb: Bad offset 520
>   gic_dist_readb: Bad offset 521
>   gic_dist_readb: Bad offset 522
>   gic_dist_readb: Bad offset 523
>   gic_dist_writeb: Bad offset 520
>   gic_dist_writeb: Bad offset 521
>   gic_dist_writeb: Bad offset 522
>   gic_dist_writeb: Bad offset 523
>   gic_dist_readb: Bad offset 520
>   gic_dist_readb: Bad offset 521
>   gic_dist_readb: Bad offset 522
>   gic_dist_readb: Bad offset 523

I suspect from what the following test says that this is an
attempt to write beyond the end of the valid IPRIORITYR registers,
which isn't permitted.

>   PASS: gicv2: mmio: IPRIORITYR: accesses beyond limit RAZ/WI
>   PASS: gicv2: mmio: IPRIORITYR: accessing last SPIs
>   PASS: gicv2: mmio: IPRIORITYR: priorities are preserved
>   PASS: gicv2: mmio: IPRIORITYR: byte reads successful
>   PASS: gicv2: mmio: IPRIORITYR: byte writes successful
>   PASS: gicv2: mmio: ITARGETSR: bits for non-existent CPUs masked
>   INFO: gicv2: mmio: ITARGETSR: 7 non-existent CPUs
>   PASS: gicv2: mmio: ITARGETSR: accesses beyond limit RAZ/WI
>   FAIL: gicv2: mmio: ITARGETSR: register content preserved
>   INFO: gicv2: mmio: ITARGETSR: writing 01010001 reads back as 00000000
>   PASS: gicv2: mmio: ITARGETSR: byte reads successful
>   FAIL: gicv2: mmio: ITARGETSR: byte writes successful
>   INFO: gicv2: mmio: ITARGETSR: writing 0x1f into bytes 2 =3D> 0x00000000
>   SUMMARY: 17 tests, 2 unexpected failures

These ITARGETSR failures are not correct (or you're not running the
test case the way it's supposed to be). Your command line runs
only one CPU, and for a uniprocessor GIC the ITARGETRSn registers
are supposed to be RAZ/WI, whereas the test seems to be expecting
something else.

thanks
-- PMM


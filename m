Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEFA3D1046
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:54:15 +0200 (CEST)
Received: from localhost ([::1]:43362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Cfu-0000xR-E1
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m6CeI-0007wF-Gq
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:52:34 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:37610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m6CeG-0007HV-It
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:52:34 -0400
Received: by mail-io1-xd32.google.com with SMTP id r18so2427608iot.4
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 06:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VWGKXBb0DWA9ITU9+F3aP2WLHpUZsSk1IOv5aU44jIs=;
 b=N5t4FqXAwirkXK2bW0QFQah/j+keb2ti7arOIeKbdjpeaouFz7GG7JdzmrSEk1/oH4
 wq+SPE8mfVLNNOa/hgn2Se69rrG4SEEtb/K6yTS9tFVyfuLwi3pXJTiMxy7jSicwJGmq
 /DzlfybWpfg2vemQP9swPgH4o2rBtkXLfD62aegFMPBwZfXdSgQkkxAu9M1r6dF4UR+C
 cEGjQgbOx77RK5ukgdPqzqSCnS7m1GcbSKlFwGN5l4+8GgpummZHZ2kZrPSimUlTwuCm
 jKV929pP0TEzuZ7pDlhZtuBTOfNC/gl/eKkAZ+sDKJbAbhpo9C79qHaSD8D1HIoALU+R
 /Szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VWGKXBb0DWA9ITU9+F3aP2WLHpUZsSk1IOv5aU44jIs=;
 b=IyMx1lqT+iIHoQFKTPmRMy1degTaAe+BHrQX8qvaYmGkxCvvwW5CdPCn1nbCsSYORc
 0B5M5CNoWnpF7EqTQ60xjGr0oQ0g9/OYIKy6SFInADuT+IsW1E6L6RMJvGIdwrV2Q3gI
 mPDB23871gnF4Uc2GKvbzr4Iqi6o1ygUznigpESD61TqYvg5teacGhkJrW0Bf/PzHu5f
 oZ7S03a7Um3KJ9iyrVlsk/XYy5klavJjL8i/xh+fEgTELD1Lc1A0lQkoUS8V4Jy9fi3Y
 dYad+wbKEbPvuvu3pjng8QGpqPUc2RRhcx9Wack/v28ZRmpMQM7SIpfo9PXbxEJXsr7z
 OIIA==
X-Gm-Message-State: AOAM533vYIkJvCTkinHgmLvuObvExHpjGuab1RJ/X8oJM7JBh9w6439R
 opiuAtrqiA75fiHrWrX8DDEBRn7NkYnEUfZS0iE=
X-Google-Smtp-Source: ABdhPJyXazpA12cByxznNQmBrY5KmcdILXfPdOr7/xtyhXcAei3+4b41oztT9HLisNRP7IpuDYf7onTfa569Pbep3Fw=
X-Received: by 2002:a02:cf31:: with SMTP id s17mr31430469jar.46.1626875551244; 
 Wed, 21 Jul 2021 06:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <875yx69r7h.fsf@redhat.com> <a8dbec45-6d87-70ee-1b58-0592145e8160@huawei.com>
In-Reply-To: <a8dbec45-6d87-70ee-1b58-0592145e8160@huawei.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 21 Jul 2021 15:52:19 +0200
Message-ID: <CAM9Jb+hUuTGe5txXEiiJhb+rH=0gjSJymMs+=AdyqbtDOGRVYg@mail.gmail.com>
Subject: Re: [PATCH for-6.2 v2 00/11] machine: smp parsing fixes and
 improvement
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Qemu Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > On Mon, Jul 19 2021, Yanan Wang <wangyanan55@huawei.com> wrote:
> >
> >> Hi,
> >>
> >> This is v2 of the series [1] that I have posted to introduce some smp parsing
> >> fixes and improvement, much more work has been processed compared to RFC v1.
> >>
> >> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg00259.html
> >>
> >> The purpose of this series is to improve/fix the parsing logic. Explicitly
> >> specifying a CPU topology parameter as zero is not allowed any more, and
> >> maxcpus is now uniformly used to calculate the omitted parameters. It's also
> >> suggested that we should start to prefer cores over sockets over threads on
> >> the newer machine types, which will make the computed virtual topology more
> >> reflective of the real hardware.
> >>
> >> In order to reduce code duplication and ease the code maintenance, smp_parse
> >> in now converted into a parser generic enough for all arches, so that the PC
> >> specific one can be removed. It's also convenient to introduce more topology
> >> members (e.g. cluster) to the generic parser in the future.
> > Cc:ing Pierre, as he also had been looking at the smp parsing code (for
> > s390x) recently.
> >
> > Also, please keep me on cc: for patches that touch s390x.
> Sure, I will. Sorry about the missing. :)
>
> Thanks,
> Yanan
> .
> >> Finally, a QEMU unit test for the parsing of given SMP configuration is added.
> >> Since all the parsing logic is in generic function smp_parse(), this test
> >> passes diffenent SMP configurations to the function and compare the parsing
> >> result with what is expected. In the test, all possible collections of the
> >> topology parameters and the corressponding expected results are listed,
> >> including the valid and invalid ones. The preference of sockets over cores
> >> and the preference of cores over sockets, and the support of multi-dies are
> >> also taken into consideration.
> >>
> >> ---
> >>
> >> Changelogs:
> >>
> >> v1->v2:
> >> - disallow "anything=0" in the smp configuration (Andrew)
> >> - make function smp_parse() a generic helper for all arches
> >> - improve the error reporting in the parser
> >> - start to prefer cores over sockets since 6.2 (Daniel)
> >> - add a unit test for the smp parsing (Daniel)
> >>
> >> ---
> >>
> >> Yanan Wang (11):
> >>    machine: Disallow specifying topology parameters as zero
> >>    machine: Make smp_parse generic enough for all arches
> >>    machine: Uniformly use maxcpus to calculate the omitted parameters
> >>    machine: Use the computed parameters to calculate omitted cpus
> >>    machine: Improve the error reporting of smp parsing
> >>    hw: Add compat machines for 6.2
> >>    machine: Prefer cores over sockets in smp parsing since 6.2
> >>    machine: Use ms instead of global current_machine in sanity-check
> >>    machine: Tweak the order of topology members in struct CpuTopology
> >>    machine: Split out the smp parsing code
> >>    tests/unit: Add a unit test for smp parsing
> >>
> >>   MAINTAINERS                 |    2 +
> >>   hw/arm/virt.c               |   10 +-
> >>   hw/core/machine-smp.c       |  124 ++++
> >>   hw/core/machine.c           |   68 +--
> >>   hw/core/meson.build         |    1 +
> >>   hw/i386/pc.c                |   66 +--
> >>   hw/i386/pc_piix.c           |   15 +-
> >>   hw/i386/pc_q35.c            |   14 +-
> >>   hw/ppc/spapr.c              |   16 +-
> >>   hw/s390x/s390-virtio-ccw.c  |   15 +-
> >>   include/hw/boards.h         |   13 +-
> >>   include/hw/i386/pc.h        |    3 +
> >>   qapi/machine.json           |    6 +-
> >>   qemu-options.hx             |    4 +-
> >>   tests/unit/meson.build      |    1 +
> >>   tests/unit/test-smp-parse.c | 1117 +++++++++++++++++++++++++++++++++++
> >>   16 files changed, 1338 insertions(+), 137 deletions(-)
> >>   create mode 100644 hw/core/machine-smp.c
> >>   create mode 100644 tests/unit/test-smp-parse.c
> >>

Please add me in CC as I reviewed one of the patch and was in middle
of reviewing few other patches
but missed the latest version.

Thanks,
Pankaj


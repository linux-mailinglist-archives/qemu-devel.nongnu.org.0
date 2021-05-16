Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753BC381BDE
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 02:52:37 +0200 (CEST)
Received: from localhost ([::1]:60386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li51I-00064s-2o
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 20:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1li4zs-0004zH-FY; Sat, 15 May 2021 20:51:08 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:36805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1li4zo-0004yp-LN; Sat, 15 May 2021 20:51:07 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id m9so3910113ybm.3;
 Sat, 15 May 2021 17:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kP36RroLkKizCdYhkaz0wlFovbkbXrH45ok6tEymahk=;
 b=FwmbbLZdztekmG4HdJrlx0XpzyBPPJnFvTxTPCCdpf6ZwrK0aBq8HeDDJEJ0SVpJTu
 QMseNjZKH1nT651pReLe2nQ93ng+I2+ASnI4I1rzyBavxiTS0wkyxgpPtWaXa5nOhBw4
 ktrCyA+rsSQBgLTdXuMw5C8/byLpGynCO+Ob05AYoHXYnGVzxD6qc8YiJoJ1Ab6bIabB
 y82ApP4Ox1mdl2ykQY8Ve3vw6J9PhxBsRcXBJXwiaRuEUcKzmjbUPeG6KuTEBcZVY4oF
 dp88FSuzMldcPzsXyMAfiKht39W2BPKE2nJLrlI9rxXCoDpx15d7wJmbWSYpaLDYoRa3
 oIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kP36RroLkKizCdYhkaz0wlFovbkbXrH45ok6tEymahk=;
 b=CoX+F/sICMpgPU5qksjYPxF1rOAfaswGpIUGc3eMlUUI+dl7h76eLRN43GqATs6HvG
 NtVekV1Xyfv3zliVBEL2z6mH8Hsy4+8KgnKOEaFCDBEWIrdWxU7fQuedFIPq+nZxB8Nj
 pW9lz+sToBc4W4FBHG1DFvMKEnv3la2tRJqzj4Oppa9eFfvCFPxYogRMKITNGh83B3zg
 EBB8uiS4FTSrU9sp17kdqNy1MIMP0zG69VMd4wtbHrhkYYGb8P8BFI928NKbC4gAx/pU
 3paqbuQ5LqTSS++Lzis/fqf+/RpSNiqCv25eMuOET6hQ1BZsYSAWid1v8n16TBFyX574
 znRw==
X-Gm-Message-State: AOAM5314BgbflBWSJX4AN2rRIKVHvxA/VsCj3Eh7GUKBJFg5Ag7Y5MA1
 Z0KdTdjowtMJ6hDDjMsZlQxnGtmzk114edFeNzg=
X-Google-Smtp-Source: ABdhPJwnxEPTB6khBFMjHE9Hb88zLyJCZmL363hQ4QXg85QRw9zHzHEIBnW6BQAwerhWRp1kqdoN0skGV3XC5UbGTdU=
X-Received: by 2002:a25:aae1:: with SMTP id t88mr71742008ybi.122.1621126262228; 
 Sat, 15 May 2021 17:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210513163858.3928976-1-philmd@redhat.com>
 <20210513163858.3928976-2-philmd@redhat.com>
 <CAEUhbmW0h+kvTyrDjum8pVmm9sjn9mkTf-bLRRJqf-ocs1mgqg@mail.gmail.com>
 <25881435-7f61-1b3d-f25c-33fc07d4ed71@redhat.com>
In-Reply-To: <25881435-7f61-1b3d-f25c-33fc07d4ed71@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 16 May 2021 08:50:51 +0800
Message-ID: <CAEUhbmXr4-0XC+mnV65ktq=pPPYLEbt970yC5ZSjwFqbRkEpiw@mail.gmail.com>
Subject: Re: [PATCH 01/10] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 16, 2021 at 1:33 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 5/14/21 5:02 AM, Bin Meng wrote:
> > On Fri, May 14, 2021 at 12:53 AM Philippe Mathieu-Daud=C3=A9
> > <philmd@redhat.com> wrote:
> >>
> >> Per the kconfig.rst:
> >>
> >>   A device should be listed [...] ``imply`` if (depending on
> >>   the QEMU command line) the board may or  may not be started
> >>   without it.
> >>
> >> This is the case with the NVDIMM device (it is certainly possible
> >> to start a machine without NVDIMM) , so use the 'imply' weak
> >> reverse dependency to select the symbol.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  default-configs/devices/ppc64-softmmu.mak | 1 -
> >>  hw/arm/Kconfig                            | 1 +
> >>  hw/i386/Kconfig                           | 1 +
> >>  hw/mem/Kconfig                            | 2 --
> >>  hw/ppc/Kconfig                            | 1 +
> >>  5 files changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/default-configs/devices/ppc64-softmmu.mak b/default-confi=
gs/devices/ppc64-softmmu.mak
> >> index ae0841fa3a1..cca52665d90 100644
> >> --- a/default-configs/devices/ppc64-softmmu.mak
> >> +++ b/default-configs/devices/ppc64-softmmu.mak
> >> @@ -8,4 +8,3 @@ CONFIG_POWERNV=3Dy
> >>
> >>  # For pSeries
> >>  CONFIG_PSERIES=3Dy
> >> -CONFIG_NVDIMM=3Dy
> >
> > I think only removing this one makes sense. I fail to see any
> > difference of other changes in this patch.
>
> See below "depends on (PC || PSERIES || ARM_VIRT)"

Yes, I saw that. This change does not make any difference compared to
"depends on"

>
> >
> >> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> >> index b887f6a5b17..67723d9ea6a 100644
> >> --- a/hw/arm/Kconfig
> >> +++ b/hw/arm/Kconfig
> >> @@ -6,6 +6,7 @@ config ARM_VIRT
> >>      imply VFIO_PLATFORM
> >>      imply VFIO_XGMAC
> >>      imply TPM_TIS_SYSBUS
> >> +    imply NVDIMM
> >>      select ARM_GIC
> >>      select ACPI
> >>      select ARM_SMMUV3
> >> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> >> index 7f91f30877f..66838fa397b 100644
> >> --- a/hw/i386/Kconfig
> >> +++ b/hw/i386/Kconfig
> >> @@ -23,6 +23,7 @@ config PC
> >>      imply TPM_TIS_ISA
> >>      imply VGA_PCI
> >>      imply VIRTIO_VGA
> >> +    imply NVDIMM
> >>      select FDC
> >>      select I8259
> >>      select I8254
> >> diff --git a/hw/mem/Kconfig b/hw/mem/Kconfig
> >> index a0ef2cf648e..8b19fdc49f1 100644
> >> --- a/hw/mem/Kconfig
> >> +++ b/hw/mem/Kconfig
> >> @@ -7,6 +7,4 @@ config MEM_DEVICE
> >>
> >>  config NVDIMM
> >>      bool
> >> -    default y
> >> -    depends on (PC || PSERIES || ARM_VIRT)
> >>      select MEM_DEVICE
> >> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> >> index e51e0e5e5ac..66e0b15d9ef 100644
> >> --- a/hw/ppc/Kconfig
> >> +++ b/hw/ppc/Kconfig
> >> @@ -3,6 +3,7 @@ config PSERIES
> >>      imply PCI_DEVICES
> >>      imply TEST_DEVICES
> >>      imply VIRTIO_VGA
> >> +    imply NVDIMM
> >>      select DIMM
> >>      select PCI
> >>      select SPAPR_VSCSI

Regards,
Bin


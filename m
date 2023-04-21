Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 641606EAF5C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:41:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptom-0002zI-I0; Fri, 21 Apr 2023 12:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pptoh-0002z1-1q
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:41:00 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pptoc-0002xU-1R
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:40:58 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-956ff2399c9so239369566b.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682095252; x=1684687252;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KbEBBZ9hchaVWp6VxQsSpSM8R/qpFi0H7g0MVdODEck=;
 b=Lya5Sy3I1PrvGOlxeawbU1Pss2wWlJqSR1iMaKyJt/1slgGeGnQQEoLFOBDKb+qQNs
 3lZU6K65u6k14+Delg+CpkYr39UaCJ5k8aPsNu0fHMxJDgRoRPtmtUJ1tFxd2YRn+wQF
 8CludYw9XLtpyMACRMRVDQ+Rczsn48whmhWfQ2QqOgzSxx6vx7OkFIrg3rs8UbeExvyM
 o8WLhTuw3sr2k5donhQrfXZLkMAshHF3NYk6fPWXZiVI1CjKDq8E3sMBCDuZrarR3VbZ
 +iyiwgxkuReKXFZPqKhyxj9u2J+h4o7fFPtCIUATIQY2KwEayWVf1J8WAn39hPypZ1JW
 56Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682095252; x=1684687252;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KbEBBZ9hchaVWp6VxQsSpSM8R/qpFi0H7g0MVdODEck=;
 b=lmWMNoI7C7d0i+IFaISAHnRyidJ8qsoDFp9RJvOI8wD26kYi/w3WfAuxs6sYb5NDf9
 HKA5DY9M1TJqM6acYgUBexVbzWnxI7K7fr5chBluo9z5iUZWAMCMM3WgARHpI3lvd8jN
 rC0UBqxbvcp0ITAgAaGX3oIk7Rs4LQsE4ra9pXpcVRMW/iCC4iYA8uWOnQIakYidjArx
 YWbowZSJRIk/vYPO62w48DJ/HS89NZOfofuFL0xRV4EHsbDgPBMz2HdHi0ArsgoM2xny
 C6inoSOANmLYC0KqtqeS2eE3UDlaVf5rrqivSe+wOBfHej+t8RvniQoNFEU6eqqkdRPS
 57fg==
X-Gm-Message-State: AAQBX9cA3HenpETeHRU3AXbiSkywEzVY+FsAKowJErmD/vxPahNagi3i
 Uvh4FDZVxy10YNORXzA13KcpVPLb/Es=
X-Google-Smtp-Source: AKy350ZFyfS4Ct8I/8ldbM5W0h22gYoHUXHSlachUPULe0s18WkKXJ0rQhUHlxMTqHDisvniElOa3A==
X-Received: by 2002:a17:906:eb01:b0:933:4d37:82b2 with SMTP id
 mb1-20020a170906eb0100b009334d3782b2mr2376253ejb.57.1682095251866; 
 Fri, 21 Apr 2023 09:40:51 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-011-063-073.77.11.pool.telefonica.de.
 [77.11.63.73]) by smtp.gmail.com with ESMTPSA id
 r2-20020a1709063d6200b00949691d3183sm2250546ejf.36.2023.04.21.09.40.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 09:40:51 -0700 (PDT)
Date: Fri, 21 Apr 2023 16:40:47 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v8 00/23] Consolidate PIIX south bridges
In-Reply-To: <20230421031431-mutt-send-email-mst@kernel.org>
References: <20230302212201.224360-1-shentey@gmail.com>
 <20230421031431-mutt-send-email-mst@kernel.org>
Message-ID: <E7BEB643-EA7E-4CF5-A00B-D9D280442472@gmail.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Am 21=2E April 2023 07:15:18 UTC schrieb "Michael S=2E Tsirkin" <mst@redha=
t=2Ecom>:
>On Thu, Mar 02, 2023 at 10:21:38PM +0100, Bernhard Beschow wrote:
>> This series consolidates the implementations of the PIIX3 and PIIX4 sou=
th
>> bridges and is an extended version of [1]=2E The motivation is to share=
 as much
>> code as possible and to bring both device models to feature parity such=
 that
>> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc mach=
ine=2E This
>> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed on=
 this
>> list before=2E
>
>Hi!
>No freeze is over, could you rebase pls?
>I could try to resolve the conflicts but this is so big I'd rather
>not take the risk of messing it up=2E

Sure! Since this series is still under discussion I'd wait for the PIIX3 X=
en decoupling series to land in master=2E This will simplify this series a =
bit by taking Xen out of the equation=2E

Best regards,
Bernhard

>
>> The series is structured as follows:
>>=20
>> Move sub devices into the PIIX3 south bridge, like PIIX4 does already:
>> * hw/i386/pc: Create RTC controllers in south bridges
>> * hw/i386/pc: No need for rtc_state to be an out-parameter
>> * hw/i386/pc_piix: Allow for setting properties before realizing PIIX3 =
south bridge
>> * hw/isa/piix3: Create USB controller in host device
>> * hw/isa/piix3: Create power management controller in host device
>> * hw/isa/piix3: Move ISA bus IRQ assignments into host device
>> * hw/isa/piix3: Create IDE controller in host device
>> * hw/isa/piix3: Wire up ACPI interrupt internally
>>=20
>> Make PIIX3 and PIIX4 south bridges more similar:
>> * hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>> * hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>> * hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>> * hw/isa/piix3: Drop the "3" from PIIX base class
>> * hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>> * hw/isa/piix4: Remove unused inbound ISA interrupt lines
>> * hw/isa/piix4: Reuse struct PIIXState from PIIX3
>> * hw/isa/piix4: Create the "intr" property during init() already
>> * hw/isa/piix4: Rename reset control operations to match PIIX3
>>=20
>> This patch achieves the main goal of the series:
>> * hw/isa/piix3: Merge hw/isa/piix4=2Ec
>>=20
>> Perform some further consolidations which were easier to do after the m=
erge:
>> * hw/isa/piix: Harmonize names of reset control memory regions
>> * hw/isa/piix: Rename functions to be shared for interrupt triggering
>> * hw/isa/piix: Consolidate IRQ triggering
>> * hw/isa/piix: Share PIIX3's base class with PIIX4
>> * hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>>=20
>> One challenge was dealing with optional devices where Peter already gav=
e advice
>> in [1] which this series implements=2E
>>=20
>> There are still some differences in the device models:
>> - PIIX4 instantiates its own PIC and PIT while PIIX3 doesn't
>> - PIIX4 wires up the RTC IRQ itself while PIIX3 doesn't
>> - Different binary layout in VM state
>>=20
>> v8:
>> - Rebase onto master
>> - Remove Reviewed-by tag from 'hw/isa/piix: Reuse PIIX3 base class' rea=
lize
>>   method in PIIX4' since it changed considerably in v7=2E
>>=20
>> Testing done (both on top of series as well as on 'hw/isa/piix3: Drop t=
he "3"
>> from PIIX base class'):
>> * `make check`
>> * `make check-avocado`
>> * Boot live CD:
>>   * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom
>> manjaro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>>   * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom
>> manjaro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>> * 'qemu-system-mips64el -M malta -kernel vmlinux-3=2E2=2E0-4-5kc-malta =
-hda
>> debian_wheezy_mipsel_standard=2Eqcow2 -append "root=3D/dev/sda1 console=
=3DttyS0"`
>>=20
>> v7:
>> - Rebase onto master
>> - Avoid the PIC proxy (Phil)
>>   The motivation for the PIC proxy was to allow for wiring up ISA inter=
rupts in
>>   the south bridges=2E ISA interrupt wiring requires the GPIO lines to =
be
>>   populated already but pc_piix assigned the interrupts only after real=
izing
>>   PIIX3=2E By shifting interrupt assignment before realizing, the ISA i=
nterrupts
>>   are already populated during PIIX3's realize phase where the ISA inte=
rrupts
>>   are wired up=2E
>> - New patches:
>>   * hw/isa/piix4: Reuse struct PIIXState from PIIX3
>>   * hw/isa/piix4: Create the "intr" property during init() already
>> - Patches with substantial changes (Reviewed-by dropped):
>>   * hw/isa/piix3: Move ISA bus IRQ assignments into host device
>>=20
>> v6:
>> - Fix some comments about TYPE_ISA_PIC (Mark) =2E=2E=2E and use it cons=
istently
>>   within the patch series=2E
>> - Incorporate series "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from=
 south
>>   bridges" [2] for maintainer convenience=2E
>> - Merge v5's 'hw/i386/pc_piix: Associate pci_map_irq_fn as soon as PCI =
bus is
>>   created' into
>>   https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-11/msg03312=
=2Ehtml =2E Do
>>   similar for Malta=2E
>> - Rebase onto latest master (d6271b657286 "Merge tag 'for_upstream' of
>>   https://git=2Ekernel=2Eorg/pub/scm/virt/kvm/mst/qemu into staging")
>>=20
>> v5:
>> - Pick up Reviewed-by tags from https://lists=2Enongnu=2Eorg/archive/ht=
ml/qemu-devel/2023-01/msg00116=2Ehtml
>> - Add patch to make usage of the isa_pic global more type-safe
>> - Re-introduce isa-pic as PIC specific proxy (Mark)
>>=20
>> v4:
>> - Rebase onto "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from south =
bridges"
>>   since it is already queued via mips-next=2E This eliminates patches
>>   'hw/isa/piix3: Prefix pci_slot_get_pirq() with "piix3_"' and 'hw/isa/=
piix4:
>>   Prefix pci_slot_get_pirq() with "piix4_"'=2E
>> - Squash 'hw/isa/piix: Drop the "3" from the PIIX base class' into
>>   'hw/isa/piix3: Rename typedef PIIX3State to PIIXState'=2E I originall=
y only
>>   split these patches since I wasn't sure whether renaming a type was a=
llowed=2E
>> - Add new patch 'hw/i386/pc_piix: Associate pci_map_irq_fn as soon as P=
CI bus is
>>   created' for forther cleanup of INTx-to-LNKx route decoupling=2E
>>=20
>> v3:
>> - Introduce one TYPE_ICH9_USB_UHCI(fn) rather than several TYPE_ICH9_US=
B_UHCIx
>>   (Philippe)
>> - Make proxy PIC generic (Philippe)
>> - Track Malta's PIIX dependencies through KConfig
>> - Rebase onto Philippe's 'hw/isa/piix4: Remove MIPS Malta specific bits=
' series [3]
>> - Also rebase onto latest master to resolve merge conflicts=2E This req=
uired
>>   copying Philippe's series as first three patches - please ignore=2E
>>=20
>> v2:
>> - Introduce TYPE_ defines for IDE and USB device models (Mark)
>> - Omit unexporting of PIIXState (Mark)
>> - Improve commit message of patch 5 to mention reset triggering through=
 PCI
>>   configuration space (Mark)
>> - Move reviewed patches w/o dependencies to the bottom of the series fo=
r early
>>   upstreaming
>>=20
>> [1] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-07/msg023=
48=2Ehtml
>> [2] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-11/msg033=
10=2Ehtml
>> [3] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-10/msg053=
67=2Ehtml
>>=20
>> Bernhard Beschow (23):
>>   hw/i386/pc: Create RTC controllers in south bridges
>>   hw/i386/pc: No need for rtc_state to be an out-parameter
>>   hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
>>     south bridge
>>   hw/isa/piix3: Create USB controller in host device
>>   hw/isa/piix3: Create power management controller in host device
>>   hw/isa/piix3: Move ISA bus IRQ assignments into host device
>>   hw/isa/piix3: Create IDE controller in host device
>>   hw/isa/piix3: Wire up ACPI interrupt internally
>>   hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>>   hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>>   hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>>   hw/isa/piix3: Drop the "3" from PIIX base class
>>   hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>>   hw/isa/piix4: Remove unused inbound ISA interrupt lines
>>   hw/isa/piix4: Reuse struct PIIXState from PIIX3
>>   hw/isa/piix4: Create the "intr" property during init() already
>>   hw/isa/piix4: Rename reset control operations to match PIIX3
>>   hw/isa/piix3: Merge hw/isa/piix4=2Ec
>>   hw/isa/piix: Harmonize names of reset control memory regions
>>   hw/isa/piix: Rename functions to be shared for interrupt triggering
>>   hw/isa/piix: Consolidate IRQ triggering
>>   hw/isa/piix: Share PIIX3's base class with PIIX4
>>   hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>>=20
>>  MAINTAINERS                   |   6 +-
>>  include/hw/i386/pc=2Eh          |   2 +-
>>  include/hw/southbridge/ich9=2Eh |   2 +
>>  include/hw/southbridge/piix=2Eh |  28 +++-
>>  hw/i386/pc=2Ec                  |  16 +-
>>  hw/i386/pc_piix=2Ec             |  67 ++++----
>>  hw/i386/pc_q35=2Ec              |   4 +-
>>  hw/isa/lpc_ich9=2Ec             |   8 +
>>  hw/isa/{piix3=2Ec =3D> piix=2Ec}    | 306 ++++++++++++++++++++++++++--=
------
>>  hw/isa/piix4=2Ec                | 302 --------------------------------=
-
>>  hw/mips/malta=2Ec               |   6 +-
>>  hw/i386/Kconfig               |   3 +-
>>  hw/isa/Kconfig                |   8 +-
>>  hw/isa/meson=2Ebuild            |   3 +-
>>  hw/mips/Kconfig               |   2 +-
>>  15 files changed, 334 insertions(+), 429 deletions(-)
>>  rename hw/isa/{piix3=2Ec =3D> piix=2Ec} (55%)
>>  delete mode 100644 hw/isa/piix4=2Ec
>>=20
>> --=20
>> 2=2E39=2E2
>>=20
>


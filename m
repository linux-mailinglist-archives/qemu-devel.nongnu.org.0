Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 989C553D1E7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 20:54:09 +0200 (CEST)
Received: from localhost ([::1]:49078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxCQy-0001Pj-M7
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 14:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCO5-00077J-Co
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:10 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCNz-00047a-Mn
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:06 -0400
Received: by mail-ej1-x62a.google.com with SMTP id v1so6920867ejg.13
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 11:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pifMGYyd/ecYV4qzC4zVBKV2RM1UsX5S3JVieo52U/k=;
 b=QkADCmxHQkqL+htS63P5nl2FZjfiEfsFUtNF2sDsErTAYVb6ch6N5JNKKtXC/yWg6O
 rZipRLf5Bjj2vX7gxNW+dTUY+MAed9+VW/KzDkIAaOCoM6osmsgWMdPwe4cBQlDFcUe3
 g84sime7UgtX7+tXsO4/8IKCkUR9T7ya9jtf9keSkldz5rrqS/Z4ihcXADhSP9ZnlRNg
 oCtsdkoLKi7SvyC8XuFizFGseVguo/Rm4qaQk9/scOTKJB7p5TDqVftRzESyW/v9+sEO
 u/URWLDjKO85H4KXyLDOu6PB+vgoFN4bOmC7er0IYvUvE+DhLeksgI6tJpE5ArhDo3J7
 CfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pifMGYyd/ecYV4qzC4zVBKV2RM1UsX5S3JVieo52U/k=;
 b=6wVW8ygiyYJCCSwMXIcyWr3UWHaYG4ZvHuzxYOcwMsW28tDYxSwOnlwGCLm+nGDDyO
 LKy0K9kxQquvxCzAI22/c6bCkUg/IXjTO4r2NLjS3gJAk/DXcMFwd8rJ1dfw3XPx2jgu
 qFxBGrTD9yIdFKom9uB7kuroZHq3ne/KgftvPxkK0XrWzH9Pk9gcp8MzqZkX3XLBWS1k
 ig1dNf7YN0/9TZjRsiks1y5x4Q2k+kjiWkOeTSWA81emXg5m8JviPh5sYDN/BLpoCPrY
 63Ic+5jbc0ANHCij/oQEsJFwDGU6H92am05MbdzGtBXK4ulwsyrH39j2iCKH1VmObNBM
 0I7w==
X-Gm-Message-State: AOAM533HwU++nzdhNII2AEd/yFAqDDLNpiZcCI8l1bX+YbT3/hEu/g8t
 nL5GId370g/yrx550F/DQTn22ALpZbgaWA==
X-Google-Smtp-Source: ABdhPJzZqxfhZ8eT/03EJqXwJJe5CQ2pBuya9Y/IT9/MVdpNo3nEgtgeIs0KOTJMigw4+WeU+7bm5Q==
X-Received: by 2002:a17:907:a0c8:b0:6f6:d3e4:49a5 with SMTP id
 hw8-20020a170907a0c800b006f6d3e449a5mr10019322ejc.644.1654282261813; 
 Fri, 03 Jun 2022 11:51:01 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 f25-20020a170906139900b006fe8c831632sm3066160ejc.73.2022.06.03.11.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 11:51:01 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 00/11] QOM'ify PIIX southbridge creation
Date: Fri,  3 Jun 2022 20:50:34 +0200
Message-Id: <20220603185045.143789-1-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v4:=0D
* Rebase onto https://patchew.org/QEMU/20220530112718.26582-1-philippe.math=
ieu.daude@gmail.com/=0D
* Cosmetics (fix typo, omit "include") (Mark, Philippe)=0D
* Split piix3 and piix4 (Philippe)=0D
* s/Found-by/Reported-by/ (Philippe)=0D
* Don't alias smbus (Mark)=0D
=0D
v3:=0D
* Rebase onto 'hw/acpi/piix4: remove legacy piix4_pm_init() function' (Mark=
) [1]=0D
* Use embedded structs for touched PCI devices (Mark)=0D
* Fix piix4's rtc embedded struct to be initialized by=0D
  object_initialize_child() (Peter) [2]=0D
=0D
Testing done:=0D
=0D
1)=0D
`make check-avocado` for --target-list=3Dx86_64-softmmu,mips-softmmu=0D
Result: All pass.=0D
=0D
2)=0D
* `qemu-system-x86_64 -M pc -m 2G -cdrom archlinux-2022.05.01-x86_64.iso`=0D
* `qemu-system-mipsel -M malta -kernel vmlinux-3.2.0-4-4kc-malta -hda=0D
  debian_wheezy_mipsel_standard.qcow2 -append "root=3D/dev/sda1 console=3Dt=
ty0"`=0D
=0D
In both cases the system booted successfully and it was possible to shut do=
wn=0D
the system using the `poweroff` command.=0D
=0D
v2:=0D
* Preserve `DeviceState *` as return value of piix4_create() (Mark)=0D
* Aggregate all type name movements into first commit (Mark)=0D
* Have piix4 southbridge rather than malta board instantiate piix4 pm (me)=
=0D
=0D
Testing done:=0D
=0D
1)=0D
`make check-avocado` for --target-list=3Dx86_64-softmmu,mips-softmmu=0D
Result: All pass.=0D
=0D
2)=0D
Modify pci_piix3_realize() to start with=0D
    error_setg(errp, "This is a test");=0D
Then start `qemu-system-x86_64 -M pc -m 1G -accel kvm -cpu host -cdrom=0D
archlinux-2022.05.01-x86_64.iso`.=0D
Result: qemu-system-x86_64 aborts with: "This is a test"=0D
=0D
v1:=0D
The piix3 and piix4 southbridge devices still rely on create() functions wh=
ich=0D
are deprecated. This series resolves these functions piece by piece to=0D
modernize the code.=0D
=0D
Both devices are modified in lockstep where possible to provide more contex=
t.=0D
=0D
Testing done:=0D
* `qemu-system-x86_64 -M pc -m 2G -cdrom archlinux-2022.05.01-x86_64.iso`=0D
* `qemu-system-mipsel -M malta -kernel vmlinux-3.2.0-4-4kc-malta -hda=0D
  debian_wheezy_mipsel_standard.qcow2 -append "root=3D/dev/sda1 console=3Dt=
ty0"`=0D
=0D
In both cases the system booted successfully and it was possible to shut do=
wn=0D
the system using the `poweroff` command.=0D
=0D
[1] https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg05686.html=0D
[2] https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg01128.html=0D
=0D
Bernhard Beschow (11):=0D
  hw/southbridge/piix: Aggregate all PIIX southbridge type names=0D
  hw/isa/piix4: Use object_initialize_child() for embedded struct=0D
  hw/isa/piix4: Move pci_map_irq_fn' near pci_set_irq_fn=0D
  hw/isa/piix4: QOM'ify PCI device creation and wiring=0D
  hw/isa/piix4: Factor out ISABus retrieval from piix4_create()=0D
  hw/isa/piix4: QOM'ify PIIX4 PM creation=0D
  hw/isa/piix4: Inline and remove piix4_create()=0D
  hw/isa/piix3: Move pci_map_irq_fn near pci_set_irq_fn=0D
  hw/isa/piix3: QOM'ify PCI device creation and wiring=0D
  hw/isa/piix3: Factor out ISABus retrieval from piix3_create()=0D
  hw/isa/piix3: Inline and remove piix3_create()=0D
=0D
 hw/i386/pc_piix.c             |   7 +-=0D
 hw/isa/piix3.c                |  98 +++++++++++++++-------------=0D
 hw/isa/piix4.c                | 119 +++++++++++++++++-----------------=0D
 hw/mips/malta.c               |   9 ++-=0D
 include/hw/isa/isa.h          |   2 -=0D
 include/hw/southbridge/piix.h |   6 +-=0D
 6 files changed, 128 insertions(+), 113 deletions(-)=0D
=0D
-- =0D
2.36.1=0D
=0D


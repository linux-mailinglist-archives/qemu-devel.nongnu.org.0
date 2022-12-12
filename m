Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707AE649745
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 01:04:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4WHV-0006CW-Of; Sun, 11 Dec 2022 19:02:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p4WHT-0006CB-TZ
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 19:02:51 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p4WHR-0005MA-T6
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 19:02:51 -0500
Received: by mail-wr1-x42a.google.com with SMTP id o5so10488827wrm.1
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 16:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ECOgeY2l4qJ8bUdCFDpaDU3eqVFS/5s/8xO+Ai7+oMk=;
 b=lmYti8PsRIooASsTL8DUYdJGOembCbdD1f11G+vI1E6fHumYfGHPtX1X8dGzAcPm0B
 ERbABOsccjzmfWmaG6omtgpYXy0s9y07LfqrE/fcNmMFfD7Sl95DPMWsVgPrGTUdgzkm
 VPCAlxFbEJuFnnDCcogfElLOZf41iHzxDbxCfBujNAFzzWHqlTGO2a4Uq8pDvH1eGa6m
 zYOiGDk3m4npSj6TPiCi4olBilBFASS+Vztn+AczlXRpaBoIjMqbqF6DXIL06sXIHk0x
 bKpLC0qxyKTYRSo8zZ8ShAsLVOW2SEtqtE5LjBK6p1mlhvKWhnQPq6jN/XEUKdThmdEe
 3uUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ECOgeY2l4qJ8bUdCFDpaDU3eqVFS/5s/8xO+Ai7+oMk=;
 b=RJxUD9By+QlCSUgOCO5+WVLt0rY2KlVNhpi7cEtHYuVA9pK0VNktuBt2Ghhu92h+4l
 jRimV999gh2rHFeqiYt2pzWujnOUuAZ8S/vHA2pUgAaDJVv0Ezt67Cqqu3m5eNK86VBU
 DL67/av45WfyO8jJWjdARNemcS08T9tjvvBZ+RU2nY4jKfaDw8kNluxRSOw4ZKmTdvuu
 lFEtVdNM2BfWwTponbRoLJWifDA77QQlssJw1IUtZ2EnOKjtvrN+3ghyHhwthwWRbazH
 sv8Le4uW/udnhbz8HdNg2DyGIyqv8txGPURLilfhlU8CCir5R7zM1+xkLcREk7IK8SH7
 0LZg==
X-Gm-Message-State: ANoB5pnRgG6yMmo5Ui2loRYv0lws0KM+CbV1xN8VtL38cGUJxGDp6MqF
 4+Tb1/hDLI+BgDfczOK0h40=
X-Google-Smtp-Source: AA0mqf7e4L1NFgznRUgFNG98P/Cd21eB/hgOSazW5je1oIlhDgLcqSHHv8HyGjfqif9TGfZG22cTLA==
X-Received: by 2002:a5d:4448:0:b0:242:7195:47c6 with SMTP id
 x8-20020a5d4448000000b00242719547c6mr9198440wrr.15.1670803368166; 
 Sun, 11 Dec 2022 16:02:48 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200150f11b7b1e9e208.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:150f:11b7:b1e9:e208])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d5109000000b002421ce6a275sm7199911wrt.114.2022.12.11.16.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 16:02:47 -0800 (PST)
Date: Mon, 12 Dec 2022 00:02:42 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-8.0 7/7] hw/mips/gt64xxx_pci: Move it to hw/pci-host/
In-Reply-To: <20221209151533.69516-8-philmd@linaro.org>
References: <20221209151533.69516-1-philmd@linaro.org>
 <20221209151533.69516-8-philmd@linaro.org>
Message-ID: <BB697AAF-67A9-43DA-832F-E6E70321D97F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42a.google.com
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



Am 9=2E Dezember 2022 15:15:33 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>
>The GT-64120 is a north-bridge, and it is not MIPS specific=2E
>Move it with the other north-bridge devices=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>---
> MAINTAINERS                                   | 2 +-
> hw/mips/Kconfig                               | 6 ------
> hw/mips/meson=2Ebuild                           | 1 -
> hw/mips/trace-events                          | 6 ------
> hw/pci-host/Kconfig                           | 6 ++++++
> hw/{mips/gt64xxx_pci=2Ec =3D> pci-host/gt64120=2Ec} | 0
> hw/pci-host/meson=2Ebuild                       | 1 +
> hw/pci-host/trace-events                      | 7 +++++++
> meson=2Ebuild                                   | 1 -
> 9 files changed, 15 insertions(+), 15 deletions(-)
> delete mode 100644 hw/mips/trace-events
> rename hw/{mips/gt64xxx_pci=2Ec =3D> pci-host/gt64120=2Ec} (100%)
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 6966490c94=2E=2Ee558b53e85 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -1226,7 +1226,7 @@ S: Odd Fixes
> F: hw/isa/piix4=2Ec
> F: hw/acpi/piix4=2Ec
> F: hw/mips/malta=2Ec
>-F: hw/mips/gt64xxx_pci=2Ec
>+F: hw/pci-host/gt64120=2Ec
> F: include/hw/southbridge/piix=2Eh
> F: tests/avocado/linux_ssh_mips_malta=2Epy
> F: tests/avocado/machine_mips_malta=2Epy
>diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
>index 8f7bce38fb=2E=2E7a55143f8a 100644
>--- a/hw/mips/Kconfig
>+++ b/hw/mips/Kconfig
>@@ -60,9 +60,3 @@ config MIPS_BOSTON
>=20
> config FW_CFG_MIPS
>     bool
>-
>-config GT64120
>-    bool
>-    select PCI
>-    select EMPTY_SLOT
>-    select I8259
>diff --git a/hw/mips/meson=2Ebuild b/hw/mips/meson=2Ebuild
>index 152103f15f=2E=2E900613fc08 100644
>--- a/hw/mips/meson=2Ebuild
>+++ b/hw/mips/meson=2Ebuild
>@@ -3,7 +3,6 @@ mips_ss=2Eadd(files('bootloader=2Ec', 'mips_int=2Ec'))
> mips_ss=2Eadd(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg=2Ec'))
> mips_ss=2Eadd(when: 'CONFIG_LOONGSON3V', if_true: files('loongson3_bootp=
=2Ec', 'loongson3_virt=2Ec'))
> mips_ss=2Eadd(when: 'CONFIG_MALTA', if_true: files('malta=2Ec'))
>-softmmu_ss=2Eadd(when: 'CONFIG_GT64120', if_true: files('gt64xxx_pci=2Ec=
'))
> mips_ss=2Eadd(when: 'CONFIG_MIPS_CPS', if_true: files('cps=2Ec'))
>=20
> if 'CONFIG_TCG' in config_all
>diff --git a/hw/mips/trace-events b/hw/mips/trace-events
>deleted file mode 100644
>index 13ee731a48=2E=2E0000000000
>--- a/hw/mips/trace-events
>+++ /dev/null
>@@ -1,6 +0,0 @@
>-# gt64xxx_pci=2Ec
>-gt64120_read(uint64_t addr, uint64_t value) "gt64120 read 0x%03"PRIx64" =
value:0x%08" PRIx64
>-gt64120_write(uint64_t addr, uint64_t value) "gt64120 write 0x%03"PRIx64=
" value:0x%08" PRIx64
>-gt64120_read_intreg(const char *regname, unsigned size, uint64_t value) =
"gt64120 read %s size:%u value:0x%08" PRIx64
>-gt64120_write_intreg(const char *regname, unsigned size, uint64_t value)=
 "gt64120 write %s size:%u value:0x%08" PRIx64
>-gt64120_isd_remap(uint64_t from_length, uint64_t from_addr, uint64_t to_=
length, uint64_t to_addr) "ISD: 0x%08" PRIx64 "@0x%08" PRIx64 " -> 0x%08" P=
RIx64 "@0x%08" PRIx64
>diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
>index 38fd2ee8f3=2E=2Ea07070eddf 100644
>--- a/hw/pci-host/Kconfig
>+++ b/hw/pci-host/Kconfig
>@@ -81,3 +81,9 @@ config MV64361
> config DINO
>     bool
>     select PCI
>+
>+config GT64120
>+    bool
>+    select PCI
>+    select EMPTY_SLOT
>+    select I8259

While at it: s/select I8259/depends on I8259/ since the model needs but do=
esn't provide I8259?

Best regards,
Bernhard

>diff --git a/hw/mips/gt64xxx_pci=2Ec b/hw/pci-host/gt64120=2Ec
>similarity index 100%
>rename from hw/mips/gt64xxx_pci=2Ec
>rename to hw/pci-host/gt64120=2Ec
>diff --git a/hw/pci-host/meson=2Ebuild b/hw/pci-host/meson=2Ebuild
>index e832babc9d=2E=2E9a813d552e 100644
>--- a/hw/pci-host/meson=2Ebuild
>+++ b/hw/pci-host/meson=2Ebuild
>@@ -1,6 +1,7 @@
> pci_ss =3D ss=2Esource_set()
> pci_ss=2Eadd(when: 'CONFIG_PAM', if_true: files('pam=2Ec'))
> pci_ss=2Eadd(when: 'CONFIG_PCI_BONITO', if_true: files('bonito=2Ec'))
>+pci_ss=2Eadd(when: 'CONFIG_GT64120', if_true: files('gt64120=2Ec'))
> pci_ss=2Eadd(when: 'CONFIG_PCI_EXPRESS_DESIGNWARE', if_true: files('desi=
gnware=2Ec'))
> pci_ss=2Eadd(when: 'CONFIG_PCI_EXPRESS_GENERIC_BRIDGE', if_true: files('=
gpex=2Ec'))
> pci_ss=2Eadd(when: ['CONFIG_PCI_EXPRESS_GENERIC_BRIDGE', 'CONFIG_ACPI'],=
 if_true: files('gpex-acpi=2Ec'))
>diff --git a/hw/pci-host/trace-events b/hw/pci-host/trace-events
>index 437e66ff50=2E=2E9d216bb89f 100644
>--- a/hw/pci-host/trace-events
>+++ b/hw/pci-host/trace-events
>@@ -6,6 +6,13 @@ bonito_spciconf_small_access(uint64_t addr, unsigned siz=
e) "PCI config address i
> # grackle=2Ec
> grackle_set_irq(int irq_num, int level) "set_irq num %d level %d"
>=20
>+# gt64120=2Ec
>+gt64120_read(uint64_t addr, uint64_t value) "gt64120 read 0x%03"PRIx64" =
value:0x%08" PRIx64
>+gt64120_write(uint64_t addr, uint64_t value) "gt64120 write 0x%03"PRIx64=
" value:0x%08" PRIx64
>+gt64120_read_intreg(const char *regname, unsigned size, uint64_t value) =
"gt64120 read %s size:%u value:0x%08" PRIx64
>+gt64120_write_intreg(const char *regname, unsigned size, uint64_t value)=
 "gt64120 write %s size:%u value:0x%08" PRIx64
>+gt64120_isd_remap(uint64_t from_length, uint64_t from_addr, uint64_t to_=
length, uint64_t to_addr) "ISD: 0x%08" PRIx64 "@0x%08" PRIx64 " -> 0x%08" P=
RIx64 "@0x%08" PRIx64
>+
> # mv64361=2Ec
> mv64361_region_map(const char *name, uint64_t poffs, uint64_t size, uint=
64_t moffs) "Mapping %s 0x%"PRIx64"+0x%"PRIx64" @ 0x%"PRIx64
> mv64361_region_enable(const char *op, int num) "Should %s region %d"
>diff --git a/meson=2Ebuild b/meson=2Ebuild
>index 5c6b5a1c75=2E=2Ebd5774f32f 100644
>--- a/meson=2Ebuild
>+++ b/meson=2Ebuild
>@@ -2944,7 +2944,6 @@ if have_system
>     'hw/intc',
>     'hw/isa',
>     'hw/mem',
>-    'hw/mips',
>     'hw/misc',
>     'hw/misc/macio',
>     'hw/net',


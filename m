Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF1D2E827B
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 23:50:45 +0100 (CET)
Received: from localhost ([::1]:45424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv6mJ-0001cs-MY
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 17:50:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6kw-0000QA-7C
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:49:18 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6ku-0006Fe-H0
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:49:17 -0500
Received: by mail-wm1-x32c.google.com with SMTP id v14so8146766wml.1
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 14:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bk0tYZBjX7UVR6Ibma6lL1omMrXDLuBQAWgVPIYBj4U=;
 b=dNWyF8JVwpw6CDErbPsCJiVvMc4SkCRDbGXDq4bIMgZHWxjufiuM3X017a6Nja/GjG
 wVEFvGtKNCVOa+uJB41/42Em9cuzkEaWp6rYYn9uJrw8J5tDoUqxBm/r01ROX6RUCZwh
 Ixe0COE/XPvj4dGSOxnvXEkJ3nmRSjLW5kMmofWzHpMlbYaTbXiu4swF+MlQ2p75wYNW
 i+1mX3ju7gQlWimeAS7H6R6q7/nWGJjq+0cUGVbb17bVKU9oHgUDV3FLr17L8RXC8rvF
 PsiilWQv5RiF7xC286V4CJ1fgqOnNjCXX9zR4V1jzQUhDL+hkF5QXTGFAFmfJ2jZKKjU
 KgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Bk0tYZBjX7UVR6Ibma6lL1omMrXDLuBQAWgVPIYBj4U=;
 b=FgdkPhKEhQMb/M1r5qUc3Lv0z/gHCj+1cKuqXKrUBptz8NnZk3IxAXfDRn7z4mwfqc
 ssjqr6d1deHhEPq3gYdmwjnpBDkZmCC+8pteXPB5DXnDJuPQU6A9EAs1hkHc1DNvfpKZ
 7w2GZwyrIpv9okNdu7+juXRDYh7xKkBjnZIAkiN+O1h6xoQV4soLzBzAOYfrDEsarQh3
 n8uLKeUzULwTd7RKEJfbaPvC4laWEd6fM71j44vmfBYMjWnLBJoGVoTXUFIATc8yqtZU
 SqmVr1QXWWTnG+mvjvHvaxvz8pM0yKwqQzqb6JYjPikYKL0Uqb/D8tJlhkrRqVBcmI4w
 z0bg==
X-Gm-Message-State: AOAM532TQ/vFqmsOyKmGMnoqV4UWOWZXySkJ7qR6iH7vXxbYBCTVH2MN
 ALy6hrU1eucFy70fwFn3ZCkklqPxKxo=
X-Google-Smtp-Source: ABdhPJwgmGzf6D4j0J7ZSLYab1KxPAPDRx32w7Q7LlsqB/EYiB3gzCK42COpmhzHUPKg7zguQmCkIw==
X-Received: by 2002:a7b:cf30:: with SMTP id m16mr13144343wmg.145.1609454954663; 
 Thu, 31 Dec 2020 14:49:14 -0800 (PST)
Received: from localhost.localdomain (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id n11sm58473427wra.9.2020.12.31.14.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 14:49:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/18] hw/pci-host/bonito: Remap PCI "lo" regions when
 PCIMAP reg is modified
Date: Thu, 31 Dec 2020 23:48:53 +0100
Message-Id: <20201231224911.1467352-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patches I wrote while reviewing/testing Jiaxun's v3 [1] trying=0D
to understand the problem with "Fixup pci.lomem mapping" [2].=0D
=0D
The issue should be fixed by patch #8 of this series:=0D
'Remap PCI "lo" regions when PCIMAP reg is modified'.=0D
The rest are cleanups patches.=0D
=0D
Happy new year,=0D
=0D
Phil.=0D
=0D
[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg769286.html=0D
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg769294.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (18):=0D
  hw/pci-host/bonito: Remove unused definitions=0D
  hw/pci-host/bonito: Display hexadecimal value with '0x' prefix=0D
  hw/pci-host/bonito: Use PCI_DEVFN() macro=0D
  hw/pci-host/bonito: Use pci_config_set_interrupt_pin()=0D
  hw/pci-host/bonito: Simplify soft reset using FIELD_EX32()=0D
  hw/pci-host/bonito: Do not allow big-endian targets=0D
  hw/pci-host/bonito: Make BONPONCFG register read-only=0D
  hw/pci-host/bonito: Remap PCI "lo" regions when PCIMAP reg is modified=0D
  hw/pci-host/bonito: Rename north bridge helpers=0D
  hw/pci-host/bonito: Rename PCI host helpers=0D
  hw/pci-host/bonito: Rename PCI function helpers=0D
  hw/pci-host/bonito: Rename PCIBonitoState -> BonitoPciState=0D
  hw/pci-host/bonito: Create PCI regions in bonito_host_realize()=0D
  hw/pci-host/bonito: Simplify using pci_host_conf_le_ops=0D
    MemoryRegionOps=0D
  hw/pci-host/bonito: Map north bridge region in bonito_host_realize()=0D
  hw/pci-host/bonito: Create TYPE_PCI_BONITO in bonito_host_realize()=0D
  hw/pci-host/bonito: Declare TYPE_BONITO_PCI_HOST_BRIDGE in include/=0D
  hw/mips/fuloong2e: Inline bonito_init()=0D
=0D
 include/hw/mips/mips.h       |   3 -=0D
 include/hw/pci-host/bonito.h |  34 ++++=0D
 hw/mips/fuloong2e.c          |   7 +-=0D
 hw/pci-host/bonito.c         | 357 +++++++++++++++--------------------=0D
 MAINTAINERS                  |   1 +=0D
 5 files changed, 197 insertions(+), 205 deletions(-)=0D
 create mode 100644 include/hw/pci-host/bonito.h=0D
=0D
-- =0D
2.26.2=0D
=0D


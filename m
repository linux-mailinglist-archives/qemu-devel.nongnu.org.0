Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A27381A2F
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 19:39:29 +0200 (CEST)
Received: from localhost ([::1]:59840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhyG8-00024X-WC
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 13:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyE7-0007xV-VT
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:37:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyE6-0005xx-Du
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:37:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7JNqGEjQzQh7OAwfD8mh/1OVsfJJeJzp5VYzdc52DQs=;
 b=ZiOswclJPp9CpCyRBKqiqaxEt4nCt8uqvXbN0BTRe8fVUMC5sJroNV9soEYsIBJjkcmiYg
 Fc/UKlqCcAm53Ur1OY+XZvI/k+ymygd9xfTtHkio3euTHJ6owOS05NUyEMtPFfz0QtRM2c
 lPmZLquZmRFQkheSgbrSO6SbrIDo4k8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-RCkBGW1-MDWMhwaUpZ3mZg-1; Sat, 15 May 2021 13:37:20 -0400
X-MC-Unique: RCkBGW1-MDWMhwaUpZ3mZg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l185-20020a1c25c20000b029014b0624775eso1651246wml.6
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KvGopyB6K56XtfZZaGA35lYiaZ9SoAOR2uPwQdOkn9g=;
 b=cRsHGle4JtBkecvspYSuBFFk3R1T1+ligTmU4NhjNB9VWlFNKQy/xS+yLL1NTHARj4
 DemZEO4pdezWMaJ+Mc+nU2DickOWWoZ2JcOf/fg2DKAo+o/k7jDmojYvAK8/BDCz48XN
 A+uXCEAh0VZpYCUXb8m6fV2RZTPe/vQxlDKWaBz/WU9ynhv7krTGWHsX1TVHebJHp2BL
 daUbqGtm/u9wkqJfirNeeuDGetVtMvuoY5UW1EfIZ1fNEhoiCMEXoJfoQyQzwQkbCikT
 b8YlA0JST+uuVAXEkdc51iWorVLkS2ZlMCsNTDOB/xezG3BH5Ge8pZWCd69L/SKoP3Zq
 1/aw==
X-Gm-Message-State: AOAM531wtvD0vThdXFgE8G7qBRuZjPP1RisFGZFUKa5zuz8spf1uTakS
 5QHD0URqWLZTyKHCHB4txBsfoxYsT+jDON80YfGxXca82hlw6Hpm6BiU9pYwu3A/KT/zzjmcUmz
 0TsMOgu0g5SXbI9ISJY9oqE/AQcbEA9ko1T3vO41rj5B5XwDZW46vYoyQK0ojXvNg
X-Received: by 2002:a7b:c206:: with SMTP id x6mr15222809wmi.72.1621100238897; 
 Sat, 15 May 2021 10:37:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydm6CoStYZBfM1kSqoIWHoht4u3i907Pi+qQNSNZxrddpb4lKaHW9WeyVqR9qPburQXgD1LA==
X-Received: by 2002:a7b:c206:: with SMTP id x6mr15222780wmi.72.1621100238606; 
 Sat, 15 May 2021 10:37:18 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id h15sm8174283wmq.4.2021.05.15.10.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/12] hw: Various Kconfig fixes
Date: Sat, 15 May 2021 19:37:04 +0200
Message-Id: <20210515173716.358295-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Various Kconfig fixes when building stand-alone machine binaries.=0D
=0D
Since v1:=0D
- Fixed Pegasos2 machine=0D
- Removed SEMIHOSTING related patches (will repost them later)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (12):=0D
  hw/mem/nvdimm: Use Kconfig 'imply' instead of 'depends on'=0D
  hw/ide/Kconfig: Add missing dependency PCI -> IDE_QDEV=0D
  hw/arm/Kconfig: Add missing dependency NPCM7XX -> SMBUS=0D
  hw/arm/Kconfig: Remove unused DS1338 symbol from i.MX25 PDK Board=0D
  hw/arm/Kconfig: Add missing SDHCI symbol to FSL_IMX25=0D
  hw/riscv/Kconfig: Add missing dependency MICROCHIP_PFSOC -> SERIAL=0D
  hw/riscv/Kconfig: Restrict NUMA to Virt & Spike machines=0D
  hw/ppc/Kconfig: Add missing dependency E500 -> DS1338 RTC=0D
  hw/pci-host/Kconfig: Add missing dependency MV64361 -> I8259=0D
  hw/isa/vt82c686: Add missing Kconfig dependencies (build error)=0D
  hw/isa/vt82c686: Add missing Kconfig dependency (runtime error)=0D
  hw/ppc/Kconfig: Add dependency PEGASOS2 -> ATI_VGA=0D
=0D
 default-configs/devices/ppc-softmmu.mak   | 1 -=0D
 default-configs/devices/ppc64-softmmu.mak | 1 -=0D
 hw/arm/Kconfig                            | 4 +++-=0D
 hw/char/Kconfig                           | 1 +=0D
 hw/i386/Kconfig                           | 1 +=0D
 hw/ide/Kconfig                            | 2 +-=0D
 hw/isa/Kconfig                            | 4 ++++=0D
 hw/mem/Kconfig                            | 2 --=0D
 hw/pci-host/Kconfig                       | 1 +=0D
 hw/ppc/Kconfig                            | 3 +++=0D
 hw/riscv/Kconfig                          | 5 +++++=0D
 hw/riscv/meson.build                      | 2 +-=0D
 12 files changed, 20 insertions(+), 7 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D



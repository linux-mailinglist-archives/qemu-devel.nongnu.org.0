Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF35A36BA21
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 21:38:38 +0200 (CEST)
Received: from localhost ([::1]:45364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb741-0001av-PG
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 15:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb711-0007z4-6K
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 15:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb70y-0008Mj-5t
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 15:35:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619465727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rGYmFGSpmD7SNs4Dd7dBqyBwJ1kX06sUPV1mfcAm/hs=;
 b=DUslu6fij2ReAFTsR07UZHYFtEd1qT1W5mMH+2d/pi5oUzgr0J/GVR3ifiJuSjJJIbmYPQ
 U1/52Sc2SN+4j4FwcbSUhr2NfEP0e1vloWweIZI46QQj6mw5pV9DDouZiLYfT3jCimPmgb
 7yknOTyMtcLwOz6SoF299EcrqbkMlzM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-tGLhy-N2NKGud5s-dPYBEw-1; Mon, 26 Apr 2021 15:35:23 -0400
X-MC-Unique: tGLhy-N2NKGud5s-dPYBEw-1
Received: by mail-wr1-f70.google.com with SMTP id
 t18-20020adfdc120000b02900ffe4432d8bso19548610wri.6
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 12:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r4tlfJuIet0+fqLYBCB2+24GYS/bGOp7U/9QFRE9R4U=;
 b=eAYBhWsKse6ppMzkWZRJnw6CEc6+GGdKN6vfQtUSQNNyuP2ByLOD2xFv4NesS/wWyL
 QEELyb4l5J15hBlcE8SnY3hp37+Rel3w+DbWlFf7hTcA/PtkigZhNK/Bn47ow+94kPgM
 6e1HLHODv6QCsbhA4JcWmzNhUKdvDkZ7SgkvZwmQ0WgKLpzJ5GBhmxJaye9R2wIsNZtX
 OhPs/IQa3opvLwiuuMJLViMD/YNmLYkXoewryu9d+8QtZ7I0MDl3vuTVFU5JmUBnjihi
 MQhAXVu0IjMNfCTR8rc5mtwr9WotdP+xeh4Ywo2XpmYBglHNGOtTXj9iYje62fJPKNVL
 aR3A==
X-Gm-Message-State: AOAM53190GeXbfcLCjlZuTvcYeBNRQ7EWZhNDwkxstHpxvKHJMyImlNM
 fOx3/dpSZTAIIoVmX3SuBpZoIMH+dGfCZYiFqFrsSiOpkm3r7TLozYENQ2oF5RjJSlfG0jHNqpG
 sRqkaBLZQy7/paep6yJTM+4+So6wWZqMymApC0CB1iJCguWR/sbwZoZk6sG07QJAA
X-Received: by 2002:a7b:ce09:: with SMTP id m9mr21355724wmc.150.1619465722440; 
 Mon, 26 Apr 2021 12:35:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyo5S3dDxCKwaOJHvF2bXR/eQGdqtQq0frw85cImHFP8gJhPk+sY7LT6H2xmLNB23Z9pH+rrg==
X-Received: by 2002:a7b:ce09:: with SMTP id m9mr21355704wmc.150.1619465722130; 
 Mon, 26 Apr 2021 12:35:22 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d10sm1324888wri.41.2021.04.26.12.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 12:35:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] hw/nvram/fw_cfg: Do not build device if not needed
 (Spring cleanup)
Date: Mon, 26 Apr 2021 21:35:13 +0200
Message-Id: <20210426193520.4115528-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
Quite a trivial series around fw_cfg:=0D
- enforce the FW_CFG Kconfig symbol,=0D
- add missing Kconfig dependencies,=0D
- explicit machines using the fw_cfg device,=0D
- allow targets not using the device to build without it.=0D
=0D
Please review,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  stubs: Restrict fw_cfg stubs to sysemu=0D
  hw/nvram: Rename FW_CFG_MIPS as generic FW_CFG Kconfig symbol=0D
  hw/nvram: Declare FW_CFG_DMA Kconfig symbol in hw/nvram/=0D
  hw/acpi/vmgenid: Make ACPI_VMGENID depends on FW_CFG Kconfig=0D
  hw: Have machines Kconfig-select FW_CFG=0D
  hw/{arm,hppa,riscv}: Add fw_cfg arch-specific stub=0D
  hw/nvram: Do not build FW_CFG if not required=0D
=0D
 hw/arm/fw_cfg.c      | 19 +++++++++++++++++=0D
 hw/hppa/fw_cfg.c     | 19 +++++++++++++++++=0D
 hw/riscv/fw_cfg.c    | 19 +++++++++++++++++=0D
 stubs/fw_cfg.c       | 49 ++++++++++++++++++++++++++++++++++++++++++--=0D
 MAINTAINERS          |  2 +-=0D
 hw/acpi/Kconfig      |  1 +=0D
 hw/arm/Kconfig       |  2 ++=0D
 hw/arm/meson.build   |  1 +=0D
 hw/display/Kconfig   |  3 ---=0D
 hw/hppa/Kconfig      |  1 +=0D
 hw/hppa/meson.build  |  1 +=0D
 hw/i386/Kconfig      |  2 ++=0D
 hw/mips/Kconfig      |  5 +----=0D
 hw/mips/meson.build  |  2 +-=0D
 hw/nvram/Kconfig     |  7 +++++++=0D
 hw/nvram/meson.build |  2 +-=0D
 hw/ppc/Kconfig       |  1 +=0D
 hw/riscv/meson.build |  1 +=0D
 hw/sparc/Kconfig     |  1 +=0D
 hw/sparc64/Kconfig   |  1 +=0D
 stubs/meson.build    |  2 +-=0D
 21 files changed, 128 insertions(+), 13 deletions(-)=0D
 create mode 100644 hw/arm/fw_cfg.c=0D
 create mode 100644 hw/hppa/fw_cfg.c=0D
 create mode 100644 hw/riscv/fw_cfg.c=0D
=0D
--=20=0D
2.26.3=0D
=0D



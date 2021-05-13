Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BE037FBD1
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:53:41 +0200 (CEST)
Received: from localhost ([::1]:40966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEai-0002M0-A6
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEMe-0002BK-Bw
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEMb-0000f2-D3
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zLqbjiL5XtpK2swb6Z/o16E32bj/HHNKtpOT6ZdXtoM=;
 b=DZ8iQ2/tnR51TafhBxRl2dJjy1IqhRujOhe4bLo6udlZsjoeP7u7qsy2OnpowijQalGMa5
 B8iPQx+8u6D4+V9rhAVjWefD0p4kYFOi37AFfO6B6lBe2CbFtj7u3gjyPomN2czEyOfIuV
 UJS5Yq311mqJaiklfvUmnvIjrtFm6eM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-Gm7K_N7nOGGH_CeOKyjblQ-1; Thu, 13 May 2021 12:39:01 -0400
X-MC-Unique: Gm7K_N7nOGGH_CeOKyjblQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 o18-20020a17090637d2b02903bf3465db95so4461967ejc.18
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zLqbjiL5XtpK2swb6Z/o16E32bj/HHNKtpOT6ZdXtoM=;
 b=qH61I56fx2oA0Fx5HXMy9/8yoyPoIi0v9z9zh0uB1bA59POpZKyGHhVduEf1oHL6Op
 h4ElBbKQQTnVUdMMC/gP3pJJ/wTuCqghmzAP1elPeZ2wDFiFVQru47k7XIgdesCmg7/t
 6Kvao+I0j8fOK5ziNVneS1rKhxzv3Wgg/e7jMokEP/zabggFKzI9ijeitYfBK7vzzlEg
 9/tNWejf/ObpCpyUeDdmbwTlI5TixDw2NloGluug0/vKVMdgKxWKvS3rkV0hjnssGQ2Q
 6Q+uExpqD/W9lZuRJx/cnGAfKsTpW3DekpxRRTD5YBS1+ckZPGAH6fEUC3pX3rHMz2si
 w2XQ==
X-Gm-Message-State: AOAM530Da0j8cZr87g5HdkBavvuXleHpU0yCNaxEpNjQhNBFVtFNv+JA
 +ytuls2BMCkLqF0gaF8nCbRUTVdnb7WIPJnRc9VKu8362Hj2PaeYaKoLG7nX6WV/9hOUitgb/07
 Mfeyl06pcwOWSvWBGUb2j9Iatuz4tqh3777BwY5lEXY5KBiSbQxBVysruHEHgJOpy
X-Received: by 2002:aa7:d915:: with SMTP id a21mr52983130edr.357.1620923940034; 
 Thu, 13 May 2021 09:39:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYdk+QaPCHLpah07gZqGTW7yByPT+IbvE91TXayXTPfCGtW1qOy5Xvn+w3iAeoapVxz2jj/w==
X-Received: by 2002:aa7:d915:: with SMTP id a21mr52983107edr.357.1620923939799; 
 Thu, 13 May 2021 09:38:59 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id j8sm2647335edq.67.2021.05.13.09.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 09:38:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/10] hw: Various Kconfig fixes
Date: Thu, 13 May 2021 18:38:48 +0200
Message-Id: <20210513163858.3928976-1-philmd@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Various Kconfig fixes when building stand-alone machine binaries.=0D
=0D
FYI I'm looking at a way to test this automatically, by generating=0D
all the configurations using:=0D
https://docs.gitlab.com/ee/ci/parent_child_pipelines.html#dynamic-child-pip=
el=3D=0D
ines=0D
This way we could run this on release candidate tags.=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (10):=0D
  hw/mem/nvdimm: Use Kconfig 'imply' instead of 'depends on'=0D
  hw/ide/Kconfig: Add missing dependency PCI -> QDEV=0D
  hw/arm/Kconfig: Add missing dependency NPCM7XX -> SMBUS=0D
  hw/arm/Kconfig: Remove unused DS1338 symbol from i.MX25 PDK Board=0D
  hw/arm/Kconfig: Add missing SDHCI symbol to FSL_IMX25=0D
  hw/riscv/Kconfig: Add missing dependency MICROCHIP_PFSOC -> SERIAL=0D
  hw/riscv/Kconfig: Restrict NUMA to Virt & Spike machines=0D
  hw/ppc/Kconfig: Add missing dependency E500 -> DS1338 RTC=0D
  default-configs/devices: Remove implicy SEMIHOSTING config=0D
  default-configs/devices: Clarify ARM_COMPATIBLE_SEMIHOSTING is=0D
    required=0D
=0D
 default-configs/devices/arm-softmmu.mak     | 5 +++--=0D
 default-configs/devices/ppc-softmmu.mak     | 1 -=0D
 default-configs/devices/ppc64-softmmu.mak   | 1 -=0D
 default-configs/devices/riscv32-softmmu.mak | 5 +++--=0D
 default-configs/devices/riscv64-softmmu.mak | 5 +++--=0D
 hw/arm/Kconfig                              | 4 +++-=0D
 hw/i386/Kconfig                             | 1 +=0D
 hw/ide/Kconfig                              | 2 +-=0D
 hw/mem/Kconfig                              | 2 --=0D
 hw/ppc/Kconfig                              | 2 ++=0D
 hw/riscv/Kconfig                            | 6 ++++++=0D
 hw/riscv/meson.build                        | 2 +-=0D
 12 files changed, 23 insertions(+), 13 deletions(-)=0D
=0D
--=3D20=0D
2.26.3=0D
=0D



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC69F347FE4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 18:57:52 +0100 (CET)
Received: from localhost ([::1]:37356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP7lP-0005fZ-MM
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 13:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP7iP-00040t-9U; Wed, 24 Mar 2021 13:54:45 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP7iN-0008HI-M7; Wed, 24 Mar 2021 13:54:44 -0400
Received: by mail-wr1-x432.google.com with SMTP id x16so25343251wrn.4;
 Wed, 24 Mar 2021 10:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WBZU4j9TsOyw89yO3fJ5Vv4oMr0ykthv8FZq9+quu80=;
 b=fXTg5gBVeD/Vp4OFz4fT5AfaIvdEa+64bsBORnotOZcNRQxaCsVcOSIJzQ23EyalAP
 JBBa5CLrnfUhgq0HkNWR1cizutAlDjO/lsoMlV4Ck8PoM0SyJzi6sQqFXxSIieefyFuX
 l+P6t9guZENwyCh5ZvLKK+9htZh5cqhHi0/ojewFQTfrBNjf702gbyA6+va7gjjrb0ie
 Cnfzft/rARDn83Duzbq8HUzUmKKD8vRNpShpQo2BnJgrq8SbR+EFFBD6hPV5PiVhQd2y
 yu7M752ER4Bq0yGlzdJNaAEgfz1scgB9k0IfHdJFvgLbGMYCw7TDEUpgEZPpRTi84gKJ
 W+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=WBZU4j9TsOyw89yO3fJ5Vv4oMr0ykthv8FZq9+quu80=;
 b=D788uPpKjiqtRJAUorqD/Xa6Xdi4cedOQW1CqxftTrUGr6NwjlLUmS+A7AxsTGCK9d
 +uiQ1PTIQVJDLftrtualqkXfdVPCvmEexIsFuuSj/lUnxMfhCJQfyLmhn0FC1bY6tsQn
 EUA30JYDptfRqKfA8c0WYOvnammReQEurTEaQ4QuHNNWPLvNQkjkcZJNmwoefWGMo5d0
 +FE5J6dae+efcfXdc0JAVSvhlQhKdTUPg+uR7F/vuJekctht9EsT5ZRvboctf9vY74mp
 5WQwt7wNInLIHE8fEBjGWELkSjp/IDp7xrZBjlXFoOlIdiIl+U9Wqcy0+bsoWkI2/2i6
 bL0g==
X-Gm-Message-State: AOAM5327BUKYrLKJVHplZlWwNSTvtRcqlnJc7ALCWI84aK1cbKJju6yw
 2G08jW6xmmt7CWrnm3A0Rqnp80MhOCyy9g==
X-Google-Smtp-Source: ABdhPJxMQto39mHK4AO/JV3JIJvWWTwrnjPMroBRer+Yi9bT4fsA7ogRM7TrgCxeKEpp9KihyyqlEg==
X-Received: by 2002:adf:ec8c:: with SMTP id z12mr4683303wrn.405.1616608481277; 
 Wed, 24 Mar 2021 10:54:41 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q9sm4027371wrp.79.2021.03.24.10.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 10:54:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] hw/southbridge: QOM'ify vt82c686 as VT82C686B_SOUTHBRIDGE
Date: Wed, 24 Mar 2021 18:54:32 +0100
Message-Id: <20210324175438.680310-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The motivation behind this series is to remove the=0D
isa_get_irq(NULL) call to simplify the ISA generic model.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  hw/isa/vt82c686: Name output IRQ as 'intr'=0D
  hw/isa/vt82c686: Simplify removing unuseful qemu_allocate_irqs() call=0D
  hw/isa/vt82c686: Let ISA function expose ISA IRQs=0D
  hw/ide/via: Replace magic 2 value by ARRAY_SIZE / MAX_IDE_DEVS=0D
  hw/ide/via: Connect IDE function output IRQs to the ISA function input=0D
  hw/southbridge/vt82c686: Introduce VT82C686B_SOUTHBRIDGE=0D
=0D
 hw/ide/via.c               |  31 ++++++++---=0D
 hw/isa/vt82c686.c          |  23 ++++----=0D
 hw/mips/fuloong2e.c        |  35 +++---------=0D
 hw/southbridge/vt82c686.c  | 107 +++++++++++++++++++++++++++++++++++++=0D
 MAINTAINERS                |   1 +=0D
 hw/Kconfig                 |   1 +=0D
 hw/isa/Kconfig             |   8 ---=0D
 hw/meson.build             |   1 +=0D
 hw/southbridge/Kconfig     |   7 +++=0D
 hw/southbridge/meson.build |   1 +=0D
 10 files changed, 162 insertions(+), 53 deletions(-)=0D
 create mode 100644 hw/southbridge/vt82c686.c=0D
 create mode 100644 hw/southbridge/Kconfig=0D
 create mode 100644 hw/southbridge/meson.build=0D
=0D
-- =0D
2.26.2=0D
=0D


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3949131A8C8
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 01:29:02 +0100 (CET)
Received: from localhost ([::1]:53120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAio1-0002Oa-8i
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 19:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3dhwnYAMKClMy4z19916z.x97Bz7F-yzGz689818F.9C1@flex--dje.bounces.google.com>)
 id 1lAikq-0000GM-Lz
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 19:25:44 -0500
Received: from mail-ua1-x94a.google.com ([2607:f8b0:4864:20::94a]:48610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3dhwnYAMKClMy4z19916z.x97Bz7F-yzGz689818F.9C1@flex--dje.bounces.google.com>)
 id 1lAikb-0007pK-4e
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 19:25:44 -0500
Received: by mail-ua1-x94a.google.com with SMTP id x14so414979uac.15
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 16:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=VBsGwUpGyUsrBAIRgfriyqklE61q7c+OkwCbO/KoJbQ=;
 b=PZIMdCYygaciXsnS7YyAJ58MO/BIJGFmXKzuJHkKoqnpym/Cxkib+afoBjyKaHJ+2F
 nxk84w5tuaKSnHYy2wqbzwzgij8/xxiHS0OQtXfMe93UnDotyu71PdSozAI5SN/Pm7h6
 HtmK4oC0UdJgd8xkqxGEWySOPBpr1U9exMn9Ewv9l1d5UGtmrc2x+6Up0rjEK8gxLQuc
 IBtl8UX+W7Y2kngj9NIwhZi9UEAkyqSAWhoTIoCnB+o0AUYLe44lgf/vhil7oeb0/01j
 DMfqwgzHrPHTx/K1jPLFGTtqoGVtffRm9JKhgyn7f9SjNwjWUBnP5bFQOOlIJpfJD6tH
 H39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=VBsGwUpGyUsrBAIRgfriyqklE61q7c+OkwCbO/KoJbQ=;
 b=tDyCCYIQOn6ng6pZE8hQQnw+MSHDYYra+WM6QcIb6npj5n0n42bnKJFWVO7ygXBLlo
 qHBCcweE3PJL0y1BXytEK/eXWYAymHXiwKrv9wF7nX87JGdNHzgpOnam+unJtBVLaR3c
 +5ZEf7XKFuXzy0Kzweeb9Q1/yacJWIdUxc2Pp1J+hgXFHq6zc4G1PoutDxrUha44FIhd
 2tlzWQuQKkRJEgXlZIBTAg84FpQOZ+l+VeSsEneobARdhhtVa/F9ZXEPgGyOmIiHdSCo
 /VphimRdDfycwz0HiyTbU9x3xOBwqihyuOn4/pFloRbISvgSnmdob+D5zspcH7FmaxeC
 cC/Q==
X-Gm-Message-State: AOAM531BBHL7P51l3Q7xjIC+tvb52rg3Ocaj6OjsRulZijv0JqRyPoLA
 LY5VFBeElMEJsaWfUY0MVYitcns6qzXc6PAAF68r2sVKE8uICa0fi1Cr+BpU5mSBDngk46JxJTa
 NjW0ZK8JqPmcGK/2il7nGdB7kbLN1DbYzx4bSfMMn2R5TNa5l+93U
X-Google-Smtp-Source: ABdhPJxMAPgdrVVY8ps9zaV3KC3ThLwLXkzQWQ1uER33RXnEja3s7qu2uizHZCcMqxROTRvJSg7Sqeo=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:3518:3ae4:e236:7aa4])
 (user=dje job=sendgmr) by 2002:a67:8d01:: with SMTP id
 p1mr3831485vsd.1.1613175926037; 
 Fri, 12 Feb 2021 16:25:26 -0800 (PST)
Date: Fri, 12 Feb 2021 16:25:17 -0800
Message-Id: <20210213002520.1374134-1-dje@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH v4 0/3] Add npcm7xx emc model
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hao Wu <wuhaotsh@google.com>, Avi Fishman <avi.fishman@nuvoton.com>, 
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::94a;
 envelope-from=3dhwnYAMKClMy4z19916z.x97Bz7F-yzGz689818F.9C1@flex--dje.bounces.google.com;
 helo=mail-ua1-x94a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Doug Evans <dje@google.com>
From:  Doug Evans via <qemu-devel@nongnu.org>

This is a 10/100 ethernet device that has several features.
Only the ones needed by the Linux driver have been implemented.
See npcm7xx_emc.c for a list of unimplemented features.

Doug Evans (3):
  hw/net: Add npcm7xx emc model
  hw/arm: Add npcm7xx emc model
  tests/qtests: Add npcm7xx emc model test

 docs/system/arm/nuvoton.rst    |   3 +-
 hw/arm/npcm7xx.c               |  50 +-
 hw/net/meson.build             |   1 +
 hw/net/npcm7xx_emc.c           | 857 ++++++++++++++++++++++++++++++++
 hw/net/trace-events            |  17 +
 include/hw/arm/npcm7xx.h       |   2 +
 include/hw/net/npcm7xx_emc.h   | 286 +++++++++++
 tests/qtest/meson.build        |   1 +
 tests/qtest/npcm7xx_emc-test.c | 862 +++++++++++++++++++++++++++++++++
 9 files changed, 2076 insertions(+), 3 deletions(-)
 create mode 100644 hw/net/npcm7xx_emc.c
 create mode 100644 include/hw/net/npcm7xx_emc.h
 create mode 100644 tests/qtest/npcm7xx_emc-test.c

-- 
2.30.0.478.g8a0d178c01-goog

Differences from v3:

1/3 hw/net: Add npcm7xx emc model
- no change

2/3 hw/arm: Add npcm7xx emc model
- no change

3/3 tests/qtests: Add npcm7xx emc model test
- handle big endian hosts, tested on sparc64

Differences from v2:

1/3 hw/net: Add npcm7xx emc model
- move call to qemu_set_irq
- remove use of C99 mixed decls/statements
- add use of g_autofree

2/3 hw/arm: Add npcm7xx emc model
- none, patch ok as is

3/3 tests/qtests: Add npcm7xx emc model test
- remove use of C99 mixed decls/statements


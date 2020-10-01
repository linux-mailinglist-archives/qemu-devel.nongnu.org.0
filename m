Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151D22805F3
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 19:53:55 +0200 (CEST)
Received: from localhost ([::1]:41964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kO2m9-0002jQ-Su
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 13:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kO2UK-0006x5-84; Thu, 01 Oct 2020 13:35:28 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:33704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kO2UG-0005Km-7D; Thu, 01 Oct 2020 13:35:27 -0400
Received: by mail-pg1-x531.google.com with SMTP id o25so4588559pgm.0;
 Thu, 01 Oct 2020 10:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p+PdtlFhZvZMf7BCsHxu1J7b2TEb49Uv54DWYri8UQY=;
 b=S69p07qxglcxtgpbUNGRGPWkew5MQKuzKH7cJTB8m8b8wvGR+s+jlcVFSt2OU6EsPE
 Pa/GtkogMPWgRBPA9R/ytpN0lVUSSHtVVq/wie0yXSEXBzl1pPC6f4pm9vgABjjTmUDU
 HPlD0jI+Sz3o+y8AfeNh4bvhw/M6oZwTUEa23XfsQ7UTIcSeHp7i1xfV/kQg4h0KviNE
 SzEZwHvF9OgmP6DWM1UYUCEeie8eBSWsEx5bwKJzZImn+tiC0fChIPcvLs/DdiIELlzL
 I0CAO2D2cZLis4SYmx3ccXDNdOKDZBUcVx4Ty6W5VtPNLOy7Z6juFPwdY2wriiGtg9rm
 lH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p+PdtlFhZvZMf7BCsHxu1J7b2TEb49Uv54DWYri8UQY=;
 b=MfP1ml/gZtRlMWgks2+n19006HNRPQ0mlZbh5BaqdrGdo7oUlTerY9qGgo4D/W+QOV
 Clr+2F/gkC2+0axeWMMbtq2cnUkOmu0EJ1PE1IJjEGM4vuXpLhsVJYuaDN9fwFkqRgSt
 SX6OxS8zHfOKk9auhR55MTc2iCn5j/kes0kn++Gppa1mWhNPhFzFIXbMl+FNLifpRVLJ
 Pumqsjxr4/hODndolq3l3aFnMfFWD5hHwBvolF4zLi8w3LPfI1QAfXS9tyrS3v2qi/j7
 oBZokm4JuP7ahEUFdOQPMk9aUF/4+S+0cc+KBL6YrD0X5klVG7c9vEvonYyCfSOTJuQX
 4Efg==
X-Gm-Message-State: AOAM53023a522me+sIdMiR02oasEHACxgNEfBBocakTYMh4pMUqdRiWi
 RlZmW3s8ttBgR2KAkq+9IERu/ZQotch4XQ==
X-Google-Smtp-Source: ABdhPJxviQoj2zAsX9gtAUtUaj4mwCn0l1adcThmYTRf2LSHDjGRYPiY0OAQpxhFrAK0xNvvk2YAwQ==
X-Received: by 2002:a63:1d26:: with SMTP id d38mr7283230pgd.0.1601573721919;
 Thu, 01 Oct 2020 10:35:21 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id b7sm4445646pjq.1.2020.10.01.10.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 10:35:21 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] Texi cleanup
Date: Fri,  2 Oct 2020 01:35:02 +0800
Message-Id: <20201001173503.1107-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x531.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, QEMU Trivial <qemu-trivial@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Texi cleanup=0D
=0D
V1-V2=0D
Fixes with=0D
 doc: Remove texi referenced in qemu-img-cmds.hx and target/i386/cpu.c=0D
=0D
Yonggang Luo (2):=0D
  doc: Remove texi referenced in qemu-img-cmds.hx and target/i386/cpu.c=0D
  doc: remove hxtool-conv.pl=0D
=0D
 qemu-img-cmds.hx       |   2 +-=0D
 scripts/hxtool-conv.pl | 137 -----------------------------------------=0D
 target/i386/cpu.c      |   2 +-=0D
 3 files changed, 2 insertions(+), 139 deletions(-)=0D
 delete mode 100755 scripts/hxtool-conv.pl=0D
=0D
-- =0D
2.28.0.windows.1=0D
=0D


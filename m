Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDB44C988E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:55:56 +0100 (CET)
Received: from localhost ([::1]:42476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPBPO-0001YD-5d
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:55:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPBMB-0007X0-BL; Tue, 01 Mar 2022 17:52:35 -0500
Received: from [2a00:1450:4864:20::531] (port=36472
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPBM9-0002lY-Qk; Tue, 01 Mar 2022 17:52:34 -0500
Received: by mail-ed1-x531.google.com with SMTP id cm8so23989965edb.3;
 Tue, 01 Mar 2022 14:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qOIwg9yUFTbxGoKevw1Vn+aFTtnh/GHNy44C5BDKZSI=;
 b=nibw6MvRi32t8js15EaRMREMPA4TXvJZ648WFir0XHaul0vU5ACC2OQ9q4h0WVUUpn
 RuGEGAiK3EpKBbM52QGZnroufDXzk0bN3Goma2fLDgBTiR6vAdmzkSOJAIQLTTbm5Uaa
 ftH3nnhGOLvwp2AAsVtaZxDRHE5pb1nUWJ6g7P60XeDzZcaBmXBXAij400cXdFxKqSQI
 pg3vlMyQjWnzfVLINMbERtxMy5qbz5VoGa12amncsfjJzFMOj/5qTw4RnK7lQmWNSuD2
 qriqBpY9mq7LpIfgzu/EPdaHviXbYBeqTvPzZ2mbfEN7491r7TsZ21eGaA043B1oILbV
 fIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qOIwg9yUFTbxGoKevw1Vn+aFTtnh/GHNy44C5BDKZSI=;
 b=AUk7sf65pJt5EryE/fSelIWa/XgCmwgMtB8yAodvJ/IiH5uceu/q/vlvNGnVn57xYv
 GytknmZUfTozt4UerxthbVSdbR7jJkyiUUNRPj6aZn4kIHmIMotpzUNkEJE5XwUR6jCv
 ZyZ0LOLAfbApHkXb20GIijf/HDs5ihqEQC3qI1V8HCseJ2p0zlzv2jzoA+NygECa/LDE
 QBXkhhF5ObpYs1KA2SbGyH8Vh6DeX7NX1WbRrDdBq3Dg3P0bbnF6pKpHU9FZjwwM+X3e
 zrT4Pu4DCEvQ/xPxyIBYrLbLrrtiuZwp27w05XybhnDBAF8FfsNA66FKAhrTHClIn5tA
 y+mQ==
X-Gm-Message-State: AOAM531T0FKzhnYOF+pLJaURCT9H1nUySJ4xM3HpKST3iVqSkKasVaxn
 32vvF9Pxd0FoCmVyT8jM6GTCnbQBj0E=
X-Google-Smtp-Source: ABdhPJy+rfeXU+l0VD2BEq3WSRWcWTPZK6vJLvX77XNAX8Uaj+ba/DCnTZtmJukGSMTWmX5WvUwdFQ==
X-Received: by 2002:aa7:cb8b:0:b0:410:9aaf:2974 with SMTP id
 r11-20020aa7cb8b000000b004109aaf2974mr26117175edt.173.1646175151776; 
 Tue, 01 Mar 2022 14:52:31 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-055-004-046.78.55.pool.telefonica.de. [78.55.4.46])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a056402271200b0041110d6b80asm7806711edd.39.2022.03.01.14.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:52:31 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 0/2] Resolve some redundant property accessors
Date: Tue,  1 Mar 2022 23:52:18 +0100
Message-Id: <20220301225220.239065-1-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No changes. Just also CC'ed to qemu-trivial.

The QOM API already provides appropriate accessors, so reuse them.

Testing done:

  :$ make check
  Ok:                 570
  Expected Fail:      0
  Fail:               0
  Unexpected Pass:    0
  Skipped:            178
  Timeout:            0


Bernhard Beschow (2):
  hw/vfio/pci-quirks: Resolve redundant property getters
  hw/riscv/sifive_u: Resolve redundant property accessors

 hw/riscv/sifive_u.c  | 24 ++++--------------------
 hw/vfio/pci-quirks.c | 34 +++++++++-------------------------
 2 files changed, 13 insertions(+), 45 deletions(-)

-- 
2.35.1



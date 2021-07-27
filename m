Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC943D7F69
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 22:43:17 +0200 (CEST)
Received: from localhost ([::1]:44978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Tv2-0008CS-Gm
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 16:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Tt9-000623-Lf
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 16:41:19 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:46909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Tt7-00053S-Sx
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 16:41:19 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so217965wmb.5
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 13:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6RDGsJ++zszurpWSKJ7MXT77Rkmx77mZiFdIQ5MPL2g=;
 b=aaRaFNBO/Ea8VzvUKc8UhUdhjg8qSf7X+rmOL2Jyntb3ZJ67zvIEu6Mr9KI4xHgo2q
 wEiHAUR3XIaTzPjEIZvfYkfUr/4SNRbL6Q836zKZN6z9uzVgFup3rnJE6CpLmkJgwift
 iaKviuDGoTqSyaXGBNajQs59laWR/vJx4ND0iPDWiXkrU68n1IRlTTSZTnx3q7HEInek
 oyVSYhKEsbnBSH+doUAdRJfUEXhDoB8Ux5SU1umu1+CUWMRP+zNz59T7Bi+kHwN3vXr9
 RF1g5cCDBJUBu/4fNpc7RlqDUFtC8vy2H+B2JXIX1/NT+kWkh87BSKZ7uCztovIomEB7
 AS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6RDGsJ++zszurpWSKJ7MXT77Rkmx77mZiFdIQ5MPL2g=;
 b=hVhrSm4FZcUdu5y9P2B+98LNjYPLf1uXtAiQPJ6Ja3a6mTZtpwDkj0dCg6C07EDgty
 MkmbFi9UizHr3wkQ3kSUENIUYh/v/lTyA/lpztJS/WW0bU4A7TyifAXntRdIg84ny0IO
 VXhSqSCft3mF9N9MJ8z1+8qClW7fzFBk5ywhItolcj0SOjDERpPALOuZ1xfBdMBDmnZ3
 WFluorj6Bh1MPAEm4huuSeWXB7PhUknmpMWkhAPzMPWYmdHf/X8ViSaUPnPGhxFxI6QR
 fpY60eNEcy87CP6OyCYkyEc7STS+MkOxsYZPbIgcIRRbSy/sgs7+yZ/1fkYa/wrZeeYv
 q/vA==
X-Gm-Message-State: AOAM531I7p6y7danATRELMPpxp3G42LPfGNjwqOac1yUPeHd/Ixze1Ax
 g+2st0UaZ839mASFgzUGyNA7uL8DDUWo2Q==
X-Google-Smtp-Source: ABdhPJyNOR9hyyAaMHtV+rD5q2IYzY5/S2uflbTmJ5zp/ArFM+G10lmK5V08nTinfz1/oSmmkgslwQ==
X-Received: by 2002:a05:600c:3507:: with SMTP id
 h7mr6055078wmq.9.1627418474493; 
 Tue, 27 Jul 2021 13:41:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h16sm4276302wre.52.2021.07.27.13.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 13:41:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] docs: Convert barrier.txt to rST
Date: Tue, 27 Jul 2021 21:41:09 +0100
Message-Id: <20210727204112.12579-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset converts docs/barrier.txt to rST, putting
it in the appropriate places:
 * the protocol info lives in interop/
 * the "how to use this" info lives in system/
 * TODO remarks live in the .c file :-)

thanks
-- PMM

Peter Maydell (3):
  docs: Move the protocol part of barrier.txt into interop
  ui/input-barrier: Move TODOs from barrier.txt to a comment
  docs: Move user-facing barrier docs into system manual

 docs/barrier.txt         | 370 ----------------------------------
 docs/interop/barrier.rst | 426 +++++++++++++++++++++++++++++++++++++++
 docs/interop/index.rst   |   1 +
 docs/system/barrier.rst  |  44 ++++
 docs/system/index.rst    |   1 +
 ui/input-barrier.c       |   5 +
 6 files changed, 477 insertions(+), 370 deletions(-)
 delete mode 100644 docs/barrier.txt
 create mode 100644 docs/interop/barrier.rst
 create mode 100644 docs/system/barrier.rst

-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524D71FA017
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 21:24:02 +0200 (CEST)
Received: from localhost ([::1]:57246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkui9-0007qD-Ad
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 15:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jkugu-0006K5-7V
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 15:22:44 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:50347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jkugs-0003oC-HN
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 15:22:43 -0400
Received: by mail-wm1-x32d.google.com with SMTP id l17so685499wmj.0
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 12:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3sNxJGe6/WG8AxHJSSsAdnGlRxS3BbW/MHU3XkK3cEw=;
 b=czUi2N6zo/Hf3dHJoO99nnHpEdEXpnt4WOHffLR5Z3FvcYjTgxcNe174rYqEIFNRC9
 /zbIp5Pv6wpdGUhSnE98gKPKJv+pIwOCQuaJdCcSJU9v4vIVtR5h+7YD/7CaxOkDDSDo
 jawx9dpSWgZsrasCqgIy9lrM6kuPJkf/iqnL/JMFYxeu8CpnwybbFDwKFHSutpy/eKNE
 E9j1l82GDapZtnwuI67AGhc8HAbP/a9K+JMkUp4/iBlfIS9KL9o3Mwo/dEEN1SezsywC
 nnhCb75TD8B1kSBv7K4MB9Sb/c3ERvuwOR8M3L6WaUIY8O4IhYJcQS8eQdClltcYtQ/4
 /CaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3sNxJGe6/WG8AxHJSSsAdnGlRxS3BbW/MHU3XkK3cEw=;
 b=R3Jsst6rQJATOG1HZbItdWJOBNfIt2VShOHrTw/8yPsFzTEzLwVLiLBG9Q0ogsNqwJ
 bWymuVQb90ViJEaLq2fYqHpijAdM+wN8CRbuVP7cy2eYXVhv9BdEN9zLdYf+OsTEWZRV
 jL0y/+P/N2ZmuuP2C0ujnySWpGl0hmUIclwAz1rXQQq81xwwQph+sSBcc6OGMCjY26BK
 hJZHcswyVe9FCIESfdMoEoldzzm3cPOjCf83WITgk3Z4fKJ6y596T5SOYVtFpzj1XVN0
 y6aB9Gu1ZH61MdkM4LVtFu9Gq21vst0Xz4zSGN4bQwi7mR/w0GmMTqEd7G917hYb47B8
 ePxA==
X-Gm-Message-State: AOAM532WOYmGp56vUMa6iWK28zTvXpbvW2jPqYbmZpV2Up2jyXFfGtck
 jZNuZYLdWv3jJfk5K3lRQ9SHjGuc
X-Google-Smtp-Source: ABdhPJyXBQFtjED7p7qhKWkOZUv85Y5rtFVZHHG9vif1PDKqaPknyCvR220EBIhYI3Z0rXtKX36ugQ==
X-Received: by 2002:a1c:740e:: with SMTP id p14mr847683wmc.155.1592248960670; 
 Mon, 15 Jun 2020 12:22:40 -0700 (PDT)
Received: from rtrkw774-lin.syrmia.com ([46.240.135.226])
 by smtp.gmail.com with ESMTPSA id 50sm27823909wra.1.2020.06.15.12.22.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jun 2020 12:22:40 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 00/18] MIPS + misc queue for June 15th, 2020
Date: Mon, 15 Jun 2020 21:22:15 +0200
Message-Id: <1592248953-8162-1-git-send-email-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-wm1-x32d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: aleksandar.qemu.devel@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 81b53858fed8a316a4715c2f7f92cdfb4a7b4dd8:

  target/mips: msa: Split helpers for SUBS_U.<B|H|W|D> (2020-06-15 20:50:40 +0200)

are available in the git repository at:

  https://github.com/AMarkovic/qemu tags/mips-queue-jun-15-2020

for you to fetch changes up to 250bc43a406f7d46e319abe87c19548d4f027828:

  translations: Add Swedish language (2020-06-15 20:51:10 +0200)

----------------------------------------------------------------

MIPS + misc queue for June 15th, 2020

  Highlights:

    This pull request, just exceptionally, contains two non-MIPS patches:

      - adjust sh4 maintainership
      - add Swedish translations

    The rest are MIPS patches:

      - refactor emulation of a number of MSA instructions
      - activate Loongson-related insn_flags

    Notes:

      - one checkpatch warning is benign
      - some of make check iotest-qcow2 tests fail on my system, both before
        and after applying the patches from this pull request

----------------------------------------------------------------


Aleksandar Markovic (15):
  target/mips: msa: Split helpers for MADDV.<B|H|W|D>
  target/mips: msa: Split helpers for MSUBV.<B|H|W|D>
  target/mips: msa: Split helpers for DPADD_S.<H|W|D>
  target/mips: msa: Split helpers for DPADD_U.<H|W|D>
  target/mips: msa: Split helpers for DPSUB_S.<H|W|D>
  target/mips: msa: Split helpers for DPSUB_U.<H|W|D>
  target/mips: msa: Split helpers for DOTP_S.<H|W|D>
  target/mips: msa: Split helpers for DOTP_U.<H|W|D>
  target/mips: msa: Split helpers for SUBS_S.<B|H|W|D>
  target/mips: msa: Split helpers for SUBS_U.<B|H|W|D>
  target/mips: msa: Split helpers for SUBSUS_U.<B|H|W|D>
  target/mips: msa: Split helpers for SUBSUU_S.<B|H|W|D>
  target/mips: msa: Split helpers for SUBV.<B|H|W|D>
  target/mips: msa: Split helpers for MULV.<B|H|W|D>
  MAINTAINERS: Adjust sh4 maintainership

Jiaxun Yang (2):
  target/mips: Legalize Loongson insn flags
  target/mips: Add comments for vendor-specific ASEs

Sebastian Rasmussen (1):
  translations: Add Swedish language

 target/mips/helper.h     |   73 ++-
 target/mips/mips-defs.h  |    8 +-
 target/mips/msa_helper.c | 1296 ++++++++++++++++++++++++++++++++++++----------
 target/mips/translate.c  |  213 +++++++-
 MAINTAINERS              |    8 +-
 po/sv.po                 |   75 +++
 6 files changed, 1364 insertions(+), 309 deletions(-)
 create mode 100644 po/sv.po

-- 
2.7.4



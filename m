Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB40584486
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 18:59:02 +0200 (CEST)
Received: from localhost ([::1]:54084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH6qj-0005Pv-1Z
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 12:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oH6nI-00012C-FZ; Thu, 28 Jul 2022 12:55:28 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:37819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oH6nG-0006cR-Tg; Thu, 28 Jul 2022 12:55:28 -0400
Received: by mail-oi1-x22e.google.com with SMTP id l188so3054815oia.4;
 Thu, 28 Jul 2022 09:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bEFRS9dTk9niWwfx3NckSzcNMgufAErp/mcK1dOUcGM=;
 b=Ov9xEzF0yZmMWsQwqNFysX6/tC3GhEBgGNZ3BhrUB31lqwnHDvmvyqbHrv/InTm5LE
 fX/ZAleo9VvzQC+WQ9tob3mcu1jm424WkE69Q1gzHo9aDue61t6MYE+RtH8go1ZoObkt
 LJ0t4dptdB8DOB/XOkDdzZspa+aAt+4lz/uStjWRaSVarQ3TXllioVdYiwTzp40abjMe
 qzF2gyN2X8h5T6wc5dn704HPX9evXNrqMe9rE1KE4f45yLUQE8pr4Z0wn278676/cL9N
 WpJ/CVeQ/NTfnbMAXhcxmopSHCyjuYcs7674VWGZ+n/G9ew4HrPuNQfEn4AnFArLbkDX
 CmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bEFRS9dTk9niWwfx3NckSzcNMgufAErp/mcK1dOUcGM=;
 b=tB2pB4PcV0VMu1sU5Mwk/v0VvWSer8Noxn0GrdVJzRA39T8svk1owydusyPdk499CS
 nvf/fGxHw81waEHO+xnoIifqW2viLAmGjzK8oER41j5ufKoXhSsTsOZh2RPgxclUQtUp
 i/72JquQhAaP4EIWH3y56mFwwW1CFkZg1j+6Z3k5/iaC+UdfA/2T9yXODRtjZXGPE5de
 mKVREZybSrjgDn8rLVCYUgFM4xqbDTJk0zzl9OMRnHJAEpveeL4yNqaSX54u+0MIjpZ/
 RiE3HQEuG9xoO635Rk/ZgxWhMrhOCOWiOTnDethIk29lgEWrBinloWXxs7UBTW7t94kQ
 blfg==
X-Gm-Message-State: AJIora9MaqRgiFZtWCIoQ3/eJh6QkkAlzFqpu19VLeubvp1tW2efxH0H
 xtYcLi2qzmJwQu0rqinq8Fi1LaJfaq0=
X-Google-Smtp-Source: AGRyM1sjQAmpa4Kx07ZIwTuBtAXOnjEJ421TP3y1KOyzdewgR0V1g0+NbnTBu4kyVjzRdLKBv7ouGw==
X-Received: by 2002:a05:6808:d4d:b0:33b:6ae:bd06 with SMTP id
 w13-20020a0568080d4d00b0033b06aebd06mr143733oik.183.1659027324907; 
 Thu, 28 Jul 2022 09:55:24 -0700 (PDT)
Received: from balboa.COMFAST ([179.225.208.46])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a056870170f00b0010e5a5dfcb4sm616290oae.0.2022.07.28.09.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 09:55:24 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org
Subject: [PULL 0/3] ppc queue
Date: Thu, 28 Jul 2022 13:55:16 -0300
Message-Id: <20220728165519.2101401-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 3e4abe2c92964aadd35344a635b0f32cb487fd5c:

  Merge tag 'pull-block-2022-07-27' of https://gitlab.com/vsementsov/qemu into staging (2022-07-27 20:10:15 -0700)

are available in the Git repository at:

  https://gitlab.com/danielhb/qemu.git pull-ppc-20220728

for you to fetch changes up to 0c9717ff35d2fe46fa9cb91566fe2afbed9f4f2a:

  target/ppc: Implement new wait variants (2022-07-28 13:30:41 -0300)

----------------------------------------------------------------
ppc patch queue for 2022-07-28:

Short queue with 2 Coverity fixes and one fix of the
'wait' insns that is causing hangs if the guest kernel uses
the most up to date wait opcode.

- target/ppc:
  - implement new wait variants to fix guest hang when using the new opcode
- ppc440_uc: initialize length passed to cpu_physical_memory_map()
- spapr_nvdimm: check if spapr_drc_index() returns NULL

----------------------------------------------------------------
Daniel Henrique Barboza (1):
      hw/ppc: check if spapr_drc_index() returns NULL in spapr_nvdimm.c

Nicholas Piggin (1):
      target/ppc: Implement new wait variants

Peter Maydell (1):
      hw/ppc/ppc440_uc: Initialize length passed to cpu_physical_memory_map()

 hw/ppc/ppc440_uc.c     |  5 ++-
 hw/ppc/spapr_nvdimm.c  | 18 +++++++---
 target/ppc/internal.h  |  3 ++
 target/ppc/translate.c | 96 +++++++++++++++++++++++++++++++++++++++++++++-----
 4 files changed, 109 insertions(+), 13 deletions(-)


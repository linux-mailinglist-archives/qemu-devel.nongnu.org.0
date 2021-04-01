Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7EA35146C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:25:07 +0200 (CEST)
Received: from localhost ([::1]:35318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvRh-0002Qa-Vu
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPD-0000jQ-Ta
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:31 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:36733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvP8-0006f5-G6
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:27 -0400
Received: by mail-ej1-x62f.google.com with SMTP id a7so2340221ejs.3
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 04:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qbV1HBasb1DpNZ2IY3euFlLi8eBgs3Y+vc5UTlVMYrE=;
 b=pKT7MCe7K+T9ADUJBqUwfQ8ylhr32EoGpA4TUpY7eQ4UJFRfYZYQ0kxhHZN6koo3JT
 CkZ6Ky6FjEGXGmXDON9E25oqfjRSrOlwqUDP3+PT9baF8bdP/aCGFRtigtyJ3qIXGriw
 Jcdxd73unkhqF8+HzJnHeYP9Ko8K74YaJ9xWAL1BbdYI4TMN609Bz9yWr5aJE0rjHGGb
 S0Mae+NF34wIDdR44A4VtAl9xPNa3bTOg6NxUNmY/HjhvD7pUWydaLcq8dOftXjaIONn
 YwcKbdED1Oj3w272QfIcfandsFT3CZ+oD8BjZKg1TywkUyYSlKZKHuMzA1GpBUs3mDS3
 iVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=qbV1HBasb1DpNZ2IY3euFlLi8eBgs3Y+vc5UTlVMYrE=;
 b=QAwu9NEFqYqoutUwKJVrVTbjHyVO2MuRpAwryJmIrsiApKybivDI6lKo8GDTByye3K
 o2dcvKJoSMuc4YjaZo5pUIz/vCnXE/XPmeVEXL1eZdEJbVLE3pl3AnULwW2MRG41/tI1
 ARSlIKfjxGrL5RenH7TdMNiCM7GU8D4FilI8/cuqBUAeVwb2FIIa+JtcgvkH/AHYYKJ1
 BZ9orPZ1QSZMXNpQiEo195uwlcC3+rUOoFzOQputJ4peIrrGVmzmzGwhLTTXNss+7Jrj
 /0gFeCJluGTWmRq4hSc+8UTcRFpLCJgM84UkjmY5jtPSclIcNJlYMZbbPtcN/qKWdpsp
 igPA==
X-Gm-Message-State: AOAM531q7i38PRPlyr7yLIZR2EcrtACHxNK2Tg0hPP02q0YREjxBImOv
 IqdX9Wypb4HFH4yqHnznwGZ+B0M2DJI=
X-Google-Smtp-Source: ABdhPJyMBKlPXrjeqVA5MiqQfdD22xzAHlaTRefjBgY0i4fmnZOKkplPQ64nVWEf2FmSzTMcDPVZKA==
X-Received: by 2002:a17:906:4146:: with SMTP id
 l6mr8725377ejk.295.1617276145035; 
 Thu, 01 Apr 2021 04:22:25 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d15sm3383516edx.62.2021.04.01.04.22.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 04:22:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/12] Misc patches for QEMU 6.0-rc2
Date: Thu,  1 Apr 2021 13:22:11 +0200
Message-Id: <20210401112223.55711-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6ee55e1d10c25c2f6bf5ce2084ad2327e17affa5:

  Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.0-20210331' into staging (2021-03-31 13:14:18 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 7dd6acc82fa6fbc2ff99f173635ac6be0c72b1eb:

  docs: Add a QEMU Code of Conduct and Conflict Resolution Policy document (2021-04-01 10:37:20 +0200)

----------------------------------------------------------------
* Bugfixes
* Code of conduct and conflict resolution policy

----------------------------------------------------------------
Jessica Clarke (1):
      meson: Propagate gnutls dependency to migration

Miroslav Rezanina (1):
      configure: Do not use default_feature for EXESUF

Paolo Bonzini (4):
      qapi: qom: do not use target-specific conditionals
      hexagon: do not specify executables as inputs
      hexagon: do not specify Python scripts as inputs
      docs: Add a QEMU Code of Conduct and Conflict Resolution Policy document

Pavel Dovgalyuk (4):
      replay: fix recursive checkpoints
      icount: get rid of static variable
      replay: notify CPU on event
      target/openrisc: fix icount handling for timer instructions

Richard Henderson (1):
      target/i386: Verify memory operand for lcall and ljmp

Thomas Huth (1):
      Revert "qom: use qemu_printf to print help for user-creatable objects"

 configure                          |  2 +-
 docs/devel/code-of-conduct.rst     | 60 ++++++++++++++++++++++++++++
 docs/devel/conflict-resolution.rst | 80 ++++++++++++++++++++++++++++++++++++++
 docs/devel/index.rst               |  2 +
 migration/meson.build              |  2 +-
 qapi/qom.json                      | 10 ++---
 qom/object_interfaces.c            |  1 -
 replay/replay-events.c             |  2 +
 replay/replay.c                    | 11 +++---
 softmmu/cpu-timers.c               |  5 ++-
 softmmu/icount.c                   |  9 ++---
 softmmu/timers-state.h             |  2 +
 target/hexagon/meson.build         | 36 ++++++-----------
 target/i386/tcg/translate.c        |  6 +++
 target/openrisc/translate.c        | 15 +++++++
 15 files changed, 197 insertions(+), 46 deletions(-)
 create mode 100644 docs/devel/code-of-conduct.rst
 create mode 100644 docs/devel/conflict-resolution.rst
-- 
2.30.1



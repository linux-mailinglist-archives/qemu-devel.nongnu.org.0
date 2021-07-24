Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE34B3D467A
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 10:57:40 +0200 (CEST)
Received: from localhost ([::1]:40068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7DTX-0005mg-Uz
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 04:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m7DQw-00031h-Tf
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 04:54:58 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m7DQu-0002s7-PP
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 04:54:58 -0400
Received: by mail-ej1-x62b.google.com with SMTP id nd39so7285708ejc.5
 for <qemu-devel@nongnu.org>; Sat, 24 Jul 2021 01:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IC2i2vuTfa+cyYoyYXkt/a3Uufs3zOIEu83YDHIxIuk=;
 b=NDbOig9OtiIEtUWt8+5QyylrcgBjO4EbtPxgkeI6kjzsYya1gTjvFBykVq/+n+8YDN
 QWO6VQMaB7VsK4WbY0Q5j7IZwyZBEMEe4hLBjpL9PQCh0EKv4yc9B5/4W/dXaJOkiKiR
 iQolW7lrrFIjyUpvT1ePbgJ+k69AyazTzMan+xWwp7eN/b07NJAHKj/lcvK5AiLyAuZH
 1tvat+0iitEty0z/RSJhshG1FoBxGYzh7X9ZYfVjx9js/qk0O3y5IUcOKMZ3rnScMLqN
 +5tVr/CgKa1y8Ey1RY7lvvajLLFPbycHDEfXkIeRlJ4w7m1UxAFNYx8GKkdPa8xEdmrj
 Bc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=IC2i2vuTfa+cyYoyYXkt/a3Uufs3zOIEu83YDHIxIuk=;
 b=rlTGH5v8k13U6EPPrbsjpoMTDXg8JQXFV19+kez6Jr/f4vuf1DBcX6QMbFByFf74MU
 HdPwdqIP+Ac5h7Ez8dyNRBpmWZa1frF3gurmTlwGAFIKxPv7Vy/ltKQirmFi2s29o/4w
 T7qv7bPIaRk0cIfM8Qct0WUdLY901plCRpAe8KXhtaN0N7gWApxBRw/4umk2p1KGZbYp
 H4AnSHTlEikYHqb+qvXmKcnJqTj4UWtLBi5ZpaTrsr9NL4oFl7p1XoEGakrpG+B/bK9s
 LjNsOEkeQHzWddovJ3Exk+SHFcwA+YFNsUUThLcY8nxCOeduuDcX1e5MphcQlHmmdoae
 3/4w==
X-Gm-Message-State: AOAM5330BmfZCU7uQivF23fVRskim+wdnjniK22uNRZJIIN8K2ZcqEm0
 yQI9JHcAIHp9rb1Gar+5cHGmryFWjWAizQ==
X-Google-Smtp-Source: ABdhPJwxecX8xHQQ586vobsT5hu1wtqfLuk6EPaJA4zkjUrpU7z0z5Hjj6DLUd3VgPV7oMRU5tMusA==
X-Received: by 2002:a17:907:9719:: with SMTP id
 jg25mr8178664ejc.362.1627116895358; 
 Sat, 24 Jul 2021 01:54:55 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id j21sm15723881edq.76.2021.07.24.01.54.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 01:54:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] Misc QEMU patches for 6.0-rc
Date: Sat, 24 Jul 2021 10:54:44 +0200
Message-Id: <20210724085453.16791-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
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

The following changes since commit 7b7ca8ebde4ee6fba171004b2726ae1ff5489c03:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-07-22 18:32:02 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to cbc94d9702882128c52b72b252b8eb775b0e73af:

  qom: use correct field name when getting/setting alias properties (2021-07-23 18:17:17 +0200)

----------------------------------------------------------------
Bugfixes.

----------------------------------------------------------------
Claudio Fontana (1):
      i386: do not call cpudef-only models functions for max, host, base

Daniel P. Berrangé (1):
      gitlab: only let pages be published from default branch

David Hildenbrand (3):
      MAINTAINERS: Replace Eduardo as "Host Memory Backends" maintainer
      MAINTAINERS: Add Peter Xu and myself as co-maintainer of "Memory API"
      MAINTAINERS: Add memory_mapping.h and memory_mapping.c to "Memory API"

Gerd Hoffmann (1):
      meson: fix dependencies for modinfo #2

Lara Lazier (1):
      target/i386: Added consistency checks for CR3

Paolo Bonzini (2):
      qapi: introduce forwarding visitor
      qom: use correct field name when getting/setting alias properties

 .gitlab-ci.d/buildtest.yml           |  18 ++
 MAINTAINERS                          |   6 +-
 include/qapi/forward-visitor.h       |  27 +++
 meson.build                          |   4 +-
 qapi/meson.build                     |   1 +
 qapi/qapi-forward-visitor.c          | 326 +++++++++++++++++++++++++++++++++++
 qom/object.c                         |   9 +-
 target/i386/cpu.c                    |  19 +-
 target/i386/host-cpu.c               |  13 +-
 target/i386/kvm/kvm-cpu.c            | 105 +++++------
 target/i386/tcg/sysemu/misc_helper.c |   7 +
 target/i386/tcg/sysemu/svm_helper.c  |  10 +-
 target/i386/tcg/tcg-cpu.c            |  11 +-
 tests/unit/meson.build               |   1 +
 tests/unit/test-forward-visitor.c    | 197 +++++++++++++++++++++
 15 files changed, 687 insertions(+), 67 deletions(-)
 create mode 100644 include/qapi/forward-visitor.h
 create mode 100644 qapi/qapi-forward-visitor.c
 create mode 100644 tests/unit/test-forward-visitor.c
-- 
2.31.1



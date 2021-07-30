Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D9D3DBF8A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:20:51 +0200 (CEST)
Received: from localhost ([::1]:56380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Yzy-0006Hh-Mq
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9YyD-000414-QR
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:01 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:40893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9YyC-0000lb-95
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:01 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so22374321pja.5
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=szAqu2e0kqPymuH1kmwS7D6vqFdDp51aoI9ZeLGJaag=;
 b=V7Igk0vv1VNARkIN4NZcRY1DvqCyLwexeFlT6oTQ8dK8pxuSteiNGQz9KhUuOFE8pv
 DUNCxAXS/0S9OGep7w5B76Bkqc+ncpJtGiRhd7FBT+ol3uDcpqZ5LCY/sUyKpzU6U4P7
 l16TLg9dKb3Yk3hUM9KpP41alF/DWzRAzaqwuvd4PTLU7xyF52egMDSodbaiXY5blgNE
 FMpYpDnFo0edGT/m3+DxNd/qd73QntU4UtSxo/SLO9nvdUH3d5wuvqLIjMyj9HaD00gy
 /Rtf4L8V85CCNXrqITGlupHLrTeHTzpwRcDOW5odm954BBV/27d7nwuOVYsbF8AHg5Zn
 v/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=szAqu2e0kqPymuH1kmwS7D6vqFdDp51aoI9ZeLGJaag=;
 b=tco1zkM+qw+hVu+knepIsIp/fVp5uNa1Z2HdKLVrT3DJ8yXNd6OFRIE3mN9uApo0AW
 zyGI/ZthXP85qAS6l+yGuHF4cxdwGIrvfS391I/k5PLVGgpsYLKcD+kFJuQFvChM1reo
 jyfDk7gj6gGIFqRBrQCpdZw8ldj+nwlepKBrYLkqQl8eGwRE8E4cMOueqIjeA/lzDAVZ
 nHaKBHmC4/qq26XqXXogb+YgYrXShKThLknoG+ra0F+M8YO5bH+FeQAsB7TkqRj3FrM3
 VYl9q7w0BfUfh4+4fI30kRbiIf0hzThndemz5qUmOsrsAvGIjMuw75gi3p5Pi/N0sdQV
 n43Q==
X-Gm-Message-State: AOAM530bxlJK/eE0ubcXSd0yrq+73vMXQDtRAUxADqk8EP3uniP4gIP4
 L1ODbn1983aHjm9XMWPkUSeI8sHFp7YT8Q==
X-Google-Smtp-Source: ABdhPJzjsyKj74gL05yEDX1p+FweeZhKZELqCX8a8GErouDTPyeWuwukr6zoRM7Bh7XxYzCsoxSalQ==
X-Received: by 2002:a17:90a:d598:: with SMTP id
 v24mr4602251pju.185.1627676338286; 
 Fri, 30 Jul 2021 13:18:58 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.243])
 by smtp.gmail.com with ESMTPSA id s50sm3256842pfw.212.2021.07.30.13.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 13:18:57 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/13] AQMP TUI Draft
Date: Sat, 31 Jul 2021 01:48:33 +0530
Message-Id: <20210730201846.5147-1-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pj1-x102d.google.com
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
Cc: ehabkost@redhat.com, kchamart@redhat.com, jsnow@redhat.com,
 armbru@redhat.com, wainersm@redhat.com,
 G S Niteesh Babu <niteesh.gs@gmail.com>, stefanha@redhat.com, crosa@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello all,

Gitlab: https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v3
CI: https://gitlab.com/niteesh.gs/qemu/-/pipelines/345738265

Major revision since V2:
1) Refined QMP connection manager.
2) Added static typing.
3) Allow highlighting specific messages in history box.
4) Allow copying of QMP message from TUI using keyboard shortcut alt-c.

G S Niteesh Babu (13):
  python/aqmp: Fix wait_closed work-around for python 3.6
  python: disable pylint errors for aqmp-tui
  python: Add dependencies for AQMP TUI
  python/aqmp-tui: Add AQMP TUI draft
  python: add entry point for aqmp-tui
  python/aqmp-tui: Added type annotations for aqmp-tui
  python: add optional pygments dependency
  python/aqmp-tui: add syntax highlighting
  python/aqmp-tui: Add QMP connection manager
  python/aqmp-tui: Add scrolling to history box
  python/aqmp-tui: Add ability to highlight messages
  python/aqmp-tui: Add pyperclip dependency
  python/aqmp-tui: Allow copying message from TUI

 python/Pipfile.lock          |  42 +++
 python/qemu/aqmp/aqmp_tui.py | 519 +++++++++++++++++++++++++++++++++++
 python/qemu/aqmp/util.py     |  12 +-
 python/setup.cfg             |  34 ++-
 4 files changed, 605 insertions(+), 2 deletions(-)
 create mode 100644 python/qemu/aqmp/aqmp_tui.py

-- 
2.17.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B264A33C4BE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:47:39 +0100 (CET)
Received: from localhost ([::1]:47462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLrJa-00006O-PE
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLrBZ-0002vr-1S
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:39:21 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLrBW-0006v3-Ee
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:39:20 -0400
Received: by mail-wr1-x42d.google.com with SMTP id f12so9101215wrx.8
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 10:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CwyeBE/rSeOSOt/j0aIHZXlsOGpeFiSn+IzklQT180A=;
 b=pIiacPN+nPzgghYQDDjJFCEgwNe4V53AHXHiQ8wyg9Tzpevyl6pgwLJDAUf+0OSa9N
 mTALkrK65qngUHJPxkOysAKGsc+GRAsNRabo47hOh76bQuOjsfxP5789a+APMYeVB5Hl
 AGSfRUIjtE5QSVsO6zym6TV84bMYenJw4GK/spOis45WWxvkzdydxhwZLHXMUp2gr3b0
 q5bMSg23cEG+xJcQr8da4kHJ/T9Uze7rIhVC4PW303quYtRdF4T7lcA8PeXB123x6jZt
 sfDLsQP3Gt0SZTFSg9Qk0o/le3mSIH2VTVVOw7J3VpPWQLJ04hSnCJYt/qZFrJup9Fr/
 DDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CwyeBE/rSeOSOt/j0aIHZXlsOGpeFiSn+IzklQT180A=;
 b=IfSryLeoqu3CkaQmkiDqOUCgCsLRyRBeOrvNoJtr5BmHcWtxmn9AlL+vQIkKOOUCRv
 oYuLso6sonIqgPlk9TTrTom07xF7mNOiFWTS1w5jljvd/rvMfDpYmyUhnCYCFmZaOm9l
 Y5XHAP/jVCXoRWFJ7y2gnTLJCxMcQ/GQzfTmWs9lM9CPSPl8GsIg5XR7ta6K9gxjvdq3
 efj2GwCV61O/85xy849KfDxmxIL/BV89/xShRgNXhYLi71eLssll1xwf7+HHF8J6jCTY
 H4/2H3xaiKjKxMzC+DF7Youaesk5w0OrvF1btgx5ObHbfi3YXGbOQwmWW6pjzfp7DB/f
 kU7Q==
X-Gm-Message-State: AOAM531LZ2lC8UikGc0h2S+HdxjfeC16nnAWHA2DQpZK6ibg+8kIxu1R
 /nVL1HUG5erZmuuA8Vah9ZCEuUOlVrw=
X-Google-Smtp-Source: ABdhPJxDQ6SBpa/5XaGhMP1qLpBO2Ith4PNuyPMujROXynqNzFkPvrKYQpbYmwgzFY485EiCcutoeg==
X-Received: by 2002:adf:a3d3:: with SMTP id m19mr807738wrb.24.1615829956699;
 Mon, 15 Mar 2021 10:39:16 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 m132sm295613wmf.45.2021.03.15.10.39.15 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 10:39:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 0/5] Meson version update
Date: Mon, 15 Mar 2021 18:39:07 +0100
Message-Id: <20210315173912.197857-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

The following changes since commit 51204c2f188ec1e2a38f14718d38a3772f850a4b:

  Merge remote-tracking branch 'remotes/bkoppelmann2/tags/pull-tricore-20210314' into staging (2021-03-15 15:34:27 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream-meson-0.57

for you to fetch changes up to 57d42c3b774d0716b9ad1a5a576480521edc7201:

  hexagon: use env keyword argument to pass PYTHONPATH (2021-03-15 18:06:21 +0100)

v1->v2: rebased

----------------------------------------------------------------
Update Meson to 0.57.

----------------------------------------------------------------
Paolo Bonzini (5):
      hexagon: do not specify executables as inputs
      hexagon: do not specify Python scripts as inputs
      meson: bump submodule to 0.57.1
      meson: switch minimum meson version to 0.57.0
      hexagon: use env keyword argument to pass PYTHONPATH

 configure                               |  7 +----
 docs/meson.build                        | 12 ++++----
 meson                                   |  2 +-
 meson.build                             | 54 +++++++++++++++------------------
 plugins/meson.build                     |  4 +--
 scripts/mtest2make.py                   |  7 ++---
 target/hexagon/meson.build              | 37 ++++++++--------------
 tests/docker/dockerfiles/centos7.docker |  2 +-
 tests/qapi-schema/meson.build           |  4 +--
 tests/qtest/meson.build                 |  2 +-
 tests/unit/meson.build                  |  2 +-
 trace/meson.build                       |  4 +--
 12 files changed, 57 insertions(+), 80 deletions(-)
-- 
2.29.2



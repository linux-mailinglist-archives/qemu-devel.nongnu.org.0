Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EE93F4E6C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 18:33:34 +0200 (CEST)
Received: from localhost ([::1]:60608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mICtB-00024O-R3
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 12:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mICqq-0000MA-8z
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:31:08 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:45751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mICqo-000867-EH
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:31:08 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 f11-20020a17090aa78b00b0018e98a7cddaso340583pjq.4
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 09:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=gxmeE8c+cNp2hvkK1R39Ps/RV3vUGgozanI7FGhlrBM=;
 b=iHzDejIojNVHP7L2uQ0icZfPK3FP0DKN2gCFg4G3VBqjZMwY3bXTqXw11525cgkfzw
 +SFMVSTIdvx/eTbYDatwI+zIjDuKRvi+ZSWCmXstcMavoOV4YsueAZxkdzAwDoR2RxGq
 b3rApcxIWtednAgJPWv+k+URvaGu8fuPz2ykY5IMDk2wksfJ0gpgNc+xW9nbTZbFttJj
 OTFnsh145clrqgxpFumR8XEwV026NURp9yZLkRS/F8uRIBhhhGDeUgH7uyUXsu5OLVDe
 oOWn4e45d4rmmMpR0SuW+O+WGic3k2laY5/E0tl+6xhZpBgwBO7pVJvkJEpZxOeplE67
 teeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gxmeE8c+cNp2hvkK1R39Ps/RV3vUGgozanI7FGhlrBM=;
 b=CEDODQWKiRiTNuX0SKF1G6DJ4VasIoiVE6CO2GvPRPL8djXtFBFBoBk2WVLNNUBD6N
 3I6CFgMao24VPNgxVFbmQ0kS7StLUJuZEBQtG+BnFINVbKIgQh9YVoxqUffWPOf8oV/t
 6RnQqbyJaAkZ/AFrXvKWCBX76uBQCA9u0CuMzYBLT+KnsuWfk9p+E1O/pccoKCaqrV1Z
 /wtezfOtLVmqGtzBbQkF2D95rf49nPyrCffJ4QJej/mRtcVtBTCZ6NCKIUp6q7zrkgdd
 wgzeDmmfa+ITyXIzUsFI3oTn2bJ8h7R4KMOGtwtAzJ2erMAeDwXIdN07SQBnhuLax/Tn
 u/1Q==
X-Gm-Message-State: AOAM5307QtgDTBfXYZKGlQS71nLMuSofKGkfZO2mxaAi2YHRazZjJEKR
 YPekTbL2qcixyeNNblnnUgnmpf124oI=
X-Google-Smtp-Source: ABdhPJz7PaQHW/sqONETdYGEy1Mv6LkPtaBZf+6VGkx5Te9qNQodQZckjwvl/QeqbgDzfSOC1YMGTQ==
X-Received: by 2002:a17:90a:5d16:: with SMTP id
 s22mr13461480pji.69.1629736264951; 
 Mon, 23 Aug 2021 09:31:04 -0700 (PDT)
Received: from localhost.localdomain ([120.138.13.180])
 by smtp.gmail.com with ESMTPSA id x19sm16371243pfa.104.2021.08.23.09.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:31:04 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/5] python/aqmp: AQMP-TUI
Date: Mon, 23 Aug 2021 21:59:33 +0530
Message-Id: <20210823162938.32757-1-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pj1-x1036.google.com
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

Gitlab: https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v5
Based-on: <20210803182941.504537-1-jsnow@redhat.com> [v3,00/25] python:
introduce Asynchronous QMP package
CI: https://gitlab.com/niteesh.gs/qemu/-/pipelines/357960983

Updates since v4:

1) Changed reference to parent name from master to parent.
2) Merged connection manager to the AQMP TUI patch
3) Fixed some docstrings.
4) Added scrolling support to history box.

G S Niteesh Babu (5):
  python: Add dependencies for AQMP TUI
  python/aqmp-tui: Add AQMP TUI
  python: Add entry point for aqmp-tui
  python: add optional pygments dependency
  python/aqmp-tui: Add syntax highlighting

 python/Pipfile.lock          |  20 ++
 python/qemu/aqmp/aqmp_tui.py | 669 +++++++++++++++++++++++++++++++++++
 python/setup.cfg             |  27 +-
 3 files changed, 715 insertions(+), 1 deletion(-)
 create mode 100644 python/qemu/aqmp/aqmp_tui.py

-- 
2.17.1



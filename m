Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311743F1F4B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 19:43:00 +0200 (CEST)
Received: from localhost ([::1]:54628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGm4A-0005Yb-ON
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 13:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mGm0c-00038p-4w
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:39:18 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:36788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mGm0a-0000Yw-AA
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:39:17 -0400
Received: by mail-pf1-x431.google.com with SMTP id m26so6174526pff.3
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 10:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=6FtV5MpUEXBgcEW1AIt0hyWmZoBuxiLCqyJUcuq1CuE=;
 b=YzC3IrrDknQ5qTAkoWCHhL90BT3BtogS5umtE9iHoQWNVG7rWuJFk/5Bn+sacLpA3w
 itUSAzEaWcu+NwHOoC3haeV7aFLUTpp8/VMpni0AwuUHaK9em1XJUckMvSdim8Mo5yYt
 qi94qZJFq+zyzx1MVVD08BrVCVZPUwqX+EU0d+v38PEuXLK3BaUXy1/d37BTVJtisWU7
 QjAC1/EH7IWa1iR3KoXoz8KN4lTk5LEcNRA9lTH6djWcOOUIJMod5pW1xKC3ooRxpf1s
 S+XCzdy95hlAawzV6xtW2GhIptcS68qPY9w72dfCVm1WC9OEisE9RoQbMnXo/IRws7pN
 /G2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6FtV5MpUEXBgcEW1AIt0hyWmZoBuxiLCqyJUcuq1CuE=;
 b=QRTe5SRDZYROMMDpU2i1vZ1DNnEcR99/lUgScfQAvDJGraH+bIbPOvkvmpqRqb9dCU
 38xwuBptEVbruspUKkaJdDe+86eOxshq67y2xyboOX1YxsmjcEW9nVTvrdZgjs0gbHuV
 +7CkD9Zvxts2g3s91sgOCONswqBHa1rKfmyUuupopnnyyTXZB3yON1ILzlejzUd/u/dO
 dYZSbF4vWV9p6TXhWNMlWitYzA2dNvPfTMduz6WgaJXxwCzPW/82xHJ8x/6Pamz38ScO
 ViyT6obJmo1i4fsEU1eWEvGAcSwWTCDCVmZbUVuYaHLG7HdTvdct4lLMsrGl3ca48UQU
 G88A==
X-Gm-Message-State: AOAM532sQo1PTnbil944/G8Bq41Hrk8NCqiCyW87wYQPT6othh0mSYD9
 kNWVLDOmVqfv4+c73TjG3s/GgGBoxZk=
X-Google-Smtp-Source: ABdhPJzQ+dfXYjWMkMHQx7htq1hkDQlwiJ7ONk4IZA7h9oZUCTI7GVD4wozGGjkvzL2gYfsJbw/eyQ==
X-Received: by 2002:a63:8542:: with SMTP id u63mr14944424pgd.44.1629394754560; 
 Thu, 19 Aug 2021 10:39:14 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.8])
 by smtp.gmail.com with ESMTPSA id s2sm4061090pfw.193.2021.08.19.10.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 10:39:14 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/7] AQMP TUI Draft
Date: Thu, 19 Aug 2021 23:08:24 +0530
Message-Id: <20210819173831.23515-1-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pf1-x431.google.com
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

Gitlab: https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v4
CI: https://gitlab.com/niteesh.gs/qemu/-/pipelines/356024270

Revision since v3:
1) Added docstrings
2) Minor changes in AQMP TUI Draft
3) Switched to constant retry delay in QMP connection manager and other
   minor changes.

G S Niteesh Babu (7):
  python: disable pylint errors for aqmp-tui
  python: Add dependencies for AQMP TUI
  python/aqmp-tui: Add AQMP TUI draft
  python: Add entry point for aqmp-tui
  python: add optional pygments dependency
  python/aqmp-tui: Add syntax highlighting
  python/aqmp-tui: Add QMP connection manager

 python/Pipfile.lock          |  20 +
 python/qemu/aqmp/aqmp_tui.py | 681 +++++++++++++++++++++++++++++++++++
 python/setup.cfg             |  29 +-
 3 files changed, 729 insertions(+), 1 deletion(-)
 create mode 100644 python/qemu/aqmp/aqmp_tui.py

-- 
2.17.1



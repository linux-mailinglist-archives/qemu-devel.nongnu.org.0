Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9479C3C7970
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:12:41 +0200 (CEST)
Received: from localhost ([::1]:36598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Qds-00013d-Gs
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m3QZ6-0001Cm-85
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:07:44 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:40755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m3QZ4-000638-ET
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:07:44 -0400
Received: by mail-pf1-x42e.google.com with SMTP id j199so47376pfd.7
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=EQQMazI2FSSSNJdeqUcv40aAuOVUAnhzrJC9XKatN7Y=;
 b=glu5uPW5mDLgRe1WLBUi93uaCuYWa5oV39xmUoTNICaduhLQv/8dIZr0sbkH19AcLt
 ScWJ5Az7h8UkQEQ3BJXRGVTcK9stQFfzWKeSPF1zFPTIw0MGvQtwQiqcbvryxjYBWFTd
 mZGCZLVKIJbemM2US/Q2HZNobnwX+W8zEMLNj8wmM05nQ47VnF9IlWAcRb9tHlu8vWtY
 C4k5yUPHsN0tPNJk3BqMDHKVRuMfvbRhTRz1e4QbEkuhoLtw7bMZXfods2DNFA+5leI7
 coQJzW2FQ7L8YBSU0VjmmSjmii32iV5IGpXOoNwr0FlsOENyI4hhrNDMlodxghY1F0it
 bsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EQQMazI2FSSSNJdeqUcv40aAuOVUAnhzrJC9XKatN7Y=;
 b=tEZa/HcjSI5KF7ZrVXkzR8N7ROMih/LF0CkZvM4uSO/NoVRJ5NG4s6i8tizoBTRgBz
 Il94m8jNsGmt6weLb10m3we30u0ba/kwS4gLNtC1rOO2R5wQihMvNqVRnOqbyxK15lDX
 bZ59/BgEJC2ck1HdoloWHbYdhWeZdxMM9dv5ywGoFgoZ1gkrjOmSJUr1nKw872wfmHc6
 OQ8zZtP6KHkacSRiXQ6BqpuPfDeSna/OiO8U9NH/j0jiEmGc+n/9FxuuXzkrshdYg2Vn
 YeaxidQNg/gaOxWW9MCcwvpD+0DxqlQrPigbvnRXBHYt8ojLteb2rQ9WSGsWvraEIAVb
 jYKQ==
X-Gm-Message-State: AOAM531hdESTwZXK8D/rF8BanR346+I6cCLmTT4KI7pAYtv7PXzlLXZg
 ZXQPBagfefs3ke4N4a0RVUQbAb9/p6J1UA==
X-Google-Smtp-Source: ABdhPJzo61OE2ZJYEJh0RKzVOUqJINS7V5EPMeAJag1ojiKldTnikfUOCtzTnZX2+d1a+4frgdd44w==
X-Received: by 2002:aa7:8707:0:b029:306:7e78:ee7a with SMTP id
 b7-20020aa787070000b02903067e78ee7amr6629991pfo.29.1626214058989; 
 Tue, 13 Jul 2021 15:07:38 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.183])
 by smtp.gmail.com with ESMTPSA id w16sm94678pgi.41.2021.07.13.15.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:07:38 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] python: AQMP-TUI Prototype
Date: Wed, 14 Jul 2021 03:37:28 +0530
Message-Id: <20210713220734.26302-1-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pf1-x42e.google.com
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
Cc: G S Niteesh Babu <niteesh.gs@gmail.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v1/
Based-on: <20210701041313.1696009-1-jsnow@redhat.com>
     [PATCH 00/20] python: introduce Asynchronous QMP package

Updates in V2:
1) Moved loop related initialization to 'run' function in 'App' class
2) Added a module logger with support in TUI log messages.
3) Corrected usage of logging.info and logging.debug
4) Added an option in setup.cfg to silent pylint regarding duplicate-code
4) Modified the arguments list to the TUI

NOTE: I am not able to get the pipelines running after the v2 changes.
I was only able to test the changes locally using *make check*.

This patch series introduces AQMP-TUI prototype. This prototype has been
helpfull in letting us try out different ideas and giving some insights
into things that we had to take care of in the upcoming TUI. It was also
helpfull in finding out bugs in the AQMP library.

The intent for this patch series is to get comments on the architectural
design of the prototype. These comments will lay down the foundation for
the upcoming TUI.

G S Niteesh Babu (6):
  python: disable pylint errors for aqmp-tui
  python: Add dependencies for AQMP TUI
  python/aqmp-tui: Add AQMP TUI draft
  python: add optional pygments dependency
  python/aqmp-tui: add syntax highlighting
  python: add entry point for aqmp-tui

 python/Pipfile.lock          |  20 ++
 python/qemu/aqmp/aqmp_tui.py | 342 +++++++++++++++++++++++++++++++++++
 python/setup.cfg             |  36 +++-
 3 files changed, 397 insertions(+), 1 deletion(-)
 create mode 100644 python/qemu/aqmp/aqmp_tui.py

-- 
2.17.1



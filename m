Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BDF2287EA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 20:03:44 +0200 (CEST)
Received: from localhost ([::1]:44998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxwcB-00025v-HS
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 14:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jxwaF-0000YH-1D
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 14:01:43 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jxwaD-0003uO-Au
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 14:01:42 -0400
Received: by mail-wr1-x444.google.com with SMTP id q5so22057683wru.6
 for <qemu-devel@nongnu.org>; Tue, 21 Jul 2020 11:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iffYNJCjZMfkQNG/K5IEyiUEOe84TcgbyNlODKnBPac=;
 b=SzU/TPMTQum3wtWCGkFuDD4I51EzlGdjirbfO9pmmO6ra1jgN0656wlLN7Qse4JQy/
 C/rqNww9IFyp7oLOmFxDdYU9ruvMj4zh6H1ebKJdaDbxG41uzVtj/9HsxHZoxXOPm4TO
 BVT/eYC3JJvOTcgPjqlI3RgVC6omOq4DWvEnsyzB/eiThTpfg1C3+YKWH7DUfQOiQnVE
 25dm2LreHtFXz6sKKAl2zo+nsOkxZIL2CkzVqvL64zczWqqQLkvjz9XgVuUtA5rBixO5
 jRFCN4UpL3BuFiRfCdJ9JZwpemuiEC2Yvce0TvtjVgXFKex6/899t6PGDUA4iNOXIk1t
 V8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=iffYNJCjZMfkQNG/K5IEyiUEOe84TcgbyNlODKnBPac=;
 b=MZv84wzKLviN5SPpWe9i+9e6vtextQ1GEL6xqvLw4w/6fl1uX43z9oPsIaCZvujuxH
 4tHdlCCQAgY4OqVz2yGY3UX2yHiyiVopFYqM7Gqoib6dVjmgAp4ryk6BPQOIm1e/Z3WR
 2Nz9TM1pI1MK2hS2hNTP9fgmm/HUqH1WgsjJ/Q4PNo+mSCQ7ObfkzrtUOcwub/ZuotL6
 97aPCLpWrrkoougeTLUsoKvpz5Y2rGTUlXb+RQ47tKsJNtgVlGgF613pkop5LzY33Yrx
 5Ra1eygtAKE5ADEk4zC5hKslOhSYLN04lljBjf/Y2YYCCpmdQQqw1sHDFYDx+n6ovnmY
 RVQQ==
X-Gm-Message-State: AOAM531Tai9fYAbTRlO9AE5ooGIw3ue9xYy7Hh7EZNuY065C1/eWASCW
 IomsPioJoYsVli/mAail7BiIE2Y6PvY=
X-Google-Smtp-Source: ABdhPJxTF6jUtLdbDwWLTPjjQ+PsWVY2FHA0PhI3Me/CG+QUSn9mn9rqtMUIz5jvFVRd+2h4eC6duA==
X-Received: by 2002:a5d:4a0d:: with SMTP id m13mr9910001wrq.12.1595354499017; 
 Tue, 21 Jul 2020 11:01:39 -0700 (PDT)
Received: from x1w.redhat.com (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id t2sm3557249wmb.25.2020.07.21.11.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 11:01:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] AVR patches for 2020-07-21
Date: Tue, 21 Jul 2020 20:01:33 +0200
Message-Id: <20200721180137.11136-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 90218a9a393c7925f330e7dcc08658e2a01d3bd4:

  Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2020-07=
-21' into staging (2020-07-21 10:24:38 +0100)

are available in the Git repository at:

  https://gitlab.com/philmd/qemu.git tags/avr-20200721

for you to fetch changes up to 5e29521a82e540552880c3572cb8274bcaa1002c:

  hw/avr/boot: Fix memory leak in avr_load_firmware() (2020-07-21 16:13:04 +0=
200)

----------------------------------------------------------------
AVR patches

Fixes a memory leak reported by Coverity (CID 1430449).

CI jobs result:
. https://gitlab.com/philmd/qemu/-/pipelines/168722631

----------------------------------------------------------------

Philippe Mathieu-Daud=C3=A9 (4):
  qemu/osdep: Document os_find_datadir() return value
  qemu/osdep: Reword qemu_get_exec_dir() documentation
  qemu-common: Document qemu_find_file()
  hw/avr/boot: Fix memory leak in avr_load_firmware()

 include/qemu-common.h | 17 +++++++++++++++++
 include/qemu/osdep.h  |  5 ++++-
 hw/avr/boot.c         |  2 +-
 os-posix.c            |  3 +++
 os-win32.c            |  7 ++++++-
 5 files changed, 31 insertions(+), 3 deletions(-)

--=20
2.21.3



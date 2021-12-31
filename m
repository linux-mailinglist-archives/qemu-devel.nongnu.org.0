Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CF64824AA
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 16:54:19 +0100 (CET)
Received: from localhost ([::1]:52594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3KEU-00044I-Jn
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 10:54:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n3G87-0005Xr-TR; Fri, 31 Dec 2021 06:31:28 -0500
Received: from [2a00:1450:4864:20::330] (port=39528
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n3G85-0005wN-TQ; Fri, 31 Dec 2021 06:31:27 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 g7-20020a7bc4c7000000b00345c4bb365aso14636165wmk.4; 
 Fri, 31 Dec 2021 03:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version:signed-off-by
 :content-transfer-encoding;
 bh=xDcKdi1xnSy4xUhLHbDGCBgLhVFhAtW7fbQb9786whU=;
 b=j4udd3eRPFfDbgUmyhco0YmB1CGHsIIRQcM91t4H7i/4C/HUa9pTJO3MpOcXMr8ieE
 TttnvpBe/hjrkrodiF3a1Fem9nArKEdNgBsP9HOFaPv1Wjq6j/hE9ThOhZ/uj2ttU+mT
 NcSQGiRo5gAZSxw9Hkbl1LUibU2qyhe1C8wiWF+9e3fcc48lBnE5TlLk00YB/adZZ1Bw
 JLy9vdMK/6xllnKnpi9yQSMZ3aQey0ZwdzzeqhbgzKmIiI+doYQ49OMQVAb/V2Z86plB
 u+tlJ8jI10ZivsfLUaT758/DwPqKjApNepdq02y/BEheGRX1E9btB9FtPv3VuQykLekH
 iWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :signed-off-by:content-transfer-encoding;
 bh=xDcKdi1xnSy4xUhLHbDGCBgLhVFhAtW7fbQb9786whU=;
 b=G8cY7OaUrRsgyAvu4B26DEU9NgDvEQ8gM0UkHtwqdy40x/TsNsrrutVpdJWU+FXE5d
 OqbENf383iWWqMgNcl5Kykcdoyo9PDxYA9quHwF8dGdWejwrX7f5o6wyr9g4z3pTIhaL
 WAHHmoWKeSgc+1Em/yc5CEiZME+LgLT03qCRAH4u8L/rGSoVd02BqjmX75yCsxEIH1SL
 mV68rv6pYUFHIc40C/WJQuAIF6jBLAoGzEdLYRXYkzJwXzAG3nFGT8BNATQLgjlVRUg4
 we/RatqBUzSMFfJOF+JEzfCYtvNIY3etNxhyyrHvAFWkbE567nKfgi3YCNe9vbkV8sZv
 NMtA==
X-Gm-Message-State: AOAM5319L9/A/ly+IuCVHKddoeKb/xubs9m8fLawOHtYAmbAhD9g/iWD
 AzSy6KHdikU6RaFjWNPse43sELyv9/8=
X-Google-Smtp-Source: ABdhPJyBwjBwXj6+vQwN7jkCeYnVJFCqnjJRQ3FM6FrwTm4UqWV1MqDfgJZrbKrYsqt9pD3fSS2bBw==
X-Received: by 2002:a1c:f304:: with SMTP id q4mr29935889wmq.162.1640950283234; 
 Fri, 31 Dec 2021 03:31:23 -0800 (PST)
Received: from localhost.localdomain (201.11.75.194.dyn.plus.net.
 [194.75.11.201])
 by smtp.googlemail.com with ESMTPSA id z11sm32802237wmf.9.2021.12.31.03.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 03:31:23 -0800 (PST)
From: Carwyn Ellis <carwynellis@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] ui/cocoa: Add option to disable left command and hide
 cursor on click
Date: Fri, 31 Dec 2021 11:30:58 +0000
Message-Id: <20211231113059.84130-1-carwynellis@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=carwynellis@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 31 Dec 2021 10:51:30 -0500
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
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
 Carwyn Ellis <carwynellis@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Having made the switch to an M1 Mac I needed to switch from VMware back
to QEMU in order to run some intel guests.

This patch addresses a couple of niggles with the cocoa UI, namely:

 - Using command-tab to switch between the guest OS and MacOS sends the
   command keypress to the guest which can be annoying e.g. on a
   windows guest this may trigger the start menu

 - Switching between the guest and MacOS sometimes leaves the MacOS
   mouse cursor visible with no way to hide it without switching
   windows again

To address these issues I've made the following changes

 - Added a new cocoa display option left-command-key which can be used
   to disable the left command key in the guest. Default is on.

 - Added a call to hideCursor on left and right mouse clicks so if the
   cursor is visible after switching back to the guest a mouse click
   will hide the cursor again.

 - Also updated the command line docs to reference the show-cursor
   option which is also respected by the cocoa UI code.

Carwyn Ellis (1):
  ui/cocoa: Add option to disable left command and hide cursor on click

 qapi/ui.json    | 17 +++++++++++++++++
 qemu-options.hx | 12 ++++++++++++
 ui/cocoa.m      | 16 ++++++++++++++--
 3 files changed, 43 insertions(+), 2 deletions(-)

-- 
2.34.1



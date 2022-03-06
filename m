Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AC44CEB76
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 13:14:12 +0100 (CET)
Received: from localhost ([::1]:43034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQpm7-0001wA-CP
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 07:14:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQpjk-0008C8-JS
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 07:11:45 -0500
Received: from [2607:f8b0:4864:20::42e] (port=33380
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQpjg-00031y-5n
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 07:11:44 -0500
Received: by mail-pf1-x42e.google.com with SMTP id d17so11501920pfl.0
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 04:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iMB3Ifd6s7S7VN6SmtGdBRinN4ZfD2P+ZwrbUqYY3XY=;
 b=hWsUYKk3uAppnKsKplnDmqrX5Vr2/A9DSYmZq6lrVpLIPsKKS5Prda3895lxFE9UQQ
 eXTV9Xur2esMit1Uy50A+19woq0L1/XnZ3nmmfDuifVk3VOUze0HEmfCc9KQlfDI9m1z
 ykwaqQa6jqGnG/f+888ssbwhy/XfUYg5EOfL9Bltla4PQuT0tlmzXK0jmD565n6RlhBb
 UFC8eAJNoXvaw420tCroOr2Yfvi4ooWjD5QHUG7c/3pDYDFTrGBVcBWspB6ys7kz0ho6
 2LvOtXja9QWZiUiV35AmChs/y6uB5bpH1+9cY/05tV1mNO012ZwqiMwBwFr0bztYV93/
 7jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iMB3Ifd6s7S7VN6SmtGdBRinN4ZfD2P+ZwrbUqYY3XY=;
 b=Uf2SwFjvlV9IMAd2fRm+FUz6MT9zNNcCT6fm5Z48M0J4DV16uMiKkfKFWNcjGHc2vd
 beabEXGLH8KL22bMh6QTU+knLwV9dWtOMpUA4xJaBZK9VhZu9aphE0TEO6E3VaT/PmPT
 pztm3+RLNO3Hgjd4h6T7JRaVc+vQShOH3i8oqX21os5xRWeN2i32p10v2yn2i2RUKt0P
 hAak/0oUuxcESv+70gMH7hR7WDpZdR/9JYt7FzKSF2foMVbbIa95y6+XN2RxjRPGzTSy
 GtJvgiDBdq2fOThDbgy4iCsLfJC6w6CPrO62uOYBykGPCqyB8evfA+sSgTwpLJqnHJ/S
 7tZw==
X-Gm-Message-State: AOAM530ZuBjqNW3nOP1pR9FhPMlfAMGzY7V2/fNyJwhprZ6+VYBOzm/x
 cjvdwSPQ7+nnkyecvWqrClWmiHHlNEc=
X-Google-Smtp-Source: ABdhPJzYmZ0fMp52MhURE8DSC8ipWVfmZO8YRo/Aq/XO7tljonWPcCEX8bTfWCm999YpoG2ydIKRsA==
X-Received: by 2002:aa7:94a4:0:b0:4f3:6215:5d1e with SMTP id
 a4-20020aa794a4000000b004f362155d1emr8056630pfl.73.1646568697682; 
 Sun, 06 Mar 2022 04:11:37 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:9574:a172:f92a:5d0f])
 by smtp.gmail.com with ESMTPSA id
 s42-20020a056a0017aa00b004df8133df4asm12820042pfg.179.2022.03.06.04.11.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 04:11:37 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2 0/2] cocoa: keyboard quality of life
Date: Sun,  6 Mar 2022 21:11:17 +0900
Message-Id: <20220306121119.45631-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Eric Blake <eblake@redhat.com>, Gustavo Noronha Silva <gustavo@noronha.dev.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch series was originally posted by Gustavo Noronha Silva,
and rebased to commit 2acf5e1d0e0f15be1b0ad85cf05b3a6e6307680c by
Akihiko Odaki.

This series adds two new options to the cocoa display:

 - full-grab causes it to use a global tap to steal system combos
   away from Mac OS X, so they can be handled by the VM

 - swap-opt-cmd does what it says on the tin; while that is something
   you can do at the Mac OS X level or even supported by some
   keyboards, it is much more convenient to have qemu put Meta/Super
   and Alt where they belong if you are running a non-Mac VM

Both are off by default. For full-grab in particular, it is off also
because unfortunately it needs accessibility permissions for input
grabbing, so it requires more deliberate action by the user anyway.

v2:
 - Removed extra cast operator (BALATON Zoltan)
 - Renamed swap-option-command to swap-opt-cmd (BALATON Zoltan)
 - Simplified swap-opt-cmd flag setting
 - Updated qapi/ui.json for 7.0

Gustavo Noronha Silva (2):
  ui/cocoa: capture all keys and combos when mouse is grabbed
  ui/cocoa: add option to swap Option and Command

 qapi/ui.json    |  21 +++++++++
 qemu-options.hx |   3 ++
 ui/cocoa.m      | 111 ++++++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 126 insertions(+), 9 deletions(-)

-- 
2.32.0 (Apple Git-132)



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F113A9E1E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 16:52:16 +0200 (CEST)
Received: from localhost ([::1]:34216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltWtr-0005JG-Gj
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 10:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltWs2-0003J5-CA
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:50:22 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:36455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltWs0-0001Mf-N1
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:50:22 -0400
Received: by mail-pl1-x62c.google.com with SMTP id x10so1240117plg.3
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 07:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6v1W5O2xXBWxoMYHDw/cTFpbhwG7a0B4t3qLFRjYY0I=;
 b=nWAbhIh7QW9P/mYDRIGuOnU4ePnCfa1zNsUzEZtgIhLfcP4OCiXWCfZ7C6PxHdqky+
 eh1SeFOQUpR63PHHXrYkwvrifayKc+wzvn+RSEtHmtBVcVILQw6JyAav1VQTIGQITr+p
 TGnRQ3dsjr+tGV9S7kh8Sh8niyanaeHCI70oPG6BuvXmHQkJ17hpFAbf49eaTi8rcL32
 xR0X/y7Yd4zqRkU94jvMhYTRR027tpP8mIA16bqk1oUWrd7lekPX/ddiiNczFNz1S7Mv
 QpX8MHysbETkld+R/aOpabFLVi9nlAlcehrEV2tp2VNlcYBuCLZpuUL5Wyv66JUAE7sj
 ItuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6v1W5O2xXBWxoMYHDw/cTFpbhwG7a0B4t3qLFRjYY0I=;
 b=ekg8m44X/3GDM8qQpHaJosHweN0N4eoGXy5qCGHBUzfybi21yznh7IWQ1UfPwBPyH6
 S11Et+cWZW9a6CNRpUojJP7MJGSx0tNpPWDqJ/NQzd9tMXKT3Mge2ay7Dk5mGjatZo8T
 7tqG1vbmh6GByZMUrzyCD528mNx6ex3Awl1j2k+0HxgwdV7HPYZjM7JtSgxB9U9W2qCd
 JMTN0WKVdSAthmQJ4euCSxzude8J22Yyp2b8PSt6WuDmaMMsoUQEfPOwFYVDqcPiF/dy
 MenX9FvI6ndn+s1FQaeBypuIC0Ld1l/YPO/DPQbZAQTqWpsvc6QTExcft6yH2xXYRjm4
 IWGw==
X-Gm-Message-State: AOAM531qN3pC1d7SXRlcL3TvdMH8sOnv+B5S5G6q636QLhq2bRw4HDwp
 whxLuInJMFVGz+1anVfhV/TBu2p43FSojg==
X-Google-Smtp-Source: ABdhPJxWKyShJAs6ZE58nzV07cqrz1y52jzty8kwkXKE01MHlctOfI/Z6vBiFaomgI3CXd9YaesnQA==
X-Received: by 2002:a17:902:6a84:b029:f3:f285:7d8 with SMTP id
 n4-20020a1709026a84b02900f3f28507d8mr40204plk.57.1623855019101; 
 Wed, 16 Jun 2021 07:50:19 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:40bd:72ed:2c81:7963])
 by smtp.gmail.com with ESMTPSA id w7sm2381580pjy.11.2021.06.16.07.50.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Jun 2021 07:50:18 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [ui/keycodemapdb PATCH 0/1] Add QEMU QKeyCode "lang1" and "lang2"
Date: Wed, 16 Jun 2021 23:50:08 +0900
Message-Id: <20210616145009.56146-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62c.google.com
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
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch is corresponding to QEMU patch "input: Add lang1 and lang2 to
QKeyCode". This should be applied *after* applying the patch for QEMU.

Akihiko Odaki (1):
  Add QEMU QKeyCode "lang1" and "lang2"

 data/keymaps.csv | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.30.1 (Apple Git-130)



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B76394CE3
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 17:23:51 +0200 (CEST)
Received: from localhost ([::1]:47676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ln0oY-0003Iv-Kp
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 11:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1ln0n9-0001Lx-FE
 for qemu-devel@nongnu.org; Sat, 29 May 2021 11:22:24 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1ln0n4-0006eO-S2
 for qemu-devel@nongnu.org; Sat, 29 May 2021 11:22:22 -0400
Received: by mail-wr1-x42b.google.com with SMTP id f11so6213253wrq.1
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 08:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S+rggVQSPTKzxDiOW3qSCjPtorWvmYr4CYkYUhpPgwg=;
 b=mwywJHvL4GFqeqCQOoEITQmrcJoMweBledwSSNenlqptMMAdKzyPnxESIYjHFBG7KJ
 fz68nu5G3RuBEg54683p+gRfcHcbxnQGojBxAMkn9WmM8uiU51+TBuXrazxHcyZooNY1
 cMAaZQGyQAmOLPJBCF1tZ3MKvYu0JC74/1fhKeZ9YSjjbnVAWMdt9a/yGO/2Dyugrnm6
 xhOJb6eqXK/zi70OHFA0w6ABhaonwk1Mh0eeG+jKZLbYuvquKtNRo9tEwnS7Vabrv+dO
 eVJLocCH6VAmAQ+KFiXKyskufXog6mYuVFHV3wM03bXhaL+GlvnApBZqK6BpTGgqcTqO
 fEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S+rggVQSPTKzxDiOW3qSCjPtorWvmYr4CYkYUhpPgwg=;
 b=Ebtco2OEsRaRmygUB3CUUD3PjUC58vQh+Ztd0zGsN1450lY0zz8zb98RPRw3/4vORW
 vTm4qT7gXR0BvqA/IPsBisfJHaiz0HteXoVeVAiaOedrkpqoDi8w9ARzGIFROcNhLzF/
 KeUc/YfLZ70uMobkwoFNU0N21+m9do6FNGTJrbob8YdrW8bO+yJa0tfVYOaiL7ZxW2LZ
 ftKR2EfdXj5LYoA2gk88LTlrosw5++OG+pgnfGxuCsY/CjWb6vCsXEHFapHrWpFpAsI/
 IYup17gALBp5KDpHXPvgori35ZVPsghq0YjpAAaUKEOPbv2BtFK6e2NyHJKb12Zz+Bke
 dfwQ==
X-Gm-Message-State: AOAM5328vAhcGc4aIqE1Mo0V7uqySVsfcGVLhDCbSSUcfate7Sv7oORB
 8fuDQnoh+gZ4gnjnTeRfMuU/UjF01EriFA==
X-Google-Smtp-Source: ABdhPJxF1tBrWnsnMqbfzQg+nIibxhey88mkfHacBrOyrRM8NSfPHDPTDVg9VBTuqdthPhC5fMoZTA==
X-Received: by 2002:a5d:4d92:: with SMTP id b18mr14013242wru.167.1622301736380; 
 Sat, 29 May 2021 08:22:16 -0700 (PDT)
Received: from localhost.localdomain ([102.47.172.201])
 by smtp.gmail.com with ESMTPSA id s7sm17019164wmh.35.2021.05.29.08.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 08:22:15 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/3] Cache modelling TCG plugin
Date: Sat, 29 May 2021 17:22:00 +0200
Message-Id: <20210529152203.40358-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In this RFC patch series, I propose an initial cache modelling TCG
plugin. As of now, it models separate L1 data cache and L1 instruction
cache. It supports three eviction policies: LRU, random, and FIFO. Once
a policy is chosen, it's used for both instruction and data caches.

Mahmoud Mandour (3):
  plugins: Added a new cache modelling plugin
  plugins: cache: Enabled parameterization and added trace printing
  plugins: cache: Added FIFO and LRU eviction policies.

 contrib/plugins/Makefile |   1 +
 contrib/plugins/cache.c  | 595 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 596 insertions(+)
 create mode 100644 contrib/plugins/cache.c

-- 
2.25.1



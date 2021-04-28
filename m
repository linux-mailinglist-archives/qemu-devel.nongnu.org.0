Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D1F36D862
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:37:12 +0200 (CEST)
Received: from localhost ([::1]:45886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbkNL-0007m0-0O
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lbkM7-0006tZ-Cr
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:35:55 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lbkM4-0003yc-Jv
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:35:55 -0400
Received: by mail-wr1-x433.google.com with SMTP id e5so34440372wrg.7
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 06:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vrn4k5SYwkNyUKB1dvZjdZnyTqzOl/VJqwvLbl2/tIw=;
 b=qqNbhXMe3SAA8dFdCe01RgYBAZ35qfOqtGEuawvMRnktKMEXpYuNFjMEAIwBZmbwkN
 HC4EmjEJAkk2hp5Pe7hCU/KDtt0Ufv1DUopniunpR2g7ZAu8aUnjcQEQPtBbeA+EA4rv
 EWrPYP49EpTYzWkk6uSEApkrtCqcAF6GVCz2hdKy1ZG099Nf2/NLnhOe+S9q9NIIF5Jv
 kR3rUW24F18AjAljJahcq4NUd3VB7zVOZLORi8elMSfImaqPh69sAHP9ulg/PrnOUCPP
 qo2mqBfcrC4JTU0oL/++RbZrT52iCm2hm9/MNcErftpnaNT7OT6SfqtfzVtY92feTJbo
 eGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vrn4k5SYwkNyUKB1dvZjdZnyTqzOl/VJqwvLbl2/tIw=;
 b=jja9TePfOcs9aCNLW/rrGxJfPQrI5oLpw8n/6YTf3w25BXzRZnonGkzkGZY87BSZaT
 7P5AhNjIWNgmd9pP4RlJ8vZZ1WU1fP6WajAC6b5ihWMrHYvWaiVP7AHvrDbonL82Tl1L
 Pu1z1F0jVVYfETR/GzDkew6hgezNRIIlGFpTpDmQ+fNIaw7nYo54GQA1eMashntQB322
 86pkW2PNI7M3gNtN5Fo67qzsOoXf/977HMxPZdImLUIBho+ZGhu9pu89Ubn3+arfe1PG
 o8+eagJ3eF8K/228Bb5A75skMiEedIkboSDknIdqiSmC5vV/cnaz0+u2oJZbmR3o5D02
 qlKQ==
X-Gm-Message-State: AOAM531xx9IfWRQCsu0YepZ0Grh3qMGsuI6kK8tV2v+TW8AVHissdgrp
 WO4xWljdbBe+iobO/jhRDmQWdvhWh+g=
X-Google-Smtp-Source: ABdhPJwTHx04my9y9KOnMofYdbsIIpyAhkYYHn0MVB+3K1YRIWxk7CTneHi9Ntg5R7+HJu2xgo2oRw==
X-Received: by 2002:a05:6000:184a:: with SMTP id
 c10mr36680737wri.237.1619616948434; 
 Wed, 28 Apr 2021 06:35:48 -0700 (PDT)
Received: from localhost.localdomain ([197.61.118.208])
 by smtp.googlemail.com with ESMTPSA id q128sm6827177wma.39.2021.04.28.06.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 06:35:47 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tools/meson.build: Error on enabling virtiofsd and
 have_system is false
Date: Wed, 28 Apr 2021 15:35:07 +0200
Message-Id: <20210428133507.52066-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: pbonzini@redhat.com, Mahmoud Mandour <ma.mandourr@gmail.com>,
 dgilbert@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previously, on configuring with --enable-virtiofsd and specifying
a target list that does not contain a full-system emulation target,
a spurious error message is emitted. This patch introduces a
meaningful error message for such case.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 tools/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 3e5a0abfa2..f6a4ced2f4 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -5,7 +5,9 @@ have_virtiofsd = (targetos == 'linux' and
     'CONFIG_VHOST_USER' in config_host)
 
 if get_option('virtiofsd').enabled()
-  if not have_virtiofsd
+  if not have_system
+    error('virtiofsd requires full-system emulation target(s)')
+  elif not have_virtiofsd
     if targetos != 'linux'
       error('virtiofsd requires Linux')
     elif not seccomp.found() or not libcap_ng.found()
-- 
2.25.1



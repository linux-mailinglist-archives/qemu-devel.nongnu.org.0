Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03EA33F5C5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:42:11 +0100 (CET)
Received: from localhost ([::1]:47590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZFK-0007Uy-Ng
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMYdf-0003OA-MC
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:03:15 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:36659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMYdc-0006G1-Gf
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:03:15 -0400
Received: by mail-ed1-x532.google.com with SMTP id o19so2931905edc.3
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 09:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vKnBQRql1G8DVvyy9caNU13ZLqsgVIyaseCtUE3V0b0=;
 b=ABfasNPwBLkAgbws0ZBNzvYWwJ5giaWhDSL5y5Z1clJEnyMMC3iah6FWXc6H25t3qR
 gcOjbnQVGmVezM0f0XkItj/40IzMLCH0oSc+qGtch2V8XTjnmLDsGcjCRymYcHxLDHK7
 qdopim5iV9wRtVbQuxhvJJjmHH23BjlqpF2x/5eUhfc2b5bPQtSBPDQNIdW8oJdKPfcb
 ZgpRxiqOtPRqSYLM1LjzAHjF6BB1vmS5pC0Yf/MWdn08Bfps5WdL7Jxizv8PGlTPTCTE
 N1zD2Tv/ru77UC+E59zNHQ42fycRHwsTg2zSV2/sB38GhKvn0OIQQ4YKdotCf2bp6O4I
 iLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vKnBQRql1G8DVvyy9caNU13ZLqsgVIyaseCtUE3V0b0=;
 b=ZT2ZTz0zJCF0LABNlp435y5+xInZztFqRDRjB/SwiWxcy8DeKgdGLN+K4Wte7tzM58
 VuuCiu5TcYR3CQi22aPzlD4cLVY13qroTWKVMLmp9n4ifXdwV/lGsIJdBry5bxtjxokT
 nwmz7Vz2qj/L5nXMINElDvnqFGqQqbOofGhLIuNb6ngW25aY/ezolsYOjUvrccVglQ1s
 6kGPmwU6VL3HII8IPPVLqR1QFCGqLIZ34KA5gny0fXNP1GTueXDYvi3NvDrIwpz/V3DV
 lRjMhcJqjKsKjs3hGDgCj2sL9YsVk483QwlfZ0Y0gg/RODdzAhyjwPFZE+8sI76fI39c
 Fouw==
X-Gm-Message-State: AOAM533PoHt1ZXhzu3STFtYLQmOIaI0X8mrmMkF9tMHcVyAg2rvqtzVm
 F3JWQb/Nc4IuSUrIBlDZhDyFfg==
X-Google-Smtp-Source: ABdhPJzj8WWGN9XqtFpwcysOt1vyiZQyWxPpn2Xe2ZTtjoq8SS6GMIMaVtunmotJxRSzXJsXkAaiNQ==
X-Received: by 2002:a05:6402:48c:: with SMTP id
 k12mr43149916edv.237.1615996990614; 
 Wed, 17 Mar 2021 09:03:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y9sm11884600ejd.110.2021.03.17.09.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 09:03:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 76CAB1FF7E;
 Wed, 17 Mar 2021 16:03:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] support.md: add a link to matrix bridge to IRC
Date: Wed, 17 Mar 2021 16:02:59 +0000
Message-Id: <20210317160259.14098-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: pbonzini@redhat.com, thuth@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want users to be able to use newer tooling and not be stuck with
IRC like the rest of the fossils. As the #QEMU channel is bridged by
the matrix.org server lets point there as well. At least it's not
Slack.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 support.md | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/support.md b/support.md
index f6ee85c..252351c 100644
--- a/support.md
+++ b/support.md
@@ -33,10 +33,12 @@ want to send your question to another of [QEMU's mailing
 lists](https://wiki.qemu.org/MailingLists)
 
 * A lot of developers hang around on IRC (network: irc.oftc.net,
-channel #qemu).<br> QEMU developers tend to hold normal office hours
-and are distributed around the world. Please be patient as you may
-have to wait some time for a response. If you can't leave IRC open and
-wait you may be better served by a mailing list.
+channel #qemu, also available via
+[Matrix](https://matrix.to/#/#_oftc_#qemu:matrix.org)).<br> QEMU
+developers tend to hold normal office hours and are distributed around
+the world. Please be patient as you may have to wait some time for a
+response. If you can't leave IRC open and wait you may be better
+served by a mailing list.
 
 * If you think you have found a bug you can report it on [our bug
   tracker](https://bugs.launchpad.net/qemu/).<br>
-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7C0331A56
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 23:42:59 +0100 (CET)
Received: from localhost ([::1]:52558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJOaY-0004J6-6P
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 17:42:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lJOYu-0003iL-Uz
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 17:41:16 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:45652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lJOYr-0000Tp-7M
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 17:41:16 -0500
Received: by mail-oi1-x243.google.com with SMTP id t83so2805243oih.12
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 14:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V3qETCs45aquJ5Oy8x+kDYAvLJsw5S1iROWD3/9SCt0=;
 b=mTdyAlHQBo125l0z2VoFcWC6tqM+cKhnriSe0Bws7eD86QSwqecPfaupUklTggn4BB
 4lXvWEoLsZaWCMGtbzdn+v/x71dPlaU8ECmSPRlQPZ3L4lfYYwZQbp/knnM2VRQlZu2O
 Wb+D+bdXzyVAqZbJ9LWF1mWBbgS41ZIQvj3gpqNcI0aE30y7uq55+cppNKg/Hv2hJkrD
 oUE/RlqQIhaeA+KkoPp4N94D5TgmXzdzWUqjHiZOIqu5rKaITeDi4Uy1Qj3szNRvO9Aa
 lu4XyCrzR/2O9E3qFiCSFYwxQkjKFRGUtMo232neTw2Ne8KbBW+K+qGiWzHMS5IVQmmY
 gpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V3qETCs45aquJ5Oy8x+kDYAvLJsw5S1iROWD3/9SCt0=;
 b=dIv/TbGC6mvRRfbIbYfUFwN7amGlS5Alq1AnjiP8WFXdDq0wh6GgPB4dfnVOMKcS7j
 KE6F/d/ERAVt3D7fz70hrOotAlsgdFmWxb2iT4q0KvLu/Bz3FsLB2k9pdWOjEkKV9X6I
 otBNC/gDZ9Lp/w3x6DQg/Lv1GMBw+KUarUDuolVpvno2SWBDV0GlUwWOXPhoqOhVe+XE
 1llaX/3LKGRZeXlyCd7S778PtLSOcu9cT11BjdD4kjMOzANBwu4PVDENWB1rI8Iq64pu
 j24DCvo8Kx9beIlHdDMAhC2UExKdSXhdSJ5i9ZXRlkI7xaNyfpnDQGCl8Ox8tD6Qht42
 g/5w==
X-Gm-Message-State: AOAM533rUdcT1cw4ups9SVVn2AdrXLIm25qzQiJ8SUzAtunQ8wNopStm
 1jAEnGaxZeWZg1H/BnVkuTIc3FQNaZ0zUqQi
X-Google-Smtp-Source: ABdhPJwCFgrfoMKaDQUt5GuJU7eE1sKSp1Nxde2oTOhhehfykzisRYunDXSfNaEj50j5BCj8K5iqMg==
X-Received: by 2002:aca:3307:: with SMTP id z7mr842313oiz.34.1615243270131;
 Mon, 08 Mar 2021 14:41:10 -0800 (PST)
Received: from rebo.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id n1sm2502069oig.47.2021.03.08.14.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 14:41:09 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] bsd-user: Add new maintainers
Date: Mon,  8 Mar 2021 15:40:23 -0700
Message-Id: <20210308224023.75187-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::243;
 envelope-from=imp@bsdimp.com; helo=mail-oi1-x243.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The FreeBSD project has a number of enhancements to bsd-user. These changes have
evolved over the past 10 year, and aren't currently updated to the latest
version of qemu due to fluxuations in staffing causing us to fall behind in the
past. We're working on porting all the changes forward and contributing all the
changes back to qemu. Add myself as maintainer and Kyle Evans as a reviewer for
changes. In addition, add a pointer to our github repo in the interim while this
work is ongoing.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 26c9454823..ec0e935038 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2896,9 +2896,12 @@ F: thunk.c
 F: accel/tcg/user-exec*.c
 
 BSD user
-S: Orphan
+M: Warner Losh <imp@bsdimp.com>
+R: Kyle Evans <kevans@freebsd.org>
+S: Maintained
 F: bsd-user/
 F: default-configs/targets/*-bsd-user.mak
+T: git https://github.com/qemu-bsd-user/qemu-bsd-user bsd-user-rebase-3.1
 
 Linux user
 M: Laurent Vivier <laurent@vivier.eu>
-- 
2.30.0



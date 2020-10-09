Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F13288F58
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 19:01:53 +0200 (CEST)
Received: from localhost ([::1]:60514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQvmC-000523-5v
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 13:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kQvJF-0008V6-6o
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:31:57 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kQvJD-00059B-BW
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:31:56 -0400
Received: by mail-wr1-x430.google.com with SMTP id n18so10944174wrs.5
 for <qemu-devel@nongnu.org>; Fri, 09 Oct 2020 09:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VFKVIc/s+dLwpD2mSiyRtaqb4zL/MldI20hobohgCRc=;
 b=B4hVPY+/DDYKgHQwMb6J76NiI7t0a06cFGItnF8zk5dXdqHgMAB48hdpCHgwNgKipE
 lC0A5cm+Fs5xxUxj7oEMcZIDn9BZ/D5kQ2L+N9VpntRbiRitVVPC27ey9vZS0Th5z9dI
 B/MESEkHKu7eI0VPriwHI71YrPnSCTDc0rNOHw90pL9KO4hFKhOVgMFRJmWD7BTzTi+4
 W7xu8HPH06vG+E/ONq6neb8leQ36xIfQFG9X81nFy881P2ONVb1bt+cSBaNnigjundrJ
 fti5pZaHNwWZpwo3tuK68dFClidqL9Ocg70/EuTMLbJLCRXjE9m4Zuw3fI21nvoFyQ/7
 Fmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VFKVIc/s+dLwpD2mSiyRtaqb4zL/MldI20hobohgCRc=;
 b=AiAcTJ/xLkzksRU8+8Uh03j+caiW+32nDCmHpCI41guVRw8IMC6kmf3a4l9xKmJNEf
 rs0pL3wd+t3N8iUBIxXbdMHHqTbIfny2UYMGruFzeHCJhkyi70ZOJP7g73/fATTQFQnN
 Ltj+eDEtTu76ZYgF5pohnmy+IG7PaBTTV9wpK5cUJHfZD+mp+d2frJCKziUEBS3rI3fY
 PqAMXEp6X6bYwvYa+R2rkY4tLPNeXWH3qAMBSzXXfrSTjQwSDuNlTmgGaGMJPtOGj1xX
 rfZNDXrklWBi1rNyr102qa6hZE12h1fQfs+0cJsE/Ru2N8CKcGKRnAOwVCavvYmR00U7
 qwqQ==
X-Gm-Message-State: AOAM530QlTGe88FoVN/y2PvF2szR1Gb0TufiRmbOxDUjtc9lNvJ0pPeN
 cW7tmBLD6NnGBym2dqyr+ABl1Q==
X-Google-Smtp-Source: ABdhPJwbNC9t44gIe1u3HdnuhbZJwQIargP9sLE18VeKHxAyK108w9Pg7ZES+guGsEMk37lQ+JDN/A==
X-Received: by 2002:a5d:6a0d:: with SMTP id m13mr4986990wru.161.1602261113889; 
 Fri, 09 Oct 2020 09:31:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 30sm2837262wrs.84.2020.10.09.09.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 09:31:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 56E2A1FF8F;
 Fri,  9 Oct 2020 17:31:47 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 03/22] hw/ide: restore replay support of IDE
Date: Fri,  9 Oct 2020 17:31:28 +0100
Message-Id: <20201009163147.28512-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201009163147.28512-1-alex.bennee@linaro.org>
References: <20201009163147.28512-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 "open list:IDE" <qemu-block@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A recent change to weak reset handling broke replay due to the use of
aio_bh_schedule_oneshot instead of the replay aware
replay_bh_schedule_oneshot_event.

Fixes: 55adb3c456 ("ide: cancel pending callbacks on SRST")
Suggested-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: John Snow <jsnow@redhat.com>
Acked-by: John Snow <jsnow@redhat.com>
Message-Id: <20201007160038.26953-4-alex.bennee@linaro.org>

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 0e32abd779..693b352d5e 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -2289,8 +2289,8 @@ void ide_ctrl_write(void *opaque, uint32_t addr, uint32_t val)
             s = &bus->ifs[i];
             s->status |= BUSY_STAT;
         }
-        aio_bh_schedule_oneshot(qemu_get_aio_context(),
-                                ide_bus_perform_srst, bus);
+        replay_bh_schedule_oneshot_event(qemu_get_aio_context(),
+                                         ide_bus_perform_srst, bus);
     }
 
     bus->cmd = val;
-- 
2.20.1



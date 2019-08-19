Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7AE94D44
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 20:54:49 +0200 (CEST)
Received: from localhost ([::1]:56340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzmno-0000ao-BC
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 14:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60401)
 by lists.gnu.org with esmtp (Exim 4.90_1) (envelope-from
 <3P_BaXQMKCnwxh1lttlqj.htrvjrz-ij0jqstslsz.twl@flex--scw.bounces.google.com>)
 id 1hzmmw-0000Ak-To
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 14:53:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from
 <3P_BaXQMKCnwxh1lttlqj.htrvjrz-ij0jqstslsz.twl@flex--scw.bounces.google.com>)
 id 1hzmmv-0000ql-W8
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 14:53:54 -0400
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a]:36421)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from
 <3P_BaXQMKCnwxh1lttlqj.htrvjrz-ij0jqstslsz.twl@flex--scw.bounces.google.com>)
 id 1hzmmv-0000oO-QX
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 14:53:53 -0400
Received: by mail-qk1-x74a.google.com with SMTP id q62so4446231qkd.3
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 11:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=Nrgig+C5pc7X6sZGR3YI4RODigq0lm7IQt9biX4BZYs=;
 b=a6OBngfACo7ivVNDRhvZ/3yYtycbvuNdPKsvXkzZflxIb8EbADM6eVY518OAuR0c5b
 vm+g6vWmHElW2ieoGNPN6HvUel5Sgfoj1ooOalB4apeU9TS0zz6avBjwJ2mcDlW0+ixm
 vC1q6OF7CInzSp7MpNKTDbX0BDO3jzuOjP3M4780QftD9hCqoK9qAXLf91M2bsiBgS6B
 vbyv0EuxS9WTdCqxQbugCMNa0DwTDdsUpXGTdW6QH3HTAEEnm7tNYUkl95K82YYX6upT
 qAa67B8bkoQAZpinTmpuoaSSyzt5LZAkJHxudA/wCqtBWX0CNNxH/Gdd7kbp1GVxpZNY
 cOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=Nrgig+C5pc7X6sZGR3YI4RODigq0lm7IQt9biX4BZYs=;
 b=oQesRb23MCC453Fkfc4puROIbZw5kSs7ShwJZ3m5Bl1K8e2v9JIi7AmI0mC15BZsHa
 8QcLJJV/5hbvBv5DIeZfMtUIbtsdCMhlmqOl4P2L3xHC9zOievSJ2FzhsZtOnG6RSNf+
 hXYSlCU7iU8KE4Prr5R3YNldNBHKgIK7A4kOuEO2uF7lwUS9bvCrNhSudRnEnDolj+rN
 gTiov5LtvXxuRX4Ml6QNzVoeiwa5dcQnEMm/pJrJ7n2dg56bI7aeAUYilo1tGL9SgM5l
 tvqeS8PLA72nwVhbcIldYVpOunXIyv5UOJIwu0H8fzA5k3Vq56UiafSBWwh27Wtu0WRf
 3KAw==
X-Gm-Message-State: APjAAAWKaqlbOiNOlMo/a5IKsEn3zD9ESENq5epUNule8PbRBur/yBTf
 9AMwWepGwOGUrtFksIlg2Dl1GjM=
X-Google-Smtp-Source: APXvYqxEtaK1nzf6ysIel9xkbdUIGmHFYG2gjzY+fjJIaDUsrOGYk3ou+kV5VOuoqCvauTdNKHfd8YU=
X-Received: by 2002:ab0:6883:: with SMTP id t3mr6266931uar.104.1566240831142; 
 Mon, 19 Aug 2019 11:53:51 -0700 (PDT)
Date: Mon, 19 Aug 2019 11:53:48 -0700
Message-Id: <20190819185348.221825-1-scw@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::74a
Subject: [Qemu-devel] [PATCH] linux-user: erroneous fd_trans_unregister call
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
From: Shu-Chun Weng via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: Shu-Chun Weng <scw@google.com>
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org,
 Shu-Chun Weng <scw@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

timer_getoverrun returns the "overrun count" for the timer, which is not
a file descriptor and thus should not call fd_trans_unregister on it.

Signed-off-by: Shu-Chun Weng <scw@google.com>
---
 linux-user/syscall.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 8367cb138d..012d79f8c1 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11846,7 +11846,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             timer_t htimer = g_posix_timers[timerid];
             ret = get_errno(timer_getoverrun(htimer));
         }
-        fd_trans_unregister(ret);
         return ret;
     }
 #endif
-- 
2.23.0.rc1.153.gdeed80330f-goog



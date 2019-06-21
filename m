Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F044E75F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 13:53:44 +0200 (CEST)
Received: from localhost ([::1]:59996 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heI6x-0001tp-KF
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 07:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49229)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1heHl1-0000wo-99
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:31:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1heHkm-00067Y-9c
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:30:55 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51500)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1heHkm-00066q-34
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:30:48 -0400
Received: by mail-wm1-x341.google.com with SMTP id 207so6031510wma.1
 for <qemu-devel@nongnu.org>; Fri, 21 Jun 2019 04:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a3VGuwnoGM9LiZBZHhLPfux9Kyat183XzMS8uuGHjKk=;
 b=vfnsTVvpoLsCV3J9zxaZqMHgDbWFpYiznQGay7eixnslFrrXf6aaHfu/LuUcQ3zzUQ
 iSKdr2mNqA8+lC+FALXYH/E2iUegO5ESxvOvCYo5J2ITcYKqwkMoQUaTnLoI0Lb7wPzl
 YzFfu8WE95I9HTJHx4Oc1J0bnQOAFqrfFXMPGKhiyXwJtGvpOtMiuLP1a3URV8bXmTR8
 Lk8Uklm02kAI+plAP6R7VHwfQxtqsrQSohd4Dl0Dl04V4DB4dV+UiwkHZimhZnp1y23d
 8qshSMOOgs9pIkbtjux5AKVg2hbqif0+pai00AevWUAAgQM+yNMCAXWBcYpEzyvUMzB0
 VUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=a3VGuwnoGM9LiZBZHhLPfux9Kyat183XzMS8uuGHjKk=;
 b=gYoEtvlK9hi3DRqPzqU+B492pZvRIxDzs5XV4Sf7NEzqNVr68W6SSSS/+BI6wg7wQL
 yvgyEPIjjiXTeyc2P6hNwUaYPVRle0Yer4o+RMyYBcYbT5TEgcSB/BjxoVCNyb7GzGRx
 O0PLgVrQ4QT6RTturzUikg79i4kHdgNSw2xBJhmOx+IsFd1xDQE20Ai7mSW6bVOCe2Id
 XUnvFCVnkYPSDoglVqVeJkhHox6IqgDmqenZ7TtzA1lRDMCfNfhaKaK3LzG70Ld77z92
 4qcbUrgomsP/JOhUbHGIfeae+T/05yE7VWqxHzTNiol48H/dBiG8R0/VMhCyf/zRLb0E
 4lDw==
X-Gm-Message-State: APjAAAVZ6riUeHYMv53RRFaoJVjifrWXnM21Zy36y67jJVRfVRdOkq7i
 +Bk4A0Ht4C+VRc7tGVz1Z4dcb9sN
X-Google-Smtp-Source: APXvYqykY5Odf/j/xE+rxPQq1QqQ6UYmgViZuKeBIK6KH4Iz3JOnPODDY2Ri9Y90KAwqSXcAOoyxBQ==
X-Received: by 2002:a7b:cc97:: with SMTP id p23mr4031210wma.120.1561116646861; 
 Fri, 21 Jun 2019 04:30:46 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id r3sm2712851wrr.61.2019.06.21.04.30.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 04:30:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 13:30:19 +0200
Message-Id: <1561116620-22245-25-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561116620-22245-1-git-send-email-pbonzini@redhat.com>
References: <1561116620-22245-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PULL 24/25] util/main-loop: Fix incorrect assertion
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
Cc: Lidong Chen <lidong.chen@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lidong Chen <lidong.chen@oracle.com>

The check for poll_fds in g_assert() was incorrect. The correct assertion
should check "n_poll_fds + w->num <= ARRAY_SIZE(poll_fds)" because the
subsequent for-loop is doing access to poll_fds[n_poll_fds + i] where i
is in [0, w->num).  This could happen with a very high number of file
descriptors and/or wait objects.

Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Suggested-by: Liam Merwick <liam.merwick@oracle.com>
Reviewed-by: Liran Alon <liran.alon@oracle.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <ded30967982811617ce7f0222d11228130c198b7.1560806687.git.lidong.chen@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/main-loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/main-loop.c b/util/main-loop.c
index e1e349c..a9f4e8d 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -422,7 +422,7 @@ static int os_host_main_loop_wait(int64_t timeout)
     g_main_context_prepare(context, &max_priority);
     n_poll_fds = g_main_context_query(context, max_priority, &poll_timeout,
                                       poll_fds, ARRAY_SIZE(poll_fds));
-    g_assert(n_poll_fds <= ARRAY_SIZE(poll_fds));
+    g_assert(n_poll_fds + w->num <= ARRAY_SIZE(poll_fds));
 
     for (i = 0; i < w->num; i++) {
         poll_fds[n_poll_fds + i].fd = (DWORD_PTR)w->events[i];
-- 
1.8.3.1




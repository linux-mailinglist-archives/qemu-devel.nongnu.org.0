Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7C037674C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 16:55:49 +0200 (CEST)
Received: from localhost ([::1]:34804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1tM-0002HB-Tr
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 10:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1i5-0007oE-Fr
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:44:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1hz-0000lr-3q
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:44:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620398639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0aEFCYf2HLWMKyL3vu/hasMYJfVES1sketKqALkOn8E=;
 b=XjDmLzn0JnJ9VZvoF6bTxrHPLA2LQUIUK0G7C9O+G7oE8cxPRjvo8Gn6pcKqrpdE8qIQ/R
 Cqk5Ys/eZ7Wy5A2YzyW05+1xP41kj5fuT2oXmuU2s87MSdPAnEZVniZtDNGDGakiuoBXAM
 6kNqr7TeQNsu5nHprRQ0oE51Elx0cR4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-oF72ux7RPXaQbh8mxqHTug-1; Fri, 07 May 2021 10:43:57 -0400
X-MC-Unique: oF72ux7RPXaQbh8mxqHTug-1
Received: by mail-wr1-f69.google.com with SMTP id
 88-20020adf95610000b029010758d8d7e2so3647753wrs.19
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 07:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0aEFCYf2HLWMKyL3vu/hasMYJfVES1sketKqALkOn8E=;
 b=ODIyPbzDsrKDyutY2cF55ZppOBkGzqX/fjYFySjViVOw6gwCQfl1E9nnkoJPUvsuXI
 xMUJo2PXZhbCa1VCrDWHHOioD9NQL+42QMh4k9jVUa2KRTR5jGP7DdxVfXFHGlHIDjJt
 6Bc3B57FoetW1rxYO4S/5T/X6F91D24wtqqoCGEDnR4EejMZkAUlVTS32JYRp2C2Xox1
 P6q06FEhBi3Mc1KOkqmliat16oaQVHZLsWP9/O4B2qOin0bzEO/GmX9+syvm7SY4DHvv
 5BFjOFfJO12blep900u+sr6wkrTHcjCiFySI8laPsE4naU3LDzx2b165XrJZYlD5fGfw
 iLoQ==
X-Gm-Message-State: AOAM533+xvOE9olgtfFIlQjTLmRMwXJTKgr90qFwjsgdv1yGyPKgd8Ec
 dlS/WsCiBqiMzomVDSud+YF6VC3zTaFJFXmgw343UiJDTRaaZVnAmgB1A0uTJEGOE1SL5cNMRUq
 CLJDlCQzqqVGKSpplGTgiO+SaGQ4JXqmapgLUeBkerL5UR++Jfiux6F6X0V918nuN
X-Received: by 2002:a1c:e912:: with SMTP id q18mr21780868wmc.59.1620398635922; 
 Fri, 07 May 2021 07:43:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuxDw+Z5ejCnnQGzrscKMxB38QYBMH5R95NR75yg2DPkosJ/eaQfVzqQPNjxuH9z1wWTJ1gA==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr21780843wmc.59.1620398635604; 
 Fri, 07 May 2021 07:43:55 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id q12sm9079882wrx.17.2021.05.07.07.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 07:43:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/17] linux-user/syscall: Move code around in
 do_sendrecvmsg_locked()
Date: Fri,  7 May 2021 16:43:06 +0200
Message-Id: <20210507144315.1994337-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507144315.1994337-1-philmd@redhat.com>
References: <20210507144315.1994337-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid initializing variables too early, since there is
2 possible failure points before they get used. Move them
after the lock_iovec() call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 linux-user/syscall.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 7c5c821f48d..593241362a9 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3379,15 +3379,8 @@ static abi_long do_sendrecvmsg_locked(int fd, struct target_msghdr *msgp,
         msg.msg_name = NULL;
         msg.msg_namelen = 0;
     }
-    msg.msg_controllen = 2 * tswapal(msgp->msg_controllen);
-    msg.msg_control = alloca(msg.msg_controllen);
-    memset(msg.msg_control, 0, msg.msg_controllen);
-
-    msg.msg_flags = tswap32(msgp->msg_flags);
 
     count = tswapal(msgp->msg_iovlen);
-    target_vec = tswapal(msgp->msg_iov);
-
     if (count > IOV_MAX) {
         /* sendrcvmsg returns a different errno for this condition than
          * readv/writev, so we must catch it here before lock_iovec() does.
@@ -3396,14 +3389,20 @@ static abi_long do_sendrecvmsg_locked(int fd, struct target_msghdr *msgp,
         goto out2;
     }
 
+    target_vec = tswapal(msgp->msg_iov);
     vec = lock_iovec(send ? VERIFY_READ : VERIFY_WRITE,
                      target_vec, count, send);
     if (vec == NULL) {
         ret = -host_to_target_errno(errno);
         goto out2;
     }
+
     msg.msg_iovlen = count;
     msg.msg_iov = vec;
+    msg.msg_flags = tswap32(msgp->msg_flags);
+    msg.msg_controllen = 2 * tswapal(msgp->msg_controllen);
+    msg.msg_control = alloca(msg.msg_controllen);
+    memset(msg.msg_control, 0, msg.msg_controllen);
 
     if (send) {
         if (fd_trans_target_to_host_data(fd)) {
-- 
2.26.3



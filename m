Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F1C376749
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 16:53:48 +0200 (CEST)
Received: from localhost ([::1]:58320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1rP-0000Od-O5
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 10:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1i6-0007q4-9N
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:44:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1i3-0000nJ-LX
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:44:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620398643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VXb/SdsglaW/QeR809+FkWbDDukXToeT9LG+jBzD2Ak=;
 b=NdV3KcBaBxPdcdPawJGW+qo0sV7BVOUVGrszLU/9qcz7zpAPjXoHay0i9/pdpiM+Kq0Dgg
 316Xc/zDa6O27uQm2rcM8antPHx1WVFHMjwuQa43L+Nn+Z/xGEFMeZ0JOHKJSYR46s1oKf
 7XYtQy536rtL4oGTXN6gj+qbsJmU73c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-Lty4evigOQWdlqHgvfzylQ-1; Fri, 07 May 2021 10:44:02 -0400
X-MC-Unique: Lty4evigOQWdlqHgvfzylQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso3686385wrh.12
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 07:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VXb/SdsglaW/QeR809+FkWbDDukXToeT9LG+jBzD2Ak=;
 b=d4C1Rhdi2Y5bSEdKWp0Ncvgq6gAziaPcKls5Ej7uvsfThi0QPB1UwShaimdo2mX8AD
 BsRVVFsZnpHoXjyXpHvg3WmBFWUUTtRGk9qu87gT2aL6Yrd0QQUGf2sk+YUYQDOVXD/G
 PCx0/1CQHT0r4VytoM7qCPxpnTUfFH1GyDEg/9S9EmqddAKu3eqmyGvNNfk19g2j+/nQ
 hsn0xE/Se2GRRFA15GhXvOBL/RDNt6LDDQnvwXvOBwx6hYCJicOVJZ1l75R1fwyvhSE7
 FQj6OE0MeVfZiFSDM0YPG6+MlBh1+bfIwpaRVKz6XNahI8Vt+8AcIX4iF5puqcmFkEPZ
 xACg==
X-Gm-Message-State: AOAM533ae7czLzsepcnUCaVR29QM8QKaq75Mbn/nJ3WtpJsonBgLxdsb
 JxC9HiDvcuPg7QLg9Jq7yIWEMwTK+IYFhJhPrIQdbLraZiyzFFyTrHyKuB26UxBz9FlVT7tXC/v
 hnvg/F8F5f19cCOTWci5p7rGquGkBStrhl5JcgkyxHgJbVtnjOcuisUF9B7Ogu4Xj
X-Received: by 2002:adf:f5c6:: with SMTP id k6mr13450308wrp.338.1620398640790; 
 Fri, 07 May 2021 07:44:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIYqu7g0FIq8SCVQnMmTws2rDcXfTUEbAeQnUtRQ+O103KeVplYGEoYEo0zclOShBCiqkK6w==
X-Received: by 2002:adf:f5c6:: with SMTP id k6mr13450277wrp.338.1620398640536; 
 Fri, 07 May 2021 07:44:00 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id v13sm8883864wrt.65.2021.05.07.07.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 07:44:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/17] linux-user/syscall: Replace alloca() by GLib alloc()
 in sendrecvmsg
Date: Fri,  7 May 2021 16:43:07 +0200
Message-Id: <20210507144315.1994337-10-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The ALLOCA(3) man-page mentions its "use is discouraged".

Use autofree heap allocation instead (returning ENOMEM on failure).

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 linux-user/syscall.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 593241362a9..c88e240ff93 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3358,13 +3358,19 @@ static abi_long do_sendrecvmsg_locked(int fd, struct target_msghdr *msgp,
     abi_ulong count;
     struct iovec *vec;
     abi_ulong target_vec;
+    g_autofree void *msg_control = NULL;
 
     if (msgp->msg_name) {
         msg.msg_namelen = tswap32(msgp->msg_namelen);
-        msg.msg_name = alloca(msg.msg_namelen+1);
+        msg.msg_name = g_try_malloc(msg.msg_namelen + 1);
+        if (!msg.msg_name) {
+            ret = -TARGET_ENOMEM;
+            goto out2;
+        }
         ret = target_to_host_sockaddr(fd, msg.msg_name,
                                       tswapal(msgp->msg_name),
                                       msg.msg_namelen);
+        g_free(msg.msg_name);
         if (ret == -TARGET_EFAULT) {
             /* For connected sockets msg_name and msg_namelen must
              * be ignored, so returning EFAULT immediately is wrong.
@@ -3401,8 +3407,7 @@ static abi_long do_sendrecvmsg_locked(int fd, struct target_msghdr *msgp,
     msg.msg_iov = vec;
     msg.msg_flags = tswap32(msgp->msg_flags);
     msg.msg_controllen = 2 * tswapal(msgp->msg_controllen);
-    msg.msg_control = alloca(msg.msg_controllen);
-    memset(msg.msg_control, 0, msg.msg_controllen);
+    msg.msg_control = msg_control = g_malloc0(msg.msg_controllen);
 
     if (send) {
         if (fd_trans_target_to_host_data(fd)) {
-- 
2.26.3



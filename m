Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA2C30C4FC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:11:36 +0100 (CET)
Received: from localhost ([::1]:59342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yH9-0005pT-B2
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6y2S-0005qW-5y
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:56:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6y2M-0001jZ-OU
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:56:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612281378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ow8WkzDqwlr6NSlZiItBTXInPAFY5oanHyLWGxhAEug=;
 b=F9WjnMe4ZwE4CrDhgQeU7V9IempN+MnGulepz8Uh3y6pDGafj+5uoo0Ib38CMRqobK7BkS
 gSgOp3KLOkwX8oTMIRoYx731M0j4rrnUrpR9x/guAg+HHs/EnfIaO7Hc9pC7Kiyms4gI5e
 syHx90gXs9rS+I8vFYXN/lNklhKI53s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-a_q_MijLPTeFqvcjpMSxEw-1; Tue, 02 Feb 2021 10:56:15 -0500
X-MC-Unique: a_q_MijLPTeFqvcjpMSxEw-1
Received: by mail-wm1-f70.google.com with SMTP id x20so1657531wmc.0
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 07:56:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ow8WkzDqwlr6NSlZiItBTXInPAFY5oanHyLWGxhAEug=;
 b=mvuuN+bnl3WOCKXDjWQRg6OgoXmrt7nHI214rEN18pPXeQPt2WVMXFi2LWuQpnRESo
 491SUxxDsFzUh234pndmRxtdC/y79ssPMFZhUKSyGAu9dIjseRJarQ6QHD5EK0pB58b/
 iCmzUf4gU8yAFWKdle7NS4M+xcV7igZ6YwQcUIoTcCtMj2P7N5+wjSaMfRGZXt9mUYJZ
 8PLcwjvoLMg8q7tSv4sU2b8lCwSt1Ets3xiCZ0Dy6l3TJfMuG6MFITL4wiYVrFrdYjbE
 Y287EAPxdICZSr0E03UMTyNSc2kH0anOvaq4F6jHjDK5Mn62b+NU2kOVu5jy6nyoN6Cf
 XE8A==
X-Gm-Message-State: AOAM532kp8bdJ4hvyiwlesXIMwadS4W/UCdV9SrEa90Icra3g1k0xMcw
 pKoL2aiylvmXT0LS54VFpMfqO/6O+vF6eb6w2yEQm5IZiJ2x3Ya530RiJc1c5rEe99RwD++wjW0
 xhcAcgQZVRzy94kgjYq9ajCfOPFZU4L1/HY74L1zM9SV2Fw+D/9W/iB9nhERvBMQQ
X-Received: by 2002:a1c:1fce:: with SMTP id f197mr776467wmf.110.1612281373949; 
 Tue, 02 Feb 2021 07:56:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyH4m873K4it6Y0grf8QOwagFdLutxC4dRftkk54Zl9WfrmECMLpIzM69tGOgaLBxiQ5YKbbw==
X-Received: by 2002:a1c:1fce:: with SMTP id f197mr776448wmf.110.1612281373686; 
 Tue, 02 Feb 2021 07:56:13 -0800 (PST)
Received: from x1w.redhat.com (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id i18sm24635262wrn.29.2021.02.02.07.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 07:56:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Cover docs/igd-assign.txt in VFIO section
Date: Tue,  2 Feb 2021 16:56:11 +0100
Message-Id: <20210202155611.998424-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bcd88668bcd..838d0f14a59 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1768,6 +1768,7 @@ M: Alex Williamson <alex.williamson@redhat.com>
 S: Supported
 F: hw/vfio/*
 F: include/hw/vfio/
+F: docs/igd-assign.txt
 
 vfio-ccw
 M: Cornelia Huck <cohuck@redhat.com>
-- 
2.26.2



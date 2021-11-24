Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEBD45C9BE
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 17:18:53 +0100 (CET)
Received: from localhost ([::1]:51522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpuyy-0004WJ-H0
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 11:18:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpuw4-0000zA-DA
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 11:15:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpuw2-0005O3-4p
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 11:15:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637770549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pAJvjWL7+9OjZK8lvdVpeV3G6cYC7dwmwUMy7U51Sis=;
 b=TwdLWuX9OiMsBzZPF+Jf6Ced12Fk2mOZeqyT8+NmbjghhYDITXOsQo9zOkbQtpFuUNZ4Ah
 joyrqXfjp3+EvsLNjEpk2me1ygBkWj/foKTHcT54HpRaIcTc23FQht2mS6w6D8I3JocFBX
 z8GWmMvUVeT3MH3yW+Etg4sYgPtk088=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520--M79cWVmPWC_izr4YqlbsA-1; Wed, 24 Nov 2021 11:15:48 -0500
X-MC-Unique: -M79cWVmPWC_izr4YqlbsA-1
Received: by mail-wr1-f70.google.com with SMTP id
 f3-20020a5d50c3000000b00183ce1379feso619360wrt.5
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 08:15:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pAJvjWL7+9OjZK8lvdVpeV3G6cYC7dwmwUMy7U51Sis=;
 b=s8Wn+R4hsIqISa5RwEyJZYXQ88ZifunEK4kLjG/ViEeuafb4HtZ8Dp37ndJzw5f1PM
 Y8AvEXUIqqQJdkWIYaAXMRgqt82hrE6PseUtBQmwv+q3CqmHB9ewczZiAM97fV8rSiIq
 1htGHk9bI+Cm1qztBzNtAByu+IWxmYq2lPruTEYF6ELHRuztGcM8ir4RQWWJnl+h0Zce
 ZK8RhqfuCGLusiyX6TsTE4t2oWZ1KENHs3LY/ZQpw1rV+sgVNw3quv0XapB8az6BH8oP
 YwC3LzcapD3DBX5xJqja9QqdXS0rNAS5XPysqFfJpkjJRn4x9LqPVhA05iKa0ix8MlKc
 rW2g==
X-Gm-Message-State: AOAM532SLwPkob7FpzznhyaYxzNzhKEY7Wdk97PfXCFALr06Y5Dl2mBH
 qwQ1VdOF2dYQ4RjbSLorCzEJLsALokOrIIVrvgXZDLo2e1kek9EdOefcfcNS+GtP+pPfKt3Bqju
 D4uI1lIeOSV8z1sYF2L8Z3YpQfMPE9IgTRzTLU8gaPenb2UKxa8KxWd0mibDIZzY5
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr21038491wrr.143.1637770545915; 
 Wed, 24 Nov 2021 08:15:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwD9RdGN6SPWCFFH8LFC0bXsyXZDyls+tWio3VN0u65oJD/MN0d2h89E97UsuseeuRigr54iw==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr21037970wrr.143.1637770542794; 
 Wed, 24 Nov 2021 08:15:42 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id g18sm238429wrv.42.2021.11.24.08.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 08:15:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/3] hw/block/fdc: Extract blk_create_empty_drive()
Date: Wed, 24 Nov 2021 17:15:34 +0100
Message-Id: <20211124161536.631563-2-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124161536.631563-1-philmd@redhat.com>
References: <20211124161536.631563-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to re-use this code in the next commit,
so extract it as a new blk_create_empty_drive() function.

Inspired-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/fdc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index fa933cd3263..1dbf3f6028f 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -61,6 +61,12 @@
     } while (0)
 
 
+/* Anonymous BlockBackend for empty drive */
+static BlockBackend *blk_create_empty_drive(void)
+{
+    return blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
+}
+
 /********************************************************/
 /* qdev floppy bus                                      */
 
@@ -486,8 +492,7 @@ static void floppy_drive_realize(DeviceState *qdev, Error **errp)
     }
 
     if (!dev->conf.blk) {
-        /* Anonymous BlockBackend for an empty drive */
-        dev->conf.blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
+        dev->conf.blk = blk_create_empty_drive();
         ret = blk_attach_dev(dev->conf.blk, qdev);
         assert(ret == 0);
 
-- 
2.33.1



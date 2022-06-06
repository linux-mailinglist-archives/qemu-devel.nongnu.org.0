Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BFE53E529
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:53:13 +0200 (CEST)
Received: from localhost ([::1]:50700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyE6S-0003xc-CN
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr7-00025e-Ri
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr4-0000Y0-Mg
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+t3gkwgGwLSHvcNvt1joAtKEz1aMI4Lc04QL7sM58NE=;
 b=EofvFlICZzbvC/sFpu9uXlC/YDOPNA1rYu9D8bt2KI1snCuNY/UEc68aW0LHfUhQYfyqdT
 AgNdCv+lHmfmZ0LFcelj9H03BeeH8gpK94CCwc1m9HgSwunge0sH9BXRsTukAjN4xuVHGs
 KSD+gmWenC36k/88GN7rj20TzNF2nGo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-t_RliPABNi2qUlqAq2byxw-1; Mon, 06 Jun 2022 10:37:13 -0400
X-MC-Unique: t_RliPABNi2qUlqAq2byxw-1
Received: by mail-wm1-f69.google.com with SMTP id
 o23-20020a05600c511700b0039743cd8093so7797860wms.6
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+t3gkwgGwLSHvcNvt1joAtKEz1aMI4Lc04QL7sM58NE=;
 b=fRNuGS0szGWHTCmQ5xMZZVYVd/b0hUDwWzy+dFN+HvwyBD42G00YCMOvOBg1DNf94k
 CqBWKoKyewhEiv+WVsdk3n/L5Qoy4PAZ+1zjOK5r4S0bjw5+x+IQDvM+zk3m7GqT/DK0
 d/pbu4AZoXSQiZ6uxccZeBl6k79Mh6biprLZeMr2JMk+t0G7cA42DiC8sS4cge8wf/1l
 HXrkz9kD7I/7QtO/R4TwaKUqWf4cDOif9Raie/4g5BxF9Xc8JEUCDSLYT9Av8CKhCApR
 wE6AWkLWqIJbSiNq51Tyj83nzyENm7Aq7o9bnnyp2/M4Fr1Bp11iZLQNlicJhW7lRxQs
 IXiQ==
X-Gm-Message-State: AOAM5321xHKviSWDEVfYd7fYDUypsyuBFPwsrNauworbDtySjWdkgL5Z
 4xFKX7JOgSZ+B9IkRWqu6nLvVrzuk1SvdSge4QQJl39jzwheIcK9pGQjZtJ3lyES5aDrYD+17Zm
 yagC5YWyClKi9YQVm7sF8L29+k5TiqDJDMblGskEh1Hz0dAC1qdrsi0DJL5g+ZCbQ0co=
X-Received: by 2002:a05:6000:244:b0:210:cc02:889a with SMTP id
 m4-20020a056000024400b00210cc02889amr22564052wrz.141.1654526231731; 
 Mon, 06 Jun 2022 07:37:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrXkIGSYB8gyNcDxqlYhKfftHY1+ntg1RcE3h1KbikZh40jqf/nPhptAaZb1Z11xquLGmDrw==
X-Received: by 2002:a05:6000:244:b0:210:cc02:889a with SMTP id
 m4-20020a056000024400b00210cc02889amr22564018wrz.141.1654526231400; 
 Mon, 06 Jun 2022 07:37:11 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 bv18-20020a0560001f1200b002183cedbf34sm3176040wrb.73.2022.06.06.07.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Subject: [PULL 13/29] tests/avocado: add replay Linux tests for virtio machine
Date: Mon,  6 Jun 2022 16:36:28 +0200
Message-Id: <20220606143644.1151112-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch adds two tests for replaying Linux boot process
on x86_64 virtio platform.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-Id: <165364840811.688121.11931681195199516354.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/avocado/replay_linux.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/avocado/replay_linux.py b/tests/avocado/replay_linux.py
index 1099b5647f..3bb1bc8816 100644
--- a/tests/avocado/replay_linux.py
+++ b/tests/avocado/replay_linux.py
@@ -123,3 +123,29 @@ def test_pc_q35(self):
         :avocado: tags=machine:q35
         """
         self.run_rr(shift=3)
+
+@skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
+class ReplayLinuxX8664Virtio(ReplayLinux):
+    """
+    :avocado: tags=arch:x86_64
+    :avocado: tags=virtio
+    :avocado: tags=accel:tcg
+    """
+
+    hdd = 'virtio-blk-pci'
+    cd = 'virtio-blk-pci'
+    bus = None
+
+    chksum = 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'
+
+    def test_pc_i440fx(self):
+        """
+        :avocado: tags=machine:pc
+        """
+        self.run_rr(shift=1)
+
+    def test_pc_q35(self):
+        """
+        :avocado: tags=machine:q35
+        """
+        self.run_rr(shift=3)
-- 
2.36.1




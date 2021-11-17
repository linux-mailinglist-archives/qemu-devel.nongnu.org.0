Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735DB454C5E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:45:02 +0100 (CET)
Received: from localhost ([::1]:44484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOzU-0002Zt-JG
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:45:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnOyC-0001CO-PL
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:43:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnOy9-0001X9-58
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:43:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637171016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uqvPrBwdkBrZ7W0JKAAxs4bNDX9811R3xbg078n3/OU=;
 b=ApDfgM1y45zmiGSiZW9t13EWFlIwq6a2RK9sm26ISJ9aK91ZzQIVdy/2v0YpyC7ZUaGFf2
 EN9L7XXJuAu89n6ndsgk07pSI2T7KeCRYPTjCbe3K9zVGHiqRZv+hEW3vB1XZi17Va/d1m
 B2Z9OjllxIXenvXFmj7pbrA74kM2Ohw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-GJsGUu5ZOcyOnUJP9htbfQ-1; Wed, 17 Nov 2021 12:43:35 -0500
X-MC-Unique: GJsGUu5ZOcyOnUJP9htbfQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso1812784wms.1
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 09:43:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uqvPrBwdkBrZ7W0JKAAxs4bNDX9811R3xbg078n3/OU=;
 b=IMlwcm68Cj4EiTrZTOMMCWsExjIXeNZvPl6mjJXAHGbM+oRbE0sRBq6QDem5KXdBvL
 27+Z5zBHtfXhkg1h3OtBMPnINLYB0YLzBWlUJc7nd6j2mnGEEXM/EhbJ0lM54C6nJSAk
 El3p6HKeQ6cG/nrtwr8cHvYQ/eBKPdkj6RAuS6apPSu9Wen61f7Dk35pBcyGn6WqaAjE
 P6vuC2ixjH6b6R2M9p5A9xT4Kb2wBHNO3VR9iRcc5Bc7KKSQpAzff81aOSUWX+MYBCGP
 iDDTMl/AXc02D8eSJj9afng7DqRLp0/VNnvCJGtEvuGAbndBShhutOIoH0Fxw3Eq1aGQ
 Iruw==
X-Gm-Message-State: AOAM532OK3nq7a9gXmbScVzTcwiMVVSVqDAPvuxhDhkQ1z9WjiW3lx9M
 /D9ctCUgDVPmMY8VI4vqW2wrDJf7xBpTBGtGc6o7tFVYJJ4onaz+OAzKNMT2KTp1P7sIyHJ2KRB
 g5EAMi3PzGWXns6bOYOQ3K8QjdH7jYfXnMPNO6UX3eStTGiPvRBPbqH+C4ApG5aZV
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr22493601wrm.79.1637171013494; 
 Wed, 17 Nov 2021 09:43:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDKeRbIEjWaQNF19yqyxn8L9wkqUsk9+mq1X1Lv/Oqfy+zGUWv6A3nj8GSXmjnJTKCBDLfwg==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr22493558wrm.79.1637171013257; 
 Wed, 17 Nov 2021 09:43:33 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id h204sm408353wmh.33.2021.11.17.09.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 09:43:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2] hw/i386/microvm: Reduce annoying debug message in
 dt_setup_microvm()
Date: Wed, 17 Nov 2021 18:43:31 +0100
Message-Id: <20211117174331.1715144-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: f5918a99283 ("microvm: add device tree support.")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/microvm-dt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
index 875ba919639..6ee6c42904d 100644
--- a/hw/i386/microvm-dt.c
+++ b/hw/i386/microvm-dt.c
@@ -327,7 +327,9 @@ void dt_setup_microvm(MicrovmMachineState *mms)
     dt_setup_sys_bus(mms);
 
     /* add to fw_cfg */
-    fprintf(stderr, "%s: add etc/fdt to fw_cfg\n", __func__);
+    if (debug) {
+        fprintf(stderr, "%s: add etc/fdt to fw_cfg\n", __func__);
+    }
     fw_cfg_add_file(x86ms->fw_cfg, "etc/fdt", mms->fdt, size);
 
     if (debug) {
-- 
2.31.1



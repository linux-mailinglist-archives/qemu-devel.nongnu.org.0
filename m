Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFF145C9E3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 17:23:15 +0100 (CET)
Received: from localhost ([::1]:59446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpv3C-0001Xt-7M
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 11:23:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpuwC-000182-3u
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 11:16:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpuw8-0005RL-5m
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 11:15:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637770555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UWA1IDLGCZTNS+dT5T8n4DWw9F8qpa2tToMXzGyuHog=;
 b=S2mHyBY4m4Q17FWeMarpzp+7YnExqGxusl9fWdfwDMlh1BSUttdKtBr2fFOMp/2oJZDI3W
 Uq3MJG9zT9yxurUSh+YrVPmdPAdOsIS7TUOl/IXdHFcen6mDFVW9TBNkiZLEV7NRROU0hS
 LwWjJ5j3CU+sttnrUSi0Ct/gk7EsM7c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-4Faw_wBAMwC4l1lCe4E9DQ-1; Wed, 24 Nov 2021 11:15:51 -0500
X-MC-Unique: 4Faw_wBAMwC4l1lCe4E9DQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so3248315wmc.7
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 08:15:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UWA1IDLGCZTNS+dT5T8n4DWw9F8qpa2tToMXzGyuHog=;
 b=1UcnOcJRS07XoZ5oJtClx5FXyeOlkhB9+3A8zD/KTAfdCrGGd1wz3GhxOlfr/ZMqDc
 G1qYhgpoMubfWpGn6UMz/tRgnH5a4FX+zBlGQJPxW/wy8rj9c1fVpDzPdiGXWy6ic8Yk
 hv3C4klapTwZz22d1+YkrdlxWGjbCe2C9519kDhbGhAXfr2PBjGLQXDkvvXzdwYeStRb
 Q9FjOchdd1KnC36jUEHD+a5hoojykUVTmcmX9zvO/w4IRZfi4XNkxtzdvLheqGl6gCOk
 dZQ0TmWqldW7/Ft088vneL3isgJj+gfBvuXbmcLXwusJKOXPicYRMk0iatcih9+8VkKF
 5tZQ==
X-Gm-Message-State: AOAM5327+GTkz05XEuSSwqAcH4X9sdOUiecuDpdEjxE90qUoiusX5aD+
 zFQfKl9XMRSqdtCVS3yuWMPKWMzljRotALBvp5Wet6fRTr1bwBkF1OsxZ69i/oUXLntoj82BNeO
 oi8fI6u0vsRG+v0PbLX75AkrtEKKQa8zFrltORnE+P8S8oDXjtLrjtZosn54UEC65
X-Received: by 2002:a05:600c:1e8d:: with SMTP id
 be13mr16646672wmb.79.1637770549979; 
 Wed, 24 Nov 2021 08:15:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhOxWAfEOKANUCdT5gCfgNnQm4YjIS4Kb5ct9ksNwKPCyZAxhHo+ZzOqFgRDRUWtEsNYglyg==
X-Received: by 2002:a05:600c:1e8d:: with SMTP id
 be13mr16646606wmb.79.1637770549664; 
 Wed, 24 Nov 2021 08:15:49 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o1sm234558wrn.63.2021.11.24.08.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 08:15:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/3] hw/block/fdc: Kludge missing floppy drive to fix
 CVE-2021-20196
Date: Wed, 24 Nov 2021 17:15:35 +0100
Message-Id: <20211124161536.631563-3-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-stable@nongnu.org, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gaoning Pan <pgn@zju.edu.cn>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Guest might select another drive on the bus by setting the
DRIVE_SEL bit of the DIGITAL OUTPUT REGISTER (DOR).
The current controller model doesn't expect a BlockBackend
to be NULL. A simple way to fix CVE-2021-20196 is to create
an empty BlockBackend when it is missing. All further
accesses will be safely handled, and the controller state
machines keep behaving correctly.

Cc: qemu-stable@nongnu.org
Fixes: CVE-2021-20196
Reported-by: Gaoning Pan (Ant Security Light-Year Lab) <pgn@zju.edu.cn>
BugLink: https://bugs.launchpad.net/qemu/+bug/1912780
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/338
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/fdc.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 1dbf3f6028f..21d18ac2e36 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -1166,7 +1166,19 @@ static FDrive *get_drv(FDCtrl *fdctrl, int unit)
 
 static FDrive *get_cur_drv(FDCtrl *fdctrl)
 {
-    return get_drv(fdctrl, fdctrl->cur_drv);
+    FDrive *cur_drv = get_drv(fdctrl, fdctrl->cur_drv);
+
+    if (!cur_drv->blk) {
+        /*
+         * Kludge: empty drive line selected. Create an anonymous
+         * BlockBackend to avoid NULL deref with various BlockBackend
+         * API calls within this model (CVE-2021-20196).
+         * Due to the controller QOM model limitations, we don't
+         * attach the created to the controller device.
+         */
+        cur_drv->blk = blk_create_empty_drive();
+    }
+    return cur_drv;
 }
 
 /* Status A register : 0x00 (read-only) */
-- 
2.33.1



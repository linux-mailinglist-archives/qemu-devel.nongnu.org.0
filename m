Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C9536A382
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 00:43:06 +0200 (CEST)
Received: from localhost ([::1]:37062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laQzR-0003IO-Cw
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 18:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laQxl-0002IE-TC
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 18:41:21 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laQxk-0001Kb-KR
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 18:41:21 -0400
Received: by mail-wr1-x42f.google.com with SMTP id c4so13086958wrt.8
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 15:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p/zy/Z+Qd/eJr8yIhJGl9KIuGgPFWP7jni5e955+Gj0=;
 b=bZwEw5QPLaAwEu5tfWSUZAAPdBCl79RdxVCZCmM9LRObKOC+y8FsYLuJK4vPXK6yru
 ygLkqTR8XRxyzeQ3UHcmDWPGQ+Euu6shY6uYLBHCpYL5aDB2GocqVhO6dVhPxRctNTXe
 lLfHG28miJ9SyyFs0cOoGwuPkhV1bBHC6HCaX2oda2ATI5GGVSzih1ZhYNSkP3habVrK
 aswZ9p6aJxIfH3hiF+TtOxeV98ywIxuaa+JTKUHm9DUOkWtaLjGQaV77jvk8fOTY6rqL
 tUSRgt4G/FJIgQ9vqkQEQCh45c/KrFKvM9WsAlGTVoSNCS6NqeWPxnNz6LpierACstXm
 TBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p/zy/Z+Qd/eJr8yIhJGl9KIuGgPFWP7jni5e955+Gj0=;
 b=TlX4vKBqlS0qPjZGkvWuGEpHMfwspHNH5AUMOt7CvP+nYDQDNLDh+/xoDtuAlPAc0Y
 eK3nMN5XK/RmtSi9KyA8gmlyl0kQ6gceZGkbLNQPKi/B0DeIyYmYNXAOxaFHmZegrDge
 Q+JGnszXXp0MoWZ5ORqqTw+Iq6YqUTTZq7ZCyMxgqXIsoDnDBV+aZvSd3dcuQ3k/hQQh
 /NbfZd5mnKNjebypKpuoIBVVoe/dMY55T7lecW2xPIGB6nsRlJq49QjW+gvvULVTZRVR
 P5rEex+0BQDmvriMrtaGVVhWXsdUhCLmcECP375ubqI/PXxbgm/Faz2+iyvwqJBdIWo5
 hpBA==
X-Gm-Message-State: AOAM533WQUXVtAEuX10egE0JEts6RAEFzT0FmRdMzcCMm8RLJ6L5GLCz
 UKzh7uckEbopn1p+ICFmfmh91yv3MwwpKg==
X-Google-Smtp-Source: ABdhPJzkrHT+HIROFYkQGx1mWNVQf9Y4Ab+yLfmeBcMVlDCHxxDgsn5UVjHbA3kxHsTJtiSnhjwN7A==
X-Received: by 2002:a5d:4ccc:: with SMTP id c12mr13553277wrt.268.1619304078432; 
 Sat, 24 Apr 2021 15:41:18 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id e10sm13982097wrw.20.2021.04.24.15.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 15:41:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/usb/host-stub: Remove unused header
Date: Sun, 25 Apr 2021 00:41:09 +0200
Message-Id: <20210424224110.3442424-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210424224110.3442424-1-f4bug@amsat.org>
References: <20210424224110.3442424-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/host-stub.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/usb/host-stub.c b/hw/usb/host-stub.c
index 538ed29684c..80809ceba54 100644
--- a/hw/usb/host-stub.c
+++ b/hw/usb/host-stub.c
@@ -31,7 +31,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "ui/console.h"
 #include "hw/usb.h"
 #include "monitor/monitor.h"
 
-- 
2.26.3



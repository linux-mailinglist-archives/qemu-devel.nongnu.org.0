Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C57E53E521
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:46:01 +0200 (CEST)
Received: from localhost ([::1]:36780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyDzU-0002eW-E6
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr6-00020C-8M
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDqs-0000X4-SC
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GV6fJFZNyQM7Vlfi7lzQrg6nodQlBueopCSHj17DwEk=;
 b=Om1TqIbgY2TbErKRcBSPnFpQ68LQos2cVC0Vb9SMj1cnmVNCq3TT3ussPtTtIUO69t10T2
 Mdy7ZnaItKHcmlpGTNfiIYlPGWa3OdQZo3XTEN6fP3JkMBLxLQK1fxdP8qCG5gIMuplmRV
 GMxvXijM6COdIi5iqfBT4/44tscB4GE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-3A7YOR8-M_u55edosFU2EQ-1; Mon, 06 Jun 2022 10:37:01 -0400
X-MC-Unique: 3A7YOR8-M_u55edosFU2EQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 c11-20020adffb4b000000b0020ff998391dso2868251wrs.8
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GV6fJFZNyQM7Vlfi7lzQrg6nodQlBueopCSHj17DwEk=;
 b=uBhrF25GVlaXPzgdm4NjPMbpMLjLK/xCCQ5C+jS8jaSWQy/925W2sOVKKieGnhu8+l
 LgYt8PcOjApX61YncFsC+Vkd65X9NwSWJ94dh4q9in2/fc+N60E0x4Tr0Pqu8Ms/B4dM
 PTHytFquondZk7t4/TqQqLH9akKwbVYNH3med8+f34tDoUaVxqIOUuvDqKX7VTt0y0kc
 0x56FB6uSLuR9bvE0yIeRS83qAJFnmRZ1b37X84o3wHdsskvtJVw0ycCpxHgYwY2VI8E
 SRIt/obMpHPflCgH9SU36Vrw5P1ReV6wDOlBSAvU5es74TcVoF+ceuTZUUWcDpSuE5NS
 sNqQ==
X-Gm-Message-State: AOAM5324u9WkdLuzAZz1r9PtXYWf+iIiE1E+eJb2mYtR/o/cM4Jz70Yh
 RZSVc8RfOXWYm01L0uggMrEnulPgjw6pl8xrizfohLm1KfTVYDX7DG0ydL6aRFmnUD727rvJmw6
 lhwXl5yfY9AW1VROLBuR7SHRnq/ENlPl7o6iIeIyDwqDHUaFreXLm4SFWWgWICe7Lpis=
X-Received: by 2002:a05:600c:4fd2:b0:39b:893e:ff79 with SMTP id
 o18-20020a05600c4fd200b0039b893eff79mr39757315wmq.73.1654526219505; 
 Mon, 06 Jun 2022 07:36:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxD8VnhghkKWY31A7DunOMWZnYYXjV9UWCDYKKxBKHkSegoSJfk7QEJQokD7iWiB+QDaXQTUA==
X-Received: by 2002:a05:600c:4fd2:b0:39b:893e:ff79 with SMTP id
 o18-20020a05600c4fd200b0039b893eff79mr39757296wmq.73.1654526219287; 
 Mon, 06 Jun 2022 07:36:59 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 o22-20020a1c7516000000b003942a244ed1sm17015441wmc.22.2022.06.06.07.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:36:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 06/29] replay: fix event queue flush for qemu shutdown
Date: Mon,  6 Jun 2022 16:36:21 +0200
Message-Id: <20220606143644.1151112-7-pbonzini@redhat.com>
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

This patch fixes event queue flush in the case of emulator
shutdown. replay_finish_events should be called when replay_mode
is not cleared.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <165364836758.688121.7959245442743676491.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 replay/replay.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/replay/replay.c b/replay/replay.c
index 6df2abc18c..2d3607998a 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -387,9 +387,8 @@ void replay_finish(void)
     g_free(replay_snapshot);
     replay_snapshot = NULL;
 
-    replay_mode = REPLAY_MODE_NONE;
-
     replay_finish_events();
+    replay_mode = REPLAY_MODE_NONE;
 }
 
 void replay_add_blocker(Error *reason)
-- 
2.36.1




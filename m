Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB1337A565
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 13:01:57 +0200 (CEST)
Received: from localhost ([::1]:50340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQ9E-0005Xv-EA
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 07:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgPqA-0006B6-G7
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:42:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgPq8-0002Fw-Ug
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:42:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620729732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X1iTG1yjolMhBDy0+VNZDVcooHD0ZAJOzdWx2SUtTQk=;
 b=On6vwHEwNlKr1gHzj24sEI5QyEA/fCY3hpd3wdyHi/HmtssCjNi68E2ozeTfvtKHvbxWHh
 /AjlMSccCpyrEYE9tlxfbV1XnsnTNWDos0zhgKj+pC8Qv3XSKWIWu2yB/gwbNF0UOh6ZPa
 11pblbo10FrBKMbWxUCGRtaiNfhfl4g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-kZBhTU0CMKqSRC6_EQN_GA-1; Tue, 11 May 2021 06:42:10 -0400
X-MC-Unique: kZBhTU0CMKqSRC6_EQN_GA-1
Received: by mail-wm1-f72.google.com with SMTP id
 b128-20020a1c1b860000b029015b52bdb65aso879607wmb.5
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 03:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X1iTG1yjolMhBDy0+VNZDVcooHD0ZAJOzdWx2SUtTQk=;
 b=KhBLOmFv1ZiCKDmNl5SEQhxfbN7CDAetXN3BNvoDmlr+MCEfoqP701fE4mCv5Y/sHY
 u2pJRq98rDdmClrZq99zpmX+3Zsh0tLWIiTbRg4rX2qAryzmDHrSx2VX/UV93EhNlflc
 CO1PIqBdhCinvtw+/RsPjmpLzKSwUeqZJn7X3YwWbWjfMST7vf05zSYqjxhzN1J+u+WN
 /CO4I5m9wJzBqKFFbYr5V/boAvVR7kPL4qqwjcJQeKiCiqDsZbKo1RlgQjTFQUQA5Gxv
 M/G3xtWcBKD1lGmwnjGOsM1nPIUP29b29DibbQx+ajbAABbSjeHP/e/UX7/4DtYzLWQG
 WQEg==
X-Gm-Message-State: AOAM530u0ZDiITcGcUe9kjxKjUSC0jbfs7/cZ4vstJa9DyGCR6Tbekgs
 VPCKkgD3D6r+e7nAEfX6UsUgF6zJYVeU3KiS9XtN677swOvqVZ1UBmnJk4T/oLuTGNgFtvnZQ0a
 9sy2GuQC/fPPz0lf0YyHo8QyLJdWzwUoMu7+P9Pma34vef2W/l/SyqZQTEPPxa8Wa
X-Received: by 2002:adf:e510:: with SMTP id j16mr37794837wrm.28.1620729728419; 
 Tue, 11 May 2021 03:42:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzv5XBBZ0qMOazznFfZigWz5hluW3ryczVSzJckCIkkWIplwaxlHe9vrbqbQHM2e8YxGory/A==
X-Received: by 2002:adf:e510:: with SMTP id j16mr37794809wrm.28.1620729728226; 
 Tue, 11 May 2021 03:42:08 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id r18sm1394695wmp.0.2021.05.11.03.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 03:42:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] virtio-blk: Constify VirtIOFeature feature_sizes[]
Date: Tue, 11 May 2021 12:41:56 +0200
Message-Id: <20210511104157.2880306-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511104157.2880306-1-philmd@redhat.com>
References: <20210511104157.2880306-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/virtio-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index d28979efb8d..f139cd7cc9c 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -40,7 +40,7 @@
  * Starting from the discard feature, we can use this array to properly
  * set the config size depending on the features enabled.
  */
-static VirtIOFeature feature_sizes[] = {
+static const VirtIOFeature feature_sizes[] = {
     {.flags = 1ULL << VIRTIO_BLK_F_DISCARD,
      .end = endof(struct virtio_blk_config, discard_sector_alignment)},
     {.flags = 1ULL << VIRTIO_BLK_F_WRITE_ZEROES,
-- 
2.26.3



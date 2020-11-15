Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37932B39ED
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 23:37:20 +0100 (CET)
Received: from localhost ([::1]:47510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keQe7-0000Nr-V3
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 17:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQV5-0000nH-5W
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQV3-0001an-CX
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605479276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YyzcHr5pc04nBGrUs6cDVbhWISou0mXaM0HOd2coAqQ=;
 b=GNzITIogQg/ky7wY5NLYOgNzzmTN18Glq7l75a8Stq/xzFejvJqeuQNcOFWCevwOpq6r51
 SPzEfXyGElj9Q0rMYGCm4vYRKWW4Dirjy6qkFRFJoxwetSQHhDmNzx6x1I5JzMgEjuzgnT
 yMkGu2iC7Ah/Kdlxot2TJi7Qo9fOhDU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-HYbVd5XFPYSHnPaNEoJHng-1; Sun, 15 Nov 2020 17:27:54 -0500
X-MC-Unique: HYbVd5XFPYSHnPaNEoJHng-1
Received: by mail-wr1-f70.google.com with SMTP id h29so9781111wrb.13
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 14:27:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YyzcHr5pc04nBGrUs6cDVbhWISou0mXaM0HOd2coAqQ=;
 b=Sa/hOTB9Idge863/HxE+YrUP7jBhpt4+nndqfM5TaZXDhZ20iX1IHwcKknhOB1sC/x
 4gLwF2+IjMqgE0oil/nAIeOPGVPVsXQrqRVTWDLyeSjmn9KgJ8cYBmVp1x8hk2hDxPhX
 mOAAaiqd0Kg7NzxXQPBqfGg9LGWrdwFs6ePkp1CK4Jf5QfSkP58256s8etvtKTpfiYwl
 yp3kKSkT9Uz0ogGaTYxHA0/xyI4yauULS41ddL6LqeQSpNn2X5IqbIyfFeyWJPTk2O/1
 2DI7dGBWb0O6yAzGHpXGu/JNpnbr4kVDQFIrgx6gAOtN5EoyQpg7Bi5T/JIkWuXVih5i
 45tQ==
X-Gm-Message-State: AOAM5304rEqgVdgArvSj4lpqmjwXQgjN4zz2ArD9v5RtB5tY83fQiGhG
 B3UJVfFfdnqLLo/MybcqL4MNKmdQSHqLvajw+w58bfciSWbLdMveJ9Uml7jaia7CQ84PzxILFAY
 l1pAQWZCGqQ2A5ID8xO6HwD9hD5AzTOPmadlGQXyHZDInvMgypgx7+k9/OaDp
X-Received: by 2002:a7b:c308:: with SMTP id k8mr12162974wmj.76.1605479273333; 
 Sun, 15 Nov 2020 14:27:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyiBV0BfKIjzqEP7c1f2dUze+a2fGG1cQ+0nYrhFZy96TkLi/mO129cta4PJnvqG7dCAIr+uA==
X-Received: by 2002:a7b:c308:: with SMTP id k8mr12162955wmj.76.1605479273116; 
 Sun, 15 Nov 2020 14:27:53 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id t74sm17810566wmt.8.2020.11.15.14.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 14:27:52 -0800 (PST)
Date: Sun, 15 Nov 2020 17:27:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/17] block/export: port virtio-blk read/write range check
Message-ID: <20201115220740.488850-16-mst@redhat.com>
References: <20201115220740.488850-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201115220740.488850-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 16:39:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Check that the sector number and byte count are valid.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201111124331.1393747-11-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 block/export/vhost-user-blk-server.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index d88e41714d..6d7fd0fec3 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -214,9 +214,23 @@ static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
         QEMUIOVector qiov;
         if (is_write) {
             qemu_iovec_init_external(&qiov, out_iov, out_num);
+
+            if (unlikely(!vu_blk_sect_range_ok(vexp, req->sector_num,
+                                               qiov.size))) {
+                req->in->status = VIRTIO_BLK_S_IOERR;
+                break;
+            }
+
             ret = blk_co_pwritev(blk, offset, qiov.size, &qiov, 0);
         } else {
             qemu_iovec_init_external(&qiov, in_iov, in_num);
+
+            if (unlikely(!vu_blk_sect_range_ok(vexp, req->sector_num,
+                                               qiov.size))) {
+                req->in->status = VIRTIO_BLK_S_IOERR;
+                break;
+            }
+
             ret = blk_co_preadv(blk, offset, qiov.size, &qiov, 0);
         }
         if (ret >= 0) {
-- 
MST



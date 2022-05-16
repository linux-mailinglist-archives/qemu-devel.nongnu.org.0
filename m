Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9E75283F7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:16:47 +0200 (CEST)
Received: from localhost ([::1]:60464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZeY-0006vm-H9
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9J-0002dH-C6
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9H-0005m8-4j
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JyIahbS4OZdt1tqLpTxbnEQNK1KVz8nAfhMMVVMnJ7c=;
 b=BLIqvvCDgrXWrgBKYzC8GsWpwqb4Mrp2eSiODScruH07eK+01p1wLQGNBXq6GMWYINsnyv
 t5PIn+ZednYfT37BV2nKlwY0D32auggd3C95PNYWNmHQE2IOFaGyYVQABj+J4nY2vjB+DZ
 l+s37SMQH6drUaujS/ViEL1s7bBBCoc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-fP7p-tqCN4iUKpyyc6ZXEA-1; Mon, 16 May 2022 06:40:20 -0400
X-MC-Unique: fP7p-tqCN4iUKpyyc6ZXEA-1
Received: by mail-wm1-f70.google.com with SMTP id
 e9-20020a05600c4e4900b00394779649b1so10154507wmq.3
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JyIahbS4OZdt1tqLpTxbnEQNK1KVz8nAfhMMVVMnJ7c=;
 b=b2NWNGZLU2z23m8+SKH6y2aSt0uD9nkYsjY8qY7Z72d8+qU5DMw1S/mO5IUiB/j1t0
 3OGHjZChJ2toWKh3Lf/63OuQiazXUGiWfHz0C+K7JU3FuAQxr8KBJ/qGBXzbVMlwBhiF
 PujWnrXFJM/9dbwiITRD0bKUuU7oLg9pn8yT81Qpf8Dt58l3PvuJmCo1oOzrNpbLnTtu
 ah+j379CQtnbPWXf7bUCcHdEn4PSUS1MotMZlFoSg782FViEdqaa28jZQYKsUD1twKQr
 3c16HhzG6jflgqTsvMmsmOWn5tCxPzd9FzP79Lua27R4S5R0Tk33/uukjeL7Q0B5ir5q
 E0Qw==
X-Gm-Message-State: AOAM531y7NTix8V/35vpeyVXVDhEL/QqW3d3XcGkLjyM9BdfI3h5gIf1
 SOVbNdiHQkOG3Uvo6TQGGVOR2vPiLd6l+0kqYgxw+lWnwE4Eq4eLOq4hG1ByLouAThgiYsC5LL5
 xSmfP2g1mGJVXTLSJ5ckHyTtHAKsXBQ27o21JtdmEIhLjto3E/u0ZJ4E7UxXa
X-Received: by 2002:adf:aaca:0:b0:20c:fedb:6685 with SMTP id
 i10-20020adfaaca000000b0020cfedb6685mr7529446wrc.596.1652697618878; 
 Mon, 16 May 2022 03:40:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzy20NgV69to2MCfz3qV0S+dkwyeV0SRc44AMY5JSyku3j2D5PmAHPOxt7dlDinhiJm9TvEZA==
X-Received: by 2002:adf:aaca:0:b0:20c:fedb:6685 with SMTP id
 i10-20020adfaaca000000b0020cfedb6685mr7529424wrc.596.1652697618501; 
 Mon, 16 May 2022 03:40:18 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 r5-20020adfbb05000000b0020d00174eabsm5826511wrg.94.2022.05.16.03.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:40:18 -0700 (PDT)
Date: Mon, 16 May 2022 06:40:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 79/91] docs/vhost-user: Clarifications for
 VHOST_USER_ADD/REM_MEM_REG
Message-ID: <20220516095448.507876-80-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Kevin Wolf <kwolf@redhat.com>

The specification for VHOST_USER_ADD/REM_MEM_REG messages is unclear
in several points, which has led to clients having incompatible
implementations. This changes the specification to be more explicit
about them:

* VHOST_USER_ADD_MEM_REG is not specified as receiving a file
  descriptor, though it obviously does need to do so. All
  implementations agree on this one, fix the specification.

* VHOST_USER_REM_MEM_REG is not specified as receiving a file
  descriptor either, and it also has no reason to do so. rust-vmm does
  not send file descriptors for removing a memory region (in agreement
  with the specification), libvhost-user and QEMU do (which is a bug),
  though libvhost-user doesn't actually make any use of it.

  Change the specification so that for compatibility QEMU's behaviour
  becomes legal, even if discouraged, but rust-vmm's behaviour becomes
  the explicitly recommended mode of operation.

* VHOST_USER_ADD_MEM_REG doesn't have a documented return value, which
  is the desired behaviour in the non-postcopy case. It also implemented
  like this in QEMU and rust-vmm, though libvhost-user is buggy and
  sometimes sends an unexpected reply. This will be fixed in a separate
  patch.

  However, in postcopy mode it does reply like VHOST_USER_SET_MEM_TABLE.
  This behaviour is shared between libvhost-user and QEMU; rust-vmm
  doesn't implement postcopy mode yet. Mention it explicitly in the
  spec.

* The specification doesn't mention how VHOST_USER_REM_MEM_REG
  identifies the memory region to be removed. Change it to describe the
  existing behaviour of libvhost-user (guest address, user address and
  size must match).

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20220407133657.155281-2-kwolf@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/interop/vhost-user.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 3c12607517..a99ba4433c 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -1376,6 +1376,14 @@ Front-end message types
   For further details on postcopy, see ``VHOST_USER_SET_MEM_TABLE``.
   They apply to ``VHOST_USER_ADD_MEM_REG`` accordingly.
 
+  Exactly one file descriptor from which the memory is mapped is
+  passed in the ancillary data.
+
+  In postcopy mode (see ``VHOST_USER_POSTCOPY_LISTEN``), the back-end
+  replies with the bases of the memory mapped region to the front-end.
+  For further details on postcopy, see ``VHOST_USER_SET_MEM_TABLE``.
+  They apply to ``VHOST_USER_ADD_MEM_REG`` accordingly.
+
 ``VHOST_USER_REM_MEM_REG``
   :id: 38
   :equivalent ioctl: N/A
@@ -1400,6 +1408,14 @@ Front-end message types
   accept messages with one file descriptor. If a file descriptor is
   passed, the back-end MUST close it without using it otherwise.
 
+  The memory region to be removed is identified by its guest address,
+  user address and size. The mmap offset is ignored.
+
+  No file descriptors SHOULD be passed in the ancillary data. For
+  compatibility with existing incorrect implementations, the back-end MAY
+  accept messages with one file descriptor. If a file descriptor is
+  passed, the back-end MUST close it without using it otherwise.
+
 ``VHOST_USER_SET_STATUS``
   :id: 39
   :equivalent ioctl: VHOST_VDPA_SET_STATUS
-- 
MST



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86A94F80FD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 15:51:14 +0200 (CEST)
Received: from localhost ([::1]:44132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncSXZ-0003rz-Rw
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 09:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ncSKw-000235-Qs
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:38:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ncSKv-0001Es-5q
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649338685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKy17Zglmykr9MbAWfmwpdaYoLUfmCReqddqj733UTU=;
 b=b9SLf2hb12ZKWTROGpS8pnvwpj26B86vR7GPz7A6LBsGYW+hlmOV2viCXLXlryq5MbeObk
 mxwodnAkIAsjIV7g/UTPh87gQulsq7aR+QM2eW/siO9YG6WnzRy7AZgfEOqLo1N4UD0OH1
 01mfqz1iC8OCA9ASTl6eDDMmN0bopFI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-X4TG9B57NweyztyufkJbNg-1; Thu, 07 Apr 2022 09:38:03 -0400
X-MC-Unique: X4TG9B57NweyztyufkJbNg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 990DF3C13A24;
 Thu,  7 Apr 2022 13:37:52 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA4BB54AC96;
 Thu,  7 Apr 2022 13:37:50 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] docs/vhost-user: Clarifications for
 VHOST_USER_ADD/REM_MEM_REG
Date: Thu,  7 Apr 2022 15:36:55 +0200
Message-Id: <20220407133657.155281-2-kwolf@redhat.com>
In-Reply-To: <20220407133657.155281-1-kwolf@redhat.com>
References: <20220407133657.155281-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, raphael.norwitz@nutanix.com, qemu-block@nongnu.org,
 stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 docs/interop/vhost-user.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 4dbc84fd00..f9e721ba5f 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -308,6 +308,7 @@ replies. Here is a list of the ones that do:
 There are several messages that the master sends with file descriptors passed
 in the ancillary data:
 
+* ``VHOST_USER_ADD_MEM_REG``
 * ``VHOST_USER_SET_MEM_TABLE``
 * ``VHOST_USER_SET_LOG_BASE`` (if ``VHOST_USER_PROTOCOL_F_LOG_SHMFD``)
 * ``VHOST_USER_SET_LOG_FD``
@@ -1334,6 +1335,14 @@ Master message types
   ``VHOST_USER_REM_MEM_REG`` message, this message is used to set and
   update the memory tables of the slave device.
 
+  Exactly one file descriptor from which the memory is mapped is
+  passed in the ancillary data.
+
+  In postcopy mode (see ``VHOST_USER_POSTCOPY_LISTEN``), the slave
+  replies with the bases of the memory mapped region to the master.
+  For further details on postcopy, see ``VHOST_USER_SET_MEM_TABLE``.
+  They apply to ``VHOST_USER_ADD_MEM_REG`` accordingly.
+
 ``VHOST_USER_REM_MEM_REG``
   :id: 38
   :equivalent ioctl: N/A
@@ -1349,6 +1358,14 @@ Master message types
   ``VHOST_USER_ADD_MEM_REG`` message, this message is used to set and
   update the memory tables of the slave device.
 
+  The memory region to be removed is identified by its guest address,
+  user address and size. The mmap offset is ignored.
+
+  No file descriptors SHOULD be passed in the ancillary data. For
+  compatibility with existing incorrect implementations, the slave MAY
+  accept messages with one file descriptor. If a file descriptor is
+  passed, the slave MUST close it without using it otherwise.
+
 ``VHOST_USER_SET_STATUS``
   :id: 39
   :equivalent ioctl: VHOST_VDPA_SET_STATUS
-- 
2.35.1



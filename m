Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8615F337013
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:34:43 +0100 (CET)
Received: from localhost ([::1]:40076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIeQ-0004Pm-I2
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:34:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKIcv-0002Yb-J2
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:33:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKIcr-0005eB-LX
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:33:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615458785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/99h6TfCR3pAsmKhZm5mKjTif2mO+t7aYAaYGvoa9JI=;
 b=HZwi9EcTc3x7kKW1ZxvSD3RmzASjFECksKYMMpoAnUjteKH0Sboq+AJShs8wANrkJOswsP
 fxARUkPfy4cuv0H0bdmHhgUgotVYhAwiOiErk4k32L5EqKVOeXyhwWIWqvCyEbJJTn2E1p
 wOKECvTQh1pT+Eal7P0UG0dsAFAHmpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-C3XAVkpsMH28TZxDfOEKsQ-1; Thu, 11 Mar 2021 05:33:03 -0500
X-MC-Unique: C3XAVkpsMH28TZxDfOEKsQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50A411015C8F
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 10:33:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEA4A5DF26;
 Thu, 11 Mar 2021 10:33:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] docs: vhost-user: clean up request/reply description
Date: Thu, 11 Mar 2021 05:32:44 -0500
Message-Id: <20210311103250.532191-2-pbonzini@redhat.com>
In-Reply-To: <20210311103250.532191-1-pbonzini@redhat.com>
References: <20210311103250.532191-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: marcandre.lureau@redhat.com, stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is not necessary to mention which side is sending/receiving
each payload; it is more interesting to say which is the request
and which is the reply.  This also matches what vhost-user-gpu.rst
already does.

While at it, ensure that all messages list both the request and
the reply payload.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/interop/vhost-user.rst | 166 +++++++++++++++++++++---------------
 1 file changed, 98 insertions(+), 68 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index d6085f7045..4c46b16416 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -838,11 +838,14 @@ Protocol features
 Master message types
 --------------------
 
+For this type of message, the request is sent by the master and the
+reply is sent by the slave.
+
 ``VHOST_USER_GET_FEATURES``
   :id: 1
   :equivalent ioctl: ``VHOST_GET_FEATURES``
-  :master payload: N/A
-  :slave payload: ``u64``
+  :request payload: N/A
+  :reply payload: ``u64``
 
   Get from the underlying vhost implementation the features bitmask.
   Feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` signals slave support
@@ -852,7 +855,8 @@ Master message types
 ``VHOST_USER_SET_FEATURES``
   :id: 2
   :equivalent ioctl: ``VHOST_SET_FEATURES``
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Enable features in the underlying vhost implementation using a
   bitmask.  Feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` signals
@@ -862,8 +866,8 @@ Master message types
 ``VHOST_USER_GET_PROTOCOL_FEATURES``
   :id: 15
   :equivalent ioctl: ``VHOST_GET_FEATURES``
-  :master payload: N/A
-  :slave payload: ``u64``
+  :request payload: N/A
+  :reply payload: ``u64``
 
   Get the protocol feature bitmask from the underlying vhost
   implementation.  Only legal if feature bit
@@ -878,7 +882,8 @@ Master message types
 ``VHOST_USER_SET_PROTOCOL_FEATURES``
   :id: 16
   :equivalent ioctl: ``VHOST_SET_FEATURES``
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Enable protocol features in the underlying vhost implementation.
 
@@ -892,7 +897,8 @@ Master message types
 ``VHOST_USER_SET_OWNER``
   :id: 3
   :equivalent ioctl: ``VHOST_SET_OWNER``
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
   Issued when a new connection is established. It sets the current
   *master* as an owner of the session. This can be used on the *slave*
@@ -900,7 +906,8 @@ Master message types
 
 ``VHOST_USER_RESET_OWNER``
   :id: 4
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
 .. admonition:: Deprecated
 
@@ -913,8 +920,8 @@ Master message types
 ``VHOST_USER_SET_MEM_TABLE``
   :id: 5
   :equivalent ioctl: ``VHOST_SET_MEM_TABLE``
-  :master payload: memory regions description
-  :slave payload: (postcopy only) memory regions description
+  :request payload: memory regions description
+  :reply payload: (postcopy only) memory regions description
 
   Sets the memory map regions on the slave so it can translate the
   vring addresses. In the ancillary data there is an array of file
@@ -937,8 +944,8 @@ Master message types
 ``VHOST_USER_SET_LOG_BASE``
   :id: 6
   :equivalent ioctl: ``VHOST_SET_LOG_BASE``
-  :master payload: u64
-  :slave payload: N/A
+  :request payload: u64
+  :reply payload: N/A
 
   Sets logging shared memory space.
 
@@ -950,44 +957,48 @@ Master message types
 ``VHOST_USER_SET_LOG_FD``
   :id: 7
   :equivalent ioctl: ``VHOST_SET_LOG_FD``
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
   Sets the logging file descriptor, which is passed as ancillary data.
 
 ``VHOST_USER_SET_VRING_NUM``
   :id: 8
   :equivalent ioctl: ``VHOST_SET_VRING_NUM``
-  :master payload: vring state description
+  :request payload: vring state description
+  :reply payload: N/A
 
   Set the size of the queue.
 
 ``VHOST_USER_SET_VRING_ADDR``
   :id: 9
   :equivalent ioctl: ``VHOST_SET_VRING_ADDR``
-  :master payload: vring address description
-  :slave payload: N/A
+  :request payload: vring address description
+  :reply payload: N/A
 
   Sets the addresses of the different aspects of the vring.
 
 ``VHOST_USER_SET_VRING_BASE``
   :id: 10
   :equivalent ioctl: ``VHOST_SET_VRING_BASE``
-  :master payload: vring state description
+  :request payload: vring state description
+  :reply payload: N/A
 
   Sets the base offset in the available vring.
 
 ``VHOST_USER_GET_VRING_BASE``
   :id: 11
   :equivalent ioctl: ``VHOST_USER_GET_VRING_BASE``
-  :master payload: vring state description
-  :slave payload: vring state description
+  :request payload: vring state description
+  :reply payload: vring state description
 
   Get the available vring base offset.
 
 ``VHOST_USER_SET_VRING_KICK``
   :id: 12
   :equivalent ioctl: ``VHOST_SET_VRING_KICK``
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Set the event file descriptor for adding buffers to the vring. It is
   passed in the ancillary data.
@@ -1005,7 +1016,8 @@ Master message types
 ``VHOST_USER_SET_VRING_CALL``
   :id: 13
   :equivalent ioctl: ``VHOST_SET_VRING_CALL``
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Set the event file descriptor to signal when buffers are used. It is
   passed in the ancillary data.
@@ -1023,7 +1035,8 @@ Master message types
 ``VHOST_USER_SET_VRING_ERR``
   :id: 14
   :equivalent ioctl: ``VHOST_SET_VRING_ERR``
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Set the event file descriptor to signal when error occurs. It is
   passed in the ancillary data.
@@ -1040,8 +1053,8 @@ Master message types
 ``VHOST_USER_GET_QUEUE_NUM``
   :id: 17
   :equivalent ioctl: N/A
-  :master payload: N/A
-  :slave payload: u64
+  :request payload: N/A
+  :reply payload: u64
 
   Query how many queues the backend supports.
 
@@ -1052,7 +1065,8 @@ Master message types
 ``VHOST_USER_SET_VRING_ENABLE``
   :id: 18
   :equivalent ioctl: N/A
-  :master payload: vring state description
+  :request payload: vring state description
+  :reply payload: N/A
 
   Signal slave to enable or disable corresponding vring.
 
@@ -1062,7 +1076,8 @@ Master message types
 ``VHOST_USER_SEND_RARP``
   :id: 19
   :equivalent ioctl: N/A
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Ask vhost user backend to broadcast a fake RARP to notify the migration
   is terminated for guest that does not support GUEST_ANNOUNCE.
@@ -1077,7 +1092,8 @@ Master message types
 ``VHOST_USER_NET_SET_MTU``
   :id: 20
   :equivalent ioctl: N/A
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Set host MTU value exposed to the guest.
 
@@ -1094,7 +1110,8 @@ Master message types
 ``VHOST_USER_SET_SLAVE_REQ_FD``
   :id: 21
   :equivalent ioctl: N/A
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
   Set the socket file descriptor for slave initiated requests. It is passed
   in the ancillary data.
@@ -1109,8 +1126,8 @@ Master message types
 ``VHOST_USER_IOTLB_MSG``
   :id: 22
   :equivalent ioctl: N/A (equivalent to ``VHOST_IOTLB_MSG`` message type)
-  :master payload: ``struct vhost_iotlb_msg``
-  :slave payload: ``u64``
+  :request payload: ``struct vhost_iotlb_msg``
+  :reply payload: ``u64``
 
   Send IOTLB messages with ``struct vhost_iotlb_msg`` as payload.
 
@@ -1124,7 +1141,8 @@ Master message types
 ``VHOST_USER_SET_VRING_ENDIAN``
   :id: 23
   :equivalent ioctl: ``VHOST_SET_VRING_ENDIAN``
-  :master payload: vring state description
+  :request payload: vring state description
+  :reply payload: N/A
 
   Set the endianness of a VQ for legacy devices. Little-endian is
   indicated with state.num set to 0 and big-endian is indicated with
@@ -1139,8 +1157,8 @@ Master message types
 ``VHOST_USER_GET_CONFIG``
   :id: 24
   :equivalent ioctl: N/A
-  :master payload: virtio device config space
-  :slave payload: virtio device config space
+  :request payload: virtio device config space
+  :reply payload: virtio device config space
 
   When ``VHOST_USER_PROTOCOL_F_CONFIG`` is negotiated, this message is
   submitted by the vhost-user master to fetch the contents of the
@@ -1153,8 +1171,8 @@ Master message types
 ``VHOST_USER_SET_CONFIG``
   :id: 25
   :equivalent ioctl: N/A
-  :master payload: virtio device config space
-  :slave payload: N/A
+  :request payload: virtio device config space
+  :reply payload: N/A
 
   When ``VHOST_USER_PROTOCOL_F_CONFIG`` is negotiated, this message is
   submitted by the vhost-user master when the Guest changes the virtio
@@ -1166,8 +1184,8 @@ Master message types
 ``VHOST_USER_CREATE_CRYPTO_SESSION``
   :id: 26
   :equivalent ioctl: N/A
-  :master payload: crypto session description
-  :slave payload: crypto session description
+  :request payload: crypto session description
+  :reply payload: crypto session description
 
   Create a session for crypto operation. The server side must return
   the session id, 0 or positive for success, negative for failure.
@@ -1179,7 +1197,8 @@ Master message types
 ``VHOST_USER_CLOSE_CRYPTO_SESSION``
   :id: 27
   :equivalent ioctl: N/A
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   Close a session for crypto operation which was previously
   created by ``VHOST_USER_CREATE_CRYPTO_SESSION``.
@@ -1191,8 +1210,8 @@ Master message types
 
 ``VHOST_USER_POSTCOPY_ADVISE``
   :id: 28
-  :master payload: N/A
-  :slave payload: userfault fd
+  :request payload: N/A
+  :reply payload: userfault fd
 
   When ``VHOST_USER_PROTOCOL_F_PAGEFAULT`` is supported, the master
   advises slave that a migration with postcopy enabled is underway,
@@ -1201,7 +1220,8 @@ Master message types
 
 ``VHOST_USER_POSTCOPY_LISTEN``
   :id: 29
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
   Master advises slave that a transition to postcopy mode has
   happened.  The slave must ensure that shared memory is registered
@@ -1212,10 +1232,11 @@ Master message types
 
 ``VHOST_USER_POSTCOPY_END``
   :id: 30
-  :slave payload: ``u64``
+  :request payload: N/A
+  :reply payload: ``u64``
 
   Master advises that postcopy migration has now completed.  The slave
-  must disable the userfaultfd. The response is an acknowledgement
+  must disable the userfaultfd. The reply is an acknowledgement
   only.
 
   When ``VHOST_USER_PROTOCOL_F_PAGEFAULT`` is supported, this message
@@ -1227,7 +1248,8 @@ Master message types
 ``VHOST_USER_GET_INFLIGHT_FD``
   :id: 31
   :equivalent ioctl: N/A
-  :master payload: inflight description
+  :request payload: inflight description
+  :reply payload: N/A
 
   When ``VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD`` protocol feature has
   been successfully negotiated, this message is submitted by master to
@@ -1238,7 +1260,8 @@ Master message types
 ``VHOST_USER_SET_INFLIGHT_FD``
   :id: 32
   :equivalent ioctl: N/A
-  :master payload: inflight description
+  :request payload: inflight description
+  :reply payload: N/A
 
   When ``VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD`` protocol feature has
   been successfully negotiated, this message is submitted by master to
@@ -1248,7 +1271,8 @@ Master message types
 ``VHOST_USER_GPU_SET_SOCKET``
   :id: 33
   :equivalent ioctl: N/A
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
   Sets the GPU protocol socket file descriptor, which is passed as
   ancillary data. The GPU protocol is used to inform the master of
@@ -1257,8 +1281,8 @@ Master message types
 ``VHOST_USER_RESET_DEVICE``
   :id: 34
   :equivalent ioctl: N/A
-  :master payload: N/A
-  :slave payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
   Ask the vhost user backend to disable all rings and reset all
   internal device state to the initial state, ready to be
@@ -1271,8 +1295,8 @@ Master message types
 ``VHOST_USER_VRING_KICK``
   :id: 35
   :equivalent ioctl: N/A
-  :slave payload: vring state description
-  :master payload: N/A
+  :request payload: vring state description
+  :reply payload: N/A
 
   When the ``VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS`` protocol
   feature has been successfully negotiated, this message may be
@@ -1285,7 +1309,8 @@ Master message types
 ``VHOST_USER_GET_MAX_MEM_SLOTS``
   :id: 36
   :equivalent ioctl: N/A
-  :slave payload: u64
+  :request payload: N/A
+  :reply payload: u64
 
   When the ``VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS`` protocol
   feature has been successfully negotiated, this message is submitted
@@ -1298,7 +1323,8 @@ Master message types
 ``VHOST_USER_ADD_MEM_REG``
   :id: 37
   :equivalent ioctl: N/A
-  :slave payload: single memory region description
+  :request payload: N/A
+  :reply payload: single memory region description
 
   When the ``VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS`` protocol
   feature has been successfully negotiated, this message is submitted
@@ -1313,7 +1339,8 @@ Master message types
 ``VHOST_USER_REM_MEM_REG``
   :id: 38
   :equivalent ioctl: N/A
-  :slave payload: single memory region description
+  :request payload: N/A
+  :reply payload: single memory region description
 
   When the ``VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS`` protocol
   feature has been successfully negotiated, this message is submitted
@@ -1328,8 +1355,8 @@ Master message types
 ``VHOST_USER_SET_STATUS``
   :id: 39
   :equivalent ioctl: VHOST_VDPA_SET_STATUS
-  :slave payload: N/A
-  :master payload: ``u64``
+  :request payload: ``u64``
+  :reply payload: N/A
 
   When the ``VHOST_USER_PROTOCOL_F_STATUS`` protocol feature has been
   successfully negotiated, this message is submitted by the master to
@@ -1339,8 +1366,8 @@ Master message types
 ``VHOST_USER_GET_STATUS``
   :id: 40
   :equivalent ioctl: VHOST_VDPA_GET_STATUS
-  :slave payload: ``u64``
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: ``u64``
 
   When the ``VHOST_USER_PROTOCOL_F_STATUS`` protocol feature has been
   successfully negotiated, this message is submitted by the master to
@@ -1351,11 +1378,14 @@ Master message types
 Slave message types
 -------------------
 
+For this type of message, the request is sent by the slave and the reply
+is sent by the master.
+
 ``VHOST_USER_SLAVE_IOTLB_MSG``
   :id: 1
   :equivalent ioctl: N/A (equivalent to ``VHOST_IOTLB_MSG`` message type)
-  :slave payload: ``struct vhost_iotlb_msg``
-  :master payload: N/A
+  :request payload: ``struct vhost_iotlb_msg``
+  :reply payload: N/A
 
   Send IOTLB messages with ``struct vhost_iotlb_msg`` as payload.
   Slave sends such requests to notify of an IOTLB miss, or an IOTLB
@@ -1369,8 +1399,8 @@ Slave message types
 ``VHOST_USER_SLAVE_CONFIG_CHANGE_MSG``
   :id: 2
   :equivalent ioctl: N/A
-  :slave payload: N/A
-  :master payload: N/A
+  :request payload: N/A
+  :reply payload: N/A
 
   When ``VHOST_USER_PROTOCOL_F_CONFIG`` is negotiated, vhost-user
   slave sends such messages to notify that the virtio device's
@@ -1384,8 +1414,8 @@ Slave message types
 ``VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG``
   :id: 3
   :equivalent ioctl: N/A
-  :slave payload: vring area description
-  :master payload: N/A
+  :request payload: vring area description
+  :reply payload: N/A
 
   Sets host notifier for a specified queue. The queue index is
   contained in the ``u64`` field of the vring area description. The
@@ -1407,8 +1437,8 @@ Slave message types
 ``VHOST_USER_SLAVE_VRING_CALL``
   :id: 4
   :equivalent ioctl: N/A
-  :slave payload: vring state description
-  :master payload: N/A
+  :request payload: vring state description
+  :reply payload: N/A
 
   When the ``VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS`` protocol
   feature has been successfully negotiated, this message may be
@@ -1421,8 +1451,8 @@ Slave message types
 ``VHOST_USER_SLAVE_VRING_ERR``
   :id: 5
   :equivalent ioctl: N/A
-  :slave payload: vring state description
-  :master payload: N/A
+  :request payload: vring state description
+  :reply payload: N/A
 
   When the ``VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS`` protocol
   feature has been successfully negotiated, this message may be
@@ -1448,7 +1478,7 @@ client MUST respond with a Payload ``VhostUserMsg`` indicating success
 or failure. The payload should be set to zero on success or non-zero
 on failure, unless the message already has an explicit reply body.
 
-The response payload gives QEMU a deterministic indication of the result
+The reply payload gives QEMU a deterministic indication of the result
 of the command. Today, QEMU is expected to terminate the main vhost-user
 loop upon receiving such errors. In future, qemu could be taught to be more
 resilient for selective requests.
-- 
2.26.2




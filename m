Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1122E337031
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:40:14 +0100 (CET)
Received: from localhost ([::1]:56718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIjl-0003Tv-2j
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:40:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKIcw-0002ap-Vt
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:33:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKIct-0005f0-AT
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615458786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TAodmZ+Do/ZOTZrVCcOUAmzLxA2scUdv9ira0Sq1dLM=;
 b=XcBjxCVizF0K2ScFdkzHkbMoK6/EBx9p6yehDOaDirkBd1MFKdSt5qV0pu8wH22Yd0TVb3
 GfDBG1WvbxGcz6tdiL7l5DT4MbQQEgq4UEgMKhuHR1YZ6rzZb7+aNtUuZZvTFmGxPHjvTK
 OKakVyC4ctY9sRkT7JFN5kknbZ23oJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-4r4PHRvmOrq3ARCwdDSMzA-1; Thu, 11 Mar 2021 05:33:04 -0500
X-MC-Unique: 4r4PHRvmOrq3ARCwdDSMzA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCCB11015C84
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 10:33:03 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7778D5DF26;
 Thu, 11 Mar 2021 10:33:03 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] docs: vhost-user: rename message names from "SLAVE" to
 "BACKEND"
Date: Thu, 11 Mar 2021 05:32:47 -0500
Message-Id: <20210311103250.532191-5-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Follow the terminology that is used in the rest of the document.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/interop/vhost-user.rst | 40 ++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 96be549127..84c05dfb91 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -290,7 +290,7 @@ in the ancillary data:
 * ``VHOST_USER_SET_VRING_KICK``
 * ``VHOST_USER_SET_VRING_CALL``
 * ``VHOST_USER_SET_VRING_ERR``
-* ``VHOST_USER_SET_SLAVE_REQ_FD``
+* ``VHOST_USER_SET_BACKEND_REQ_FD``
 * ``VHOST_USER_SET_INFLIGHT_FD`` (if ``VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD``)
 
 If *frontend* is unable to send the full message or receives a wrong
@@ -479,7 +479,7 @@ expected to reply with a zero payload, non-zero otherwise.
 
 The backend relies on the backend communication channel (see :ref:`Back-end
 communication <backend_communication>` section below) to send IOTLB miss
-and access failure events, by sending ``VHOST_USER_SLAVE_IOTLB_MSG``
+and access failure events, by sending ``VHOST_USER_BACKEND_IOTLB_MSG``
 requests to the frontend with a ``struct vhost_iotlb_msg`` as
 payload. For miss events, the iotlb payload has to be filled with the
 miss message type (1), the I/O virtual address and the permissions
@@ -503,15 +503,15 @@ Back-end communication
 ----------------------
 
 An optional communication channel is provided if the backend declares
-``VHOST_USER_PROTOCOL_F_SLAVE_REQ`` protocol feature, to allow the
+``VHOST_USER_PROTOCOL_F_BACKEND_REQ`` protocol feature, to allow the
 backend to make requests to the frontend.
 
-The fd is provided via ``VHOST_USER_SET_SLAVE_REQ_FD`` ancillary data.
+The fd is provided via ``VHOST_USER_SET_BACKEND_REQ_FD`` ancillary data.
 
-A backend may then send ``VHOST_USER_SLAVE_*`` messages to the frontend
+A backend may then send ``VHOST_USER_BACKEND_*`` messages to the frontend
 using this fd communication channel.
 
-If ``VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD`` protocol feature is
+If ``VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD`` protocol feature is
 negotiated, backend can send file descriptors (at most 8 descriptors in
 each message) to frontend via ancillary data using this fd communication
 channel.
@@ -798,7 +798,7 @@ Note that due to the fact that too many messages on the sockets can
 cause the sending application(s) to block, it is not advised to use
 this feature unless absolutely necessary. It is also considered an
 error to negotiate this feature without also negotiating
-``VHOST_USER_PROTOCOL_F_SLAVE_REQ`` and ``VHOST_USER_PROTOCOL_F_REPLY_ACK``,
+``VHOST_USER_PROTOCOL_F_BACKEND_REQ`` and ``VHOST_USER_PROTOCOL_F_REPLY_ACK``,
 the former is necessary for getting a message channel from the backend
 to the frontend, while the latter needs to be used with the in-band
 notification messages to block until they are processed, both to avoid
@@ -818,12 +818,12 @@ Protocol features
   #define VHOST_USER_PROTOCOL_F_RARP                  2
   #define VHOST_USER_PROTOCOL_F_REPLY_ACK             3
   #define VHOST_USER_PROTOCOL_F_MTU                   4
-  #define VHOST_USER_PROTOCOL_F_SLAVE_REQ             5
+  #define VHOST_USER_PROTOCOL_F_BACKEND_REQ           5
   #define VHOST_USER_PROTOCOL_F_CROSS_ENDIAN          6
   #define VHOST_USER_PROTOCOL_F_CRYPTO_SESSION        7
   #define VHOST_USER_PROTOCOL_F_PAGEFAULT             8
   #define VHOST_USER_PROTOCOL_F_CONFIG                9
-  #define VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD        10
+  #define VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD      10
   #define VHOST_USER_PROTOCOL_F_HOST_NOTIFIER        11
   #define VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD       12
   #define VHOST_USER_PROTOCOL_F_RESET_DEVICE         13
@@ -1023,8 +1023,8 @@ reply is sent by the backend.
   in the ancillary data. This signals that polling will be used
   instead of waiting for the call. Note that if the protocol features
   ``VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS`` and
-  ``VHOST_USER_PROTOCOL_F_SLAVE_REQ`` have been negotiated this message
-  isn't necessary as the ``VHOST_USER_SLAVE_VRING_CALL`` message can be
+  ``VHOST_USER_PROTOCOL_F_BACKEND_REQ`` have been negotiated this message
+  isn't necessary as the ``VHOST_USER_BACKEND_VRING_CALL`` message can be
   used, it may however still be used to set an event file descriptor
   or to enable polling.
 
@@ -1041,8 +1041,8 @@ reply is sent by the backend.
   invalid FD flag. This flag is set when there is no file descriptor
   in the ancillary data. Note that if the protocol features
   ``VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS`` and
-  ``VHOST_USER_PROTOCOL_F_SLAVE_REQ`` have been negotiated this message
-  isn't necessary as the ``VHOST_USER_SLAVE_VRING_ERR`` message can be
+  ``VHOST_USER_PROTOCOL_F_BACKEND_REQ`` have been negotiated this message
+  isn't necessary as the ``VHOST_USER_BACKEND_VRING_ERR`` message can be
   used, it may however still be used to set an event file descriptor
   (which will be preferred over the message).
 
@@ -1103,7 +1103,7 @@ reply is sent by the backend.
   respond with zero in case the specified MTU is valid, or non-zero
   otherwise.
 
-``VHOST_USER_SET_SLAVE_REQ_FD``
+``VHOST_USER_SET_BACKEND_REQ_FD``
   :id: 21
   :equivalent ioctl: N/A
   :request payload: N/A
@@ -1114,7 +1114,7 @@ reply is sent by the backend.
 
   This request should be sent only when
   ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, and protocol
-  feature bit ``VHOST_USER_PROTOCOL_F_SLAVE_REQ`` bit is present in
+  feature bit ``VHOST_USER_PROTOCOL_F_BACKEND_REQ`` bit is present in
   ``VHOST_USER_GET_PROTOCOL_FEATURES``.  If
   ``VHOST_USER_PROTOCOL_F_REPLY_ACK`` is negotiated, the backend must
   respond with zero for success, non-zero otherwise.
@@ -1377,7 +1377,7 @@ Back-end message types
 For this type of message, the request is sent by the backend and the reply
 is sent by the frontend.
 
-``VHOST_USER_SLAVE_IOTLB_MSG``
+``VHOST_USER_BACKEND_IOTLB_MSG``
   :id: 1
   :equivalent ioctl: N/A (equivalent to ``VHOST_IOTLB_MSG`` message type)
   :request payload: ``struct vhost_iotlb_msg``
@@ -1392,7 +1392,7 @@ is sent by the frontend.
   ``VIRTIO_F_IOMMU_PLATFORM`` feature has been successfully
   negotiated.
 
-``VHOST_USER_SLAVE_CONFIG_CHANGE_MSG``
+``VHOST_USER_BACKEND_CONFIG_CHANGE_MSG``
   :id: 2
   :equivalent ioctl: N/A
   :request payload: N/A
@@ -1407,7 +1407,7 @@ is sent by the frontend.
   ``VHOST_USER_NEED_REPLY`` flag, the frontend must respond with zero when
   operation is successfully completed, or non-zero otherwise.
 
-``VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG``
+``VHOST_USER_BACKEND_VRING_HOST_NOTIFIER_MSG``
   :id: 3
   :equivalent ioctl: N/A
   :request payload: vring area description
@@ -1430,7 +1430,7 @@ is sent by the frontend.
   ``VHOST_USER_PROTOCOL_F_HOST_NOTIFIER`` protocol feature has been
   successfully negotiated.
 
-``VHOST_USER_SLAVE_VRING_CALL``
+``VHOST_USER_BACKEND_VRING_CALL``
   :id: 4
   :equivalent ioctl: N/A
   :request payload: vring state description
@@ -1444,7 +1444,7 @@ is sent by the frontend.
 
   The state.num field is currently reserved and must be set to 0.
 
-``VHOST_USER_SLAVE_VRING_ERR``
+``VHOST_USER_BACKEND_VRING_ERR``
   :id: 5
   :equivalent ioctl: N/A
   :request payload: vring state description
-- 
2.26.2




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7CB68F8DD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 21:33:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPr82-00086p-CT; Wed, 08 Feb 2023 15:33:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pPr7y-000869-Et
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:33:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pPr7v-0005Rz-Pk
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:33:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675888391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UeS9Rf5OtLf74H9BKovTcnYag8/50YqE83t7qZ9ZWgo=;
 b=Y+CSC3fv9GVgLWRg3/0WqZtOwQEawThr/cQN8GQKRPHAV2FkKqtvmVx1uYTUrfoQtlneDH
 h0c/D02lljxgaJzzXuqcvszV4RkGhtpzD80mlBiYdbpQ/PFNBGoDUB9dnU6gkuMiG/wnbp
 NRr4IPpmBJg8SN9MW3nl38WtXBgnLZE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-NecOogkQMv6PtbFtKqblwg-1; Wed, 08 Feb 2023 15:33:06 -0500
X-MC-Unique: NecOogkQMv6PtbFtKqblwg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4413185D060;
 Wed,  8 Feb 2023 20:33:06 +0000 (UTC)
Received: from max-t490s.redhat.com (unknown [10.39.208.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6470A1121314;
 Wed,  8 Feb 2023 20:33:04 +0000 (UTC)
From: Maxime Coquelin <maxime.coquelin@redhat.com>
To: qemu-devel@nongnu.org, mst@redhat.com, pbonzini@redhat.com,
 stephen@networkplumber.org, chenbo.xia@intel.com, thomas@monjalon.net,
 dmarchan@redhat.com
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>
Subject: [PATCH v2 1/3] docs: vhost-user: replace _SLAVE_ with _BACKEND_
Date: Wed,  8 Feb 2023 21:32:57 +0100
Message-Id: <20230208203259.381326-2-maxime.coquelin@redhat.com>
In-Reply-To: <20230208203259.381326-1-maxime.coquelin@redhat.com>
References: <20230208203259.381326-1-maxime.coquelin@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=maxime.coquelin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Backend's message and protocol features names were still
using "_SLAVE_" naming. For consistency with the new naming
convention, replace it with _BACKEND_.

Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>
---
 docs/interop/vhost-user.rst | 40 ++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 3f18ab424e..8a5924ea75 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -315,7 +315,7 @@ in the ancillary data:
 * ``VHOST_USER_SET_VRING_KICK``
 * ``VHOST_USER_SET_VRING_CALL``
 * ``VHOST_USER_SET_VRING_ERR``
-* ``VHOST_USER_SET_SLAVE_REQ_FD``
+* ``VHOST_USER_SET_BACKEND_REQ_FD`` (previous name ``VHOST_USER_SET_SLAVE_REQ_FD``)
 * ``VHOST_USER_SET_INFLIGHT_FD`` (if ``VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD``)
 
 If *front-end* is unable to send the full message or receives a wrong
@@ -516,7 +516,7 @@ expected to reply with a zero payload, non-zero otherwise.
 
 The back-end relies on the back-end communication channel (see :ref:`Back-end
 communication <backend_communication>` section below) to send IOTLB miss
-and access failure events, by sending ``VHOST_USER_SLAVE_IOTLB_MSG``
+and access failure events, by sending ``VHOST_USER_BACKEND_IOTLB_MSG``
 requests to the front-end with a ``struct vhost_iotlb_msg`` as
 payload. For miss events, the iotlb payload has to be filled with the
 miss message type (1), the I/O virtual address and the permissions
@@ -540,15 +540,15 @@ Back-end communication
 ----------------------
 
 An optional communication channel is provided if the back-end declares
-``VHOST_USER_PROTOCOL_F_SLAVE_REQ`` protocol feature, to allow the
+``VHOST_USER_PROTOCOL_F_BACKEND_REQ`` protocol feature, to allow the
 back-end to make requests to the front-end.
 
-The fd is provided via ``VHOST_USER_SET_SLAVE_REQ_FD`` ancillary data.
+The fd is provided via ``VHOST_USER_SET_BACKEND_REQ_FD`` ancillary data.
 
-A back-end may then send ``VHOST_USER_SLAVE_*`` messages to the front-end
+A back-end may then send ``VHOST_USER_BACKEND_*`` messages to the front-end
 using this fd communication channel.
 
-If ``VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD`` protocol feature is
+If ``VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD`` protocol feature is
 negotiated, back-end can send file descriptors (at most 8 descriptors in
 each message) to front-end via ancillary data using this fd communication
 channel.
@@ -835,7 +835,7 @@ Note that due to the fact that too many messages on the sockets can
 cause the sending application(s) to block, it is not advised to use
 this feature unless absolutely necessary. It is also considered an
 error to negotiate this feature without also negotiating
-``VHOST_USER_PROTOCOL_F_SLAVE_REQ`` and ``VHOST_USER_PROTOCOL_F_REPLY_ACK``,
+``VHOST_USER_PROTOCOL_F_BACKEND_REQ`` and ``VHOST_USER_PROTOCOL_F_REPLY_ACK``,
 the former is necessary for getting a message channel from the back-end
 to the front-end, while the latter needs to be used with the in-band
 notification messages to block until they are processed, both to avoid
@@ -855,12 +855,12 @@ Protocol features
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
@@ -1059,8 +1059,8 @@ Front-end message types
   in the ancillary data. This signals that polling will be used
   instead of waiting for the call. Note that if the protocol features
   ``VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS`` and
-  ``VHOST_USER_PROTOCOL_F_SLAVE_REQ`` have been negotiated this message
-  isn't necessary as the ``VHOST_USER_SLAVE_VRING_CALL`` message can be
+  ``VHOST_USER_PROTOCOL_F_BACKEND_REQ`` have been negotiated this message
+  isn't necessary as the ``VHOST_USER_BACKEND_VRING_CALL`` message can be
   used, it may however still be used to set an event file descriptor
   or to enable polling.
 
@@ -1077,8 +1077,8 @@ Front-end message types
   invalid FD flag. This flag is set when there is no file descriptor
   in the ancillary data. Note that if the protocol features
   ``VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS`` and
-  ``VHOST_USER_PROTOCOL_F_SLAVE_REQ`` have been negotiated this message
-  isn't necessary as the ``VHOST_USER_SLAVE_VRING_ERR`` message can be
+  ``VHOST_USER_PROTOCOL_F_BACKEND_REQ`` have been negotiated this message
+  isn't necessary as the ``VHOST_USER_BACKEND_VRING_ERR`` message can be
   used, it may however still be used to set an event file descriptor
   (which will be preferred over the message).
 
@@ -1139,7 +1139,7 @@ Front-end message types
   respond with zero in case the specified MTU is valid, or non-zero
   otherwise.
 
-``VHOST_USER_SET_SLAVE_REQ_FD``
+``VHOST_USER_SET_BACKEND_REQ_FD`` (previous name ``VHOST_USER_SET_SLAVE_REQ_FD``)
   :id: 21
   :equivalent ioctl: N/A
   :request payload: N/A
@@ -1150,7 +1150,7 @@ Front-end message types
 
   This request should be sent only when
   ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, and protocol
-  feature bit ``VHOST_USER_PROTOCOL_F_SLAVE_REQ`` bit is present in
+  feature bit ``VHOST_USER_PROTOCOL_F_BACKEND_REQ`` bit is present in
   ``VHOST_USER_GET_PROTOCOL_FEATURES``.  If
   ``VHOST_USER_PROTOCOL_F_REPLY_ACK`` is negotiated, the back-end must
   respond with zero for success, non-zero otherwise.
@@ -1429,7 +1429,7 @@ Back-end message types
 For this type of message, the request is sent by the back-end and the reply
 is sent by the front-end.
 
-``VHOST_USER_SLAVE_IOTLB_MSG``
+``VHOST_USER_BACKEND_IOTLB_MSG`` (previous name ``VHOST_USER_SLAVE_IOTLB_MSG``)
   :id: 1
   :equivalent ioctl: N/A (equivalent to ``VHOST_IOTLB_MSG`` message type)
   :request payload: ``struct vhost_iotlb_msg``
@@ -1444,7 +1444,7 @@ is sent by the front-end.
   ``VIRTIO_F_IOMMU_PLATFORM`` feature has been successfully
   negotiated.
 
-``VHOST_USER_SLAVE_CONFIG_CHANGE_MSG``
+``VHOST_USER_BACKEND_CONFIG_CHANGE_MSG`` (previous name ``VHOST_USER_SLAVE_CONFIG_CHANGE_MSG``)
   :id: 2
   :equivalent ioctl: N/A
   :request payload: N/A
@@ -1459,7 +1459,7 @@ is sent by the front-end.
   ``VHOST_USER_NEED_REPLY`` flag, the front-end must respond with zero when
   operation is successfully completed, or non-zero otherwise.
 
-``VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG``
+``VHOST_USER_BACKEND_VRING_HOST_NOTIFIER_MSG`` (previous name ``VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG``)
   :id: 3
   :equivalent ioctl: N/A
   :request payload: vring area description
@@ -1482,7 +1482,7 @@ is sent by the front-end.
   ``VHOST_USER_PROTOCOL_F_HOST_NOTIFIER`` protocol feature has been
   successfully negotiated.
 
-``VHOST_USER_SLAVE_VRING_CALL``
+``VHOST_USER_BACKEND_VRING_CALL`` (previous name ``VHOST_USER_SLAVE_VRING_CALL``)
   :id: 4
   :equivalent ioctl: N/A
   :request payload: vring state description
@@ -1496,7 +1496,7 @@ is sent by the front-end.
 
   The state.num field is currently reserved and must be set to 0.
 
-``VHOST_USER_SLAVE_VRING_ERR``
+``VHOST_USER_BACKEND_VRING_ERR`` (previous name ``VHOST_USER_SLAVE_VRING_ERR``)
   :id: 5
   :equivalent ioctl: N/A
   :request payload: vring state description
-- 
2.39.1



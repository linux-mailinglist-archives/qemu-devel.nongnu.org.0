Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2C16531F5
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:44:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7zOQ-00054N-Sr; Wed, 21 Dec 2022 08:44:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7zOP-0004xl-IZ
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:44:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7zON-0002xK-A9
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:44:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671630258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KEy4v9f8l1FnU90DwFD9CBq/2E8qxUzwOfrumw/dl8E=;
 b=X2xJWqRHqyjy0+goVVKxjdxy9HTMmknEJsmbdlKEvpakTjtgkyE4b/bFVzN0lKy09F53fh
 deDQ/TcfhD1qUWEEL4rqG9up8lqN9/cw9+Nl3bbrl9iKBPrQF/PYVFeHBRu9zXA/Czpo1l
 vKIvJCsrvtl//uTwVwD0knWylZlY2mw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-322-K0QQfcNTOd68B2mbNr7tOQ-1; Wed, 21 Dec 2022 08:44:17 -0500
X-MC-Unique: K0QQfcNTOd68B2mbNr7tOQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi19-20020a05600c3d9300b003cf9d6c4016so955591wmb.8
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:44:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KEy4v9f8l1FnU90DwFD9CBq/2E8qxUzwOfrumw/dl8E=;
 b=1fZiX/AxeGQJx06+rDlsyZo/mCsHFRyqqGXPVFimSMGJRmHHbiWuAh6Z1E0HMa/l0B
 gENlT6mcWq7vdFCBjoCWHdXC7ZFfpoyCsSJdVuFdhsIQp61EWQm70+6yXnVs5BzuVA7i
 OznMwYumfQWVPlbZqFdCsQY2OYqBnbVUeXkxJgJ6cOaUzWHUQ6mYTcSJxf+1c5bEP7s/
 L7JQNyBRNrz3GAWg34iHP5nWTbYFuRcn2TjL80l8c2AntK7AUfQGZhRQQ+ozNcuN6epE
 m2eXVVf9nqE1TzogZ03PWkxbK6OXDx7ofVQ5u4ExiN9Poiug2BkBhYD5XXxU3xJHC8vb
 6zew==
X-Gm-Message-State: AFqh2koZaQblnyEr4TBsxXqLIJHMnPVBZWdzhlG8mwMFYM5LdYnRNdQW
 Vzh4XF7Putmv7PcKoxhsCWuIdVvPUv5nK7Gt0ezH0/0e2rSJ5oB7X8cCb92JWZ5IvFQcSVUAelm
 cZ4QwxEFFYyhTzj7jI+wEndwpxfC/8I46C074X2H6mmeBaf/BKXF/9CIRP3cv
X-Received: by 2002:adf:f1c9:0:b0:242:763:34ad with SMTP id
 z9-20020adff1c9000000b00242076334admr1198179wro.1.1671630256076; 
 Wed, 21 Dec 2022 05:44:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs1Df+eyXhdqhUs9hwebKlhDHGjTK0wmvZCFyuAmpc2lJG1Ss13lWEfBVpY3EH7iVun1EJp3A==
X-Received: by 2002:adf:f1c9:0:b0:242:763:34ad with SMTP id
 z9-20020adff1c9000000b00242076334admr1198162wro.1.1671630255804; 
 Wed, 21 Dec 2022 05:44:15 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 c3-20020a5d5283000000b0024206ed539fsm15426702wrv.66.2022.12.21.05.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:44:15 -0800 (PST)
Date: Wed, 21 Dec 2022 08:44:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jonah Palmer <jonah.palmer@oracle.com>
Subject: [PULL 36/41] hw/virtio: Guard and restrict scope of
 qmp_virtio_feature_map_t[]
Message-ID: <20221221130339.1234592-37-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Commit f3034ad71f ("qmp: decode feature & status bits in
virtio-status") did not guard all qmp_virtio_feature_map_t
arrays with the corresponding #ifdef'ry used in
qmp_decode_features(). Fix that and reduce the arrays scope
by declaring them static.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221213111707.34921-4-philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Jonah Palmer<jonah.palmer@oracle.com>
Suggested-by: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a>
Signed-off-by: Philippe Mathieu-Daudé <a class="moz-txt-link-rfc2396E" href="mailto:philmd@linaro.org">&lt;philmd@linaro.org&gt;</a>
---
 hw/virtio/virtio.c | 56 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 14 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 15197002ef..7345261ed8 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -179,7 +179,8 @@ static qmp_virtio_feature_map_t virtio_config_status_map[] = {
 };
 
 /* virtio-blk features mapping */
-qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
+#ifdef CONFIG_VIRTIO_BLK
+static qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_BLK_F_SIZE_MAX, \
             "VIRTIO_BLK_F_SIZE_MAX: Max segment size is size_max"),
     FEATURE_ENTRY(VIRTIO_BLK_F_SEG_MAX, \
@@ -216,9 +217,11 @@ qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
             "negotiation supported"),
     { -1, "" }
 };
+#endif
 
 /* virtio-serial features mapping */
-qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
+#ifdef CONFIG_VIRTIO_SERIAL
+static qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_CONSOLE_F_SIZE, \
             "VIRTIO_CONSOLE_F_SIZE: Host providing console size"),
     FEATURE_ENTRY(VIRTIO_CONSOLE_F_MULTIPORT, \
@@ -227,9 +230,11 @@ qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
             "VIRTIO_CONSOLE_F_EMERG_WRITE: Emergency write supported"),
     { -1, "" }
 };
+#endif
 
 /* virtio-gpu features mapping */
-qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
+#ifdef CONFIG_VIRTIO_GPU
+static qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_GPU_F_VIRGL, \
             "VIRTIO_GPU_F_VIRGL: Virgl 3D mode supported"),
     FEATURE_ENTRY(VIRTIO_GPU_F_EDID, \
@@ -248,9 +253,11 @@ qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
             "negotiation supported"),
     { -1, "" }
 };
+#endif
 
 /* virtio-input features mapping */
-qmp_virtio_feature_map_t virtio_input_feature_map[] = {
+#ifdef CONFIG_VIRTIO_INPUT
+static qmp_virtio_feature_map_t virtio_input_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             "VHOST_F_LOG_ALL: Logging write descriptors supported"),
     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
@@ -258,9 +265,11 @@ qmp_virtio_feature_map_t virtio_input_feature_map[] = {
             "negotiation supported"),
     { -1, "" }
 };
+#endif
 
 /* virtio-net features mapping */
-qmp_virtio_feature_map_t virtio_net_feature_map[] = {
+#ifdef CONFIG_VIRTIO_NET
+static qmp_virtio_feature_map_t virtio_net_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_NET_F_CSUM, \
             "VIRTIO_NET_F_CSUM: Device handling packets with partial checksum "
             "supported"),
@@ -336,9 +345,11 @@ qmp_virtio_feature_map_t virtio_net_feature_map[] = {
             "negotiation supported"),
     { -1, "" }
 };
+#endif
 
 /* virtio-scsi features mapping */
-qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
+#ifdef CONFIG_VIRTIO_SCSI
+static qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_SCSI_F_INOUT, \
             "VIRTIO_SCSI_F_INOUT: Requests including read and writable data "
             "buffers suppoted"),
@@ -357,9 +368,11 @@ qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
             "negotiation supported"),
     { -1, "" }
 };
+#endif
 
 /* virtio/vhost-user-fs features mapping */
-qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
+#ifdef CONFIG_VHOST_USER_FS
+static qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             "VHOST_F_LOG_ALL: Logging write descriptors supported"),
     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
@@ -367,9 +380,11 @@ qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
             "negotiation supported"),
     { -1, "" }
 };
+#endif
 
 /* virtio/vhost-user-i2c features mapping */
-qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
+#ifdef CONFIG_VIRTIO_I2C_ADAPTER
+static qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_I2C_F_ZERO_LENGTH_REQUEST, \
             "VIRTIO_I2C_F_ZERO_LEGNTH_REQUEST: Zero length requests supported"),
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
@@ -379,9 +394,11 @@ qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
             "negotiation supported"),
     { -1, "" }
 };
+#endif
 
 /* virtio/vhost-vsock features mapping */
-qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
+#ifdef CONFIG_VHOST_VSOCK
+static qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_VSOCK_F_SEQPACKET, \
             "VIRTIO_VSOCK_F_SEQPACKET: SOCK_SEQPACKET supported"),
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
@@ -391,9 +408,11 @@ qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
             "negotiation supported"),
     { -1, "" }
 };
+#endif
 
 /* virtio-balloon features mapping */
-qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
+#ifdef CONFIG_VIRTIO_BALLOON
+static qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_BALLOON_F_MUST_TELL_HOST, \
             "VIRTIO_BALLOON_F_MUST_TELL_HOST: Tell host before reclaiming "
             "pages"),
@@ -409,16 +428,20 @@ qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
             "VIRTIO_BALLOON_F_REPORTING: Page reporting VQ enabled"),
     { -1, "" }
 };
+#endif
 
 /* virtio-crypto features mapping */
-qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
+#ifdef CONFIG_VIRTIO_CRYPTO
+static qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             "VHOST_F_LOG_ALL: Logging write descriptors supported"),
     { -1, "" }
 };
+#endif
 
 /* virtio-iommu features mapping */
-qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
+#ifdef CONFIG_VIRTIO_IOMMU
+static qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
     FEATURE_ENTRY(VIRTIO_IOMMU_F_INPUT_RANGE, \
             "VIRTIO_IOMMU_F_INPUT_RANGE: Range of available virtual addrs. "
             "available"),
@@ -439,9 +462,11 @@ qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
             "available"),
     { -1, "" }
 };
+#endif
 
 /* virtio-mem features mapping */
-qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
+#ifdef CONFIG_VIRTIO_MEM
+static qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
 #ifndef CONFIG_ACPI
     FEATURE_ENTRY(VIRTIO_MEM_F_ACPI_PXM, \
             "VIRTIO_MEM_F_ACPI_PXM: node_id is an ACPI PXM and is valid"),
@@ -451,9 +476,11 @@ qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
             "accessed"),
     { -1, "" }
 };
+#endif
 
 /* virtio-rng features mapping */
-qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
+#ifdef CONFIG_VIRTIO_RNG
+static qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
     FEATURE_ENTRY(VHOST_F_LOG_ALL, \
             "VHOST_F_LOG_ALL: Logging write descriptors supported"),
     FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
@@ -461,6 +488,7 @@ qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
             "negotiation supported"),
     { -1, "" }
 };
+#endif
 
 /*
  * The alignment to use between consumer and producer parts of vring.
-- 
MST



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCB16C4D76
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:22:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezLp-00081c-FG; Wed, 22 Mar 2023 10:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pezLg-0007ys-2X
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:21:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pezLd-0007J0-P5
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:21:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679494913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O3p4U7iiHs6Fcdufu9lV6f5rSclPKtis3t4ojlW26v8=;
 b=PlxVvMTvTHAgEAv1FcPB3smRg05vECkCI2o3yg+vIsPKXeClxJ7J/sII1bvoR6dR73Xl7Q
 kmttGcavK1B3masf0eKL4AKNmwPXJF0Cr/7piLPrsl+bTxeoX6o1B0DmNv+TYC/mlu8Gr5
 XI6qn1pTi1CI2rZu02GAh2EB1Z6Kbkc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-qW8AoOneMBuEilRqUKO_ew-1; Wed, 22 Mar 2023 10:21:51 -0400
X-MC-Unique: qW8AoOneMBuEilRqUKO_ew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26060185A7A3;
 Wed, 22 Mar 2023 14:21:51 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.226.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC69640C6E67;
 Wed, 22 Mar 2023 14:21:48 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, fmartine@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, eballetb@redhat.com,
 Albert Esteve <aesteve@redhat.com>, alex.bennee@linaro.org,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 sgarzare@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 peter.griffin@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 05/12] standard-headers: Add virtio_video.h
Date: Wed, 22 Mar 2023 15:21:25 +0100
Message-Id: <20230322142132.22909-6-aesteve@redhat.com>
In-Reply-To: <20230322142132.22909-1-aesteve@redhat.com>
References: <20230322142132.22909-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=aesteve@redhat.com;
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

From: Peter Griffin <peter.griffin@linaro.org>

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Message-Id: <20211209145601.331477-6-peter.griffin@linaro.org>
---
 include/standard-headers/linux/virtio_video.h | 513 ++++++++++++++++++
 1 file changed, 513 insertions(+)
 create mode 100644 include/standard-headers/linux/virtio_video.h

diff --git a/include/standard-headers/linux/virtio_video.h b/include/standard-headers/linux/virtio_video.h
new file mode 100644
index 0000000000..6ccd7b1f38
--- /dev/null
+++ b/include/standard-headers/linux/virtio_video.h
@@ -0,0 +1,513 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * Virtio Video Device
+ *
+ * This header is BSD licensed so anyone can use the definitions
+ * to implement compatible drivers/servers:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ * 3. Neither the name of IBM nor the names of its contributors
+ *    may be used to endorse or promote products derived from this software
+ *    without specific prior written permission.
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
+ * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL IBM OR
+ * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
+ * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
+ * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
+ * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+ * SUCH DAMAGE.
+ *
+ * Copyright (C) 2019 OpenSynergy GmbH.
+ */
+
+#ifndef _UAPI_LINUX_VIRTIO_VIDEO_H
+#define _UAPI_LINUX_VIRTIO_VIDEO_H
+
+#include <linux/types.h>
+#include <linux/virtio_config.h>
+
+/*
+ * Feature bits
+ */
+
+/* Guest pages can be used for video buffers. */
+#define VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES 0
+/*
+ * The host can process buffers even if they are non-contiguous memory such as
+ * scatter-gather lists.
+ */
+#define VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG 1
+/* Objects exported by another virtio device can be used for video buffers */
+#define VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT 2
+
+/*
+ * Image formats
+ */
+
+enum virtio_video_format {
+	/* Raw formats */
+	VIRTIO_VIDEO_FORMAT_RAW_MIN = 1,
+	VIRTIO_VIDEO_FORMAT_ARGB8888 = VIRTIO_VIDEO_FORMAT_RAW_MIN,
+	VIRTIO_VIDEO_FORMAT_BGRA8888,
+	VIRTIO_VIDEO_FORMAT_NV12, /* 12  Y/CbCr 4:2:0  */
+	VIRTIO_VIDEO_FORMAT_YUV420, /* 12  YUV 4:2:0     */
+	VIRTIO_VIDEO_FORMAT_YVU420, /* 12  YVU 4:2:0     */
+	VIRTIO_VIDEO_FORMAT_RAW_MAX = VIRTIO_VIDEO_FORMAT_YVU420,
+
+	/* Coded formats */
+	VIRTIO_VIDEO_FORMAT_CODED_MIN = 0x1000,
+	VIRTIO_VIDEO_FORMAT_MPEG2 =
+		VIRTIO_VIDEO_FORMAT_CODED_MIN, /* MPEG-2 Part 2 */
+	VIRTIO_VIDEO_FORMAT_MPEG4, /* MPEG-4 Part 2 */
+	VIRTIO_VIDEO_FORMAT_H264, /* H.264 */
+	VIRTIO_VIDEO_FORMAT_HEVC, /* HEVC aka H.265*/
+	VIRTIO_VIDEO_FORMAT_VP8, /* VP8 */
+	VIRTIO_VIDEO_FORMAT_VP9, /* VP9 */
+	VIRTIO_VIDEO_FORMAT_FWHT, /* FWHT used by vicodec */
+	VIRTIO_VIDEO_FORMAT_CODED_MAX = VIRTIO_VIDEO_FORMAT_FWHT,
+};
+
+enum virtio_video_profile {
+	/* H.264 */
+	VIRTIO_VIDEO_PROFILE_H264_MIN = 0x100,
+	VIRTIO_VIDEO_PROFILE_H264_BASELINE = VIRTIO_VIDEO_PROFILE_H264_MIN,
+	VIRTIO_VIDEO_PROFILE_H264_MAIN,
+	VIRTIO_VIDEO_PROFILE_H264_EXTENDED,
+	VIRTIO_VIDEO_PROFILE_H264_HIGH,
+	VIRTIO_VIDEO_PROFILE_H264_HIGH10PROFILE,
+	VIRTIO_VIDEO_PROFILE_H264_HIGH422PROFILE,
+	VIRTIO_VIDEO_PROFILE_H264_HIGH444PREDICTIVEPROFILE,
+	VIRTIO_VIDEO_PROFILE_H264_SCALABLEBASELINE,
+	VIRTIO_VIDEO_PROFILE_H264_SCALABLEHIGH,
+	VIRTIO_VIDEO_PROFILE_H264_STEREOHIGH,
+	VIRTIO_VIDEO_PROFILE_H264_MULTIVIEWHIGH,
+	VIRTIO_VIDEO_PROFILE_H264_MAX = VIRTIO_VIDEO_PROFILE_H264_MULTIVIEWHIGH,
+
+	/* HEVC */
+	VIRTIO_VIDEO_PROFILE_HEVC_MIN = 0x200,
+	VIRTIO_VIDEO_PROFILE_HEVC_MAIN = VIRTIO_VIDEO_PROFILE_HEVC_MIN,
+	VIRTIO_VIDEO_PROFILE_HEVC_MAIN10,
+	VIRTIO_VIDEO_PROFILE_HEVC_MAIN_STILL_PICTURE,
+	VIRTIO_VIDEO_PROFILE_HEVC_MAX =
+		VIRTIO_VIDEO_PROFILE_HEVC_MAIN_STILL_PICTURE,
+
+	/* VP8 */
+	VIRTIO_VIDEO_PROFILE_VP8_MIN = 0x300,
+	VIRTIO_VIDEO_PROFILE_VP8_PROFILE0 = VIRTIO_VIDEO_PROFILE_VP8_MIN,
+	VIRTIO_VIDEO_PROFILE_VP8_PROFILE1,
+	VIRTIO_VIDEO_PROFILE_VP8_PROFILE2,
+	VIRTIO_VIDEO_PROFILE_VP8_PROFILE3,
+	VIRTIO_VIDEO_PROFILE_VP8_MAX = VIRTIO_VIDEO_PROFILE_VP8_PROFILE3,
+
+	/* VP9 */
+	VIRTIO_VIDEO_PROFILE_VP9_MIN = 0x400,
+	VIRTIO_VIDEO_PROFILE_VP9_PROFILE0 = VIRTIO_VIDEO_PROFILE_VP9_MIN,
+	VIRTIO_VIDEO_PROFILE_VP9_PROFILE1,
+	VIRTIO_VIDEO_PROFILE_VP9_PROFILE2,
+	VIRTIO_VIDEO_PROFILE_VP9_PROFILE3,
+	VIRTIO_VIDEO_PROFILE_VP9_MAX = VIRTIO_VIDEO_PROFILE_VP9_PROFILE3,
+};
+
+enum virtio_video_level {
+	/* H.264 */
+	VIRTIO_VIDEO_LEVEL_H264_MIN = 0x100,
+	VIRTIO_VIDEO_LEVEL_H264_1_0 = VIRTIO_VIDEO_LEVEL_H264_MIN,
+	VIRTIO_VIDEO_LEVEL_H264_1_1,
+	VIRTIO_VIDEO_LEVEL_H264_1_2,
+	VIRTIO_VIDEO_LEVEL_H264_1_3,
+	VIRTIO_VIDEO_LEVEL_H264_2_0,
+	VIRTIO_VIDEO_LEVEL_H264_2_1,
+	VIRTIO_VIDEO_LEVEL_H264_2_2,
+	VIRTIO_VIDEO_LEVEL_H264_3_0,
+	VIRTIO_VIDEO_LEVEL_H264_3_1,
+	VIRTIO_VIDEO_LEVEL_H264_3_2,
+	VIRTIO_VIDEO_LEVEL_H264_4_0,
+	VIRTIO_VIDEO_LEVEL_H264_4_1,
+	VIRTIO_VIDEO_LEVEL_H264_4_2,
+	VIRTIO_VIDEO_LEVEL_H264_5_0,
+	VIRTIO_VIDEO_LEVEL_H264_5_1,
+	VIRTIO_VIDEO_LEVEL_H264_MAX = VIRTIO_VIDEO_LEVEL_H264_5_1,
+};
+
+enum virtio_video_bitrate_mode {
+	VIRTIO_VIDEO_BITRATE_MODE_VBR = 0,
+	VIRTIO_VIDEO_BITRATE_MODE_CBR = 1,
+};
+
+/*
+ * Config
+ */
+
+struct virtio_video_config {
+	__le32 version;
+	__le32 max_caps_length;
+	__le32 max_resp_length;
+	__u8 device_name[32];
+};
+
+/*
+ * Commands
+ */
+
+enum virtio_video_cmd_type {
+	/* Command */
+	VIRTIO_VIDEO_CMD_QUERY_CAPABILITY = 0x0100,
+	VIRTIO_VIDEO_CMD_STREAM_CREATE,
+	VIRTIO_VIDEO_CMD_STREAM_DESTROY,
+	VIRTIO_VIDEO_CMD_STREAM_DRAIN,
+	VIRTIO_VIDEO_CMD_RESOURCE_CREATE,
+	VIRTIO_VIDEO_CMD_RESOURCE_QUEUE,
+	VIRTIO_VIDEO_CMD_RESOURCE_DESTROY_ALL,
+	VIRTIO_VIDEO_CMD_QUEUE_CLEAR,
+	/* GET/SET_PARAMS are being replaced with GET/SET_PARAMS_EXT */
+	VIRTIO_VIDEO_CMD_GET_PARAMS__UNUSED,
+	VIRTIO_VIDEO_CMD_SET_PARAMS__UNUSED,
+	VIRTIO_VIDEO_CMD_QUERY_CONTROL,
+	VIRTIO_VIDEO_CMD_GET_CONTROL,
+	VIRTIO_VIDEO_CMD_SET_CONTROL,
+    VIRTIO_VIDEO_CMD_GET_PARAMS_EXT,
+    VIRTIO_VIDEO_CMD_SET_PARAMS_EXT,
+
+	/* Response */
+	VIRTIO_VIDEO_RESP_OK_NODATA = 0x0200,
+	VIRTIO_VIDEO_RESP_OK_QUERY_CAPABILITY,
+	VIRTIO_VIDEO_RESP_OK_RESOURCE_QUEUE,
+	VIRTIO_VIDEO_RESP_OK_GET_PARAMS,
+	VIRTIO_VIDEO_RESP_OK_QUERY_CONTROL,
+	VIRTIO_VIDEO_RESP_OK_GET_CONTROL,
+
+	VIRTIO_VIDEO_RESP_ERR_INVALID_OPERATION = 0x0300,
+	VIRTIO_VIDEO_RESP_ERR_OUT_OF_MEMORY,
+	VIRTIO_VIDEO_RESP_ERR_INVALID_STREAM_ID,
+	VIRTIO_VIDEO_RESP_ERR_INVALID_RESOURCE_ID,
+	VIRTIO_VIDEO_RESP_ERR_INVALID_PARAMETER,
+	VIRTIO_VIDEO_RESP_ERR_UNSUPPORTED_CONTROL,
+};
+
+struct virtio_video_cmd_hdr {
+	__le32 type; /* One of enum virtio_video_cmd_type */
+	__le32 stream_id;
+};
+
+/* VIRTIO_VIDEO_CMD_QUERY_CAPABILITY */
+enum virtio_video_queue_type {
+	VIRTIO_VIDEO_QUEUE_TYPE_INPUT = 0x100,
+	VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT,
+};
+
+struct virtio_video_query_capability {
+	struct virtio_video_cmd_hdr hdr;
+	__le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
+	__u8 padding[4];
+};
+
+enum virtio_video_planes_layout_flag {
+	VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER = 1 << 0,
+	VIRTIO_VIDEO_PLANES_LAYOUT_PER_PLANE = 1 << 1,
+};
+
+struct virtio_video_format_range {
+	__le32 min;
+	__le32 max;
+	__le32 step;
+	__u8 padding[4];
+};
+
+struct virtio_video_format_frame {
+	struct virtio_video_format_range width;
+	struct virtio_video_format_range height;
+	__le32 num_rates;
+	__u8 padding[4];
+	/* Followed by struct virtio_video_format_range frame_rates[] */
+};
+
+struct virtio_video_format_desc {
+	__le64 mask;
+	__le32 format; /* One of VIRTIO_VIDEO_FORMAT_* types */
+	__le32 planes_layout; /* Bitmask with VIRTIO_VIDEO_PLANES_LAYOUT_* */
+	__le32 plane_align;
+	__le32 num_frames;
+	/* Followed by struct virtio_video_format_frame frames[] */
+};
+
+struct virtio_video_query_capability_resp {
+	struct virtio_video_cmd_hdr hdr;
+	__le32 num_descs;
+	__u8 padding[4];
+	/* Followed by struct virtio_video_format_desc descs[] */
+};
+
+/* VIRTIO_VIDEO_CMD_STREAM_CREATE */
+enum virtio_video_mem_type {
+	VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES,
+	VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT,
+};
+
+struct virtio_video_stream_create {
+	struct virtio_video_cmd_hdr hdr;
+	__le32 in_mem_type; /* One of VIRTIO_VIDEO_MEM_TYPE_* types */
+	__le32 out_mem_type; /* One of VIRTIO_VIDEO_MEM_TYPE_* types */
+	__le32 coded_format; /* One of VIRTIO_VIDEO_FORMAT_* types */
+	__u8 padding[4];
+	__u8 tag[64];
+};
+
+/* VIRTIO_VIDEO_CMD_STREAM_DESTROY */
+struct virtio_video_stream_destroy {
+	struct virtio_video_cmd_hdr hdr;
+};
+
+/* VIRTIO_VIDEO_CMD_STREAM_DRAIN */
+struct virtio_video_stream_drain {
+	struct virtio_video_cmd_hdr hdr;
+};
+
+/* VIRTIO_VIDEO_CMD_RESOURCE_CREATE */
+struct virtio_video_mem_entry {
+	__le64 addr;
+	__le32 length;
+	__u8 padding[4];
+};
+
+struct virtio_video_object_entry {
+	__u8 uuid[16];
+};
+
+#define VIRTIO_VIDEO_MAX_PLANES 8
+
+struct virtio_video_resource_create {
+	struct virtio_video_cmd_hdr hdr;
+	__le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
+	__le32 resource_id;
+	__le32 planes_layout;
+	__le32 num_planes;
+	__le32 plane_offsets[VIRTIO_VIDEO_MAX_PLANES];
+	__le32 num_entries[VIRTIO_VIDEO_MAX_PLANES];
+	/**
+	 * Followed by either
+	 * - struct virtio_video_mem_entry entries[]
+	 *   for VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES
+	 * - struct virtio_video_object_entry entries[]
+	 *   for VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT
+	 */
+};
+
+/* VIRTIO_VIDEO_CMD_RESOURCE_QUEUE */
+struct virtio_video_resource_queue {
+	struct virtio_video_cmd_hdr hdr;
+	__le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
+	__le32 resource_id;
+	__le64 timestamp;
+	__le32 num_data_sizes;
+	__le32 data_sizes[VIRTIO_VIDEO_MAX_PLANES];
+	__u8 padding[4];
+};
+
+enum virtio_video_buffer_flag {
+	VIRTIO_VIDEO_BUFFER_FLAG_ERR = 0x0001,
+	VIRTIO_VIDEO_BUFFER_FLAG_EOS = 0x0002,
+
+	/* Encoder only */
+	VIRTIO_VIDEO_BUFFER_FLAG_IFRAME = 0x0004,
+	VIRTIO_VIDEO_BUFFER_FLAG_PFRAME = 0x0008,
+	VIRTIO_VIDEO_BUFFER_FLAG_BFRAME = 0x0010,
+};
+
+struct virtio_video_resource_queue_resp {
+	struct virtio_video_cmd_hdr hdr;
+	__le64 timestamp;
+	__le32 flags; /* One of VIRTIO_VIDEO_BUFFER_FLAG_* flags */
+	__le32 size; /* Encoded size */
+};
+
+/* VIRTIO_VIDEO_CMD_RESOURCE_DESTROY_ALL */
+struct virtio_video_resource_destroy_all {
+	struct virtio_video_cmd_hdr hdr;
+	__le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
+	__u8 padding[4];
+};
+
+/* VIRTIO_VIDEO_CMD_QUEUE_CLEAR */
+struct virtio_video_queue_clear {
+	struct virtio_video_cmd_hdr hdr;
+	__le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
+	__u8 padding[4];
+};
+
+/* VIRTIO_VIDEO_CMD_GET_PARAMS */
+struct virtio_video_plane_format {
+	__le32 plane_size;
+	__le32 stride;
+};
+
+struct virtio_video_crop {
+	__le32 left;
+	__le32 top;
+	__le32 width;
+	__le32 height;
+};
+
+struct virtio_video_params {
+	__le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
+	__le32 format; /* One of VIRTIO_VIDEO_FORMAT_* types */
+	__le32 frame_width;
+	__le32 frame_height;
+	__le32 min_buffers;
+	__le32 max_buffers;
+	struct virtio_video_crop crop;
+	__le32 frame_rate;
+	__le32 num_planes;
+	struct virtio_video_plane_format plane_formats[VIRTIO_VIDEO_MAX_PLANES];
+    __le32 resource_type; /* One of VIRTIO_VIDEO_MEM_TYPE_* types */
+    __u8 padding[4];
+};
+
+struct virtio_video_get_params {
+	struct virtio_video_cmd_hdr hdr;
+	__le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* types */
+	__u8 padding[4];
+};
+
+struct virtio_video_get_params_resp {
+	struct virtio_video_cmd_hdr hdr;
+	struct virtio_video_params params;
+};
+
+/* VIRTIO_VIDEO_CMD_SET_PARAMS */
+struct virtio_video_set_params {
+	struct virtio_video_cmd_hdr hdr;
+	struct virtio_video_params params;
+};
+
+/* VIRTIO_VIDEO_CMD_QUERY_CONTROL */
+enum virtio_video_control_type {
+	VIRTIO_VIDEO_CONTROL_BITRATE = 1,
+	VIRTIO_VIDEO_CONTROL_PROFILE,
+	VIRTIO_VIDEO_CONTROL_LEVEL,
+	VIRTIO_VIDEO_CONTROL_FORCE_KEYFRAME,
+    VIRTIO_VIDEO_CONTROL_BITRATE_MODE,
+    VIRTIO_VIDEO_CONTROL_BITRATE_PEAK,
+    VIRTIO_VIDEO_CONTROL_PREPEND_SPSPPS_TO_IDR,
+};
+
+struct virtio_video_query_control_profile {
+	__le32 format; /* One of VIRTIO_VIDEO_FORMAT_* */
+	__u8 padding[4];
+};
+
+struct virtio_video_query_control_level {
+	__le32 format; /* One of VIRTIO_VIDEO_FORMAT_* */
+	__u8 padding[4];
+};
+
+struct virtio_video_query_control {
+	struct virtio_video_cmd_hdr hdr;
+	__le32 control; /* One of VIRTIO_VIDEO_CONTROL_* types */
+	__u8 padding[4];
+	/*
+	 * Followed by a value of struct virtio_video_query_control_*
+	 * in accordance with the value of control.
+	 */
+};
+
+struct virtio_video_query_control_resp_profile {
+	__le32 num;
+	__u8 padding[4];
+	/* Followed by an array le32 profiles[] */
+};
+
+struct virtio_video_query_control_resp_level {
+	__le32 num;
+	__u8 padding[4];
+	/* Followed by an array le32 level[] */
+};
+
+struct virtio_video_query_control_resp {
+	struct virtio_video_cmd_hdr hdr;
+	/* Followed by one of struct virtio_video_query_control_resp_* */
+};
+
+/* VIRTIO_VIDEO_CMD_GET_CONTROL */
+struct virtio_video_get_control {
+	struct virtio_video_cmd_hdr hdr;
+	__le32 control; /* One of VIRTIO_VIDEO_CONTROL_* types */
+	__u8 padding[4];
+};
+
+struct virtio_video_control_val_bitrate {
+	__le32 bitrate;
+	__u8 padding[4];
+};
+
+struct virtio_video_control_val_bitrate_peak {
+    __le32 bitrate_peak;
+    __u8 padding[4];
+};
+
+struct virtio_video_control_val_bitrate_mode {
+    __le32 bitrate_mode;
+    __u8 padding[4];
+};
+
+struct virtio_video_control_val_profile {
+	__le32 profile;
+	__u8 padding[4];
+};
+
+struct virtio_video_control_val_level {
+	__le32 level;
+	__u8 padding[4];
+};
+
+struct virtio_video_control_val_prepend_spspps_to_idr {
+    __le32 prepend_spspps_to_idr;
+    __u8 padding[4];
+};
+
+struct virtio_video_get_control_resp {
+	struct virtio_video_cmd_hdr hdr;
+	/* Followed by one of struct virtio_video_control_val_* */
+};
+
+/* VIRTIO_VIDEO_CMD_SET_CONTROL */
+struct virtio_video_set_control {
+	struct virtio_video_cmd_hdr hdr;
+	__le32 control; /* One of VIRTIO_VIDEO_CONTROL_* types */
+	__u8 padding[4];
+	/* Followed by one of struct virtio_video_control_val_* */
+};
+
+struct virtio_video_set_control_resp {
+	struct virtio_video_cmd_hdr hdr;
+};
+
+/*
+ * Events
+ */
+
+enum virtio_video_event_type {
+	/* For all devices */
+	VIRTIO_VIDEO_EVENT_ERROR = 0x0100,
+
+	/* For decoder only */
+	VIRTIO_VIDEO_EVENT_DECODER_RESOLUTION_CHANGED = 0x0200,
+};
+
+struct virtio_video_event {
+	__le32 event_type; /* One of VIRTIO_VIDEO_EVENT_* types */
+	__le32 stream_id;
+};
+
+#endif /* _UAPI_LINUX_VIRTIO_VIDEO_H */
-- 
2.39.2



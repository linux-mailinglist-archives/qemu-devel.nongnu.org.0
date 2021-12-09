Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4ED46EA84
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 16:02:31 +0100 (CET)
Received: from localhost ([::1]:54736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvKwH-0001zT-Kl
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 10:02:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvKqj-0002bc-Dg
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:56:45 -0500
Received: from [2a00:1450:4864:20::32b] (port=35653
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvKqg-0001Za-5t
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:56:45 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so6801473wme.0
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 06:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AEQ/hf2H6Lmolyi6kLAaOjgkgfooSi3nVD5VGm8eWOQ=;
 b=JkWEuzF4a2Nwmp5cenhM+MziWwgnGiqSPpDsHsUjov2zj1c7SpxRZwieieoZoW6F4z
 /1AYMTvxOd1+KbkHCNfug0w/lhFSqRhvWUy2UzQAFRdFZ8Rgy9ThXHsmw6jro8kKf2g7
 /+ZxwcQnhY85fBrsVbRM8pEbr1+Lb9Li5yzR/DIW1ncgo9OdfakbBMnxBFdOaKKKigvS
 7bJ6uAYDAKTlg+bqTTCDXIZN1odxdsni+azxSM0WJTZ/5ogQWX7bfOWTtsl9OmzL1OM1
 vZqxg4S/soET/bfkpo7Fp5V8hwuQIWrGmyRfZ+DpBmPmM8J5XYR9980mQTq9FoNgFRDD
 uUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AEQ/hf2H6Lmolyi6kLAaOjgkgfooSi3nVD5VGm8eWOQ=;
 b=MsdVmW+X+U83jdN4a1si8sip+Q18k33aj7D1AmM4ADjsvRbuaGTyCovLTl3/DqYeLg
 0Ko8AzdIsCAICFklFdtLViCnZoJ6urkfJoDG8w4AW5svtwBAtewatLapgqsKJNDxvcsi
 sGVgZDA4HVX+4wb04uZKWB1yswrqu2eLTpJDrUAPWI4RWS/7mTR10RTcXWYiVnqM2TN5
 Bj6zWJecA5bG99drWP6SBzI7/fFKapIpaLPLheC3BFhx/MgzC9C1CmuEnf2nKUL00Wgt
 uFYoiXqvYXTIoFbqZZqcn5gCfEHpZeLuHt8E5ftab9+ZaKAvDXWBRTtXSsSrfQAu4ngz
 pneA==
X-Gm-Message-State: AOAM532O+yBTyLmMzD81Zp8CWdUYNn5VkhwTOAMIg8UD32AEdnqVHKl7
 g7IrR9zPQpO/ECBtM80e4uBhPw==
X-Google-Smtp-Source: ABdhPJwM2VCEIehiKgXcVhFyIuJtSIiZOThS5g3KUyxdhvGy5gf8BCG828aJiO8XaEToglbHEC5/zg==
X-Received: by 2002:a7b:c770:: with SMTP id x16mr8143322wmk.66.1639061800603; 
 Thu, 09 Dec 2021 06:56:40 -0800 (PST)
Received: from xps15-9570.lan (host-92-16-105-103.as13285.net. [92.16.105.103])
 by smtp.gmail.com with ESMTPSA id y142sm30845wmc.40.2021.12.09.06.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 06:56:40 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: marcandre.lureau@redhat.com,
	mst@redhat.com,
	alex.bennee@linaro.org
Subject: [PATCH 5/8] standard-headers: Add virtio_video.h
Date: Thu,  9 Dec 2021 14:55:58 +0000
Message-Id: <20211209145601.331477-6-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209145601.331477-1-peter.griffin@linaro.org>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.griffin@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Griffin <peter.griffin@linaro.org>, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 include/standard-headers/linux/virtio_video.h | 483 ++++++++++++++++++
 1 file changed, 483 insertions(+)
 create mode 100644 include/standard-headers/linux/virtio_video.h

diff --git a/include/standard-headers/linux/virtio_video.h b/include/standard-headers/linux/virtio_video.h
new file mode 100644
index 0000000000..16b5f642a9
--- /dev/null
+++ b/include/standard-headers/linux/virtio_video.h
@@ -0,0 +1,483 @@
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
+	VIRTIO_VIDEO_FORMAT_CODED_MAX = VIRTIO_VIDEO_FORMAT_VP9,
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
+/*
+ * Config
+ */
+
+struct virtio_video_config {
+	__le32 version;
+	__le32 max_caps_length;
+	__le32 max_resp_length;
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
+	VIRTIO_VIDEO_CMD_GET_PARAMS,
+	VIRTIO_VIDEO_CMD_SET_PARAMS,
+	VIRTIO_VIDEO_CMD_QUERY_CONTROL,
+	VIRTIO_VIDEO_CMD_GET_CONTROL,
+	VIRTIO_VIDEO_CMD_SET_CONTROL,
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
2.25.1



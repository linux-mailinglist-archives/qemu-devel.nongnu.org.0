Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F306EA318
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 07:25:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppjFc-0003S3-DR; Fri, 21 Apr 2023 01:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjFW-0003Re-Cq
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:23:58 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjFU-0001db-HE
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:23:58 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f1950f5628so400175e9.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 22:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682054634; x=1684646634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UVMAUpD3jHH8OkngSUWsCZ+0Iib70URdOUn8K/MqeCg=;
 b=LH/fyEBtRjDymlHRn5j2P00ROykhaQPVUG0++vcN1FvhJmea1T6sofCzkWTdo5wlhl
 h8pMr09soTuSlWBrZrRHaWj+pSOcVkvEysg/Jc+8vyYofviku5HS9Ic4D7x13ybyDazZ
 5jV5JyeqAetnuEzbhEQfHtpNYnBnTFmSiqgzlaZjqAvSSbbVmkYVCr8S4OZ98DnSJ6tb
 lseQSyjxy5SDfHqU5fPMqII7ojzP1O3PssHE2tEYRd3b6ALJUulB3y0PmJRFlGRDl/+5
 LW2+UGNfbhf5YsP+Em/K8o4zmmeNiGwW56fPk1WzrL9YEow69spck8ekSEF2h+VI8KQ9
 Aevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682054634; x=1684646634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UVMAUpD3jHH8OkngSUWsCZ+0Iib70URdOUn8K/MqeCg=;
 b=MRba6NxvCA/jB1kfsVJ0Ln643BVodllcWuj0aHVkCF2qEKfzR63coyjx351jyknb5U
 H5AcFNLKfG+Je32cbSo7TLWvLNte8wea0pKvlnzu5DwKiUASqdRtKxXZKe40Z++qEEC5
 vxlYO5n+J+w/VlClYAQcD2o+UHqAIvc5GAlpLjL2sfwncgydiXhw4MDucCULZ32gcY/v
 Rx3YwIJwm2R+ZIgFge97gs/17/8IiVk6iIRtkgdo8Yp3eHB4lBwWkvSsWyi2NZyZc1hK
 Zr2CO+k4WesLREMvBXIYH0HlKrn2NfTikE74q+2vaibhbTSxyM89VLcx58rmAiNHX6zG
 QyMw==
X-Gm-Message-State: AAQBX9cB9R5bc836GpONl9szggwgTXzvH8rHIEsVoREj0ULUx2DoPju/
 pa/MTkzpBN9+AMDYb1sMU6qkIIjdqlw=
X-Google-Smtp-Source: AKy350bX8cn9qydhqGNOp7ZuCcamWRrtCbMH65I0aRoMFiOz0epQbAe2wUhaiBO0I6cS60nKCuc4Aw==
X-Received: by 2002:a7b:c441:0:b0:3f0:7e56:82a4 with SMTP id
 l1-20020a7bc441000000b003f07e5682a4mr919818wmi.18.1682054634663; 
 Thu, 20 Apr 2023 22:23:54 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a7bc3cd000000b003f173c566b5sm3813475wmj.5.2023.04.20.22.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 22:23:54 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
X-Google-Original-From: Karim Taha <krm.taha@outlook.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com,
	Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 02/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 07:22:46 +0200
Message-Id: <20230421052255.5603-3-krm.taha@outlook.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421052255.5603-1-krm.taha@outlook.com>
References: <20230421052255.5603-1-krm.taha@outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stacey Son <sson@FreeBSD.org>

add the relevant definitions of struct target_sockaddr and struct
target_ip_mreq and the related flags, to be used in
bsd-user/bsd-socket.c for the socket conversion functions: target_to_host_sockaddr, host_to_target_sockaddr, target_to_host_ip_mreq
---
 bsd-user/syscall_defs.h | 110 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/bsd-user/syscall_defs.h b/bsd-user/syscall_defs.h
index b6d113d24a..f041245792 100644
--- a/bsd-user/syscall_defs.h
+++ b/bsd-user/syscall_defs.h
@@ -179,6 +179,116 @@ struct target_freebsd__wrusage {
     struct target_freebsd_rusage wru_children;
 };
 
+/*
+ * sys/socket.h
+ */
+
+/*
+ * Types
+ */
+#define TARGET_SOCK_STREAM      1   /* stream socket */
+#define TARGET_SOCK_DGRAM       2   /* datagram socket */
+#define TARGET_SOCK_RAW         3   /* raw-protocol interface */
+#define TARGET_SOCK_RDM         4   /* reliably-delivered message */
+#define TARGET_SOCK_SEQPACKET   5   /* sequenced packet stream */
+
+
+/*
+ * Option flags per-socket.
+ */
+
+#define TARGET_SO_DEBUG         0x0001  /* turn on debugging info recording */
+#define TARGET_SO_ACCEPTCONN    0x0002  /* socket has had listen() */
+#define TARGET_SO_REUSEADDR     0x0004  /* allow local address reuse */
+#define TARGET_SO_KEEPALIVE     0x0008  /* keep connections alive */
+#define TARGET_SO_DONTROUTE     0x0010  /* just use interface addresses */
+#define TARGET_SO_BROADCAST     0x0020  /* permit sending of broadcast msgs */
+#define TARGET_SO_USELOOPBACK   0x0040  /* bypass hardware when possible */
+#define TARGET_SO_LINGER        0x0080  /* linger on close if data present */
+#define TARGET_SO_OOBINLINE     0x0100  /* leave received OOB data in line */
+#define TARGET_SO_REUSEPORT     0x0200  /* allow local address & port reuse */
+#define TARGET_SO_TIMESTAMP     0x0400  /* timestamp received dgram traffic */
+#define TARGET_SO_NOSIGPIPE     0x0800  /* no SIGPIPE from EPIPE */
+#define TARGET_SO_ACCEPTFILTER  0x1000  /* there is an accept filter */
+#define TARGET_SO_BINTIME       0x2000  /* timestamp received dgram traffic */
+#define TARGET_SO_NO_OFFLOAD    0x4000  /* socket cannot be offloaded */
+#define TARGET_SO_NO_DDP        0x8000  /* disable direct data placement */
+
+/*
+ * Additional options, not kept in so_options.
+ */
+#define TARGET_SO_SNDBUF        0x1001  /* send buffer size */
+#define TARGET_SO_RCVBUF        0x1002  /* receive buffer size */
+#define TARGET_SO_SNDLOWAT      0x1003  /* send low-water mark */
+#define TARGET_SO_RCVLOWAT      0x1004  /* receive low-water mark */
+#define TARGET_SO_SNDTIMEO      0x1005  /* send timeout */
+#define TARGET_SO_RCVTIMEO      0x1006  /* receive timeout */
+#define TARGET_SO_ERROR         0x1007  /* get error status and clear */
+#define TARGET_SO_TYPE          0x1008  /* get socket type */
+#define TARGET_SO_LABEL         0x1009  /* socket's MAC label */
+#define TARGET_SO_PEERLABEL     0x1010  /* socket's peer's MAC label */
+#define TARGET_SO_LISTENQLIMIT  0x1011  /* socket's backlog limit */
+#define TARGET_SO_LISTENQLEN    0x1012  /* socket's complete queue length */
+#define TARGET_SO_LISTENINCQLEN 0x1013  /* socket's incomplete queue length */
+#define TARGET_SO_SETFIB        0x1014  /* use this FIB to route */
+#define TARGET_SO_USER_COOKIE   0x1015  /* user cookie (dummynet etc.) */
+#define TARGET_SO_PROTOCOL      0x1016  /* get socket protocol (Linux name) */
+
+/* alias for SO_PROTOCOL (SunOS name) */
+#define TARGET_SO_PROTOTYPE     TARGET_SO_PROTOCOL
+
+/*
+ * Level number for (get/set)sockopt() to apply to socket itself.
+ */
+#define TARGET_SOL_SOCKET       0xffff  /* options for socket level */
+
+#ifndef CMSG_ALIGN
+#define CMSG_ALIGN(len) (((len) + sizeof(long) - 1) & ~(sizeof(long) - 1))
+#endif
+
+/*
+ * sys/socket.h
+ */
+struct target_msghdr {
+    abi_long    msg_name;       /* Socket name */
+    int32_t     msg_namelen;    /* Length of name */
+    abi_long    msg_iov;        /* Data blocks */
+    int32_t     msg_iovlen;     /* Number of blocks */
+    abi_long    msg_control;    /* Per protocol magic (eg BSD fd passing) */
+    int32_t     msg_controllen; /* Length of cmsg list */
+    int32_t     msg_flags;      /* flags on received message */
+};
+
+struct target_sockaddr {
+    uint8_t sa_len;
+    uint8_t sa_family;
+    uint8_t sa_data[14];
+} QEMU_PACKED;
+
+struct target_in_addr {
+    uint32_t s_addr; /* big endian */
+};
+
+struct target_cmsghdr {
+    uint32_t    cmsg_len;
+    int32_t     cmsg_level;
+    int32_t     cmsg_type;
+};
+
+/*
+ * netinet/in.h
+ */
+struct target_ip_mreq {
+    struct target_in_addr   imr_multiaddr;
+    struct target_in_addr   imr_interface;
+};
+
+struct target_ip_mreqn {
+    struct target_in_addr   imr_multiaddr;
+    struct target_in_addr   imr_address;
+    int32_t                 imr_ifindex;
+};
+
 #define safe_syscall0(type, name) \
 type safe_##name(void) \
 { \
-- 
2.40.0



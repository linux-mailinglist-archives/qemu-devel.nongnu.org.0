Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C354A109C2C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 11:19:32 +0100 (CET)
Received: from localhost ([::1]:52210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZXwR-0000bc-CJ
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 05:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57458)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prashantbhole.linux@gmail.com>) id 1iZXsE-0005g9-Sn
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 05:15:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prashantbhole.linux@gmail.com>) id 1iZXna-0003jy-9E
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 05:10:27 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:40860)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <prashantbhole.linux@gmail.com>)
 id 1iZXna-0003jo-2y
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 05:10:22 -0500
Received: by mail-pj1-x1043.google.com with SMTP id ep1so8070951pjb.7
 for <qemu-devel@nongnu.org>; Tue, 26 Nov 2019 02:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8RYu51EDNv1nof9QqLb6ITvPij8Y0e1oqvT4ZWA3MBk=;
 b=nRF5Tm8jxrFWVSKwm9O8IM/CbmQqEsu5rCN9Jyr5Imv6QqQfq9VRMYS7YLJ5wUJCxh
 qIt9XGVC1HAjJFjMFfh2wiMDJ1RsUshx7jiDLkSxPCruk/EpIJA5uWjo33nVwjrwg7KQ
 iqAIss99ASYM2cGrf4dQrhfnPWjiHbnNJiSrsXNoPQPG99KrN1YdAAsafpM+Mau9iN3X
 g3ZrKf6tLLLyKSYyX6wrhJ2QDhD4/HkK2AbM4EASZg5bK2CrlgHNsZiMnfc8ye1r2Vti
 5CmHfDMSNkWzgKkbp2IsgZJrdCp3p41Vbh3TvrO36cyVwu+Ef5NXYan++ww4AzfpXKdS
 H29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8RYu51EDNv1nof9QqLb6ITvPij8Y0e1oqvT4ZWA3MBk=;
 b=oBWp7l1ht7s+f4IJ8Uf9Hrel56EiShbJ2Ub7A5rA30AhgGGtFCbRvMrb761gOWlJ20
 oBihnB9w040b0KcG/nXfgy22DbO28CcGZf9bg0bChXP30Ahu6PUf5Mc0IkZd6+ioNHge
 wDc50MBYuIY61zuQDmrQvlcbM8PLl3WcKJZmglgwsmSC+KooZa3Uco+xBPNmcJ0eASbk
 8MbZPpl0wj5HgIC+S6kcRs0fpPz7wPydsVA2Hbz/qJI/jn8aI7KjjWNpNEpm7jk7A96i
 V6TAa7uK/uACwOPWhG1xAxAtQiO4BJg8Yd4m2J/C2l/EzMKpuPBIly/5lQLWuEiQcRSr
 vjUA==
X-Gm-Message-State: APjAAAUsZy4HsnwZYCrQKDiszmIgBF+Xv1qso4p9D/nukXEfhPH5kzZf
 G/NOLvarMV8150ulMXnMqZc=
X-Google-Smtp-Source: APXvYqxADjKHatHur+fxT/01AG/vZgD9nSsRNGb2AyFD7GjgVAPzN1abgIppTbaJ/3338My3voR1ig==
X-Received: by 2002:a17:90a:650c:: with SMTP id
 i12mr5948361pjj.28.1574763021275; 
 Tue, 26 Nov 2019 02:10:21 -0800 (PST)
Received: from localhost.localdomain ([222.151.198.97])
 by smtp.gmail.com with ESMTPSA id h9sm12059065pgk.84.2019.11.26.02.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 02:10:20 -0800 (PST)
From: Prashant Bhole <prashantbhole.linux@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
Subject: [RFC 3/3] virtio-net: add support for offloading an ebpf map
Date: Tue, 26 Nov 2019 19:09:14 +0900
Message-Id: <20191126100914.5150-4-prashantbhole.linux@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191126100914.5150-1-prashantbhole.linux@gmail.com>
References: <20191126100914.5150-1-prashantbhole.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
Cc: Song Liu <songliubraving@fb.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>,
 Prashant Bhole <prashantbhole.linux@gmail.com>, kvm@vger.kernel.org,
 Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

This change is a part of XDP offload feature. It handles offloading
of eBPF map from the guest.

A command handler for VIRTIO_NET_CTRL_EBPF now checks for subcommand
VIRTIO_NET_CTRL_EBPF_MAP and. The control buffer consists of struct
virtio_net_ctrl_ebpf_map followed by map key/value or key/key pair.
Map manipulation is done using libbpf APIs.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Co-developed-by: Prashant Bhole <prashantbhole.linux@gmail.com>
Signed-off-by: Prashant Bhole <prashantbhole.linux@gmail.com>
---
 hw/net/Makefile.objs                        |  2 +
 hw/net/virtio-net.c                         | 88 +++++++++++++++++++++
 include/standard-headers/linux/virtio_net.h | 23 ++++++
 3 files changed, 113 insertions(+)

diff --git a/hw/net/Makefile.objs b/hw/net/Makefile.objs
index 7907d2c199..5928497a01 100644
--- a/hw/net/Makefile.objs
+++ b/hw/net/Makefile.objs
@@ -52,3 +52,5 @@ common-obj-$(CONFIG_ROCKER) += rocker/rocker.o rocker/rocker_fp.o \
 obj-$(call lnot,$(CONFIG_ROCKER)) += rocker/qmp-norocker.o
 
 common-obj-$(CONFIG_CAN_BUS) += can/
+
+virtio-net.o-libs := $(LIBBPF_LIBS)
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 7cc1bd1654..3c49273796 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1011,6 +1011,92 @@ static int virtio_net_handle_offloads(VirtIONet *n, uint8_t cmd,
     }
 }
 
+static int virtio_net_handle_ebpf_map(VirtIONet *n, struct iovec *iov,
+                                      unsigned int iov_cnt)
+{
+#ifdef CONFIG_LIBBPF
+    struct virtio_net_ctrl_ebpf_map *ctrl = NULL;
+    struct bpf_create_map_attr map_attr = {};
+    uint8_t *key, *val;
+    uint32_t buf_len;
+    int fd, err = 0;
+    size_t s;
+
+    s = iov_to_buf(iov, iov_cnt, 0, &buf_len, sizeof(buf_len));
+    if (s != sizeof(buf_len)) {
+        goto err;
+    }
+
+    ctrl = malloc(sizeof(*ctrl) + buf_len);
+    if (!ctrl) {
+        goto err;
+    }
+
+    s = iov_to_buf(iov, iov_cnt, 0, ctrl, sizeof(*ctrl) + buf_len);
+    if (s != (sizeof(*ctrl) + buf_len)) {
+        error_report("Invalid map control buffer");
+        goto err;
+    }
+
+    key = ctrl->buf;
+    val = ctrl->buf + ctrl->key_size;
+
+    switch (ctrl->cmd) {
+    case VIRTIO_NET_BPF_CMD_CREATE_MAP:
+        map_attr.map_type = ctrl->map_type;
+        map_attr.map_flags = ctrl->map_flags;
+        map_attr.key_size = ctrl->key_size;
+        map_attr.value_size = ctrl->value_size;
+        map_attr.max_entries = ctrl->max_entries;
+        fd = bpf_create_map_xattr(&map_attr);
+        if (fd < 0) {
+            goto err;
+        }
+        ctrl->map_fd = fd;
+        break;
+    case VIRTIO_NET_BPF_CMD_FREE_MAP:
+        close(ctrl->map_fd);
+        break;
+    case VIRTIO_NET_BPF_CMD_LOOKUP_ELEM:
+        err = bpf_map_lookup_elem(ctrl->map_fd, key, val);
+        break;
+    case VIRTIO_NET_BPF_CMD_GET_FIRST:
+        err = bpf_map_get_next_key(ctrl->map_fd, NULL, val);
+        break;
+    case VIRTIO_NET_BPF_CMD_GET_NEXT:
+        err = bpf_map_get_next_key(ctrl->map_fd, key, val);
+        break;
+    case VIRTIO_NET_BPF_CMD_UPDATE_ELEM:
+        err = bpf_map_update_elem(ctrl->map_fd, key, val, ctrl->flags);
+        break;
+    case VIRTIO_NET_BPF_CMD_DELETE_ELEM:
+        err = bpf_map_delete_elem(ctrl->map_fd, key);
+    default:
+        error_report("map operation not implemented %d", ctrl->cmd);
+        goto err;
+    }
+
+    if (err) {
+        goto err;
+    }
+
+    s = iov_from_buf(iov, iov_cnt, 0, ctrl, sizeof(*ctrl) + buf_len);
+    if (s != sizeof(*ctrl) + buf_len) {
+        error_report("failed to write map operation result");
+        goto err;
+    }
+
+    free(ctrl);
+    return VIRTIO_NET_OK;
+
+err:
+    if (ctrl) {
+        free(ctrl);
+    }
+#endif
+    return VIRTIO_NET_ERR;
+}
+
 static int virtio_net_handle_ebpf_prog(VirtIONet *n, struct iovec *iov,
                                        unsigned int iov_cnt)
 {
@@ -1053,6 +1139,8 @@ static int virtio_net_handle_ebpf(VirtIONet *n, uint8_t cmd,
 {
     if (cmd == VIRTIO_NET_CTRL_EBPF_PROG) {
         return virtio_net_handle_ebpf_prog(n, iov, iov_cnt);
+    } else if (cmd == VIRTIO_NET_CTRL_EBPF_MAP) {
+        return virtio_net_handle_ebpf_map(n, iov, iov_cnt);
     }
 
     return VIRTIO_NET_ERR;
diff --git a/include/standard-headers/linux/virtio_net.h b/include/standard-headers/linux/virtio_net.h
index 83292c81bc..cca234e0e8 100644
--- a/include/standard-headers/linux/virtio_net.h
+++ b/include/standard-headers/linux/virtio_net.h
@@ -281,11 +281,34 @@ struct virtio_net_ctrl_ebpf_prog {
 	uint8_t insns[0];
 };
 
+struct virtio_net_ctrl_ebpf_map {
+	__virtio32 buf_len;
+	__virtio32 cmd;
+	__virtio32 map_type;
+	__virtio32 key_size;
+	__virtio32 value_size;
+	__virtio32 max_entries;
+	__virtio32 map_flags;
+	__virtio32 map_fd;
+	__virtio64 flags;
+	uint8_t buf[0];
+};
+
 #define VIRTIO_NET_CTRL_EBPF 	6
  #define VIRTIO_NET_CTRL_EBPF_PROG 1
+ #define VIRTIO_NET_CTRL_EBPF_MAP 2
 
 /* Commands for VIRTIO_NET_CTRL_EBPF_PROG */
 #define VIRTIO_NET_BPF_CMD_SET_OFFLOAD 1
 #define VIRTIO_NET_BPF_CMD_UNSET_OFFLOAD 2
 
+/* Commands for VIRTIO_NET_CTRL_EBPF_MAP */
+#define VIRTIO_NET_BPF_CMD_CREATE_MAP 1
+#define VIRTIO_NET_BPF_CMD_FREE_MAP 2
+#define VIRTIO_NET_BPF_CMD_UPDATE_ELEM 3
+#define VIRTIO_NET_BPF_CMD_LOOKUP_ELEM 4
+#define VIRTIO_NET_BPF_CMD_DELETE_ELEM 5
+#define VIRTIO_NET_BPF_CMD_GET_FIRST 6
+#define VIRTIO_NET_BPF_CMD_GET_NEXT 7
+
 #endif /* _LINUX_VIRTIO_NET_H */
-- 
2.20.1



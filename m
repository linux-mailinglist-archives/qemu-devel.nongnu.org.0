Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AEB35BC35
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 10:31:22 +0200 (CEST)
Received: from localhost ([::1]:59372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVryb-00024E-Km
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 04:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lVruW-00069Z-1w
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:27:08 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:38704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lVruU-00022h-26
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:27:07 -0400
Received: by mail-lj1-x22e.google.com with SMTP id r22so3633193ljc.5
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 01:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rR/ZgngZM5oOB4BqtYElewjRkJ3NaY7MYoAEqn+Vxxc=;
 b=VoU0ZWFg/2TrFJpX4MnDajsTvrcKQQb1YnxhsnOJ+ibiHeXKAg9WMjea2TzbxUwwpg
 HNhoYJM+LX2GBRmIH5fzdwudokgPeYufbsRWVpgRkFDH2+x+bCz7eCRwpXsdZNeO9nwZ
 nefE05xx65wgg8NdKHRvCSEm+odq8yA3VtqKoib2n/ozTsMEWBQuLyjYJyfyKE1UOg4P
 Bl4XbinZdSFphhKgpYLpJoZEa3xtzvB6Kls+vj0QoSEEhZzEJORqznCUJGSoLtRb/AKZ
 w2UciwO/8Jjmo1lOBoLWv+mGsOaRlDyhw3RKDLzM1pcUFqMYc5Z9x5/7awSFPYv2/G6/
 heIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rR/ZgngZM5oOB4BqtYElewjRkJ3NaY7MYoAEqn+Vxxc=;
 b=pBxr7HsvgxVtqA2XZRtK/kFVZAS/kodmv0bIlJJy33vx2EmNm04p9ODkDlhHcsSFLj
 r1qWoQO4fMrfuYA9kM4kYkyVIrqlJz/Mh+mKIQ4FETXMOcAIlHazg3O4RxQNTvCuoULV
 LN8U9VxswF2lRToTrUQ9BN7msUuP6XwryYi80Tmy0ljXzn2m11k7/gXdP1QvFJMHnWmm
 L0njpMjnnwAcq2hOQGfEOkDuUx8XDwD3orlBzdVTiLhA2dte2rIi+bB+eX4navNQziaw
 og4sbSSav+Gpet4hd7NzVmUWLgmRCjy3P2QwICHpq3LGAIF+M6aXn472jrDxdXv6/S59
 RQlA==
X-Gm-Message-State: AOAM531ks/eskKYDeAcAsO1xOaRR9uisBRlsepcXN2orwOZnvoHCZvnk
 JDUSNJvKKm4rYMC+/N/y3jJXNQ==
X-Google-Smtp-Source: ABdhPJyDkITOUGIDJEdQn8XUAkJxO7dpe3t6AhaksnPQHvRgdT9YPU9aNeufPCRwjEw8JiAzy1dHlw==
X-Received: by 2002:a2e:7607:: with SMTP id r7mr4078883ljc.226.1618216024359; 
 Mon, 12 Apr 2021 01:27:04 -0700 (PDT)
Received: from localhost.localdomain (128-124-64-30.mobile.vf-ua.net.
 [128.124.64.30])
 by smtp.gmail.com with ESMTPSA id n22sm2679702ljc.23.2021.04.12.01.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 01:27:03 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [PATCH v6 6/7] docs: Added eBPF documentation.
Date: Mon, 12 Apr 2021 11:25:11 +0300
Message-Id: <20210412082512.14998-7-andrew@daynix.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210412082512.14998-1-andrew@daynix.com>
References: <20210412082512.14998-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::22e;
 envelope-from=andrew@daynix.com; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew <andrew@daynix.com>

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 docs/devel/ebpf_rss.rst | 125 ++++++++++++++++++++++++++++++++++++++++
 docs/devel/index.rst    |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 docs/devel/ebpf_rss.rst

diff --git a/docs/devel/ebpf_rss.rst b/docs/devel/ebpf_rss.rst
new file mode 100644
index 0000000000..e00962577a
--- /dev/null
+++ b/docs/devel/ebpf_rss.rst
@@ -0,0 +1,125 @@
+===========================
+eBPF RSS virtio-net support
+===========================
+
+RSS(Receive Side Scaling) is used to distribute network packets to guest virtqueues
+by calculating packet hash. Usually every queue is processed then by a specific guest CPU core.
+
+For now there are 2 RSS implementations in qemu:
+- 'in-qemu' RSS (functions if qemu receives network packets, i.e. vhost=off)
+- eBPF RSS (can function with also with vhost=on)
+
+eBPF support (CONFIG_EBPF) is enabled by 'configure' script.
+To enable eBPF RSS support use './configure --enable-bpf'.
+
+If steering BPF is not set for kernel's TUN module, the TUN uses automatic selection
+of rx virtqueue based on lookup table built according to calculated symmetric hash
+of transmitted packets.
+If steering BPF is set for TUN the BPF code calculates the hash of packet header and
+returns the virtqueue number to place the packet to.
+
+Simplified decision formula:
+
+.. code:: C
+
+    queue_index = indirection_table[hash(<packet data>)%<indirection_table size>]
+
+
+Not for all packets, the hash can/should be calculated.
+
+Note: currently, eBPF RSS does not support hash reporting.
+
+eBPF RSS turned on by different combinations of vhost-net, vitrio-net and tap configurations:
+
+- eBPF is used:
+
+        tap,vhost=off & virtio-net-pci,rss=on,hash=off
+
+- eBPF is used:
+
+        tap,vhost=on & virtio-net-pci,rss=on,hash=off
+
+- 'in-qemu' RSS is used:
+
+        tap,vhost=off & virtio-net-pci,rss=on,hash=on
+
+- eBPF is used, hash population feature is not reported to the guest:
+
+        tap,vhost=on & virtio-net-pci,rss=on,hash=on
+
+If CONFIG_EBPF is not set then only 'in-qemu' RSS is supported.
+Also 'in-qemu' RSS, as a fallback, is used if the eBPF program failed to load or set to TUN.
+
+RSS eBPF program
+----------------
+
+RSS program located in ebpf/rss.bpf.skeleton.h generated by bpftool.
+So the program is part of the qemu binary.
+Initially, the eBPF program was compiled by clang and source code located at tools/ebpf/rss.bpf.c.
+Prerequisites to recompile the eBPF program (regenerate ebpf/rss.bpf.skeleton.h):
+
+        llvm, clang, kernel source tree, bpftool
+        Adjust Makefile.ebpf to reflect the location of the kernel source tree
+
+        $ cd tools/ebpf
+        $ make -f Makefile.ebpf
+
+Current eBPF RSS implementation uses 'bounded loops' with 'backward jump instructions' which present in the last kernels.
+Overall eBPF RSS works on kernels 5.8+.
+
+eBPF RSS implementation
+-----------------------
+
+eBPF RSS loading functionality located in ebpf/ebpf_rss.c and ebpf/ebpf_rss.h.
+
+The `struct EBPFRSSContext` structure that holds 4 file descriptors:
+
+- ctx - pointer of the libbpf context.
+- program_fd - file descriptor of the eBPF RSS program.
+- map_configuration - file descriptor of the 'configuration' map. This map contains one element of 'struct EBPFRSSConfig'. This configuration determines eBPF program behavior.
+- map_toeplitz_key - file descriptor of the 'Toeplitz key' map. One element of the 40byte key prepared for the hashing algorithm.
+- map_indirections_table - 128 elements of queue indexes.
+
+`struct EBPFRSSConfig` fields:
+
+- redirect - "boolean" value, should the hash be calculated, on false  - `default_queue` would be used as the final decision.
+- populate_hash - for now, not used. eBPF RSS doesn't support hash reporting.
+- hash_types - binary mask of different hash types. See `VIRTIO_NET_RSS_HASH_TYPE_*` defines. If for packet hash should not be calculated - `default_queue` would be used.
+- indirections_len - length of the indirections table, maximum 128.
+- default_queue - the queue index that used for packet that shouldn't be hashed. For some packets, the hash can't be calculated(g.e ARP).
+
+Functions:
+
+- `ebpf_rss_init()` - sets ctx to NULL, which indicates that EBPFRSSContext is not loaded.
+- `ebpf_rss_load()` - creates 3 maps and loads eBPF program from the rss.bpf.skeleton.h. Returns 'true' on success. After that, program_fd can be used to set steering for TAP.
+- `ebpf_rss_set_all()` - sets values for eBPF maps. `indirections_table` length is in EBPFRSSConfig. `toeplitz_key` is VIRTIO_NET_RSS_MAX_KEY_SIZE aka 40 bytes array.
+- `ebpf_rss_unload()` - close all file descriptors and set ctx to NULL.
+
+Simplified eBPF RSS workflow:
+
+.. code:: C
+
+    struct EBPFRSSConfig config;
+    config.redirect = 1;
+    config.hash_types = VIRTIO_NET_RSS_HASH_TYPE_UDPv4 | VIRTIO_NET_RSS_HASH_TYPE_TCPv4;
+    config.indirections_len = VIRTIO_NET_RSS_MAX_TABLE_LEN;
+    config.default_queue = 0;
+
+    uint16_t table[VIRTIO_NET_RSS_MAX_TABLE_LEN] = {...};
+    uint8_t key[VIRTIO_NET_RSS_MAX_KEY_SIZE] = {...};
+
+    struct EBPFRSSContext ctx;
+    ebpf_rss_init(&ctx);
+    ebpf_rss_load(&ctx);
+    ebpf_rss_set_all(&ctx, &config, table, key);
+    if (net_client->info->set_steering_ebpf != NULL) {
+        net_client->info->set_steering_ebpf(net_client, ctx->program_fd);
+    }
+    ...
+    ebpf_unload(&ctx);
+
+
+NetClientState SetSteeringEBPF()
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+For now, `set_steering_ebpf()` method supported by Linux TAP NetClientState. The method requires an eBPF program file descriptor as an argument.
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 6cf7e2d233..33179ba309 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -42,3 +42,4 @@ Contents:
    qom
    block-coroutine-wrapper
    multi-process
+   ebpf_rss
-- 
2.31.0



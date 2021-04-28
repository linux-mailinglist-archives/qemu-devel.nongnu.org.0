Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA3436DDB8
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:58:27 +0200 (CEST)
Received: from localhost ([::1]:54042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnW6-0003yV-FY
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lbnLt-00049b-Pn
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:47:54 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:38658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lbnLq-0006iY-VM
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:47:53 -0400
Received: by mail-lf1-x135.google.com with SMTP id 124so19263685lff.5
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 09:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T0Wbu6qoiD9bpA7ptuoV/Y2lkGPGEkTfUfR3V0sHXsw=;
 b=scElFHpxutRnoRWKCEmv0LCD0jD/W2HdKDr4gCw8VHFnzbi8E8uwPHEQHACgnadL2a
 Zs53e5MfjPQrTm8xMVQvBEXwtwkDpc1bZiB0lscwnGDU2LzTNq+PAg3yNKzAV1W4Zb3U
 NRCHnflTHrylgfzJCzjy3Fborg/k3m0x8ekUji5m5WKJkcV0+ytEtpdogtqO15M0z48U
 g3Z1vgxf0XDMQ2wFRGojV08XI8uxXS3l2v79ALjRefddn40JHkjVSDUV/jP/sR6ne2Ja
 TGf9iFJWnsJgZR/nb1Zb3GdUvtJtyYI9ajubBPyAup56xsCp0kWUPEU1p2NZtX0tw3A1
 GO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T0Wbu6qoiD9bpA7ptuoV/Y2lkGPGEkTfUfR3V0sHXsw=;
 b=TzjghLIyQxY0wqKHyUsOeAk6XUqT3ZjU12iy+jIKapuTmcyJqCOfBpFvLTneLGzMhf
 GmtY5JvapWUXXwwF1Jr9dCfH8Y8q03RTdmWxQO+7ShqPXyTew39aauOmWRAjsHWovNeH
 67uipXOJI3BLLsWP0QPVXScoGpbN5LNFrLuryJqM7UHSm2ZDsLv/bqcdHp9OqB3DZNji
 Mn1I2ovFlO2ojDOrDcm5tpl3k+se+L/22NemlZul3M72Bpf3TtGgbKVk7CDPSnwS7n5p
 LIja+AAyrK2jwKAj01UxLlOMT5zYQMgf4pK76bkw42GbkQoimz44aL56vdFgnbl4K7K3
 a2gQ==
X-Gm-Message-State: AOAM5325XRfyrmzrhguVKAedG2h+O3Jnv1xo7c8oXYNNFjKKhHdyF6q5
 yuQCsr7Gworq/ScmlC9KAOL+Nw==
X-Google-Smtp-Source: ABdhPJx6YA9gbJvnK20ly31/1YZhdcl01ER2SbGPOAGz1ZA39OTquX0/MpkEONxkioj9bQS+Y19RMA==
X-Received: by 2002:ac2:5334:: with SMTP id f20mr4098190lfh.389.1619628468846; 
 Wed, 28 Apr 2021 09:47:48 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id v24sm86302lfp.195.2021.04.28.09.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 09:47:48 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [PATCH v7 6/7] docs: Added eBPF documentation.
Date: Wed, 28 Apr 2021 19:47:32 +0300
Message-Id: <20210428164733.56547-7-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210428164733.56547-1-andrew@daynix.com>
References: <20210428164733.56547-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::135;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x135.google.com
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
2.31.1



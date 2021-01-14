Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA522F6C73
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 21:45:53 +0100 (CET)
Received: from localhost ([::1]:38606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l09VA-0005Wh-Oy
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 15:45:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1l09SL-0003lz-7H
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 15:42:57 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:40229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1l09SC-0004l8-D2
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 15:42:56 -0500
Received: by mail-lf1-x130.google.com with SMTP id v24so3315991lfr.7
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 12:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zo+JDulbpqpXd86bTN/5v4bNXjapoOM58nTBntwYslQ=;
 b=UHkMQ/G8SvbSnziV9etoOd2LmYVWfCBlcUVEmgZeLtcyh0Tye20UpOxCglmkSZ2y34
 NZIoBubxu0ME5OJ9bfTIO2H89bUJX8EgHYsrXgr4cTPD4nNNdlKXFVM4CYjxtgCwrq++
 bunYiDdWKCsSUHPup3CL1Aja05Aqe0U+hfhebucJyWdVoBm+gu3tyUn3oVqEZCrKVu08
 qDl7sb8FKYAuQ3mFeDSMFKAHh/RivxOLlC+cj++mLfI9eSKXvR465swuotmsyOwqV3Fw
 +yygP00KIOTBwyo2Q1JTalCa20ZPBhL8RgzDwRlZLWkCCILWF/K9W/Vyi+jwUNwGDiHA
 M4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zo+JDulbpqpXd86bTN/5v4bNXjapoOM58nTBntwYslQ=;
 b=E+NH7Bu2+PFOJ3NM+jQjouCKUSCCBwlC1wwi4NgZ/ODJOZXLoBFOmSpCGNfYoSBz39
 3MxAXde7PCrEn+t0PCqoGk8O3LxMu7S/CEdOItHR8qAV7XHFHtT73saziBfw1biSQVxY
 XsO9hhLo4tQN+F0DEEQNUUbuFgRpkatm2CW4QQ0iRmR3jMaiDeByofZc2QJUEESZsW7V
 vCLGGQefreEOMt/3pupD9o4IENWQda/2pxBdmQiITsRYcC8bEwqJCoYzDJTNhJAtgyc8
 S9NAEFALtaD38KQdAo0Hz9aOcxs875UybxOlq3OosZzszW2K7MXJZDs2uh+Nwg4YTJYQ
 TBCg==
X-Gm-Message-State: AOAM532LoqLmfLxYR5QhxOhtZfV195/c5X8nyV7GVwH/C/WO6p+e+jpj
 RDYWkOiugJXDZ2WwTk33ylUhDBbyKy2Y9Q==
X-Google-Smtp-Source: ABdhPJyrEbH0en0o2s6qH15xSwuRjSf++baEJqceXovYN3bdFPVaVVqs7j2iVlLZi4iseYMebOC6ng==
X-Received: by 2002:ac2:5634:: with SMTP id b20mr2373498lff.480.1610656966713; 
 Thu, 14 Jan 2021 12:42:46 -0800 (PST)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id t20sm565833ljk.58.2021.01.14.12.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 12:42:46 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH v3 6/6] docs: Added eBPF documentation.
Date: Thu, 14 Jan 2021 23:16:12 +0200
Message-Id: <20210114211612.387052-7-andrew@daynix.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210114211612.387052-1-andrew@daynix.com>
References: <20210114211612.387052-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::130;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x130.google.com
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

Also, added maintainers information.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 MAINTAINERS       |   8 +++
 docs/ebpf_rss.rst | 125 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 docs/ebpf_rss.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 4be087b88e..4aafdfce2c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3173,6 +3173,14 @@ S: Maintained
 F: hw/semihosting/
 F: include/hw/semihosting/
 
+EBPF:
+M: Jason Wang <jasowang@redhat.com>
+R: Andrew Melnychenko <andrew@daynix.com>
+R: Yuri Benditovich <yuri.benditovich@daynix.com>
+S: Maintained
+F: ebpf/*
+F: tools/ebpf/*
+
 Build and test automation
 -------------------------
 Build and test automation
diff --git a/docs/ebpf_rss.rst b/docs/ebpf_rss.rst
new file mode 100644
index 0000000000..5beecfe33f
--- /dev/null
+++ b/docs/ebpf_rss.rst
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
+        Adjust 'linuxhdrs' in Makefile.ebpf to reflect the location of the kernel source tree
+
+        $ cd ebpf
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
+- `ebpf_rss_load()` - creates 3 maps and loads eBPF program from tun_rss_steering.h. Returns 'true' on success. After that, program_fd can be used to set steering for TAP.
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
-- 
2.30.0



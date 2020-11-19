Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DE82B905B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 11:47:28 +0100 (CET)
Received: from localhost ([::1]:36764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfhTL-0006Ba-My
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 05:47:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kfhNI-0000ub-7f
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:41:12 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:43045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kfhNC-00022O-Rn
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:41:11 -0500
Received: by mail-lf1-x143.google.com with SMTP id d17so7503632lfq.10
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 02:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dmLUdxZHGWyOYdMewR63J3QC8sezfZzwKQl39nnBQTo=;
 b=yzYsMEN7MWOs8xTjRJ/+99H1+Cy50LKuuLZmQxCYMDNzzsiIWUlz0wak2ineJf7spz
 LJJ+5r75BtqUqjncAf4GhT06KzoT14lVihvgdNQ4KiSTZ8hIGDiwBrLeCnnhbmAjOXhd
 tIqUzL0imWVf53skmyeljqv3j/4yiksA2tQzolFAIxjMbctR95Ijq8caQrqHPUjoeISH
 Uj6nS+F487xZOPsFMgqUfpV+45lTXy3GTm0VSsjKIJ4bEtsR2SbP+1AgcSywspwZc06q
 MZhA+9RJ1bEMPtdUA/QVF5HjkUTe3z91YwKssFD/U9z1rbFUJC0I4f2uteJd+hpBuDK3
 JuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dmLUdxZHGWyOYdMewR63J3QC8sezfZzwKQl39nnBQTo=;
 b=FjBvLiE0HVcc8GjHjybmo/Pgb+56tMqtZhMlzmNDZvI2SU6fNJ0a4lldrn8cWgM7hl
 ZUl5T8qY6nfWHFgQR0Pym37qTq6pMQBCyMB4yeFLial6OSHUWS88zkyh9EJHdCeTap5m
 cPXtT7tjpnPqiBDvcpl075bHQoNOD50IKduzKW1j5DWtVh8cPbzJzWJWpT60sCQDG1ry
 fWaCGkYgX+IRHqwdAjXrPBGSNkQ1GzU81zJ02bNK3aTjfCWFlb7lu5ih0Q/gUgk2PjVs
 +nIp84MVCcGlVDbBHNXsQP02DAim+A6vq72jZdtKnn3D08KlidnfaJrZ0sjp2Bh9sPVv
 +1Jw==
X-Gm-Message-State: AOAM531b9ZSWkKLyKhigKWhN5SgDqhacpcFt/IDOg6FvLJ/z4AtidSRk
 QbGggF6X2r0ip+iQwYyN5DhxuQ==
X-Google-Smtp-Source: ABdhPJxw8eP8AUFkQzXdp9LPIeX3/c5Oq703+WgI9y9lIYIbzd5c7J1ToBHyYrgxU0iVXEqLxBjg4w==
X-Received: by 2002:ac2:5638:: with SMTP id b24mr5385301lff.332.1605782464978; 
 Thu, 19 Nov 2020 02:41:04 -0800 (PST)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id h6sm3912667lfj.108.2020.11.19.02.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 02:41:04 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH v2 5/5] docs: Added eBPF documentation.
Date: Thu, 19 Nov 2020 13:13:05 +0200
Message-Id: <20201119111305.485202-6-andrew@daynix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119111305.485202-1-andrew@daynix.com>
References: <20201119111305.485202-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::143;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew <andrew@daynix.com>

Also, added maintainers information.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 MAINTAINERS       |   7 +++
 docs/ebpf_rss.rst | 133 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 140 insertions(+)
 create mode 100644 docs/ebpf_rss.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 2c22bbca5a..d93c85b867 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3111,6 +3111,13 @@ S: Maintained
 F: hw/semihosting/
 F: include/hw/semihosting/
 
+EBPF:
+M: Jason Wang <jasowang@redhat.com>
+R: Andrew Melnychenko <andrew@daynix.com>
+R: Yuri Benditovich <yuri.benditovich@daynix.com>
+S: Maintained
+F: ebpf/*
+
 Build and test automation
 -------------------------
 Build and test automation
diff --git a/docs/ebpf_rss.rst b/docs/ebpf_rss.rst
new file mode 100644
index 0000000000..f832defdf4
--- /dev/null
+++ b/docs/ebpf_rss.rst
@@ -0,0 +1,133 @@
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
+RSS program located in ebpf/tun_rss_steering.h as an array of 'struct bpf_insn'.
+So the program is part of the qemu binary.
+Initially, the eBPF program was compiled by clang and source code located at ebpf/rss.bpf.c.
+Prerequisites to recompile the eBPF program (regenerate ebpf/tun_rss_steering.h):
+
+        llvm, clang, kernel source tree, python3 + (pip3 pyelftools)
+        Adjust 'linuxhdrs' in Makefile.ebpf to reflect the location of the kernel source tree
+
+        $ cd ebpf
+        $ make -f Makefile.ebpf
+
+Note the python script for convertation from eBPF ELF object to '.h' file - Ebpf_to_C.py:
+
+        $ python EbpfElf_to_C.py rss.bpf.o tun_rss_steering
+
+The first argument of the script is ELF object, second - section name where the eBPF program located.
+The script would generate <section name>.h file with eBPF instructions and 'relocate array'.
+'relocate array' is an array of 'struct fixup_mapfd_t' with the name of the eBPF map and instruction offset where the file descriptor of the map should be placed.
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
2.29.2



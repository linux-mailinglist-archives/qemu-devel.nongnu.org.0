Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45883D5B8C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:27:22 +0200 (CEST)
Received: from localhost ([::1]:57750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m81Zh-0005Qs-VO
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m81WF-0005Sq-C3
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:23:47 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:41784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m81WD-0008Pg-3q
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:23:47 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 a80-20020a1c98530000b0290245467f26a4so132995wme.0
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 07:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IgI3vvsL2YVBU+vSqnLmuqypZ1Yx7TJO0yv9+ZaGTlg=;
 b=CJBBprd5Dh6bJymVbKI61UMbxKSC7Tfn6u88ZGjikYz8siO8N6g5mRoCCaQ2Qh3s3z
 REd5w3WLw4o+42z6VZUUH112LJYZrPvlOqVRKC+l9SqTCvrtG8rfUZAWxfxeRKC5MHxQ
 bZ1O8StLyrnS+a/mewT5Pj+iERA0yppw89qVyfsGgJjkXNPEBPW5SU+99NBn2tOP6DDp
 g0GzViXxsmdLyaH5Vyz8iCBD3bncBp24XCyS4JHi+ouk+DzgmfCEFUrE6UT2zPcGoZaD
 d17V+gz+CXcAcGg5loAASbEK0UtfPIokX/1R3JIgZ231ACY/OkxEkWo2JD9rz3yH3Q1T
 ICVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IgI3vvsL2YVBU+vSqnLmuqypZ1Yx7TJO0yv9+ZaGTlg=;
 b=ZkPlZv7AmJyY4b1h5psnGnhiWc9WqeK7cBsx1/nnucC8R1JmDJPXmf7eZTne+L3swA
 c2slAfOFPOx8GBw4pqt2VQV1Apu09v8LErbzNY1lD8y3LA3KHpVjH6DGG83mtbt6rY7/
 GaaVbtkB4GsDBp6sFefFVX3Ltx1mN0w5Qc9vN/agScqa8tcceoNLrwLymkNMhZO8cA/w
 Ekw4dnxr4eOLOZb4+Rwvodud0YFvff/97DpjBu2UKBTtiblc4HZlQ1KE5KdOkUI/S69b
 o4MM5sDUQ6zvASFQ3hGmbK4Fvn1Frzt/K3iKo89/nvaGB6YSX2Otqfex/lJEreACiDiR
 X/eA==
X-Gm-Message-State: AOAM531b94sL66ycoAe/3JS1ObVgHzias3B+LdmXaOn1dTt/xGqFWqM8
 sg51S8g/sMNLIEPtSeoDFpBRAphLQcKNag==
X-Google-Smtp-Source: ABdhPJwkMGDw2ydGOAl0C2IsgOfyZsdzOvoHwQFMb4lAjbTRoWmnDgMlxronMih30w71EDiC5YPA9A==
X-Received: by 2002:a7b:cbda:: with SMTP id n26mr17261564wmi.179.1627309423244; 
 Mon, 26 Jul 2021 07:23:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 6sm13823427wmi.3.2021.07.26.07.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:23:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 03/10] docs/devel/ebpf_rss.rst: Format literals
 correctly
Date: Mon, 26 Jul 2021 15:23:31 +0100
Message-Id: <20210726142338.31872-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210726142338.31872-1-peter.maydell@linaro.org>
References: <20210726142338.31872-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In rST markup, single backticks `like this` represent "interpreted
text", which can be handled as a bunch of different things if tagged
with a specific "role":
https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#interpreted-text
(the most common one for us is "reference to a URL, which gets
hyperlinked").

The default "role" if none is specified is "title_reference",
intended for references to book or article titles, and it renders
into the HTML as <cite>...</cite> (usually comes out as italics).

To format a literal (generally rendered as fixed-width font),
double-backticks are required.

ebpf_rss.rst gets this wrong in a few places; correct them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/ebpf_rss.rst | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/docs/devel/ebpf_rss.rst b/docs/devel/ebpf_rss.rst
index e00962577ad..4a68682b31a 100644
--- a/docs/devel/ebpf_rss.rst
+++ b/docs/devel/ebpf_rss.rst
@@ -72,7 +72,7 @@ eBPF RSS implementation
 
 eBPF RSS loading functionality located in ebpf/ebpf_rss.c and ebpf/ebpf_rss.h.
 
-The `struct EBPFRSSContext` structure that holds 4 file descriptors:
+The ``struct EBPFRSSContext`` structure that holds 4 file descriptors:
 
 - ctx - pointer of the libbpf context.
 - program_fd - file descriptor of the eBPF RSS program.
@@ -80,20 +80,20 @@ The `struct EBPFRSSContext` structure that holds 4 file descriptors:
 - map_toeplitz_key - file descriptor of the 'Toeplitz key' map. One element of the 40byte key prepared for the hashing algorithm.
 - map_indirections_table - 128 elements of queue indexes.
 
-`struct EBPFRSSConfig` fields:
+``struct EBPFRSSConfig`` fields:
 
-- redirect - "boolean" value, should the hash be calculated, on false  - `default_queue` would be used as the final decision.
+- redirect - "boolean" value, should the hash be calculated, on false  - ``default_queue`` would be used as the final decision.
 - populate_hash - for now, not used. eBPF RSS doesn't support hash reporting.
-- hash_types - binary mask of different hash types. See `VIRTIO_NET_RSS_HASH_TYPE_*` defines. If for packet hash should not be calculated - `default_queue` would be used.
+- hash_types - binary mask of different hash types. See ``VIRTIO_NET_RSS_HASH_TYPE_*`` defines. If for packet hash should not be calculated - ``default_queue`` would be used.
 - indirections_len - length of the indirections table, maximum 128.
 - default_queue - the queue index that used for packet that shouldn't be hashed. For some packets, the hash can't be calculated(g.e ARP).
 
 Functions:
 
-- `ebpf_rss_init()` - sets ctx to NULL, which indicates that EBPFRSSContext is not loaded.
-- `ebpf_rss_load()` - creates 3 maps and loads eBPF program from the rss.bpf.skeleton.h. Returns 'true' on success. After that, program_fd can be used to set steering for TAP.
-- `ebpf_rss_set_all()` - sets values for eBPF maps. `indirections_table` length is in EBPFRSSConfig. `toeplitz_key` is VIRTIO_NET_RSS_MAX_KEY_SIZE aka 40 bytes array.
-- `ebpf_rss_unload()` - close all file descriptors and set ctx to NULL.
+- ``ebpf_rss_init()`` - sets ctx to NULL, which indicates that EBPFRSSContext is not loaded.
+- ``ebpf_rss_load()`` - creates 3 maps and loads eBPF program from the rss.bpf.skeleton.h. Returns 'true' on success. After that, program_fd can be used to set steering for TAP.
+- ``ebpf_rss_set_all()`` - sets values for eBPF maps. ``indirections_table`` length is in EBPFRSSConfig. ``toeplitz_key`` is VIRTIO_NET_RSS_MAX_KEY_SIZE aka 40 bytes array.
+- ``ebpf_rss_unload()`` - close all file descriptors and set ctx to NULL.
 
 Simplified eBPF RSS workflow:
 
@@ -122,4 +122,4 @@ Simplified eBPF RSS workflow:
 NetClientState SetSteeringEBPF()
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-For now, `set_steering_ebpf()` method supported by Linux TAP NetClientState. The method requires an eBPF program file descriptor as an argument.
+For now, ``set_steering_ebpf()`` method supported by Linux TAP NetClientState. The method requires an eBPF program file descriptor as an argument.
-- 
2.20.1



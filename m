Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2860F3DD507
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:00:08 +0200 (CEST)
Received: from localhost ([::1]:45184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWc3-0003Fz-4q
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:00:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaN-0000XB-U1
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:23 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:55205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaL-0003at-GL
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:23 -0400
Received: by mail-wm1-x335.google.com with SMTP id b128so10238855wmb.4
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Y2muprbycP1Fyma9ck4C7z6fmxENa295w40MBCrC3qo=;
 b=qwd8K/NWxu4pcOrWimJ1M0PN2cj1wCqNhWCaYmKFbOz1Sl8ThVAN6zYVv3izanoRJn
 NVcqdbo6u/Pwzzkb0KfZjQwR/LcO20tKaY74F4KCbIS8LCGwiCMwwfGSHrl44L+QIYnu
 5BJwuXlIdTP+QQgo3/sJ7xZ1HDh4sH6WsoWdCdzFK5vQCRCPUO/IzEEHBULg/C2F6o8I
 kQTwfkfvgPJbJFPMMgK8YWqVr8XZQk7pNari+uKzatX9p5JL+Yadmp1to6DTSvkFqrHj
 TPnN/2xKZPcArIO6nuhec+5t8arB4F1YmEQtD57AP9ojzWNZwReXCyVDKb5Rg+7PXy24
 t3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y2muprbycP1Fyma9ck4C7z6fmxENa295w40MBCrC3qo=;
 b=VWTp7UDkDlW0G0SYtUDJTDXt8+LxIWEN+AP7E3jJxYP+LgussvtsFB4dtKvjzaO0oX
 BvbMkLYJSrTKLhhCrJ+QYBiMr6Ms/08Yb6zZag9JU0vdgL90yQtvCRBufQw+lXR6tPW0
 5k+pHeWHaoe7W7BuQ01zR6B/OHfjPef1zlM6HzTqj9E1QKgGy5XUEZRJtDdvQobRxV59
 qgHD9ZvM6FljplsNXns5Khhxv3J6CmkItkviMWoq0gQFicD0sioBbZ6Nr0OiTqFOTW7u
 kEVy7eo/MbliltYGQMjJrnD2ukffkiChAkX5by6UPZYreZyWNZ5eH//P/mZ+lme/qlxY
 I1pQ==
X-Gm-Message-State: AOAM531skUBO2cyCiAwrpvQUoO4R3dXn0ncIWJk1mNMKY+eYWwNtUBCD
 bykdj06HAODdqVjB5dt4jm9S3Rl7QE9d+Q==
X-Google-Smtp-Source: ABdhPJzs47I21YfVyWJcGevfboYYkYxDni0qRW4FFZ9o67OG7MR0i2+LhWsvCXfL5a6yECViXmzFZQ==
X-Received: by 2002:a1c:2984:: with SMTP id p126mr16359277wmp.58.1627905500218; 
 Mon, 02 Aug 2021 04:58:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm10102772wmy.39.2021.08.02.04.58.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:58:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/21] docs/devel/ebpf_rss.rst: Format literals correctly
Date: Mon,  2 Aug 2021 12:58:00 +0100
Message-Id: <20210802115812.10731-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802115812.10731-1-peter.maydell@linaro.org>
References: <20210802115812.10731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210726142338.31872-4-peter.maydell@linaro.org
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



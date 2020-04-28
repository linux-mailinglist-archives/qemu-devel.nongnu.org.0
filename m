Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE321BB31A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 02:57:29 +0200 (CEST)
Received: from localhost ([::1]:37760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTEYy-0003s2-Da
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 20:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58848)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alexander.duyck@gmail.com>) id 1jTEVX-0007Te-HD
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 20:53:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alexander.duyck@gmail.com>) id 1jTEVX-0006yY-3D
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 20:53:55 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:44690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1jTEVW-0006vS-My
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 20:53:54 -0400
Received: by mail-pf1-x441.google.com with SMTP id p25so9845141pfn.11
 for <qemu-devel@nongnu.org>; Mon, 27 Apr 2020 17:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:date:message-id:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=r3DmuhsjF9XmFz6gfXOOjELEtTu/H+9BPOkgH77BTws=;
 b=lsaseBYznHAItZy3mUNs7I850MNJ9ER5+vLx+h/cQxBB1YwdtiU+XEgzhh5ozuzwZE
 Ahudjvk3q+PWAqpkZh9CqMx+/1WUbexSapKQTvXVssj9nlTit4ein6/oiUpteTdd+oWq
 dZdFGwbnAddKLzPxikj9Wjw8KV6pLzJXXqMWg8mo3h9wt9araAj4EpROTuIPKoObwUOW
 F3pzoKdI78VYRlAVCu+UfSpRmcqPdwnCZVDnJDk2tCfNDIElLgdCXMaUKm/cb++GXcYo
 DI6hN4Mq/cl/tNwag0OW8aHPLdv0N+IKPGu6HK3MLnZABV+FsBQaE17N+pnwAlUsXLIl
 +ahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=r3DmuhsjF9XmFz6gfXOOjELEtTu/H+9BPOkgH77BTws=;
 b=rRFAtQy+acqy/paDncnO14vD9NsBV6d/lhuLNqN9tqgHI9gzZIrlK2bR+a3l0SNF6Q
 pb0c6/93r7pLadKwrh42GcmGEqMm/9gqBobyaIXRhdiKzLfqKR85XkvMIdOM3NCPm3oi
 OoeIGwcEQwonVJRelPBq7w2gGZKk8upTUCNJgYOtlz/7u2bZ1qTR8dPGQVRijXHNAB/p
 WMWC5WWJu7ntvME3Xe+VxnHzaekIeEukpqO65mOplTUkNzM+l/r+hTqTU2nP/kDFTqCK
 xyf285Cah7zmqjHDkSWPX7683bDda1bsxiNFUtllcisyLxed5vbXQfsHoYQZRhKBjFWh
 VDFQ==
X-Gm-Message-State: AGi0PubxCNi8s10G7GEIcBN8PjcrkrC/W7A0JA1XUOLctKcyNa3cPovO
 51PzUMiaGo0ihjQuTNu0XaU=
X-Google-Smtp-Source: APiQypINBTZ+cCSIuU4rTlFONBkwozUgxthDK3GWeGE5MooBgkUB3dBOIu3hUzObt5kfEm9KGs7/Pw==
X-Received: by 2002:aa7:9589:: with SMTP id z9mr27059873pfj.247.1588035233315; 
 Mon, 27 Apr 2020 17:53:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:b:9c3:9e5c:8eff:fe4f:f2d0])
 by smtp.gmail.com with ESMTPSA id t7sm13519001pfh.143.2020.04.27.17.53.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Apr 2020 17:53:52 -0700 (PDT)
Subject: [PATCH v23 QEMU 2/5] linux-headers: update to contain
 virito-balloon free page reporting
From: Alexander Duyck <alexander.duyck@gmail.com>
To: david@redhat.com, mst@redhat.com
Date: Mon, 27 Apr 2020 17:53:52 -0700
Message-ID: <20200428005352.6158.18830.stgit@localhost.localdomain>
In-Reply-To: <20200428005134.6158.88521.stgit@localhost.localdomain>
References: <20200428005134.6158.88521.stgit@localhost.localdomain>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=alexander.duyck@gmail.com; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Duyck <alexander.h.duyck@linux.intel.com>

Sync the latest upstream changes for free page reporting. To be
replaced by a full linux header sync.

Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
---
 include/standard-headers/linux/virtio_balloon.h |    1 +
 1 file changed, 1 insertion(+)

diff --git a/include/standard-headers/linux/virtio_balloon.h b/include/standard-headers/linux/virtio_balloon.h
index af0a6b59dab2..af3b7a1fa263 100644
--- a/include/standard-headers/linux/virtio_balloon.h
+++ b/include/standard-headers/linux/virtio_balloon.h
@@ -36,6 +36,7 @@
 #define VIRTIO_BALLOON_F_DEFLATE_ON_OOM	2 /* Deflate balloon on OOM */
 #define VIRTIO_BALLOON_F_FREE_PAGE_HINT	3 /* VQ to report free pages */
 #define VIRTIO_BALLOON_F_PAGE_POISON	4 /* Guest is using page poisoning */
+#define VIRTIO_BALLOON_F_REPORTING	5 /* Page reporting virtqueue */
 
 /* Size of a PFN in the balloon interface. */
 #define VIRTIO_BALLOON_PFN_SHIFT 12



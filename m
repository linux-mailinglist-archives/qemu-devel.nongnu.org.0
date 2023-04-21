Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9762E6EACF2
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 16:30:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pprm2-0000pj-Cz; Fri, 21 Apr 2023 10:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pprlz-0000fn-Uy
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:30:04 -0400
Received: from esa4.hc2706-39.iphmx.com ([216.71.146.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pprlx-0008Nk-N5
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:30:03 -0400
X-IronPort-RemoteIP: 209.85.210.197
X-IronPort-MID: 273162246
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:J8Fve6KkJdczXcrCFE+Rb5clxSXFcZb7ZxGr2PjKsXjdYENS1jcDy
 jQXWTuCOPzcZGejctl2O4/n/EgAuZSHyoBrHQZorCE8RH908vbIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOOn9T8kjvvgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8lWo4ow/jb8kg34K6r4GpwUmEWPpingnePzxH5M7pCfcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aue60Tqm0xK6aID76vR2nRHe545gXBYqhea7vB3S9zx54
 I0lWZVd0m7FNIWV8AgWe0Aw/y2TocSqUVIISJSymZX78qHIT5fj69J/MVNnHLIowdZIB2tk/
 /lDIjUGYinW0opawJrjIgVtrsEqLc2uJI1G/385nG6fAvEhTpTOBa7N4Le03h9q3pEITauYP
 ZNBL2M+M3wsYDUWUrsTIJs6jOGknFH1bntVpE/9Sa8fuTeIlVIriuSzWDbTUvuuWOJWjmuXn
 zuY01XnBFI9LMGm0jXQpxpAgceKx0sXQrk6DbC967tmjUOewkQVDxsZU0b9puO24nNSQPpaI
 k0QvzIg9O08rR30CNb6WBK8rTiPuRt0t8dsLtDWITqlksL8izt1zEBfJtKdQLTKbPMLeAE=
IronPort-HdrOrdr: A9a23:XwRFbauS/HJn5xaC4si5tc477skDoNV00zEX/kB9WHVpmwKj5q
 STdZMgpGPJYVMqMk3I9urwXpVoLUmsl6KdpLNhRotKPzOWxVdAUrsSlLcKqgeIc0aOldK1l5
 0QCZSWYOeRMbEQt7ec3ODXKadE/PC3tIqFv6Px9UtMcC1dQ51czm5Ce3mm+45NKDWux6BVKH
 NR3KR6TkKbCAwqhw2AaRg4Y9Q=
X-Talos-CUID: =?us-ascii?q?9a23=3A2FcYxGicICDP+TY2JK1VvjOrBzJuVWzg3ibxHH+?=
 =?us-ascii?q?DOVlvQpefTASa/ahoqp87?=
X-Talos-MUID: 9a23:1RF5CwqrNzWf+qM/j/YezxZGKeBr84mhMRlTvaQYvYqjLTFJIDjI2Q==
Received: from mail-pf1-f197.google.com ([209.85.210.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2023 10:30:00 -0400
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-63b656aacc6so2596022b3a.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 07:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682087400; x=1684679400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ILSHQxrIhkdK3Yg7jyHfXMBWfomku93hOGeiPBvH9PA=;
 b=ThEEbsfn+VaxZOId50qlkb/J0L27HfqEMTNDVFCOISTEWznnvn8UfgfNLEVFgOQYhn
 bcnivfPIw/5ygvkB0MOVSuSGYCgXh4SdQ42aB4FzowO9Gd9mQ/B5+HLkYV4DvY7zQE8y
 fMmnyh7la9NP3CuLq5a5v4Oixvgmzp0KMBw/G5znlQZvRxGkmtP/sAHSiCkWcyKAb9+V
 RegcKLkh+/hddeuZBhxHHqLWc0zCNMN704mQuVGIs/raCBNsp/wV1cAPGD6bf9kLO6Os
 7llQa8jRqkdEvGclS0bUJq++B+QzwL85BeDWV0ooNTvS1cJY9iSw7nNiXBNUM0tlDQDl
 EL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682087400; x=1684679400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILSHQxrIhkdK3Yg7jyHfXMBWfomku93hOGeiPBvH9PA=;
 b=OfbVZNcPKDPvEfhxmZTeZWBBH0+rR5tOQ2tf0thfZuFVCQpLVJxmbN42gG8Mui4uKl
 EHKyo4Y6kXesggiWw0F5eZpvvSBU4FJayzm5Kd/QwI7RvRepv2DjADXXwEYlJ8NlSw86
 daen1tjazJ4XGlIDzkXpdMubrFl+PXnAK1juKNPW7VC/nG1s4ql0Y/3MQCgv1NyLQgSd
 dqaPFC5vg3iQqnm1mvPrSp9VOzCfsTOROM7Tx4sYTNqzxTbbSUZtfOIDmcfmLN6WjpuO
 /u6CfepAGn4J+QKn/o0Zctt1jTb2WyVkXxeurp1WrUhkWOOYeJV8nbPyNpTTEZjddIkM
 pEOw==
X-Gm-Message-State: AAQBX9c9q0gSvTR6ZtPAn2dHYQIGIfkwdeX5jwTeyQECF1vuRITyjdeM
 yl8OLP/YHbyQBnaVqAIIs84cSwz3j9xFZQDamYPoVEK4ecTRh/tei++bjH+qWMvNfG7v7lhOclR
 /dgPoRhpXrVtTyhgoQiQAl/fonin95xfpnElRqAo3uiI=
X-Received: by 2002:ad4:4ee9:0:b0:572:636d:625f with SMTP id
 dv9-20020ad44ee9000000b00572636d625fmr10394551qvb.33.1682087379137; 
 Fri, 21 Apr 2023 07:29:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350b7D2qcWUyMcfTpGin+Z+j2lyQvVNlYc/303AYgF+hJZUaxodWKX2lwsNI/07GcGolIkQtA4w==
X-Received: by 2002:ad4:4ee9:0:b0:572:636d:625f with SMTP id
 dv9-20020ad44ee9000000b00572636d625fmr10394490qvb.33.1682087378851; 
 Fri, 21 Apr 2023 07:29:38 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a0cf551000000b005ef59a383e6sm1204676qvm.119.2023.04.21.07.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 07:29:38 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org (open list:Block I/O path)
Subject: [PATCH v8 8/8] memory: abort on re-entrancy in debug builds
Date: Fri, 21 Apr 2023 10:27:36 -0400
Message-Id: <20230421142736.2817601-9-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230421142736.2817601-1-alxndr@bu.edu>
References: <20230421142736.2817601-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.146.118; envelope-from=alxndr@bu.edu;
 helo=esa4.hc2706-39.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This is useful for using unit-tests/fuzzing to detect bugs introduced by
the re-entrancy guard mechanism into devices that are intentionally
re-entrant.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 softmmu/memory.c | 3 +++
 util/async.c     | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index a11ee3e30d..5390f91db6 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -547,6 +547,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
         !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
         if (mr->dev->mem_reentrancy_guard.engaged_in_io) {
             trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
+#ifdef DEBUG
+            abort();
+#endif
             return MEMTX_ACCESS_ERROR;
         }
         mr->dev->mem_reentrancy_guard.engaged_in_io = true;
diff --git a/util/async.c b/util/async.c
index a9b528c370..2dc9389e0d 100644
--- a/util/async.c
+++ b/util/async.c
@@ -160,6 +160,9 @@ void aio_bh_call(QEMUBH *bh)
         last_engaged_in_io = bh->reentrancy_guard->engaged_in_io;
         if (bh->reentrancy_guard->engaged_in_io) {
             trace_reentrant_aio(bh->ctx, bh->name);
+#ifdef DEBUG
+            abort();
+#endif
         }
         bh->reentrancy_guard->engaged_in_io = true;
     }
-- 
2.39.0



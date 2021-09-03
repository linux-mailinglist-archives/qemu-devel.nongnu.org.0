Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BC13FFECC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:15:54 +0200 (CEST)
Received: from localhost ([::1]:44064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7An-0002nq-Ew
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM731-0005ZC-MK
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:07:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM72y-0000YA-Nt
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:07:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E9PypJHZFiMU1wwHSEPf1Pz6upK9EcgUKxTQXXjwTWw=;
 b=HyP2mEFD6oNZaK0NsMzwxTpQ4ZeYmKCMuuxU3XHCvy8rzABCkPyNZxeV+0kJYL6vP0Rg4o
 NaKYvbagQAwXN9mU6Ob8XE7P7J3vsFTiK/KEjuDtPCJvxn5p1YtnpVKfNEXsGe1pmDWu33
 FeU2edGvmhLJHlQGUi0Y5d0H85a5vtE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-vdN5_NqjMXWqTZ5hSloccA-1; Fri, 03 Sep 2021 07:07:47 -0400
X-MC-Unique: vdN5_NqjMXWqTZ5hSloccA-1
Received: by mail-wm1-f71.google.com with SMTP id
 b126-20020a1c8084000000b002f152a868a2so1706173wmd.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E9PypJHZFiMU1wwHSEPf1Pz6upK9EcgUKxTQXXjwTWw=;
 b=te3wCcUG39+fTyGnIbHRO7YORR+nhmZ9OQK9lAFGMtemzufz428xdgzIW/0rBfqujB
 1AI6oPMhB3gPhsB8UE+EGs1al6QdVzSTCpcB1TIbehTwXcSpVPPOEEU2l/2/8u2P+2Mf
 u2z1HXSJMfJY7n5CT0PbFA65wLxut8m8oA7NBBivAnALM1e92CG8K4McTfGvHF99ix6T
 OXrVQ6djnLaFOjZ19CrcuUIcdc1u3beppdBCGvzcQKkc88LVFISuOZTLb3p0tAvnVAVZ
 vRX2EIcn7v9Xafy4aSJOtzGuAl4U4FxMVfgVxFeMuCLVYjZbx2XLrsgFKDyHnUp8tXsJ
 Bs2Q==
X-Gm-Message-State: AOAM533H3AFfmGd6TYk2UcXEpUlGgPzMImwN5Q9bT2s4QoUSgW5FbTKN
 pWs1Xl9uImcVQ9UgJuo0EHGl1CDxzPLN5Rbg7CTNgWfA9GVlZxJoRUa3GbT5+O000bqiUPgB1kq
 68IYTvSXnlBOm1vsN62/lvWY6o47qrNeYoSyJDQdqjt0tC5ddtgoY/SRWRTyDFFIt
X-Received: by 2002:adf:e887:: with SMTP id d7mr3332698wrm.79.1630667265747;
 Fri, 03 Sep 2021 04:07:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOpfMVNquMJIWDXetxTHCuL3Fzb8lZKKWemq9NT4HySMg6qKhGx6koZ2JlS7tbzuIj9REIrw==
X-Received: by 2002:adf:e887:: with SMTP id d7mr3332646wrm.79.1630667265554;
 Fri, 03 Sep 2021 04:07:45 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 o5sm4341463wrw.17.2021.09.03.04.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:07:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/28] hw/9pfs: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:41 +0200
Message-Id: <20210903110702.588291-8-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/9pfs/9p-synth.c | 2 +-
 hw/9pfs/9p.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index b38088e0664..7d983574af5 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -497,7 +497,7 @@ static int synth_name_to_path(FsContext *ctx, V9fsPath *dir_path,
 out:
     /* Copy the node pointer to fid */
     g_free(target->data);
-    target->data = g_memdup(&node, sizeof(void *));
+    target->data = g_memdup2_qemu(&node, sizeof(void *));
     target->size = sizeof(void *);
     return 0;
 }
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 2815257f425..5bf1bd7229f 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -202,7 +202,7 @@ void v9fs_path_copy(V9fsPath *dst, const V9fsPath *src)
 {
     v9fs_path_free(dst);
     dst->size = src->size;
-    dst->data = g_memdup(src->data, src->size);
+    dst->data = g_memdup2_qemu(src->data, src->size);
 }
 
 int v9fs_name_to_path(V9fsState *s, V9fsPath *dirpath,
-- 
2.31.1



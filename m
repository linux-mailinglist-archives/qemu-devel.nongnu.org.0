Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F3920A54D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 20:56:43 +0200 (CEST)
Received: from localhost ([::1]:38466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joX3C-0003HA-Lp
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 14:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1joWw7-0008Ou-BL
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 14:49:23 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40445
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1joWw5-00014S-NC
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 14:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593110961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IffnAEQwVLooyZqnwMH0USvgIfFSWE7k1J5V8wEsJMc=;
 b=SoCD7dC+17iEHcRahCbWcYWVcia+C+/6++LYB1bLbVQ7Aj6K3i9DZCc9p6lZBsozxdQeXJ
 FDO7+nxSyHovvuZo8CkiLo3Tcce7fO3PgkR4UKjNVZDRuvJWNwEOkYVF8h/RkIdF26jNq+
 b77H2TTUeyqCZ3VhuFwbAgaZNGLkRz4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-y0XMY1N_O9KAC9e9lsEUXQ-1; Thu, 25 Jun 2020 14:49:19 -0400
X-MC-Unique: y0XMY1N_O9KAC9e9lsEUXQ-1
Received: by mail-wm1-f71.google.com with SMTP id a21so7772797wmd.0
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 11:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IffnAEQwVLooyZqnwMH0USvgIfFSWE7k1J5V8wEsJMc=;
 b=hNNkSwX7HSCtHEB7eNjkCEPX7TycTg25A1xMHfFY580R/yHhmFNjwzzXlbUovX1MIj
 uEpZMxhiDm8o7ngvqE/K5oryV3bBDSxOnzoVtG3JufFvvQlwho34HfS5w4IMZS0+UU4S
 gLdvBeNpN4G0er2AUcmu7RnmLo/JzwAlnTLWceDN7ObsCnljhKmgtfnduTARPvGWi95K
 bR2q6PYeC22LvCwXJF+w7bZlZgEWlqqtbxfT1p6r8gnevXMVbsEiGWd/vwvCCHX822jT
 xhxmrIm26B8H02lU7hM07vrJUw9MXjddRlLXt8YRQxepJoj1kw9lAeBIgEOInMhMhyzN
 WKWw==
X-Gm-Message-State: AOAM532BBObs92HFK5pfuVOVXEd0YjfuUz8iNXof1TdLeIb607Al34ix
 kZYck5IV09Tms3hko7hmuWkZcrWUKkr2C/Vy/GYEj37a/NQxmyRBhPpi8UcejIACNEwCzqAxmMi
 X7cRUSZ186ogTFJE=
X-Received: by 2002:adf:9c12:: with SMTP id f18mr41102128wrc.105.1593110958071; 
 Thu, 25 Jun 2020 11:49:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf2A4qmfaAmo1zDhHRG1mrmZJVLhlXeVGijQsIShuyxhNXkhhi8CLFt20HkwC4JskW3cQFMg==
X-Received: by 2002:adf:9c12:: with SMTP id f18mr41102109wrc.105.1593110957928; 
 Thu, 25 Jun 2020 11:49:17 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id o1sm34796824wrw.20.2020.06.25.11.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 11:49:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 08/17] block/nvme: Use correct type void*
Date: Thu, 25 Jun 2020 20:48:29 +0200
Message-Id: <20200625184838.28172-9-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200625184838.28172-1-philmd@redhat.com>
References: <20200625184838.28172-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 00:45:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_try_memalign() returns a void*, qemu_vfio_dma_map() consumes
a void*. Drop the confusing uint8_t* type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/nvme.c b/block/nvme.c
index 1bba496294..095a8ec024 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -441,7 +441,7 @@ static void nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
     NvmeIdNs *idns;
     size_t idsz_max;
     NvmeLBAF *lbaf;
-    uint8_t *resp;
+    void *resp;
     uint16_t oncs;
     int r;
     uint64_t iova;
-- 
2.21.3



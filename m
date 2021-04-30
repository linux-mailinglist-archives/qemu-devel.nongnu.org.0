Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B46C36FED2
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:43:10 +0200 (CEST)
Received: from localhost ([::1]:36252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWEO-0005cr-MJ
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcVxQ-0001NV-Bz
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:25:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcVxL-0004HV-3A
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619799930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4L0T4eT8dybX7s5E/1hWaD9F1Awp7eU+MGs6+A+hFYI=;
 b=NWRkGBcPY+T0jakLerGhNkdz/luwSnhpICJ4vVvpBzt8XHMOJoVYlq2kFlR00vzLV8H4kj
 tixAwQgB3QDTKjePiCaBqlfplZalxuEhsJRDiB8hici75WsJjl/VAU1wL0rAXqF+9Jkp+k
 GmKUR0Y2poVJXoPbGreUQ/Es8kTNJQQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-Q6fWD1aNNE-GGSFa2ob8Ww-1; Fri, 30 Apr 2021 12:25:28 -0400
X-MC-Unique: Q6fWD1aNNE-GGSFa2ob8Ww-1
Received: by mail-wr1-f72.google.com with SMTP id
 65-20020adf82c70000b0290107593a42c3so14158081wrc.5
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4L0T4eT8dybX7s5E/1hWaD9F1Awp7eU+MGs6+A+hFYI=;
 b=Rtuogt9Ozfo2eZeeQeEnFeHx1ucXYFnFBM/pNVHqYM7D8Uupr3gJICKSl+2W/BU2//
 N2xmog+Ib73kliVsNByNEuIix4PPX9EgX+uOKph1wOns3F9h1Zm8q4KSylRbvjLhiKDc
 pqvi9EU3L4945Pl2UZXV3+ceyB3tEBqFa4o1UUXK4VloMx30StES7I6jrORE28S75xsp
 tJjASIYXiPDZWBp4JT4DJr7HnmaIw6VYfBVtBFapS9C1+1pBgU06HG0Ezj84MHoAzm0I
 EQAZhn7Q+hYFl5ZfqPHAHLHMjcWAexQCXh+Avk80MiOLyOnhJm/GFWF2zYKrAuSn7JbC
 huoQ==
X-Gm-Message-State: AOAM531hop2zsg3TF6s5eYyt7BVwO2jxPVc5Ikvf5xYdMvSmxKMV2FXz
 XsbDmSr7ciDv3m+Q1i+9s4Phl3ErLhfzwLAYJaC9GBOk8fVjUQbbs8wOl8I3z5TANJLXZOLrerw
 JSr8AC7978Fn3BhSZktcQgeHjylS2zr71D9HZfzkRZW7M6EHLNdsQFaz4gsCMs9Bp
X-Received: by 2002:adf:ef92:: with SMTP id d18mr8245074wro.413.1619799926877; 
 Fri, 30 Apr 2021 09:25:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvSlW20BDkkdo1j2FQ9IFY1p6p35jd8qxFT5zMwdt5O7xYYY9Gg2Qtn3P5VFy8nKAXAbHxjw==
X-Received: by 2002:adf:ef92:: with SMTP id d18mr8245051wro.413.1619799926728; 
 Fri, 30 Apr 2021 09:25:26 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id q12sm2683952wrx.17.2021.04.30.09.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 09:25:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] block/vvfat: Fix leak of BDRVVVFATState::qcow_filename
Date: Fri, 30 Apr 2021 18:25:16 +0200
Message-Id: <20210430162519.271607-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430162519.271607-1-philmd@redhat.com>
References: <20210430162519.271607-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Johannes Schindelin <johannes.schindelin@gmx.de>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qcow_filename is allocated in enable_write_target(), called by
vvfat_open(), but never free'd. Free it in vvfat_close().

This fixes (QEMU built with --enable-sanitizers):

  Direct leak of 4096 byte(s) in 1 object(s) allocated from:
      #0 0x55d7a363773f in malloc (/mnt/scratch/qemu/sanitizer/qemu-system-x86_64+0x1dab73f)
      #1 0x7f55c6447958 in g_malloc (/lib64/libglib-2.0.so.0+0x58958)
      #2 0x55d7a5e123aa in vvfat_open block/vvfat.c:1236:19
      #3 0x55d7a5a5363f in bdrv_open_driver block.c:1526:15
      #4 0x55d7a5a9d369 in bdrv_open_common block.c:1802:11
      #5 0x55d7a5a609f1 in bdrv_open_inherit block.c:3444:11
      #6 0x55d7a5a65411 in bdrv_open_child_bs block.c:3079:10
      #7 0x55d7a5a60079 in bdrv_open_inherit block.c:3391:19
      #8 0x55d7a5a65da3 in bdrv_open block.c:3537:12
      #9 0x55d7a5b33f6a in blk_new_open block/block-backend.c:421:10
      #10 0x55d7a5a0a33e in blockdev_init blockdev.c:610:15
      #11 0x55d7a5a088e7 in drive_new blockdev.c:994:11
      #12 0x55d7a51b10c4 in drive_init_func softmmu/vl.c:636:12
      #13 0x55d7a620e148 in qemu_opts_foreach util/qemu-option.c:1167:14
      #14 0x55d7a51b0e20 in configure_blockdev softmmu/vl.c:695:9
      #15 0x55d7a51a70b5 in qemu_create_early_backends softmmu/vl.c:1895:5
      #16 0x55d7a519bf87 in qemu_init softmmu/vl.c:3551:5
      #17 0x55d7a366f619 in main softmmu/main.c:49:5

Fixes: 8475ea48544 ("block/vvfat: Do not unref qcow on closing backing bdrv")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/vvfat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/vvfat.c b/block/vvfat.c
index 54807f82ca1..5a4a7915220 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3233,6 +3233,7 @@ static void vvfat_close(BlockDriverState *bs)
     array_free(&(s->directory));
     array_free(&(s->mapping));
     g_free(s->cluster_buffer);
+    g_free(s->qcow_filename);
 
     if (s->qcow) {
         migrate_del_blocker(s->migration_blocker);
-- 
2.26.3



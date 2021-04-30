Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2EC36FEE8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:50:36 +0200 (CEST)
Received: from localhost ([::1]:53360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWLb-0004VR-3e
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcVxR-0001Q0-K4
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:25:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcVxP-0004IK-R5
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:25:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619799934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0q+PVZkRpHjkgV8Clf4ufwkVBb96ymjjweCH0oDKVY=;
 b=XKkkPxp+/jJZkeWl3j7XFkhtDx4qXqMx++ZprY0Pus4aebX0imwVe1Fm2nNUOLVVl8qEvU
 njRfiPJoQP3szcSWhdu+538qr+b7GousHKnylVXoqgYRrd4SG9J5lxeS1BxfqMpqqRbThy
 XQS3uptczx7VnFSnQUHT9H8v130w7/o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-qhop7FMFN6eCAPR0d0M3-w-1; Fri, 30 Apr 2021 12:25:33 -0400
X-MC-Unique: qhop7FMFN6eCAPR0d0M3-w-1
Received: by mail-wr1-f70.google.com with SMTP id
 4-20020adf91840000b029010d9c088599so1710006wri.10
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q0q+PVZkRpHjkgV8Clf4ufwkVBb96ymjjweCH0oDKVY=;
 b=H4cT7aJ0wDM9+Q6Pf5x+fl1KaRg7exbb4fpg75mBNwgJXCJHkowbn67iWH8uJ4YPAA
 iVhQxpj6Sb1GHFP84Xsj4c413LyAOWQnZlZprLLzGSeF/7les1BbbI1VXkoYj1/13e06
 3Jj+fkNtehv5+CvLuhPHvi9t/MPkzpmstn4eR8BDY0vYbEg+2HBBVG+z4/78pdG5PSTE
 iyJ1hiY3iI00SbydNXg3Yzm8uNi9Rw7i/edXNwGAcKZMAUP5sQS93mMlRRtnWDH4dvlB
 0aBDC/+j29w/cL0UYM1ueEpmQE8pWiSBFyZfaASRFSz+RfYz3ZDIuNRW4u2k3ghPhdgN
 pfcg==
X-Gm-Message-State: AOAM533ELLbhhDPC6QUmvx60zVu80YWpKDpty+6LpILbxzDcJX7RC1SP
 OrPgmRyXGp4yuhmKVz63jRtnxsMbpb03SGZNLibSTs0+jnbIB6YXSAbYV69oOUQqVI0ceor4YSW
 dNE4F29XSk89CIttmFsH1D3Iy74gRgx783DBGyl8ZVSpRXM6Cn17LnH8sQiOafdSP
X-Received: by 2002:a05:6000:1084:: with SMTP id
 y4mr8215938wrw.364.1619799932022; 
 Fri, 30 Apr 2021 09:25:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWvd94iWDs7QWXEsbG9ptXDumLhtGDra5yu/nrAB5VmX50YwVihrIOgL3ZDYwaYGvLa3gxOg==
X-Received: by 2002:a05:6000:1084:: with SMTP id
 y4mr8215911wrw.364.1619799931800; 
 Fri, 30 Apr 2021 09:25:31 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id a15sm2828323wrr.53.2021.04.30.09.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 09:25:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] block/vvfat: Fix leak of BDRVVVFATState::used_clusters
Date: Fri, 30 Apr 2021 18:25:17 +0200
Message-Id: <20210430162519.271607-3-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

used_clusters is allocated in enable_write_target(), called by
vvfat_open(), but never free'd.
Allocate it using GLib API, and free it in vvfat_close().

This fixes (QEMU built with --enable-sanitizers):

  Direct leak of 64508 byte(s) in 1 object(s) allocated from:
      #0 0x55d7a36378f7 in calloc (qemu-system-x86_64+0x1dab8f7)
      #1 0x55d7a5e14246 in enable_write_target block/vvfat.c:3145:24
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

Fixes: a046433a161 ("Major overhaul of the virtual FAT driver for read/write support")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/vvfat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index 5a4a7915220..2cc21787600 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3142,7 +3142,7 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
     int size = sector2cluster(s, s->sector_count);
     QDict *options;
 
-    s->used_clusters = calloc(size, 1);
+    s->used_clusters = g_malloc0(size);
 
     array_init(&(s->commits), sizeof(commit_t));
 
@@ -3233,6 +3233,7 @@ static void vvfat_close(BlockDriverState *bs)
     array_free(&(s->directory));
     array_free(&(s->mapping));
     g_free(s->cluster_buffer);
+    g_free(s->used_clusters);
     g_free(s->qcow_filename);
 
     if (s->qcow) {
-- 
2.26.3



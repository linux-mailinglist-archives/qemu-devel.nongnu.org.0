Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B6736FE8B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:31:55 +0200 (CEST)
Received: from localhost ([::1]:48950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcW3V-0006qc-9K
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcVxa-0001c3-EE
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:25:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcVxU-0004KM-HC
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619799939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gB7HrfP9JiCLO2S9Qgx/afIOpRLRteER0wJyUW0tVjw=;
 b=KMGDc2FHF826FR+awjmr9/U2+xTKhvWQcu+wjXcy4ZvLuXkCl8UJDItOL6b+OrPmXe9Exp
 7UWsZCeqHzipKvUlLib4Hhm0DZtEfBVIENK+lqE2zV6m2DaFddKlbG+9BrInfKA/KUyE05
 jZuojWojEoieFaYTnkoi+NqFt8/osSg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-M0fU7G5bO3yFcYNoTNF9gg-1; Fri, 30 Apr 2021 12:25:38 -0400
X-MC-Unique: M0fU7G5bO3yFcYNoTNF9gg-1
Received: by mail-wr1-f72.google.com with SMTP id
 93-20020adf80e60000b0290106fab45006so21206895wrl.20
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gB7HrfP9JiCLO2S9Qgx/afIOpRLRteER0wJyUW0tVjw=;
 b=lLNEWq3ROA8ILDoPZ9rysEK6dfb44mrsIRxNxe/BIFPqXgHMRiJjoJrQ2gfkyai5VJ
 5zHbXF8WJ+6hGbQfwiLbUTnQ7pdF2ShwldbbKBhEMpvEof/i9yJIFe5e01yPRxSWKL1w
 Z9cgQDvGgf4c6TBtsZhr8rWjZs7BcEa+b7lqgTUmLX5112otdeg3VCnM/HLGPLI8Glii
 b59xaAx9b/feBmck1qXBZDESwmds7In6iATgH4L6v5qt5xFBYVUTcc6GFkAloBH8xqBV
 UGIblRRZvgKg7GW5beA5KYxvG4E07PM9CN0tK0PeLSBhnRP1SvYuLk0lHeqn6aqGKJAJ
 A8HA==
X-Gm-Message-State: AOAM531wXOADl6r16SOgTnKTT9yVM/Cqn6AV19R2vnQg/sYANlb0iXFZ
 iEQN0gMGPrzZbCg8OIbOoy3N9lWxZUAJvDuzDRvXAH9gZYHVBOP1T+Wi6Nme7AzStpaRA/+35fH
 e2eMfKIXnrHX7BWSGO/tZ4Z+cSVUmLL0mBJw62gnewZ+ZO9hMaRYoTyx69NV1P9dO
X-Received: by 2002:a05:600c:3643:: with SMTP id
 y3mr17079476wmq.159.1619799936803; 
 Fri, 30 Apr 2021 09:25:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+KyZNJykbyKouIX1D2w8MWC4uDz/zRYICCgIwlYwdp01y8vAH3k9LVLOxIZCZp+WyKxKihg==
X-Received: by 2002:a05:600c:3643:: with SMTP id
 y3mr17079453wmq.159.1619799936587; 
 Fri, 30 Apr 2021 09:25:36 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id s6sm15817797wms.0.2021.04.30.09.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 09:25:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] block/vvfat: Fix leak of mapping_t::path
Date: Fri, 30 Apr 2021 18:25:18 +0200
Message-Id: <20210430162519.271607-4-philmd@redhat.com>
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

read_directory() keeps pointers to alloc'ed data in path ...:

 743 static int read_directory(BDRVVVFATState* s, int mapping_index)
 744 {
 ...
 792         buffer = g_malloc(length);
 ...
 828         /* create mapping for this file */
 829         if(!is_dot && !is_dotdot && (S_ISDIR(st.st_mode) || st.st_size)) {
 830             s->current_mapping = array_get_next(&(s->mapping));
 ...
 847             s->current_mapping->path=buffer;

... but these pointers are never free'd. Free them in vvfat_close(),
to fix (QEMU built with --enable-sanitizers):

  Direct leak of 148 byte(s) in 6 object(s) allocated from:
    #0 0x55d7a363773f in malloc (qemu-system-x86_64+0x1dab73f)
    #1 0x7f55c6447958 in g_malloc (/lib64/libglib-2.0.so.0+0x58958)
    #2 0x55d7a5e17679 in init_directories block/vvfat.c:962:16
    #3 0x55d7a5e1251e in vvfat_open block/vvfat.c:1255:9
    #4 0x55d7a5a5363f in bdrv_open_driver block.c:1526:15
    #5 0x55d7a5a9d369 in bdrv_open_common block.c:1802:11
    #6 0x55d7a5a609f1 in bdrv_open_inherit block.c:3444:11
    #7 0x55d7a5a65411 in bdrv_open_child_bs block.c:3079:10
    #8 0x55d7a5a60079 in bdrv_open_inherit block.c:3391:19
    #9 0x55d7a5a65da3 in bdrv_open block.c:3537:12
    #10 0x55d7a5b33f6a in blk_new_open block/block-backend.c:421:10
    #11 0x55d7a5a0a33e in blockdev_init blockdev.c:610:15
    #12 0x55d7a5a088e7 in drive_new blockdev.c:994:11
    #13 0x55d7a51b10c4 in drive_init_func softmmu/vl.c:636:12
    #14 0x55d7a620e148 in qemu_opts_foreach util/qemu-option.c:1167:14
    #15 0x55d7a51b0e20 in configure_blockdev softmmu/vl.c:695:9
    #16 0x55d7a51a70b5 in qemu_create_early_backends softmmu/vl.c:1895:5
    #17 0x55d7a519bf87 in qemu_init softmmu/vl.c:3551:5
    #18 0x55d7a366f619 in main softmmu/main.c:49:5

Fixes: a046433a161 ("Major overhaul of the virtual FAT driver for read/write support")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/vvfat.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/block/vvfat.c b/block/vvfat.c
index 2cc21787600..c193a816646 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3228,6 +3228,11 @@ static void vvfat_close(BlockDriverState *bs)
 {
     BDRVVVFATState *s = bs->opaque;
 
+    for (unsigned j = 0; j < s->mapping.next; j++) {
+        mapping_t *mapping = array_get(&(s->mapping), j);
+
+        g_free(mapping->path);
+    }
     vvfat_close_current_file(s);
     array_free(&(s->fat));
     array_free(&(s->directory));
-- 
2.26.3



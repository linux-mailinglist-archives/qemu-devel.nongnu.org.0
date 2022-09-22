Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D7A5E5EC1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:39:44 +0200 (CEST)
Received: from localhost ([::1]:32792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obIgI-0003B9-TI
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHuO-0004YH-3f
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:50:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHuJ-0003SQ-J6
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zy9hH9UGcVPO94N0r3wVdZNTgpTkq2Z804XTGmHYlxg=;
 b=gvfvf9VJrIvAgPTbRabm/XN9C6LALhXyuvGy2fnsu8dUOsJuJwtav/pWB+4ooOzqeXzLs7
 YLRQ98NzYenkLv1Fgq1VSH/kSvNPXv6HuN4OhnDW5yP/neAPQ5vwAQszNqaGykf74o+s8M
 Fsw3Ipx9jUrcxZXhrf1bbYDDeCOWpng=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-284-HkF0J4rtMKGC4LuF1wvMNw-1; Thu, 22 Sep 2022 04:50:02 -0400
X-MC-Unique: HkF0J4rtMKGC4LuF1wvMNw-1
Received: by mail-ej1-f72.google.com with SMTP id
 oz30-20020a1709077d9e00b0077239b6a915so4184664ejc.11
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zy9hH9UGcVPO94N0r3wVdZNTgpTkq2Z804XTGmHYlxg=;
 b=jShtw5iCVkI/pmEzj7q4NSOLcE8bFdcyrdC56GNfy93zHeui6PbptVnYVDfk2f+Ze9
 KFrnDc9duHA0yOtb/2qK8M9CSy+1znu54otVJsn73YjzO3Ul2kxRHzhINsLOU44brLWR
 BoaAWN2ofitbTE+b6EOQs3sBHcr54rR5t/d/m7NH7krfJw7N3av01z8vTXWlSP6HWVva
 BkW7t4E5t/zU1PAuQe6L0jju1O3WMTdZUob6b2cVcXqVGDgq9dPI9EaWTaMS+tIkPakI
 rVpFtDQ7T4kUlOiyNrm+7T/XS7gIQf34kkD4DMVVavU1gb3o/zhyZNHG4q2W3jdVUqid
 kDlQ==
X-Gm-Message-State: ACrzQf1PgA0yAPgvDIzbZXrkDczJg0UTsoru9OsA7eRR4atFqehSYbeH
 s7kVsDP5KsVVrVbuuotJcfFemTQy9Vk8nZlbVpAMIzPhn/2BZs4fc9/gd2DgPCE91htWqkBQotI
 +//3GDdGA7AKiKdmU1OsGrSwUy7chiiumfAJJA32H89AGKdtWTCoy0DMvMpdxt5c9348=
X-Received: by 2002:a17:907:31c3:b0:770:852b:71a2 with SMTP id
 xf3-20020a17090731c300b00770852b71a2mr1828981ejb.557.1663836601450; 
 Thu, 22 Sep 2022 01:50:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Ii/Aim2Hw7tzlUEn8Ye3yHbxQztvJEuZZNE9Em7K4uYqI2bHIXqvPhesn7eZmgVeq61co4Q==
X-Received: by 2002:a17:907:31c3:b0:770:852b:71a2 with SMTP id
 xf3-20020a17090731c300b00770852b71a2mr1828961ejb.557.1663836601116; 
 Thu, 22 Sep 2022 01:50:01 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a056402195300b004531b137e4bsm3298612edz.67.2022.09.22.01.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:50:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-block@nongnu.org, afaria@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Greg Kurz <groug@kaod.org>
Subject: [PATCH 24/26] 9p: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:22 +0200
Message-Id: <20220922084924.201610-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922084924.201610-1-pbonzini@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/9pfs/9p.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 994f952600..a523ac34a9 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -424,21 +424,24 @@ typedef struct V9fsGetlock
 extern int open_fd_hw;
 extern int total_open_fd;
 
-static inline void v9fs_path_write_lock(V9fsState *s)
+static inline void coroutine_fn
+v9fs_path_write_lock(V9fsState *s)
 {
     if (s->ctx.export_flags & V9FS_PATHNAME_FSCONTEXT) {
         qemu_co_rwlock_wrlock(&s->rename_lock);
     }
 }
 
-static inline void v9fs_path_read_lock(V9fsState *s)
+static inline void coroutine_fn
+v9fs_path_read_lock(V9fsState *s)
 {
     if (s->ctx.export_flags & V9FS_PATHNAME_FSCONTEXT) {
         qemu_co_rwlock_rdlock(&s->rename_lock);
     }
 }
 
-static inline void v9fs_path_unlock(V9fsState *s)
+static inline void coroutine_fn
+v9fs_path_unlock(V9fsState *s)
 {
     if (s->ctx.export_flags & V9FS_PATHNAME_FSCONTEXT) {
         qemu_co_rwlock_unlock(&s->rename_lock);
-- 
2.37.3



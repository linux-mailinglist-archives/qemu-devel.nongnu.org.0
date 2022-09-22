Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1685E5E2F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:11:21 +0200 (CEST)
Received: from localhost ([::1]:48110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obIEq-0002qj-6h
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHtq-0004HL-2q
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHtn-00038l-AS
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DiNau0XrV+NcLz+unml0gyWosKKTn8Rulie3wDNrngA=;
 b=ep5EYrjobqBfh92rCDOcSZDP3k/R0JNzlpucpKnAwVCrIjr34DIzoocBhLwmzWpgotuCQ4
 BL0+VKzbKrf0Ipb1XJLDNOTtg5lOqZW/p02JTliWrqKYtfhR47D/Iz/XZAfF2Sfj0JbP9T
 7P+Ac5AmggVqj1PCy3hO+YFvIDGY8m4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-480-W4xPcIiGO5mqwc8aHk_Tyg-1; Thu, 22 Sep 2022 04:49:33 -0400
X-MC-Unique: W4xPcIiGO5mqwc8aHk_Tyg-1
Received: by mail-ej1-f71.google.com with SMTP id
 hr12-20020a1709073f8c00b0077e8371f847so4240531ejc.20
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DiNau0XrV+NcLz+unml0gyWosKKTn8Rulie3wDNrngA=;
 b=gaPgs/XvYFx1aCWgNwwvKMp+XV3Io9GUPaVVr1PamuGe5edXCf8WHiqdke/WULtAd0
 Ege7xbV+5slkXID/Nn1KH6j1/nxUSUxhH3FttGHkCNiBMIotnwXPBx8sz30kJ+NjW9dn
 NR+8tNOw4MpfjQW1cqDGT3A0XUAAbdu6n7eLOQPeePISp4LUsnA+0mFS03Gc7/vYwoJC
 P9ty7woj8l4IPITx7zmOU/09h8EbtxziNDkEveo6E5okSl2k+/HqisSXDoSxbeqweF4Z
 5NYzXDerTaHC36azRMagexMIGKD8DYNdjskhFVeOCW9/JPpDmz1ahH9bcJSdVkrUziaF
 pQ3w==
X-Gm-Message-State: ACrzQf0KRSDpmHpH54CXU+OZGH+8yvybJ0H7x3LmkdyxjLVpm2wU3LEG
 PDxxv61I31mjIEhbSeOda7dqDO8P7LCy8vk0+LTmk/M2xoFOPSv10OnKTfFMmeR5eUT2I8vhuZI
 P+E6FOdGKZFTFYY4apt6JMiKfYb2XfdsL6KhKzQxHsarKS+5vIb9IaFaV+aaDq4oVYm8=
X-Received: by 2002:a05:6402:114a:b0:454:85e4:2295 with SMTP id
 g10-20020a056402114a00b0045485e42295mr2179687edw.348.1663836571624; 
 Thu, 22 Sep 2022 01:49:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7EAAlxx8Kt98tfB16fv7ZAaiO3BS3SwXCyvoHg/VfM5lTgH0ETcxd8ySdUBAhHYu1EcpxaWQ==
X-Received: by 2002:a05:6402:114a:b0:454:85e4:2295 with SMTP id
 g10-20020a056402114a00b0045485e42295mr2179667edw.348.1663836571404; 
 Thu, 22 Sep 2022 01:49:31 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906201100b00731803d4d04sm2289348ejo.82.2022.09.22.01.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-block@nongnu.org, afaria@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 03/26] qcow2: remove incorrect coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:01 +0200
Message-Id: <20220922084924.201610-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922084924.201610-1-pbonzini@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

This is incorrect because qcow2_mark_clean() calls qcow2_flush_caches().
qcow2_mark_clean() is called from non-coroutine context in
qcow2_inactivate() and qcow2_amend_options().

Reviewed-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/qcow2-refcount.c | 4 ++--
 block/qcow2.h          | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index c4d99817b6..1a6277c783 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1206,7 +1206,7 @@ void qcow2_free_any_cluster(BlockDriverState *bs, uint64_t l2_entry,
     }
 }
 
-int coroutine_fn qcow2_write_caches(BlockDriverState *bs)
+int qcow2_write_caches(BlockDriverState *bs)
 {
     BDRVQcow2State *s = bs->opaque;
     int ret;
@@ -1226,7 +1226,7 @@ int coroutine_fn qcow2_write_caches(BlockDriverState *bs)
     return 0;
 }
 
-int coroutine_fn qcow2_flush_caches(BlockDriverState *bs)
+int qcow2_flush_caches(BlockDriverState *bs)
 {
     int ret = qcow2_write_caches(bs);
     if (ret < 0) {
diff --git a/block/qcow2.h b/block/qcow2.h
index ba436a8d0d..c8d9e8ea79 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -874,8 +874,8 @@ void qcow2_free_any_cluster(BlockDriverState *bs, uint64_t l2_entry,
 int qcow2_update_snapshot_refcount(BlockDriverState *bs,
     int64_t l1_table_offset, int l1_size, int addend);
 
-int coroutine_fn qcow2_flush_caches(BlockDriverState *bs);
-int coroutine_fn qcow2_write_caches(BlockDriverState *bs);
+int qcow2_flush_caches(BlockDriverState *bs);
+int qcow2_write_caches(BlockDriverState *bs);
 int qcow2_check_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
                           BdrvCheckMode fix);
 
-- 
2.37.3



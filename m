Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86034CFF2B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:52:36 +0100 (CET)
Received: from localhost ([::1]:56256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCqp-0004ga-M4
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:52:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <39db33471909f8ab083e1a079eeae6975b55df13@lizzy.crudebyte.com>)
 id 1nRCfW-0000My-03
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:41:01 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:52063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <39db33471909f8ab083e1a079eeae6975b55df13@lizzy.crudebyte.com>)
 id 1nRCfS-0003mu-Eg
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:40:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=xcMKupBZTTL5NgBB0GSoIFyvqJ9eeQK3NYRIyylRKDs=; b=bkqFt
 4jZ1Sxoqa3Tl/lUFFEBDfv1xgUC82CV/KBS4rx2BOg2iY7hTA9P5l1eg0xlvq+9Axnmjh7FEfT7LA
 NUC9PWmCsL8ogLS8W67ZiN5AbJE9sCBaf2SbAJxUv1njX6iiA5m0UgchVlv4jwthSlCj/+7zrv7AU
 bB3n+0qGQ87MQxMofw5F4yjF0AaUXRwncB0DI67Ftfsl4VWrl/Suvyh+PXC4t2PdVzCKgZw6kQFYI
 KycwsWJd6wshhBWHk9Jxu9FHf7p4vtkhArPDJa0GxVif9gQBgRD8enoJecIYyazLNYQvbfF5NjKgc
 vm6gHHpV1ZDwxpDvB1lTa9seuRouQ==;
Message-Id: <39db33471909f8ab083e1a079eeae6975b55df13.1646651700.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646651700.git.qemu_oss@crudebyte.com>
References: <cover.1646651700.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 07 Mar 2022 12:15:00 +0100
Subject: [PULL v2 14/19] 9pfs/9p.h: convert Doxygen -> kerneldoc format
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>, Will Cohen <wwcohen@gmail.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=39db33471909f8ab083e1a079eeae6975b55df13@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

API doc comments in QEMU are supposed to be in kerneldoc format, so
convert API doc comments from Doxygen format to kerneldoc format.

Based-on: <E1nPTwO-0006pl-Np@lizzy.crudebyte.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <2b8f91de7bac3d3bc85d60eb08830a35a394be75.1646314856.git.qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 94b273b3d0..af2635fae9 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -100,8 +100,8 @@ typedef enum P9ProtoVersion {
     V9FS_PROTO_2000L = 0x02,
 } P9ProtoVersion;
 
-/**
- * @brief Minimum message size supported by this 9pfs server.
+/*
+ * Minimum message size supported by this 9pfs server.
  *
  * A client establishes a session by sending a Tversion request along with a
  * 'msize' parameter which suggests the server a maximum message size ever to be
@@ -231,7 +231,7 @@ static inline void v9fs_readdir_init(P9ProtoVersion proto_version, V9fsDir *dir)
     }
 }
 
-/**
+/*
  * Type for 9p fs drivers' (a.k.a. 9p backends) result of readdir requests,
  * which is a chained list of directory entries.
  */
@@ -289,8 +289,8 @@ typedef enum AffixType_t {
     AffixType_Suffix, /* A.k.a. postfix. */
 } AffixType_t;
 
-/**
- * @brief Unique affix of variable length.
+/*
+ * Unique affix of variable length.
  *
  * An affix is (currently) either a suffix or a prefix, which is either
  * going to be prepended (prefix) or appended (suffix) with some other
@@ -304,7 +304,7 @@ typedef struct VariLenAffix {
     AffixType_t type; /* Whether this affix is a suffix or a prefix. */
     uint64_t value; /* Actual numerical value of this affix. */
     /*
-     * Lenght of the affix, that is how many (of the lowest) bits of @c value
+     * Lenght of the affix, that is how many (of the lowest) bits of ``value``
      * must be used for appending/prepending this affix to its final resulting,
      * unique number.
      */
-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BD64CFDF7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:17:33 +0100 (CET)
Received: from localhost ([::1]:50794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCIu-000408-KP
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:17:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e16fea4156b6f0877df45104320164501ca689f6@lizzy.crudebyte.com>)
 id 1nRCCR-0002r7-2o
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:10:51 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:33469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e16fea4156b6f0877df45104320164501ca689f6@lizzy.crudebyte.com>)
 id 1nRCCP-0006fX-3d
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=JxwJG9r+Tf4XE67kO24LxoQgtYGtj/d4r4gjFVEHVJ0=; b=mWRJf
 l6SIcvzFc3PSVpQq7BvOnbQzHfp9WiM5uHM7yQkl3NTythf9Pz5GoOAm6tCottM4KHbVyAQ1nj2AU
 l639PQ235Kd+2OuP+PULQXnL2Y3pibity6QAmqwyJty6lvrlbk4FTd7dt1vjDLUKe2aW2rcAy/HG/
 wHxBd0P5pwj3HAlP4bv84weShWnbFbDGezsg7PGjXk8JM7Ov4qkfcEdZ2CPx1Th/rH1ZbHV75teFX
 7pk+t/obqiqAWwQqlRtyuKSBoKz4Ky8sbZPQoeRMVv+YaFVeOrvnlgE6s0axAOIvbW4rJ4v6ZbFVA
 qEPL8XPFEDOziD9wnZNSPHb0PTJhA==;
Message-Id: <e16fea4156b6f0877df45104320164501ca689f6.1646651700.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646651700.git.qemu_oss@crudebyte.com>
References: <cover.1646651700.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 07 Mar 2022 12:15:00 +0100
Subject: [PULL v2 16/19] 9pfs/9p.c: convert Doxygen -> kerneldoc format
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>, Will Cohen <wwcohen@gmail.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=e16fea4156b6f0877df45104320164501ca689f6@lizzy.crudebyte.com;
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

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <4ece6ffa4465c271c6a7c42a3040f42780fcce87.1646314856.git.qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 62 +++++++++++++++++++++++++++++-----------------------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 7405352c37..a6d6b3f835 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -628,8 +628,8 @@ static inline uint64_t mirror64bit(uint64_t value)
            ((uint64_t)mirror8bit((value >> 56) & 0xff));
 }
 
-/**
- * @brief Parameter k for the Exponential Golomb algorihm to be used.
+/*
+ * Parameter k for the Exponential Golomb algorihm to be used.
  *
  * The smaller this value, the smaller the minimum bit count for the Exp.
  * Golomb generated affixes will be (at lowest index) however for the
@@ -642,28 +642,30 @@ static inline uint64_t mirror64bit(uint64_t value)
  * should be small, for a large amount of devices k might be increased
  * instead. The default of k=0 should be fine for most users though.
  *
- * @b IMPORTANT: In case this ever becomes a runtime parameter; the value of
+ * IMPORTANT: In case this ever becomes a runtime parameter; the value of
  * k should not change as long as guest is still running! Because that would
  * cause completely different inode numbers to be generated on guest.
  */
 #define EXP_GOLOMB_K    0
 
 /**
- * @brief Exponential Golomb algorithm for arbitrary k (including k=0).
+ * expGolombEncode() - Exponential Golomb algorithm for arbitrary k
+ *                     (including k=0).
  *
- * The Exponential Golomb algorithm generates @b prefixes (@b not suffixes!)
+ * @n: natural number (or index) of the prefix to be generated
+ *     (1, 2, 3, ...)
+ * @k: parameter k of Exp. Golomb algorithm to be used
+ *     (see comment on EXP_GOLOMB_K macro for details about k)
+ * Return: prefix for given @n and @k
+ *
+ * The Exponential Golomb algorithm generates prefixes (NOT suffixes!)
  * with growing length and with the mathematical property of being
  * "prefix-free". The latter means the generated prefixes can be prepended
  * in front of arbitrary numbers and the resulting concatenated numbers are
  * guaranteed to be always unique.
  *
  * This is a minor adjustment to the original Exp. Golomb algorithm in the
- * sense that lowest allowed index (@param n) starts with 1, not with zero.
- *
- * @param n - natural number (or index) of the prefix to be generated
- *            (1, 2, 3, ...)
- * @param k - parameter k of Exp. Golomb algorithm to be used
- *            (see comment on EXP_GOLOMB_K macro for details about k)
+ * sense that lowest allowed index (@n) starts with 1, not with zero.
  */
 static VariLenAffix expGolombEncode(uint64_t n, int k)
 {
@@ -677,7 +679,9 @@ static VariLenAffix expGolombEncode(uint64_t n, int k)
 }
 
 /**
- * @brief Converts a suffix into a prefix, or a prefix into a suffix.
+ * invertAffix() - Converts a suffix into a prefix, or a prefix into a suffix.
+ * @affix: either suffix or prefix to be inverted
+ * Return: inversion of passed @affix
  *
  * Simply mirror all bits of the affix value, for the purpose to preserve
  * respectively the mathematical "prefix-free" or "suffix-free" property
@@ -701,16 +705,16 @@ static VariLenAffix invertAffix(const VariLenAffix *affix)
 }
 
 /**
- * @brief Generates suffix numbers with "suffix-free" property.
+ * affixForIndex() - Generates suffix numbers with "suffix-free" property.
+ * @index: natural number (or index) of the suffix to be generated
+ *         (1, 2, 3, ...)
+ * Return: Suffix suitable to assemble unique number.
  *
  * This is just a wrapper function on top of the Exp. Golomb algorithm.
  *
  * Since the Exp. Golomb algorithm generates prefixes, but we need suffixes,
  * this function converts the Exp. Golomb prefixes into appropriate suffixes
  * which are still suitable for generating unique numbers.
- *
- * @param n - natural number (or index) of the suffix to be generated
- *            (1, 2, 3, ...)
  */
 static VariLenAffix affixForIndex(uint64_t index)
 {
@@ -810,8 +814,8 @@ static int qid_inode_prefix_hash_bits(V9fsPDU *pdu, dev_t dev)
     return val->prefix_bits;
 }
 
-/**
- * @brief Slow / full mapping host inode nr -> guest inode nr.
+/*
+ * Slow / full mapping host inode nr -> guest inode nr.
  *
  * This function performs a slower and much more costly remapping of an
  * original file inode number on host to an appropriate different inode
@@ -823,7 +827,7 @@ static int qid_inode_prefix_hash_bits(V9fsPDU *pdu, dev_t dev)
  * qid_path_suffixmap() failed. In practice this slow / full mapping is not
  * expected ever to be used at all though.
  *
- * @see qid_path_suffixmap() for details
+ * See qid_path_suffixmap() for details
  *
  */
 static int qid_path_fullmap(V9fsPDU *pdu, const struct stat *stbuf,
@@ -864,8 +868,8 @@ static int qid_path_fullmap(V9fsPDU *pdu, const struct stat *stbuf,
     return 0;
 }
 
-/**
- * @brief Quick mapping host inode nr -> guest inode nr.
+/*
+ * Quick mapping host inode nr -> guest inode nr.
  *
  * This function performs quick remapping of an original file inode number
  * on host to an appropriate different inode number on guest. This remapping
@@ -1281,12 +1285,15 @@ static int coroutine_fn stat_to_v9stat(V9fsPDU *pdu, V9fsPath *path,
 
 
 /**
- * Convert host filesystem's block size into an appropriate block size for
- * 9p client (guest OS side). The value returned suggests an "optimum" block
- * size for 9p I/O, i.e. to maximize performance.
+ * blksize_to_iounit() - Block size exposed to 9p client.
+ * Return: block size
  *
  * @pdu: 9p client request
  * @blksize: host filesystem's block size
+ *
+ * Convert host filesystem's block size into an appropriate block size for
+ * 9p client (guest OS side). The value returned suggests an "optimum" block
+ * size for 9p I/O, i.e. to maximize performance.
  */
 static int32_t blksize_to_iounit(const V9fsPDU *pdu, int32_t blksize)
 {
@@ -2398,10 +2405,11 @@ out_nofid:
 }
 
 /**
- * Returns size required in Rreaddir response for the passed dirent @p name.
+ * v9fs_readdir_response_size() - Returns size required in Rreaddir response
+ * for the passed dirent @name.
  *
- * @param name - directory entry's name (i.e. file name, directory name)
- * @returns required size in bytes
+ * @name: directory entry's name (i.e. file name, directory name)
+ * Return: required size in bytes
  */
 size_t v9fs_readdir_response_size(V9fsString *name)
 {
-- 
2.20.1



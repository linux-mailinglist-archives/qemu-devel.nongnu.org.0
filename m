Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49DE47A438
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:14:06 +0100 (CET)
Received: from localhost ([::1]:50142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzAzu-0006Vy-02
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:14:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAkM-0008PW-E3
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:02 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAkK-00081R-N8
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976280; x=1671512280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g5dqtNSheJEAUAFWISEDuG3LJbOa/5QnES8eu5F16ig=;
 b=qjWPFf+4kA0xN/NDvgR+tnps1i4H5yt8GcSshEvtXijVkvvKSoNmuWpx
 5iGseVNZwmZogp7cYNdnD7P4NDJ8MOOAMNgx4IKPaLfhY+GMe12ejUrf9
 YVwGYYhMN7WVxdJYC0j2SXRQwsDQFh7vafPoo76TthVUCX6a6tYotF8FX
 8g0cJNKm/Nj7eJ9Vcj5IIqaynm2zHq/jWYnyvP5Fga1L+wffQ0KUg78tD
 rJ0iT/LcyI0gUGWz0wWOeT/0+1r/u3v8X9EMTbYF3V9rjMHZmPK6grhAF
 WmwVuFIzwxzhdpCToIxE3rs0xMhvag86Jknl7dpMAtB+ogkLP1bzU76Ml Q==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292661897"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:57:59 +0800
IronPort-SDR: YB+54cyvrxo9ZVtytsGc7TEruzjl+Qy5n2GIe3+iKvnDDFIsP5jSWBeOdk2LT9CnqEn4z15aTY
 PqvdyqN240U39qigD1Hs/+oCX9WCK2JXcm2pIlrpN6X6e3/Q5Loepgrc27aC4lAWyLYddrKGXC
 ebVvyxZZ43qUYmFW9LNB9ioI1X8I8WrlVvgAks6NFcJYOp7+Iu/freGZKKk6i9VevtiAJ+upu1
 3CLQY6Gx/8musfWlwYWy9Dd3Eqqt4/UlZG3lLXCUx/ooyBk2L99tIpJfq0rQB0fv7aKXgESjmj
 gQFwhQbigNs25pugmRZZRVs4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:30:49 -0800
IronPort-SDR: O7X24HeBZBne/eSqyp4oOKvdbNDe4vQyYZ7/mpMjX2Mvcfppt6GsADzFruLYIvF0STlSzcnRJR
 9RKGLpU0+K9AGbWk3sUvB6iMOKbrQH1N6y4UPtzrhrKXmDoYy84KpdPRxce5xRGKBMqveI5OJV
 820tlXqEhsQLjZsEM771U2K18vU8hCgSBXL8CZ6QWxrB7+9FBPmCGkeWBZsSVSSlCWQtzeHEf2
 hZrQoRPBkaeUt7iWtnXLeTEWj24XOldZ8QY9OILUuhN9Z/M1UVPZSN2PEAsZyCs10+y9GAlrOb
 F8Q=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:58:01 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS5M5Wkrz1RwFN
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:57:59 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976279; x=1642568280; bh=g5dqtNSheJEAUAFWIS
 EDuG3LJbOa/5QnES8eu5F16ig=; b=t97fZ3K9Lt7BzErNZ8AQwgVfxypqE2flAF
 I9WaWN7LMNhTvGlVKGKvAuGgXDzK0voGysws0BsdxsNoxYq+mEqP+ijexZtXW9BU
 UTkHAyqFL0wSy9tfrYEY3Kc3De1MXNX9ZVRhaqah8d0/fXZtKXYs+holY6nf51TH
 2+cOYLPZAgvtkAbNTvrao1MSPMMynnvFzf88N1G2qLw6CgElzfPsu+4l6gHHEyP4
 FDr086urnFfhlBex3ovEz12q++SByZ554BqG/PphaH0b8yFsHLLAo/Lkxck5go9F
 6gqK1ZByVm8dvSxR4qrcCcQwa1qKjhccKnJoiAyYwFUI7MdrId6Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id O6y4SJ3X0zO6 for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:57:59 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS5J3mbLz1RtVG;
 Sun, 19 Dec 2021 20:57:56 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 10/88] target/riscv: Use FIELD_EX32() to extract wd field
Date: Mon, 20 Dec 2021 14:55:47 +1000
Message-Id: <20211220045705.62174-11-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-3-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 12c31aa4b4..70f589813e 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -98,7 +98,7 @@ static inline uint32_t vext_lmul(uint32_t desc)
=20
 static uint32_t vext_wd(uint32_t desc)
 {
-    return (simd_data(desc) >> 11) & 0x1;
+    return FIELD_EX32(simd_data(desc), VDATA, WD);
 }
=20
 /*
--=20
2.31.1



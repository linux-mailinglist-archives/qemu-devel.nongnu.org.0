Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086024B80E4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 08:02:43 +0100 (CET)
Received: from localhost ([::1]:38962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKEKo-0005Sc-3B
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 02:02:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDow-0004dj-P4
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:46 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:59488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDou-0006IQ-Ev
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644992983; x=1676528983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jJhe4C9xKTUjuHDZsArzEwaH2LLLcRIH/N5JeKNmc74=;
 b=NLF7GSX9L7kaKWIQ2LhBj8K7HSwKIyv39YJ9zcllh/lVVG9VqFlVFphx
 etvYllcet6NYOa5AVX6XaAknCRBM0+4iC6DTc29yaIpF6gnKt6inGjGBm
 x2X+1PImvuFrfMfIrSGmUnBK6uL4wtWTBnJNONSxWyKJdTeyJVb3+b8KN
 BUGLbviv2qVg82a+nGknSYQxAX10mLJ8TyA/YyscLncINiYTJIy/FRwj4
 6jSDnP7OPPWJRIEqT6SH4kNVi7kfmyBxC1vJllssRX4l/Gl8uQNLiKXuY
 y2ntGLO8f31j9SMddrOh+xv+F0BDLThVy2K/IgY0LD7MSut2xVw6C104U g==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="193072684"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:29:41 +0800
IronPort-SDR: bAmkf4OUrVZtgx6fqEY/vPkWksI3HBYfO7deoIlVMkGtoFZf2gWpKEgdo/nEadIlJmZgBDKqeX
 5q/MGxSUuN1vbPLedky+oLoaw6nRvkdHwhg8pcBBo2sGaxGg4krputWqRJ+qR5qPu4lK2JL4Ib
 9kGvhnFu3Zumliw5T5FcKRQ9DDGzI15F54fKuzGvI4tatkeb0Zl1Dt+Ee0mSsHC+K6p7nLi9LI
 PE/w+W9UJAGBmcRECSLpR21qcpJne9oOWnnk6pxGszAFSqhTQxMfdYX4DshHakvk/CGeQw6JLS
 c9aO8jcvePt/MoNgOqagoPdF
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:02:31 -0800
IronPort-SDR: xt5NG991uZ+VlnkklIsY7b8vkl8xF3L8EcUcinbVUAS/Zh7Nvl1iLBTEttgMuzU3T6EMe+DSSx
 lYehFi9Ro290/wBVzYqnDjwywSrYFigsEmOXM7Q9pbNW3qOUDtPvYYPTn9l6fLT/ldxP2mHmMP
 vZKsE8tnfWw5TiE0YcWqMV2Mj+wv23Mr8yOhnHhDbvwvQLRl2/XlgtmTV3dfru5SElf3mZO1Hx
 ZcDdRu2h5VvqANPaWGQucFvoKfOZ/o8+y+0kagK0geA6NjWmQg2cbIedTb+cnhLfrqvg2Jnmi+
 2Kk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:29:43 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7NQ6TDFz1SVp0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:29:42 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644992982; x=1647584983; bh=jJhe4C9xKTUjuHDZsA
 rzEwaH2LLLcRIH/N5JeKNmc74=; b=Ks0LSmkFuY3tWatAWlkZG4iH4wUu1kMtWl
 jJ89Q8oNoey/C02jYhQfZ8AI5KB76lSxvCWMTwE5Ot2lT/L8AsvjlkBpe0mxzBbE
 h4gn5LcuepxTQo1lUojQMd+PtbzZqMGxZFxsUvk5YGlXYGVEa1/sUeadLYI6Qqen
 iEh549kanjj5dldInrR55oB/MJ9VcK632HalA0UYeHhSMxJbSFeqI8re+0bYA9su
 xUioHyQO5MJTlzofwDO020EaCq9w7sO/R7EbWoaKCuz1Ui0OiKFXskUXCCinSdFs
 ItDyBBqlpW33biehEEIwwHMD0p4vptdahCR76jBRQ1/Rdao9h3Vw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id oI3xax2UDzdf for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:29:42 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7NM2tM2z1Rwrw;
 Tue, 15 Feb 2022 22:29:38 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL v2 05/35] target/riscv: riscv_tr_init_disas_context: copy
 pointer-to-cfg into cfg_ptr
Date: Wed, 16 Feb 2022 16:28:42 +1000
Message-Id: <20220216062912.319738-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

As the number of extensions is growing, copying them individiually
into the DisasContext will scale less and less... instead we populate
a pointer to the RISCVCPUConfig structure in the DisasContext.

This adds an extra indirection when checking for the availability of
an extension (compared to copying the fields into DisasContext).
While not a performance problem today, we can always (shallow) copy
the entire structure into the DisasContext (instead of putting a
pointer to it) if this is ever deemed necessary.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220202005249.3566542-3-philipp.tomsich@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f0bbe80875..49e40735ce 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -76,6 +76,7 @@ typedef struct DisasContext {
     int frm;
     RISCVMXL ol;
     bool virt_enabled;
+    const RISCVCPUConfig *cfg_ptr;
     bool ext_ifencei;
     bool ext_zfh;
     bool ext_zfhmin;
@@ -908,6 +909,7 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
 #endif
     ctx->misa_ext =3D env->misa_ext;
     ctx->frm =3D -1;  /* unknown rounding mode */
+    ctx->cfg_ptr =3D &(cpu->cfg);
     ctx->ext_ifencei =3D cpu->cfg.ext_ifencei;
     ctx->ext_zfh =3D cpu->cfg.ext_zfh;
     ctx->ext_zfhmin =3D cpu->cfg.ext_zfhmin;
--=20
2.34.1



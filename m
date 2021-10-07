Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4275424D82
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 08:55:46 +0200 (CEST)
Received: from localhost ([::1]:54906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNJh-0002bH-Uv
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 02:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNCj-0002ko-SH
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:48:34 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:56888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNCh-0003IW-JU
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589311; x=1665125311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uRfXfFHryquG2t6XbI+qMdt6gXOBJDeO9IMIfFkCExU=;
 b=c0N6Qh81j9/UaigrdSlnt1zi5gIKSt+IjIuvv9vlGP3wa+FxGg6C/UHX
 gTAm3kzaqCAqfFGjwfRU2iI9uaPdBe7na3ey00ZHJWIN6nyHaabhteJvB
 MaRAdUnjeER5Dn5XyiSVNoee3d/fkGTA/Y10tPDWA2uWymveEfvKLHCwl
 u/clPCbydKMHKjdoTgdvnYzZJYtNewqHnmDvFumAXKxnXMlrM7hl7xZVD
 2b/0yJyAvjbE5skYWS7mpFbRNYELvFuyPrIKN8UiLV3omBjE4S8grzsCG
 tUxp6ISJxOJF8m/oG/ufcj/LiIoCErBhfVF3fu3ofMXI+f09iP+7uOKjl A==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="181145243"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:48:29 +0800
IronPort-SDR: ZOyevfu64Wu8doNukbc+T9qx3zShFU1dQKtDU+U61p5WKhtUIt8+TfmAYjAPKVh6WJXhIIB90k
 nvAZpQrNGkrYFMSIyxKETELRUtK8nMOzq2ahwog0cWqomp0gwtebBhKOaKu9zPobQFp1yH2TqK
 7wO/2hFFEowYJuRxEbzQmyesskaIeWhmxtbMPr775dWAZSkkcvprfX7p3rP+h+fL9J5hHX0jrP
 5NDUVbcWPzQjW6Kei1L3lSmk+MmF45X+wjZkH81p/RjTHFzCvcG9I0zc+LKmRkEAQkHZBENDQI
 yLFzisbg8yjtnPWzFE8gkCtn
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:22:50 -0700
IronPort-SDR: ZIxV/HwzMQ8/kYFFEoEg7NSBdrvzD9WlGsveyJMaXb3g6CbQldSGl1XoGMNCrj30AXjDh3gWDO
 zrbL3xqvb+Qapvhogw4aLURZhFq2M1H3L+CSB05+C3ntwFB135eJXGsub4/6YHMYkZY26lPq2d
 NqyRgw4ZYsMUbw91bHy105VmM4izLPPEfY+Qum5VJ96elatpkQZKZrM3gKki2IO3Xg4haOKFVi
 h+HpzmFyRqek6lOVmlPeq9vqRmRdC9e/JdmAwaSP/SPc0AcLqVBWcgYZexzqCMf5xahwzqjTJg
 wxE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:48:30 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ23059D2z1Rvlt
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:48:28 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1633589308; x=1636181309; bh=uRfXfFHryquG2t6XbI
 +qMdt6gXOBJDeO9IMIfFkCExU=; b=Bw6XlzvzduN2AnZHyvH4q2wiUlWtGSYnit
 L4yeGLxn5S5IlzQXi4UCqNwVIH6Netk4YkeLJx2wgU4buEuco2yDK20mrbYutlQG
 E3gn4olp5hVB9wlazSoC6qo/51C7vq74rws4LD9MR4KIzUzmBNnnVqkk8t7DydgU
 xh9HhLfuZAXACS9QNt1KL8QgltGNrl1v/NqvOifzJk1Jnz8dGpct+p4amGLWEB+P
 j/fh47uwqgrMdx2zO4Nw9NmXLK1L1RmSv7I5Ux9WE0pZpbHQdksWUb6i/SyaYvf3
 xTrpSfzAHyIvdqbg5MCmpGYcHydE8CPf77veMJY2XD9G+0tM+usQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id a-G86zn0jA_h for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:48:28 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ22v6dkYz1RvTg;
 Wed,  6 Oct 2021 23:48:23 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 04/26] target/riscv: Add x-zba, x-zbb,
 x-zbc and x-zbs properties
Date: Thu,  7 Oct 2021 16:47:29 +1000
Message-Id: <20211007064751.608580-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

The bitmanipulation ISA extensions will be ratified as individual
small extension packages instead of a large B-extension.  The first
new instructions through the door (these have completed public review)
are Zb[abcs].

This adds new 'x-zba', 'x-zbb', 'x-zbc' and 'x-zbs' properties for
these in target/riscv/cpu.[ch].

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20210911140016.834071-5-philipp.tomsich@vrull.eu
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 4 ++++
 target/riscv/cpu.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5896aca346..1a38723f2c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -293,6 +293,10 @@ struct RISCVCPU {
         bool ext_u;
         bool ext_h;
         bool ext_v;
+        bool ext_zba;
+        bool ext_zbb;
+        bool ext_zbc;
+        bool ext_zbs;
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7c626d89cd..785a3a8d19 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -617,6 +617,10 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
+    DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
+    DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
+    DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
+    DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
--=20
2.31.1



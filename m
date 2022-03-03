Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684C94CB684
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 06:40:01 +0100 (CET)
Received: from localhost ([::1]:38032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPeC0-0003Cm-Gv
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 00:40:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe1o-0002ap-0b
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:29:28 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:27416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe1m-0001dG-D8
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646285366; x=1677821366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6EoaoUI0VWVi9h01XLThoe0gu1dQk9RbAjEAt92Xfig=;
 b=A/E2j7EefcwtfQIb5OpnokoYYnJWQiyBEOCAKTvCXuIcixDik8XZTm6d
 2SEMmrFioae3iqPIK3+GxQ2LV070naWngEgUhMwrVhITuGpYFE7dOL+eQ
 LVJjTBoftuJiwE5n94bw5TXJKPlXprH684GAmhxQlq9eAvhPCfL7EJgDy
 KsWB2BeDkR3zJDeZ8fjfEM6MxqLgga4nQcHHn/sTE/IYLj2OeDBd9bEi6
 m1ZcqVyx0TQuhN3/Y/CtbK0DCe7ISkw1wSC9qAMogLO2h8/OknfcJJzww
 YrJtEbaOYMvVhySjDdyd3LBstkE3IL3ebJ+68iF6k9L7zpRjXP4CVEeUi g==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643644800"; d="scan'208";a="306258534"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2022 13:29:24 +0800
IronPort-SDR: i4RFGpjegFEz31x9bEaIl6aWhwGf8Oflv1Dsty+mogWrWK8CAu54oTvf3ftjP/5+GWOmbpffz1
 q1qdRYVDd+yUPf/epLoLRijPLXbYvBOz8TsbPcbXW8FQlQZH7z3bDnY+tWpwwMQXxQ0dRRFAxe
 qeGgsY/R1v8Bo2ldO87LoZ0YlciZ3qZrK31IJQS+ZS443oRDjS5y+Ag8XnfnKK9AUVxSxc1W7/
 WO/4l3Ghl2u7ssWsLkal/fhI3IIzXdCPuawVa19luFWqZxxljzA15GGdSJ1UD6+PgXVEa7+3fT
 jAR4l5Dj+kx7FNItQGfA6PzN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:00:47 -0800
IronPort-SDR: jQ8M7GRkl5U97Qn0r+iuJnXYcFelb60GgCm6dQ32YWkbFq28QfzKZmL5MhPnkWf/7u/Tqvryld
 8uW2zckEMG3IRgsFY8pswRLKeCXSz1XoDwlfTOLN9rUT05GY3Yqhs6StCWctRejL8brEG7NCYD
 FBLbyiNXMpEi61mNQC3ZENGBivHgYR7QsQmcGL4EKA5Zw/E23/VWhG9uOjPZLZTUPNW9PKLjQI
 UzrHue0m4DhbnJFc08Yr4+HWjyOV3gd0WOd5Dlu8509nj60M5qe69/k66tghMFcjcN2+0J4Re/
 bpQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:29:25 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K8KKw2xfgz1SVny
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 21:29:24 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1646285363; x=1648877364; bh=6EoaoUI0VWVi9h01XL
 Thoe0gu1dQk9RbAjEAt92Xfig=; b=YxVY22jvI5/6ZbF1Sp2mH0TqfmUzuB/VbF
 2nPx2n+KvZFfVKb8f6XJslktId59j8pMVfXOO8YNjRok4SwLvW5pT9Zj5vDLoji+
 e+/bijAWmkdHopd+QLCI8kFiVVcMi+d+dibtl3jpYIZymMMbNx7kH4T0fZfgy0nO
 oaGYOxpYtXdE0OTWVUATFykNHoHwpNiDv5RsPBkvaSLrzCdcBBbLgNcsjRwOGJTa
 Ql4kabjj49fOiCLECOQ/0QxPJsDhkc/Cyv0PuWauwdaQJd4186beZ0jTM3OfnmZ1
 JcKOKIJMRs68dxTjo5in2YxTiTdptlF8blyCecoDAJf0vjDD42Ag==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id GHK9joRxsmhA for <qemu-devel@nongnu.org>;
 Wed,  2 Mar 2022 21:29:23 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.101])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K8KKq4C9Rz1SHwl;
 Wed,  2 Mar 2022 21:29:18 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 ardxwe <ardxwe@gmail.com>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 13/13] target/riscv: expose zfinx, zdinx, zhinx{min} properties
Date: Thu,  3 Mar 2022 15:28:04 +1000
Message-Id: <20220303052804.529967-14-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
References: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=05403f1d5=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

Co-authored-by: ardxwe <ardxwe@gmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220211043920.28981-7-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 55371b1aa5..ddda4906ff 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -795,6 +795,11 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
     DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
=20
+    DEFINE_PROP_BOOL("zdinx", RISCVCPU, cfg.ext_zdinx, false),
+    DEFINE_PROP_BOOL("zfinx", RISCVCPU, cfg.ext_zfinx, false),
+    DEFINE_PROP_BOOL("zhinx", RISCVCPU, cfg.ext_zhinx, false),
+    DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
+
     /* Vendor-specific custom extensions */
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
=20
--=20
2.35.1



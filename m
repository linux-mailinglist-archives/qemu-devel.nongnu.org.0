Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334E64B82F6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:32:34 +0100 (CET)
Received: from localhost ([::1]:43668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFjl-0002mg-A5
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:32:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDpg-0006Jx-CH
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:32 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:14530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDpe-0006fr-7F
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993030; x=1676529030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iLXXpXI9zgLaXQJ4bWp9YAGUXCRbcHAuyAhY5lhInqQ=;
 b=P5Rp9UcyM4dS0QPHM4ZI9NWt9XWLNyFqiBIiX6GcqzfivEn3oEG/RsyV
 IKJZLixsUPmptogSaxLvZ4LTQn57uRPd5cyBabFrt6vWG91JviMP/UN1v
 iIB64uitd6kvPPsqEuy1jPYcWnHYT+aqpqHlMYa3xtrMOY6X3A82hfUhr
 J7Pf3JpJT0LlGObx0yqEr57bgzFsNLXtrHaeN/iS13XddYGdtgeeP+ZPO
 mgHofhISuTBPgmnHh9qB82jCsgLJ5lZTQurgp9kMfkmHeGB1dWrdrQmlm
 azz88Vtly1qJ+0Ez+kwuybZyZJJRuzBhUVh/l5g6i+Xz7ty37RVedS+j0 g==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="194046754"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:30:29 +0800
IronPort-SDR: LnKCey/hAVNaQ8LmKCcaS2+7dFNDcmhLqkvTgf/nrh/zdtDYnGLKH/KUO35yC5/TLM7idanWsA
 7fUHUUmLGZpmxkLBL/8g2Q7ryDumCMxjTKbOw15lcg2ZoQHQ25Uh4hmEbNHVCFYFCOU/We90Mc
 OOU3MvBRE4vbtR3crlTcTQzrAo8KF//U65OllrKrQubk6DYExnfssMlXOPSfcMpsWaLn1JTi59
 grJ0EE1x1Y6lBjgpEWenr1J7PJDt/HdAS0UEL2//ZXM9hoylIIBMDW/3cHW13wFHtXBhKw88M+
 /CCP0wvmD1fhYqZ1Shw8Qd/W
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:02:09 -0800
IronPort-SDR: DJH9b4uyh0ZhIscCWHPFcTyHqhQ/cUxBaWwy8ambo5CNtAVshjHYn+Nl7+fQjPikCmXWj4iPP2
 MBF+mNKt/rIGlLE63JmPX2CDaq16WhhoGpb5SQ6D3cep2G9iF58vbs8Whaxnp9Chv8GOsoSWkc
 3kpxajNs4mb4dWtJokKJ9SX2ufYkDccWJt7zBUTSStQMmi7U+tPlikoZQEF3HAOQvpzbv5Ra5e
 DIE8gXqsYJLHkQVdt40/chXPmz/eb+xhrE8GeLMsorIecF97LT0fcVsVcgH5+odTte6eZf1wXR
 fH4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:30:29 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7PJ6NRkz1SVp0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:30:28 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993028; x=1647585029; bh=iLXXpXI9zgLaXQJ4bW
 p9YAGUXCRbcHAuyAhY5lhInqQ=; b=ZFqBetp8Xp1NcDnY93r8jGBAlCO9NfIGmH
 yXfG/ww1jRNg7IRORXFw6k2BQfNNlNKZnxveKSyWY2HzqiBb/kQYmxXScd9LKOBp
 KFu7liVi8JwlcAjeUJLxYQdzBwnGjmOQwmNz+NRkbOROJqq8mzZsUmGJi8aBBD85
 A/GPpM+UmNyXEClqkv/xh8Lhd33hEpso/nN5e9ZbG4GEINf6/kbj0jq70eGDA3Cu
 AwrjoqNiHyEODuwIJXlFy0L2TcJCPx9y5VXaBhIzgB/MhgiJX+M0BC7lQYBkg/F2
 eof+tna9P+1NLvskWxtg4jDM3CH8lK5MEbpXoiFkEiMzZjClWzkg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id lC5Y64sZ-VHd for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:30:28 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7PD4tpcz1SHwl;
 Tue, 15 Feb 2022 22:30:24 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL v2 15/35] target/riscv: Improve delivery of guest external
 interrupts
Date: Wed, 16 Feb 2022 16:28:52 +1000
Message-Id: <20220216062912.319738-16-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

From: Anup Patel <anup.patel@wdc.com>

The guest external interrupts from an interrupt controller are
delivered only when the Guest/VM is running (i.e. V=3D1). This means
any guest external interrupt which is triggered while the Guest/VM
is not running (i.e. V=3D0) will be missed on QEMU resulting in Guest
with sluggish response to serial console input and other I/O events.

To solve this, we check and inject interrupt after setting V=3D1.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-5-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 698389ba1b..e45ca08ea9 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -326,6 +326,19 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, =
bool enable)
     }
=20
     env->virt =3D set_field(env->virt, VIRT_ONOFF, enable);
+
+    if (enable) {
+        /*
+         * The guest external interrupts from an interrupt controller ar=
e
+         * delivered only when the Guest/VM is running (i.e. V=3D1). Thi=
s means
+         * any guest external interrupt which is triggered while the Gue=
st/VM
+         * is not running (i.e. V=3D0) will be missed on QEMU resulting =
in guest
+         * with sluggish response to serial console input and other I/O =
events.
+         *
+         * To solve this, we check and inject interrupt after setting V=3D=
1.
+         */
+        riscv_cpu_update_mip(env_archcpu(env), 0, 0);
+    }
 }
=20
 bool riscv_cpu_two_stage_lookup(int mmu_idx)
--=20
2.34.1



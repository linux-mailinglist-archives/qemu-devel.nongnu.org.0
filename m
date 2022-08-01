Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C0158743A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 01:06:10 +0200 (CEST)
Received: from localhost ([::1]:53816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIeU3-0008FH-9y
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 19:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2052cf057=alistair.francis@opensource.wdc.com>)
 id 1oIeQp-0004pH-5B
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 19:02:39 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:37374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2052cf057=alistair.francis@opensource.wdc.com>)
 id 1oIeQk-0006Fv-Rm
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 19:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1659394954; x=1690930954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hdwKfjeemRbfOJf4/phUwOpFaFliq9yo8RvFR8O1ZMk=;
 b=LFT39GCUIZihM2P6mnwe/jfU+cy/X898JTznRn8WnRfi+/PqoZY3UwpB
 aDdmxotEWgKAR/IoaWmRgxlUzP7Mo+LlR23I+/44ji3PoDSK9Nw/LIzg2
 B7DeXLJZw9EcDkaK5kPdxtqT/ufX6oP5XavoEmB9F5jddHfb6ZxM4cTyK
 fVtU19At0jqAnlDCMyEQ4XgkFjxAHuC4G7mvudTQmjPWck29/66xgltDn
 IFxkXu4JYnKfF070TfS3gnQCy+IIQIS24Di56RqDuhTTZKPUaHQMdVhbw
 X8K+57BwFjZcWA1930XrLfGdsYIXaLRUx7m1L88jLYqtRzl66J/RUsoci w==;
X-IronPort-AV: E=Sophos;i="5.93,209,1654531200"; d="scan'208";a="212475785"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Aug 2022 07:02:30 +0800
IronPort-SDR: Uy8kvIQnrzddQYvzpvhfh87tM+w3ldfXKyuhgQHqEkDhmu71FaQNHCxQgUDqbK4USmAFbujbh3
 AjKiKwGDV/hNGSEySSHQC1pxaww2X7BdxSAnkyDJ09cYOrKHVa2e3AlyygRP849Q3Q6dVIz2ro
 VFzUSCutijZ8xDMG247Efierq82D1oTA5e7WVPx+K/ibJFgyE8yKmVIZf4ItJ4ycsXiOGAX/W/
 gTQqgVu5pshDBUQ0GCm/Fj9dcWwgz3aOpeouK/iVB4TiBb1hmjWWrOL7o+TdkR4fcgdMIGRmbJ
 SWYmybgjuUSi6wPoxz9XDbFx
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Aug 2022 15:23:36 -0700
IronPort-SDR: kTPewhyD9TzeeETZ3YO0TrBZswOObjsbJDe9unlYB+7+2n+NDXwn0J/pJIvfhL3epDMUbZSG5m
 3umSg1cjRUkT2moKV8muu1e9JfyyDV+7E4acvgCumQVsxcpzNh1zR8ihINuTL//cyWlJWqe7AG
 98IgIpYaUqlnRZwOZRK5QUibCyi/ZkgcHjdhsZTBAS/V0USKXZ5ywDfvEbB87yud2eM1LhdMSs
 92L+tFl1Z/0SLVu6C+0vwymQUmCmnZF6V4Mz4oGlam931aG/VWT28+zhj+YBAKmphPbZBCYcwl
 LcY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Aug 2022 16:02:31 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LxYYL1Y50z1Rwnx
 for <qemu-devel@nongnu.org>; Mon,  1 Aug 2022 16:02:30 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1659394944; x=1661986945; bh=hdwKfjeemRbfOJf4/p
 hUwOpFaFliq9yo8RvFR8O1ZMk=; b=A85dWho27+Tc9ovjdsO87b8p2ebdx4NzJv
 y4CJ2t1JdZ9hDlIp4iIwwJl6WuL2WqXM2CZuhLBy5AC6gjgSoXvaHuL+O5bOnKD1
 Ke5DnL+EJiUabTQMtudZj7ZfCLvhlMx8Ad17VTPhvWz+x1kM1cW53jNwP4XKurVj
 yz57Fbg1ZU4S35sIL9PvxsoW9bmgfp4JkVZ2IcfLQGAHq/ZmJF4v2MKLg9aRZLMY
 zvtJQmAG6E+n2AYMFH3/Vb26d3Ma/j0rY79SNcuoW4AbNjeF8IozuukEl7B8m/Zs
 lxggHwqMxd7ATd6IabnCPts9mP2iHxBJPVZFhIVhZPKkuPpG8peA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id qfLRlaBinomb for <qemu-devel@nongnu.org>;
 Mon,  1 Aug 2022 16:02:24 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.18])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LxYYB41BCz1Rwnl;
 Mon,  1 Aug 2022 16:02:22 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 1/1] linux-user/riscv: Align signal frame to 16 bytes
Date: Tue,  2 Aug 2022 09:02:12 +1000
Message-Id: <20220801230212.3406689-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220801230212.3406689-1-alistair.francis@opensource.wdc.com>
References: <20220801230212.3406689-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=2052cf057=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Follow the kernel's alignment, as we already noted.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1093
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220729201942.30738-1-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 linux-user/riscv/signal.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
index 296e39fbf0..eaa168199a 100644
--- a/linux-user/riscv/signal.c
+++ b/linux-user/riscv/signal.c
@@ -64,9 +64,7 @@ static abi_ulong get_sigframe(struct target_sigaction *=
ka,
=20
     /* This is the X/Open sanctioned signal stack switching.  */
     sp =3D target_sigsp(sp, ka) - framesize;
-
-    /* XXX: kernel aligns with 0xf ? */
-    sp &=3D ~3UL; /* align sp on 4-byte boundary */
+    sp &=3D ~0xf;
=20
     return sp;
 }
--=20
2.37.1



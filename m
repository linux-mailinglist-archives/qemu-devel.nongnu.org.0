Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0482B454392
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 10:24:32 +0100 (CET)
Received: from localhost ([::1]:41730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnHB8-0001pl-Sg
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 04:24:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9488079f4=alistair.francis@opensource.wdc.com>)
 id 1mnH7m-0006b3-SD
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 04:21:02 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:42795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9488079f4=alistair.francis@opensource.wdc.com>)
 id 1mnH7l-0000kb-4m
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 04:21:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1637140860; x=1668676860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u1YBsr6MvbQ3B/CZ6W2+TyL5ucImEkxcTIlCNH8WCzA=;
 b=KxDLjYcm/W+PfSwKPMyUa+SuFiYMRgddNJe1m0mwK3m/MMUu7U9brv0h
 gU6GIL0/LKWXgpqgPDUheLhV2u80pC9z5Y0ckYLF43Ha/XYqAgM8IcqnG
 Y4S6PtHeIqWsOXfQVHuytqOFmpeHtsuLwPrCejej3oSRMXwa7GAopkXGl
 3gBGorzyE2X7c5Ehef3+nVtvBdtZ3Maon8pPGtU/A0WwtA/Q1hBFBrn8T
 2KtHfiK1cHOZ2+qwCuFNM0EIs0IBDbdgUWi7pvAlZR73KlTfQR29PHJTD
 iOlCFlUExCW5d/Y1Rxlnz6nGv9i/jXQJHbmkqSpHGR/Pk00Nd6zWx3qHT Q==;
X-IronPort-AV: E=Sophos;i="5.87,241,1631548800"; d="scan'208";a="184819111"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Nov 2021 17:20:50 +0800
IronPort-SDR: jKd7A7HOtmn5f0QAxvj+M6mQi7fYAoauyppm13kIAlRNQIjQcMHOE/Og2Har692sND7NdyVSv4
 GEBtnpOXuRIQlj0mH5mYODra5BeZAC+/EO1Le/VOf41ITRTT2J9L1gV/CvJM82F6+vuVUr9czX
 Os3A48/DjK0QOBpOBtSyYEy17GkTq/UQEqoIdj7evvmfG/cE93S9Qmt2ebNxNJAK/C0lHa5XlQ
 qTFPww8zseRSrzjt66TuO/MW5r+aKwCAqvGhQmjOGMB6uqX73rzJ5RlACO0yKgmLUSoTriftcw
 lpAF9rN8DcEq6iUPpt9wtoeD
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 00:55:52 -0800
IronPort-SDR: 1AwajXGMgcmogrwID5hlsePRbJCf6TRYz1LhizhlRqmHA0PZCkZaLOqO5ZPP5FEAaM2URRn/TA
 nMhs32Wt9bGRA6hnPBqRP7yU6fERCmqkOKQEJp1YPYybZNZWx/U9WR4OVP8wNLwdfupR3KbCn1
 dUS8SDnhGHx8BDcPCD434noTbMuf999RhHLVKH7rygFwKRnmjRkvYSpGNUrQhU2001prKo9XDJ
 oQyDsE6tucBwcZ7z91Pl/wCg+ekUy7HLP56fnQb+ORAsyKbjA2dOYnKqmwwmfGEsh8Z68Z4k9a
 xgg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 01:20:51 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HvHTr4d8Hz1RtVt
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 01:20:48 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1637140848; x=1639732849; bh=u1YBsr6
 MvbQ3B/CZ6W2+TyL5ucImEkxcTIlCNH8WCzA=; b=EyqCVRStdAeV8V/BGa6oOOU
 0J7hl9Ib9AWYW1kHKc82ZZeUDKm/24qzWxaFEhJcNhnHOjSDAYwNp/SB/JSy7yN/
 RkSSNjvikmu0hTocv/82LSvdy2aOuzVoOoQ5NGe+/i8IYCCt5wgxoyGgTKWbBrAg
 EDc5B8Vvc4msIP52AScOaCy6FWw8Qjo2R2EXd3KXzWfCe478bk0HZ72UQznaXjDi
 2s7w5bkwLYhpNHkuMBgDb5weEDRvETTo2vPMJD5W5ovp/z6BKhNeoEtLGoB12dJg
 uhwEEyGYCx/37S+hZyEQaf1jXZLdvgeSTpcsEm7EEI4TXz6EMgVdN1Q5xSgaEMA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id kSgbnnpqxm2T for <qemu-devel@nongnu.org>;
 Wed, 17 Nov 2021 01:20:48 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.57])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HvHTm6XbPz1RtVl;
 Wed, 17 Nov 2021 01:20:44 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 2/2] meson.build: Merge riscv32 and riscv64 cpu family
Date: Wed, 17 Nov 2021 19:20:31 +1000
Message-Id: <20211117092031.99019-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211117092031.99019-1-alistair.francis@opensource.wdc.com>
References: <20211117092031.99019-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9488079f4=alistair.francis@opensource.wdc.com;
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

In ba0e73336200, we merged riscv32 and riscv64 in configure.
However, meson does not treat them the same.  We need to merge
them here as well.

Fixes: ba0e73336200
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211116095042.335224-1-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meson.build | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meson.build b/meson.build
index 36540e0794..e2d38a43e6 100644
--- a/meson.build
+++ b/meson.build
@@ -59,6 +59,12 @@ supported_cpus =3D ['ppc', 'ppc64', 's390x', 'riscv', =
'x86', 'x86_64',
   'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
=20
 cpu =3D host_machine.cpu_family()
+
+# Unify riscv* to a single family.
+if cpu in ['riscv32', 'riscv64']
+  cpu =3D 'riscv'
+endif
+
 targetos =3D host_machine.system()
=20
 if cpu in ['x86', 'x86_64']
--=20
2.31.1



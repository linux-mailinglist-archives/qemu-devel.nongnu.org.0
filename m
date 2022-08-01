Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3AC587439
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 01:04:39 +0200 (CEST)
Received: from localhost ([::1]:51686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIeSZ-0006mu-UY
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 19:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2052cf057=alistair.francis@opensource.wdc.com>)
 id 1oIeQo-0004pG-St
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 19:02:38 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:37370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2052cf057=alistair.francis@opensource.wdc.com>)
 id 1oIeQk-0006Fd-6T
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 19:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1659394953; x=1690930953;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CDDNTcfwE0ovvu6wjiTKRx/kOHI9TNM8g5Q9IC3GdYY=;
 b=eM45A85hmy64EUmnMD+IZlUiURB3ejXJwQ8Wd1j9WGpLGhGW8a4RVwI5
 lzKGtzh2tscxqafHAcW/HgUjW0BUoZDAlhbKokmukKAWPo/7es3rdWkSK
 /w5BEI8nn3bqO8H+wNSOhzw7IVZuW8KoPQijl50QUTZQezgfbvRs0DoP6
 cvLxJSYk+AFjIRatE/BQ8NyUaMrM1pe1A1cpDK4lxNeUns4xUXIrN722T
 mLQrHjFgLmjG527qydmajzvZ87jOaLkD2Aos53NkLcp+89q0fVhnww1vf
 A7glddpg4AoDEea8dkeGOvC2s2HGSTmw474fCI/6hrgqyfQvQ2sQk7cEy w==;
X-IronPort-AV: E=Sophos;i="5.93,209,1654531200"; d="scan'208";a="212475783"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Aug 2022 07:02:27 +0800
IronPort-SDR: O2RtKM2+P8CJfH+gyVPpIzEEnXZ5w9lNAYWN6YOGzT10ZNP9DD+FqbmJtUOgCkbBJA/Jrj9CQx
 E0B6qXX352SfrM+TPYrngPvdwn1kEcQyGaTkklcwAOuCQ1LfjhYooTCALIJcaNGBFaA4stc43H
 KW69xiwXzY6tscc4ZdRCVeY88HsRZbl3CEkqKdJ6ZpM8a22hQ3fyjBKjaVUMiSHAVXuQ9rv2o6
 aSvAd2P5PtPXddvU9UMdz1mDT9Bsw9h8wWFETaI4fPDq29sGTHFa7UeDDt3cjowkBVdnZJ9FCP
 3yCRjAR+vPZvUR58PehFnPC7
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Aug 2022 15:23:33 -0700
IronPort-SDR: 4y/0qoNSwA8R7ScXEzI/BcA1B5t1yAYnq0lWv+HCbeKiDIMgONRAaS2bOwwgvZHtJmQ8cg6Ilx
 uyE3ovCHpLc5UxwjZIL1TMuO7MQAowwNCKFPa81m7oT86x3pTlszdabSMeAjk1UfVT+wcT24mH
 U+O7bIJLdQ7FXGuIXyWcJ3W0Qg2S8ULvIWBjenxcWvWTcLSm9uV6u1e+c5YtZ43qWTl+q2qlWT
 MoARh2x6QLZVxC1CvONjl4nDOPWpaE5DYhN2uDvQPEK22ljBP14fYnBv7cAVZOsF6sCSz9LNj9
 piI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Aug 2022 16:02:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LxYYH0YMTz1Rwnx
 for <qemu-devel@nongnu.org>; Mon,  1 Aug 2022 16:02:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1659394941;
 x=1661986942; bh=CDDNTcfwE0ovvu6wjiTKRx/kOHI9TNM8g5Q9IC3GdYY=; b=
 GQdKkugYyVJ3/EDwNxs6G4IuLFBZYyjtqkGAAaj9YuxjP5tuj/WF0neJBf2C52AW
 qW5Rhb7MhrEoB3o2mco6PgZwwUJhFd4sWVdTxSr6T7dAsiUPbi3kFUc+bH9GcHRz
 ZgAMR9HGnPZcbtyy+bzLcmooDUUghkPMxJPu1+MmRqRbIB+Vj264/MgsOlXF299Q
 TQh0S/DjrH0d5AsCZauXZKwAEZgMN6A7dr2+eSr2+Yvme/qplz02L8Qy7v3fFt5Y
 nF+prtRjH1pRiVNN5d8davdnuC2Y3pJsKcJ5cU2kwr8yedP+/aRI6RRPEXqL2hJZ
 E7C5Dkdyp/+XwW2e6gMOFA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id vawTk_Pui0nv for <qemu-devel@nongnu.org>;
 Mon,  1 Aug 2022 16:02:21 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.18])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LxYY76M7zz1RtVk;
 Mon,  1 Aug 2022 16:02:19 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 0/1] riscv-to-apply queue
Date: Tue,  2 Aug 2022 09:02:11 +1000
Message-Id: <20220801230212.3406689-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.1
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

From: Alistair Francis <alistair.francis@wdc.com>

The following changes since commit 0e0c2cf6de0bc6538840837c63b25817cd4173=
47:

  Merge tag 'pull-target-arm-20220801' of https://git.linaro.org/people/p=
maydell/qemu-arm into staging (2022-08-01 12:00:08 -0700)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220802

for you to fetch changes up to 1eaa63429a9944265c92efdb94c02fabb231f564:

  linux-user/riscv: Align signal frame to 16 bytes (2022-08-02 08:56:49 +=
1000)

----------------------------------------------------------------
Seventh RISC-V PR for QEMU 7.1

This is a second PR to go in for RC1. It fixes a bug we have had
for awhile, but it's a simple fix so let's pull it in for RC1.

* linux-user/riscv: Align signal frame to 16 bytes

----------------------------------------------------------------
Richard Henderson (1):
      linux-user/riscv: Align signal frame to 16 bytes

 linux-user/riscv/signal.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)


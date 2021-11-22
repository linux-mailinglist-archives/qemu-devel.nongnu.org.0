Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7837A458976
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 07:53:47 +0100 (CET)
Received: from localhost ([::1]:60616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp3D0-0003or-3R
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 01:53:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=953023fde=alistair.francis@opensource.wdc.com>)
 id 1mp3Bi-0002c8-47
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 01:52:26 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:40755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=953023fde=alistair.francis@opensource.wdc.com>)
 id 1mp3Bf-0000VB-HH
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 01:52:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1637563943; x=1669099943;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1rlOIQKngIFPRuqvOg6USFcOjiVoQ36G9TK0mPqWlsw=;
 b=SgUkMEs7trINu32QAYJV3hh8Ev1sf58W1pKFNzxinDOxvvbDEq9PJFuH
 AiRyL5kdZjyOFHwMYerYFTt9db1bvrO/o9QotWzG7OvVCr7kWqKVLFEV5
 jN+vN/HDzBFnL3rUkWtDabYIcXfScjaKpefgDUDVHyQ2+EzlRVnxH0XgN
 xe3/TWI+wcNw7pX+J52dQOcVyRpw2eXKsw8en8dQWYOwZThMxG0v+sOqj
 N5W7PpU3KAGF4oJB0E4jTxucPpsekxFwFjrEXkHcIt8i8nr0VtNZsF2YQ
 ZsZ2/sj9IMIJvl49pfcZPSBvvzKhNqt54QpTDs0E1INYfmid0EMebftKO A==;
X-IronPort-AV: E=Sophos;i="5.87,254,1631548800"; d="scan'208";a="290217202"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Nov 2021 14:52:19 +0800
IronPort-SDR: 4C937Xp1CDpOdC1iLVxrO0khNWqHFtAiqQwbduY8lqZzaWGTISp9JPqqe4g8iLxHA3jd3Xv9Y+
 PSv4HDEVuX0T0ynbGL66AYuxXGC5R2OofTuxXkQtPz5zrEpL1L9tg02/bSBUZDjsiDR7fqG09A
 3WclUQc7yd+ZRCKojwhyBEOI1gu0ZH/1o3TUZj5Vv34TBuSi6irjmNd2yDLl8cwnvgPBZzN3mh
 bRH6YUYANTnnqZpKnQ2jT2cTKBwrVeT6Zgz3c4d6VIOcKHrKAkCsUP6VuwaMVwb6n+0oR5/biC
 Ov6lozEg/mG83CYmfRq6g2xU
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 22:27:15 -0800
IronPort-SDR: MSrSoHInjKYfvmgnoljejDFKU6aE2oGBG8wR13aF3rkg8EU7Nv5SOT6GRPPiRsgJoUAqTXCBVz
 3tyy/3fP1v3oNgodriDbnsfJW5a9UbvD7OXzYCJj8fpx00R10eSJwAgUe7qqctpkGM8LT9ELTv
 XEd2YNO6lIzubAQVOX35mT8CKsLv8rO19F1klSB0F8U0oBnZTADDQSOmF1/ycTxBso/i4QJc20
 Oq5+hX3yF+61r6jth9EEx4Pq8Cmi7v5y2tpAuc4/MecZcnNw2aM0uOplLHQheyt23Hh6prb7Wv
 mro=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 22:52:20 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HyHyC3Lhsz1RtVp
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 22:52:19 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1637563939; x=1640155940; bh=1rlOIQKngIFPRuqvOg6USFcOjiVoQ36G
 9TK0mPqWlsw=; b=ESZ4zRLdFvr1VErB4I2Fb8qcdpx0iaBQLKxuTnhZv8TDYeci
 qHqlZDqKR4C8F5j/i7gNM/C0Q8c7R8OTJMzgtgPv4B2FzQneJax14n+1VW6dkcjR
 eK+0i9hyFa6hDAvlDczBnp223mU8TLWmjI3UUGKwwEMJxZuGuBcTRImToJ2ghSNN
 tmI8+HN8OEfcoabf6NAatCnfehaQv0IZ7hIKTrjevPiknTUoiNyIY4rPyoaDOv6N
 kvNYEMoJqdGQQT5c9o9n7bK7UKoh3iSlA+D3NvLP5rvMt4fRRSYJ7vAbCzkOfJCE
 +WZciaScUrCkjly7yyuUVQcFRGxlqHVkF8FblQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id rRcsb3MduL8T for <qemu-devel@nongnu.org>;
 Sun, 21 Nov 2021 22:52:19 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.60])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HyHy84RY2z1RtVl;
 Sun, 21 Nov 2021 22:52:16 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 0/2] riscv-to-apply queue
Date: Mon, 22 Nov 2021 16:52:04 +1000
Message-Id: <20211122065206.83544-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=953023fde=alistair.francis@opensource.wdc.com;
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

From: Alistair Francis <alistair.francis@wdc.com>

The following changes since commit c5fbdd60cf1fb52f01bdfe342b6fa65d5343e1=
b1:

  Merge tag 'qemu-sparc-20211121' of git://github.com/mcayland/qemu into =
staging (2021-11-21 14:12:25 +0100)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20211122

for you to fetch changes up to 526e7443027c71fe7b04c29df529e1f9f425f9e3:

  hw/misc/sifive_u_otp: Do not reset OTP content on hardware reset (2021-=
11-22 10:46:22 +1000)

----------------------------------------------------------------
Seventh RISC-V PR for QEMU 6.2

 - Deprecate IF_NONE for SiFive OTP
 - Don't reset SiFive OTP content

----------------------------------------------------------------
Philippe Mathieu-Daud=C3=A9 (1):
      hw/misc/sifive_u_otp: Do not reset OTP content on hardware reset

Thomas Huth (1):
      hw/misc/sifive_u_otp: Use IF_PFLASH for the OTP device instead of I=
F_NONE

 docs/about/deprecated.rst |  6 ++++++
 hw/misc/sifive_u_otp.c    | 22 +++++++++++++---------
 2 files changed, 19 insertions(+), 9 deletions(-)


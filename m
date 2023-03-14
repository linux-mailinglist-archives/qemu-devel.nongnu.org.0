Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1196B8B5A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 07:39:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbyIr-0004RK-Mz; Tue, 14 Mar 2023 02:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4300ac6ef=alistair.francis@opensource.wdc.com>)
 id 1pbyIo-0004Qe-Ql
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:38:30 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4300ac6ef=alistair.francis@opensource.wdc.com>)
 id 1pbyIm-000209-Lm
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678775908; x=1710311908;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i0KafMsCfCkhFk9LHeyf9xfieoMBaeASX+sT50kgb2s=;
 b=CSa1VclXjG4dDqjSTx6OKNE54/CgU2cc57fdszzQ1dgZW0NZmhi7Vnrp
 4msbbxizyvsdzSaIKj2gW5IqvkwGgb6nmfGqluDTyWwIdOZrtilwnkTYY
 E4FB0kyMm8KCI4AGDS5vhG05S4HDpQ4vj642/J1ZQoBlClyVn/sbqLKfe
 X8++aaglHCL+NeK9S61MEQSmADTW70XYDIS6t0vU+7Nmrw+ntQt80tShw
 pumr/j0fzmkDBSV2bBXRyhhNHBD6Hq+fZkPQYT2NlvzvJ4MBVNR9x6Q5a
 E+3LvBdbzRXKc/H0Ur35vBqdGvl5dxpturZdUrHI+3uq2rzPwluUwIdO+ A==;
X-IronPort-AV: E=Sophos;i="5.98,259,1673884800"; d="scan'208";a="225576395"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Mar 2023 14:38:22 +0800
IronPort-SDR: 4xCKYBlJMHCK9W88prLVZti1+c7hD85jeasjbvQ6f1nBQ7pdNnwlFvuvYrG7ZZoqDN4Rlo8tMY
 x6jgcyZ2iJnFI1XtzaG3dZucpIhHbShiFEPbWg/MwKiCYIkMuh/hbyZX1tj5RvNn1uU/rx5GI1
 ho/P8E0n1Y4UNqYEdufYsHzMS1sP0ndS0t5+YC+zsDVrgYS2xE1ywu3sCvXR3jR0Cs0LUwm4NF
 JQYCuYICkNm2tsg35Z4348sMpNOCzqRelUJGCDs8bfu0OTOMmMoCmWbeuYaj32OBJjcqw6Quvt
 IkI=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 22:54:50 -0700
IronPort-SDR: yu2G5St9OrVTw1t8nJT6X6bbdlHP4ib7qSp38dfhjKkxCL5H8K87u8ifpcAMxDo4OC/piy/Uam
 Y55SzdR26jBZWbbJfjMInXg9LjMECXGzV3O2G4UZ3BeQYks2pL39KiiJ8kGIRdp0YKEKrAwlUo
 lMfb+gJMNad1Ty8Z/2n3PdUwbTg9HhTV1fnO/1IxtYj2pghbVxDsakJLrAuvHnCQguQUdPHjNF
 eTTbzAWy99+GvEppZ/EmeNt/9a7SEtTBsCXHqItkCNC9ys1tty4gPnVRUBAkdpsuxtAMOMM4ht
 vaU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 23:38:23 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PbP3y44c6z1RtVp
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 23:38:22 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1678775902;
 x=1681367903; bh=i0KafMsCfCkhFk9LHeyf9xfieoMBaeASX+sT50kgb2s=; b=
 T/Cd3IDY+b5xKcF/6uo4Wp9JR5bDTfTwnZ0swZ6eW5sjocezxDal8aNMD53ipWma
 DEfZZ41I4OTZvkVP6jHbt77sNmAzWNKcO1mxiDOwck1k8aBcM29h8lt31tBw3vAb
 AZzkYMUG2/Uw6aDAC6KJArnkFPNCVE7wU9fVg8NHsxbNRtJjKGzMhmDzAcHjKWbJ
 hDPT3Y09dJf4OVO0he9rDWNBGvXbrk9mXHNpPPEBNAzPGrwSMSwzq/+JHwT9XPjk
 e/4KaaqjvNQGkCROFkg+GnbS/8Zxm8u6wz5FDQLA5CGFwxMDdh9aUkZlofWQvRXE
 ETNvGiMegLRFTa9YtK1TIw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id MHsDjFWrVACi for <qemu-devel@nongnu.org>;
 Mon, 13 Mar 2023 23:38:22 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.75])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PbP3x0MCnz1RtVm;
 Mon, 13 Mar 2023 23:38:20 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 0/2] riscv-to-apply queue
Date: Tue, 14 Mar 2023 16:38:10 +1000
Message-Id: <20230314063812.30450-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=4300ac6ef=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alistair Francis <alistair.francis@wdc.com>

The following changes since commit 284c52eec2d0a1b9c47f06c3eee46762c5fc09=
15:

  Merge tag 'win-socket-pull-request' of https://gitlab.com/marcandre.lur=
eau/qemu into staging (2023-03-13 13:44:17 +0000)

are available in the Git repository at:

  https://github.com/alistair23/qemu.git tags/pull-riscv-to-apply-2023031=
4

for you to fetch changes up to 0d581506de803204c5a321100afa270573382932:

  Fix incorrect register name in disassembler for fmv,fabs,fneg instructi=
ons (2023-03-14 16:36:43 +1000)

----------------------------------------------------------------
Seventh RISC-V PR for 8.0

* Fix slli_uw decoding
* Fix incorrect register name in disassembler for fmv,fabs,fneg instructi=
ons

----------------------------------------------------------------
Ivan Klokov (1):
      disas/riscv: Fix slli_uw decoding

Mikhail Tyutin (1):
      Fix incorrect register name in disassembler for fmv,fabs,fneg instr=
uctions

 disas/riscv.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)


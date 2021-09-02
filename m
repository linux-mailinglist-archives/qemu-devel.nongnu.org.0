Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAC13FF7CE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 01:25:35 +0200 (CEST)
Received: from localhost ([::1]:55214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLw5L-000471-S4
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 19:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8724dbd3c=alistair.francis@opensource.wdc.com>)
 id 1mLw3W-0002sq-Oa
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:23:38 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:54418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8724dbd3c=alistair.francis@opensource.wdc.com>)
 id 1mLw3U-0003oz-60
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:23:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630625014; x=1662161014;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TKnDXizvn5HFDuuHbVm5pnXgbXGdVDpL5jU4YTVQ2ZA=;
 b=iVIR7bCf/iQ0Z+5LL5AJb2c4NuH94ak3JjShz7v+d+v5cRSyp4Ff8kao
 E4bi2bv9jf5L4psU5flqgBlTshsO62AospULH+JT+7BtmYWm+kYZHwDHv
 5X14QFDNBOi/+IJ32SQhhjnQwUeTIFnZ9Z8EmpCl/6iNEi/qqyQwOri++
 dW8dRxdM6cJnk2IMrg13hoOqvwbqNfkJP6hl7ZOez1fbX+f0aA3pAIQKG
 fychgnxPw5d5+psxi0UEtbIYaB5QJ4Pd0WoJUIJqQlziEfoRegd32+mEb
 03ao8M3zO90vX4pkI9pFY/fuz1p2IEQP6WKHGjT+bLG5NxyE2OkmWdvXr Q==;
X-IronPort-AV: E=Sophos;i="5.85,263,1624291200"; d="scan'208";a="183874834"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Sep 2021 07:23:32 +0800
IronPort-SDR: ztl/uW1rgfSdfY2AFsfPWfC3gQkHKJeYVnwAwCGGqVwWO+AgxfUEL1tXr+iHhdhOC8H0as6zMR
 8WqbmeLzuT8dpkL+D++QqhR86g9FJh3VscCSSRFDztQPK3+jVXBOC3Z0kFmgMD8TEf6i3MeNhR
 dWckJo79XE/r7IxBDq8cRz87YM/VyQYehRJDx4hPaUQnTxoSdQtNRVJG/KFOqRjLJvGgnqS+LZ
 hRU2CruZJKVBeSk/Tu1J6HEtyxw5AMlD0Y7ThzvpartXW6mk11GTGF6SLjrOczhHmSXhEFqKeI
 vRvHX2udDS0ryGZj9Xk1/uSm
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 16:00:19 -0700
IronPort-SDR: NUxOPnoKujiF1Y0lriHRv4KzgF+eRc2pp/GpFQKHEodtoT4JjqEK0ivnENT6pyFzMZhkylbS76
 CxvozSSSYB0afKAylqx35w67eIPBqzDVMT4s7gWfpvfNda/4iqtzZxGXiTORe30qGkAtTnamzc
 PRYfhDQDNi72ebm0s2cbyRqtQmBCz7HzJ4K+wdkaEy9MqN+XKvFOh3HcQPg2htEyOPVhj92wni
 D3Egjn3LwQyINN20z2rGlfr0+4sd5/abl5V/SbT7SvJS0kdFqxi6F1vzszeLSqAL3eexqI+EU7
 HQo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 16:23:34 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H0xnK2pN3z1RvlV
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 16:23:33 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1630625013;
 x=1633217014; bh=TKnDXizvn5HFDuuHbVm5pnXgbXGdVDpL5jU4YTVQ2ZA=; b=
 G+naS5W+oF6l+xVUF39GOQBGvfKmMupE6cSYNpkQaIg2C2y9k+CtYeFvOteQi7a+
 jRrd5Jt7Zjio15Y/1BIyAbsuZBS5SF4o01276iMY4Nq/Lsy4TNwVe0CrPT6Zpibu
 uqcgMlZ+M7QIOKjQqdofNrzD4JFPRkjNuohj+Gl8WmZZ4JOnJHjVtSXjYNgmYLZf
 bcdzbp45CMLUBvZMKZ4B6Vkl0YnS2G7HEAImfbzFRuALdJVP6XWUe/TAHNgql/Jg
 eRb/vxiAlY8ceTBjQW2lQnUVyiyvhkgIh7LnCpt6g6nn111X33kJonsEJqi6j9lZ
 SdzIJQ5ppWW2H/NnGEWPyg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 72R62VRurS5V for <qemu-devel@nongnu.org>;
 Thu,  2 Sep 2021 16:23:33 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.17])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H0xnD5ybJz1RvlP;
 Thu,  2 Sep 2021 16:23:28 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 0/2]  RISC-V: Populate mtval and stval
Date: Fri,  3 Sep 2021 09:23:22 +1000
Message-Id: <cover.1630624983.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=8724dbd3c=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

From: Alistair Francis <alistair.francis@wdc.com>


Populate mtval and stval when taking an illegal instruction exception if
the features are set for the CPU.



Alistair Francis (2):
  target/riscv: Implement the stval/mtval illegal instruction
  target/riscv: Set mtval and stval support

 target/riscv/cpu.h        |  6 +++++-
 target/riscv/cpu.c        |  6 +++++-
 target/riscv/cpu_helper.c |  9 +++++++++
 target/riscv/translate.c  | 33 +++++++++++++++++++--------------
 4 files changed, 38 insertions(+), 16 deletions(-)

--=20
2.31.1



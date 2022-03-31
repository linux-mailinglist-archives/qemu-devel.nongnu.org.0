Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A269F4EE4EA
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 01:50:14 +0200 (CEST)
Received: from localhost ([::1]:55126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na4YO-0006vA-Or
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 19:50:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=08287e7cc=alistair.francis@opensource.wdc.com>)
 id 1na4TO-0004ek-7l
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 19:45:02 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:58851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=08287e7cc=alistair.francis@opensource.wdc.com>)
 id 1na4TL-00007b-Do
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 19:45:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1648770300; x=1680306300;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wB01kId/b/ABjD+PbCWppd9epXmm+Jd6vwSrxp1Zf1E=;
 b=I10m9a5wMM2/i46SYl0jWphe1xkv1vppF4EBJKKZQcYzUGqx4ee2N5eY
 ahpG58ZGywYfNvYTiR4zYhEE2UUveP8SzTceMrDGQPbg5WTR/zE55wcJr
 sdd2GeIuLVU43gXSoPumHxUpd8vVqz+ZNeQtR/+BqFYS1X0qGcvj5si7w
 Fs39A7Vpx4LcnBsjCzQQ6cnOiU99lhQVs2Eph3Q3B91Ma3q5udS49T5Lv
 bvnvPQRxucLL0LwuXPtUjmxSJKQFT8WmaIyaqpLlOMmpGZ2ewgc5n+4aY
 NFDnWH8AJjZSQnK/6WxSbYXQrd9tkbdY+f+X8dZ/aOSj0utZf2c8XOS87 w==;
X-IronPort-AV: E=Sophos;i="5.90,225,1643644800"; d="scan'208";a="197691425"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Apr 2022 07:44:56 +0800
IronPort-SDR: AsIrDuoEbZfIMxdVIs3dlxB2oK5UPZMRU+kKR3lVJWhaChTqLMw5QzaFykre5nq72zwrWnoT8Y
 qyro6vwq5cw3k8PM2y31o2qlwYPRG8B4X6DDyeaUgM3urZjHwDGvcyiyBXkWI1c3/bpaVNeDmI
 05WZnCQ+1Y7V01xY1bJohM6joG6mV4ePC0GUbrdPl1n7TPsIe72hqmoitOYM+UQ3DcPi42j5yz
 6P++R2/bsI/JOpT+G2yMy1Q1uelKRWDw9RPRcxg3Q3MGFib+B72w8bUeTLcp74s4/qAnNco2Mi
 JjeeEh7KRaZh38/4kjQRNufa
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Mar 2022 16:16:35 -0700
IronPort-SDR: Za/xxNf1ClRfIr5QOwyxhG+NrqvqmxfYb+2DWDiUKHyXGvpCcqXx+DdAZRc+6JcaN45sOTr8l4
 jwf7UlAV0qFrdcbpWyuL8cxtappBLJPmh2LJrg1IelVpOmHazbk6YJyYgfNahVylADDgauak3v
 dKXr5Tx1egB+QAmiC7p2Pcg1/lwH/stiTG2Wfh4ukKSsXQpv88sLmeqTG8VlDSsnTzsaw1mteZ
 0FU3SZ6jJ4s3L+l+s5XOOT6LeIE6+flo0oD2RfevSznCOOKdLgfDR7ObTYyfgLcMmQMmIRH9AM
 vyE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Mar 2022 16:44:56 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KV0K32CQcz1SHwl
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 16:44:55 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1648770294; x=1651362295; bh=wB01kId/b/ABjD+PbCWppd9epXmm+Jd6
 vwSrxp1Zf1E=; b=QvH6A1LWxCOOVZT/Dm67Ce0y+iyX0DVHfdUKFIKs1mexNQM8
 To0YyabBL/rdErNZizcUDPQjWAfJhenB0zW3xUc4lxdMOJx4gBWsfzbuP0zK+gUd
 xAn+Ccq0UyDinTRFSEY7lULCHeql+5qJFPtuawzBd+uGPqc4rKp54+YbZvDCQeV8
 oxb9vJY2OdVvBDvvOIazHgnxsK9nDehrc+LI4TtMnTwMBQJo7BYodqH5ZqWrg8kf
 MSQA04h0cy6GCNAbVssUON5c2axo/mQaOBfIrmeLXiJvAhJQZ3KKct/a8HNvyQPs
 e55TXHywBFdem8AUBDF8pyLw+DhHyRnnCJaC0A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id qk_l3DvbBPMM for <qemu-devel@nongnu.org>;
 Thu, 31 Mar 2022 16:44:54 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KV0K02G40z1Rvlx;
 Thu, 31 Mar 2022 16:44:51 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 0/2] riscv-to-apply queue
Date: Fri,  1 Apr 2022 09:44:39 +1000
Message-Id: <20220331234441.15920-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=08287e7cc=alistair.francis@opensource.wdc.com;
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

From: Alistair Francis <alistair.francis@wdc.com>

The following changes since commit d5341e09135b871199073572f53bc11ae9b448=
97:

  Merge tag 'pull-tcg-20220331' of https://gitlab.com/rth7680/qemu into s=
taging (2022-03-31 18:36:08 +0100)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220401

for you to fetch changes up to 8ff8ac63298611c8373b294ec936475b1a33f63f:

  target/riscv: rvv: Add missing early exit condition for whole register =
load/store (2022-04-01 08:40:55 +1000)

----------------------------------------------------------------
Sixth RISC-V PR for QEMU 7.0

This is a last minute RISC-V PR for 7.0.

It includes a fix to avoid leaking no translation TLB entries. This
incorrectly cached uncachable baremetal entries. This would break Linux
boot while single stepping. As the fix is pretty straight forward (flush
the cache more often) it's being pulled in for 7.0.

At the same time I have included a RISC-V vector extension fixup patch.

----------------------------------------------------------------
Palmer Dabbelt (1):
      target/riscv: Avoid leaking "no translation" TLB entries

Yueh-Ting (eop) Chen (1):
      target/riscv: rvv: Add missing early exit condition for whole regis=
ter load/store

 target/riscv/csr.c                      | 14 ++++++++------
 target/riscv/insn_trans/trans_rvv.c.inc |  5 +++++
 2 files changed, 13 insertions(+), 6 deletions(-)


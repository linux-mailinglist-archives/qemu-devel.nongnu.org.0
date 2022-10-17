Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABCF600687
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 08:03:14 +0200 (CEST)
Received: from localhost ([::1]:53232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okJDU-0004ka-Le
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 02:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282226d84=wilfred.mallawa@opensource.wdc.com>)
 id 1okJ1J-0004Xa-0X
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 01:50:37 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:22885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282226d84=wilfred.mallawa@opensource.wdc.com>)
 id 1okJ12-0002DO-Eu
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 01:50:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665985820; x=1697521820;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gEa1XWL3Yu2VGlCN50EFgUunW1wW+ROV5F6mSaE0/Fk=;
 b=cYR8B+lEr7Fp7ggUV4022SmXLU1YMyCvQizBaA5WmBZIDj4gmEzyZncu
 0HMFTv81Vxu9xn32gRatLxw88WWyhB7RyMFebBuxVPkKVBcp/7sfVQ0sp
 BmeRXotKkVbA6MTy0sl0+31mwhJuhO2oxFDNJI9m4/K7Iofn40NIt8DFm
 +pgwVCyjg5P7bTLo53VqXZwdqQnmHjwNqBWIWKHya9L9bUNhWTa8rVB77
 RDEmv6TUg/B76NG4Lnz/v96EY49uqItIfwcuWQaUuzeU0yvrHUfF3iF4v
 TiLkVOAASTPL40crTFXD2D+tBbsjyQjrU3DznrFTbJ2N8IOllPMDBMX6I A==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; d="scan'208";a="219145798"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 13:50:15 +0800
IronPort-SDR: 8Ha+aR2RtVfS+n1AOLL3SNW4rWXqFX6D3f1b6+E9V4UM2JbgOvbh8DSOg6xpggZCammdLzNA+n
 6LAqxwA398sL4crdueuAzl0RAG+3Y1zBZ2wUzp0vQ46noaSSN1BS+Bfa8a/KqldrQ8/oZNXvLO
 v+0S1m/YnmN8vLOxgua09a4CyD6WhWFRuMGRdKTsIhUK81kNKx3JMUZNQGXUowffWJxqKEdzjy
 wSjvqYdifMXA/q3KDmZr59qLBGddHGCHcGuPBVUE4QfP7A2CjDaVt+oOADfhuCipk/URAQ8MZ0
 ojkNd1M0Nbsa/FynEfWyTOD4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2022 22:09:48 -0700
IronPort-SDR: y3aJ4dZ8eacG8HI9kXWZiGfIxNiCQzXiXJplETRHDvXWJRjDCuulRuTramjkkwPK1CPmmhE06N
 z200X2EL9orlvq5844fuXTxksHpFrX6FT5kFlk/G59FQM8rfgbTK14nlSmKURSPDvnH/Qkgmg8
 UO8nxaUVujSqsRpb119LpEX9VZhljfkE352202Ii/AbglxAKdoDYRGcRDlZX+cQ+UwCsFCpSiU
 2cbtCSj0bc3RX8jvtiwrn+KGB3moQy9y5E8zAQ/JUoUtie2GmpT25JHQWO++T2yD3bLaVIaI2/
 7Mk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2022 22:50:15 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MrR0k4j24z1RvTp
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 22:50:14 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1665985814;
 x=1668577815; bh=gEa1XWL3Yu2VGlCN50EFgUunW1wW+ROV5F6mSaE0/Fk=; b=
 UEcN3d631J9ToiSBEO+NOjXRPpAN+WQ3uXpsNEyTA7aZqa8YhJNrZOUS/5LClTSb
 v3AqgR8NAfO/8SHE8vBmTo0FB3ZCWlaNKBolAnfKDXyH9GDoRcncF/ItXEjcorRr
 ydWZ2yAmQNM2GYLgmeBhM7a/5zLiPUYmanKuyj26NDQTdeVfbNp3jln7dCZ8VY3K
 ovnsnxvR4aoh+s+lxuPkG7kDdRZ2K1JJ0rQETsTVuQT1roAlkQ/qVinc00oVxHde
 vlKYAKXepJMEmR4x3bhM2mr4LzpZwBzp7OlQFczT0OpoRdrYOtAYuzmGRUQqVwI0
 qwUJs0YCcp7tFjFDf7Ur8w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id FZ5wkl7qx2xh for <qemu-devel@nongnu.org>;
 Sun, 16 Oct 2022 22:50:14 -0700 (PDT)
Received: from oni.wdc.com (unknown [10.225.165.69])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MrR0g74mbz1RvLy;
 Sun, 16 Oct 2022 22:50:11 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: alistair@alistair23.me,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v3 0/2] implement `FIELDx_1CLEAR() macro
Date: Mon, 17 Oct 2022 15:49:49 +1000
Message-Id: <20221017054950.317584-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=282226d84=wilfred.mallawa@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_PASS=-0.001,
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

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch series implements a `FIELDx_1CLEAR()` macro and implements it
in the `hw/ssi/ibex_spi.c` model.

		    *** Changelog ***
Since v2:
	- change the macro arguments name to match
	  the existing macros.
	 (reg_val, reg, field) -> (storage, reg, field)
=09
	- Add the use of this macro to `ibex_spi`

Since v1:=20
	- Instead of needing all field bits to be set=20
	  we clear the field if any are set.
	  If the field is 0/clear then no change.

Wilfred Mallawa (2):
  hw/registerfields: add `FIELDx_1CLEAR()` macro
  hw/ssi/ibex_spi:  implement `FIELD32_1CLEAR` macro

 hw/ssi/ibex_spi_host.c      | 21 +++++++++------------
 include/hw/registerfields.h | 22 ++++++++++++++++++++++
 2 files changed, 31 insertions(+), 12 deletions(-)

--=20
2.37.3



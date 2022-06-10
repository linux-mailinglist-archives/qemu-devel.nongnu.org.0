Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD032545B24
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:33:52 +0200 (CEST)
Received: from localhost ([::1]:54710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWLH-0005K4-8s
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWF6-0002uO-GV
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:27:28 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:23582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWF4-00011L-CA
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:27:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835246; x=1686371246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xE95oNees5ops9pZymKhazkzobk94HiLxOQcfpkHVQs=;
 b=IcLYy0RBwxZObe5zdRhKURTAdmDue2qUKVO5PYeIH43V0a65DBtH4aln
 OBrtmcXXG+1CERkpwyYIHC3kg26KUB/jXsiimMHakQChNKlLexlCVS9hv
 orVzlZdagR9s8NboUOORODO7wvgmxhGg+OlFsLxaHsB0NszQrpLsTOTYd
 +ZYa87wbc/hVVfTb7ZaL6CzcXUxYZ36mOMQX0OsYe4vcUdu2UO3Nc/zaa
 EB8gbk2wMjqY4YoUUzxHqJEhPSH7TkIIL5Ey1N9DwtHGWR8dWrbK+idJr
 4z2C2cHlcKAOla39TtwXayauvQZRwjxaiUQRVzmiWbYVlJC89S0ztEtvL Q==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="307046421"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:27:22 +0800
IronPort-SDR: nfwNjqWXjPgJx/qBM2TyM35YZdZoN95QxOViLjIMlWAKPkdwzTIOMciAyP/A/8kCxy7JdNk46N
 ZCocRJm6XP0TuHoAuKM4qUqWEpyDr++5vr4bAQ6FNBaMO7j/tPNnLIEXBQYNN0xoQNlPw88GWX
 vIYNjfvXhvQY0NVyqHW+TuxrBPDwH8Y5/DROChdPsfWuw2pGFjsK5WlvDloLVIDUZ7yLPKvcwF
 Z3UJ7rlRkqdrqApf1H/fLP8s9lvkE81CneyvmH02R1vA1lZ892pYWjbPFkPgh4UfjAsh0rzZ18
 HvVZsegl7xnGS279V8ZSJp17
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:50:30 -0700
IronPort-SDR: bIFk581uhMenOUdXKuxTkb67295sAHPxuFGO+JM/dtLcAC+DDvzDROlVuYAiLw6GIc9C25M3/p
 EdxRN3zVtbUMg08Ku1Dwd7OZGmXjFp/eHnY3Xwq/6xsHAklXUuQIK27Cd26Y/kvfo4RMAWLSGB
 qtunNY/DAxCoNGZtQqp4LFrBIYz70/N6EYGzmuqCRpuvysU52APSe5gaQQ2NvX2j3DCizSGCMO
 4JCz2wzxN40Bk47txly1YF7Vj/85Rc9fXkEL05B0kgcUCbvh2V7wyUzCTjscd4qIrJEdOk7yju
 45A=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:27:22 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7Gd3qq1z1SVnx
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:27:21 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1654835241; x=1657427242; bh=xE95oNe
 es5ops9pZymKhazkzobk94HiLxOQcfpkHVQs=; b=ad6qk52b+T9WkLfpAUu77n6
 CXLZIHoHcjyKLTxjhS5b5eXnpS/dhhDeX5+wIkJXBdNDZNRJqo+84WdjiZ2+ESb+
 G5lnoX3afz0t7otBt7uI9Pzt5ZKPdjDPT36z/d6jzEAOKBM+UVxTH/LNzm1XYuUx
 MyO40AdDGF8QeQNY0Il9PeekSCcZuygCsokr/e3hTKdqXat8CbF1pQVgGCKsPdh8
 BeF16Cf0KHMXpCyqy7wGVIBZxu0xk0S4VrkN0iNRcLJOcOfORMVBWzD3N3/8y5Lz
 Vafvj/1L9bANb8Nwtl/uUfzyuQy3yWAfYceal1jtxzxuXzEHuyTNbRX23gYnGDA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Z-rY-HCzaaMc for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:27:21 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7GY72KSz1Rvlx;
 Thu,  9 Jun 2022 21:27:17 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 01/25] MAINTAINERS: Cover hw/core/uboot_image.h within Generic
 Loader section
Date: Fri, 10 Jun 2022 14:26:31 +1000
Message-Id: <20220610042655.2021686-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
References: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1538de18e=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20220509091339.26016-1-alistair.francis@wdc.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5580a36b68..b3af081c51 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2198,6 +2198,7 @@ Generic Loader
 M: Alistair Francis <alistair@alistair23.me>
 S: Maintained
 F: hw/core/generic-loader.c
+F: hw/core/uboot_image.h
 F: include/hw/core/generic-loader.h
 F: docs/system/generic-loader.rst
=20
--=20
2.36.1



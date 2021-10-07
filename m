Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CEC424DDD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 09:10:02 +0200 (CEST)
Received: from localhost ([::1]:34722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNXV-00029k-Iy
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 03:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNE9-00057n-SF
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:50:01 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:24099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNE8-0006pD-9m
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:50:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589398; x=1665125398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KCAwwCSZqFgYjxIHNr5xKhwKtO6JxjH9B2EgeWLwlk8=;
 b=HuiIRLwLWHqhu1ao4BNxE25n/x32BzOvu1rJlt7ebLGkMEtLATxlRmwp
 yYxLeYRYNKea9E94uySrxy70Hxi3X7d8kfaS+fUgij876hstuRTzC0JoS
 lYxNY/skQTFYz0JPYEr63ZbOfCDH9gmhk758ENvtusP4FUu3KBoUP7vvA
 o5QKiFZwwg13pVNlWy9pFVfn8B7lfS61BXJ78ObjD8ZTL3l9sytdWqewl
 lt0wNZQF4kTBdXEW1Oi+tdLiymYNIel9PVFFyMEHFSYgQkmDuCzAH/u8g
 atfjZ8h1MX5RD9P7dhlbCyflvXTETrL3qH2om5lATKk7HU4CUVDwe1Q5z A==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="186894971"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:49:57 +0800
IronPort-SDR: ZPXpIFKA72ha3CXywXn0jlYL0/2KZQL5w4OpActjCtmrqVoW32zgg/fC3GzZQbSOyas7DhEfmY
 Xf3ASnWdexvzJ9hn5sjtfFmxXYUBiteAerOE91XXwNAh37D/JB2iPdkuafldqQpN5Lh3ITxv3E
 XuBYBY5ywnUzqKZVnTvx/hfjlwGDmClO0IPpbbKp9ZCEhvWF7nX1GtaGxGIKvdac98jc0fLUeI
 vLeWGF4oFBIABnaFDy6gLPaUCBjvDkPxMHjhZwHj3SlTsARO44P7J1RTef06mgQhZVXxA3qI/5
 szg13oIAgCYq41M7vy9htt8S
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:25:53 -0700
IronPort-SDR: qfpYKOQS7lmj2hzpa9n5Nc+JyXdo5/9h7bOvQqKHS/kbAkLo0B9WH+XRKrafNU7YFtciLQd8Pf
 gSbAbqh0fNnoA4MELTCBUYH29AkZ4H747ojaQA1QlSrB3H1rYMvxMdVsDqzwyDaFOx+TjyNGDT
 dSfgmw3snoiRblMlC2va9+HLVjrIPFHOKYTcZaenL9V6yqaQ+5lrhzf/z0LsVi1ONhgBWy/kJY
 hLJX8qEFVBw7h+IQKztAL+cp11wkzS29UftPy1roSJITCNkWy4hfouWGiXIv2pdqFRq9vtVIfQ
 qLg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:50:00 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ24l0s9mz1RvmL
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:49:59 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1633589398; x=1636181399; bh=KCAwwCS
 ZqFgYjxIHNr5xKhwKtO6JxjH9B2EgeWLwlk8=; b=SFBDYS5lniw55YomtxjueVG
 vmHsFRQq2GAClmvo4q6J+IMceHwr9nVwfj+0CqKUs2GZ3SC+eTYDrjF2d5UJig2H
 jxBUhK7k/uTKdIiWdEBxsd+uA5vcDqVP3h9ldzS6ujuskwDlyG3vq2wttAkKQjL/
 LG7u0QldE63uFmUgq6JXTkJSsfUf6ZyB/zykbD/9f5GAW5dmyBpDtzG7XGVyj4or
 N0vChdSz12Orylqn4KDxzPfl2CHV2+X2kfgQatVWrRZcgeNwIDx4tIMHbuJjw/0C
 Rg3LI4BqeiuAJwwUFPDzJS3Hey7UkfXDwhDowMG2Tyy5Bbwk0wxBvzCXw+8PRfA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id NxgqdRk9GDmd for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:49:58 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ24f5LX3z1RvTg;
 Wed,  6 Oct 2021 23:49:54 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 20/26] hw/char: sifive_uart: Register device in 'input' category
Date: Thu,  7 Oct 2021 16:47:45 +1000
Message-Id: <20211007064751.608580-21-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
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

From: Bin Meng <bmeng.cn@gmail.com>

The category of sifive_uart device is not set. Put it into the
'input' category.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210926105003.2716-3-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/char/sifive_uart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
index 278e21c434..1c75f792b3 100644
--- a/hw/char/sifive_uart.c
+++ b/hw/char/sifive_uart.c
@@ -248,6 +248,7 @@ static void sifive_uart_class_init(ObjectClass *oc, v=
oid *data)
     rc->phases.enter =3D sifive_uart_reset_enter;
     rc->phases.hold  =3D sifive_uart_reset_hold;
     device_class_set_props(dc, sifive_uart_properties);
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
=20
 static const TypeInfo sifive_uart_info =3D {
--=20
2.31.1



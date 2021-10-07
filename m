Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEC7424DB0
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 09:06:43 +0200 (CEST)
Received: from localhost ([::1]:52702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNUG-0003oe-8g
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 03:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNE7-000530-V1
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:59 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:24099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNE5-0006pD-9p
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589395; x=1665125395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7muA6BblBjgKS6MFJkpK3aWT4dKQtyogCxrBaIt3Dcs=;
 b=j8HzFarkUvHfiIgdSKR2ndi5vO0ndNSwqMJjwn046cS4+LaiBCYemF2z
 i27D3a0FrgtIOI7UXURQshymOGZRXK5aGx7oKCRk0xZrLhrW+zWsHkPuf
 OgOCfHG3WgRGjx3wzbeLOr9vNXugXNoP1FKdsx9LZHHPl1Wkxsc6fm3+a
 zMAGsvRqB7e0AP0e4fzov72SUasxaq14WFVky7Y8xN1kHuBHVZvakawpC
 O/ROh7NNrE/JKjKbyIm2ueOGYI7KTcGsEzrp1s/k4JGNkgEPFNouCRmKh
 4WY1QhRYODtkTWZyyg23icmWvq+IuPslgPQr7EIkHB0DdcBdaouGTsrCB g==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="186894964"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:49:53 +0800
IronPort-SDR: c4JmfJQQV7Q073XO1bJM++Pk2osH22uMcUimw+d5eV1n4V+6NviZQsZ4AAdGhbWD+2f9XaC+C4
 jOQkrlQu3vXYuTp8cPZ9Hr5Calzi+0vw/STf0ss4F5q+GZf7fTjbRFRzti7Oh4tcC3LXBK2UJW
 AsCfBXov08hF4NVmdFG6YbnY8jTVQu97VuvYjEuUrHUfjKDqLkkkwQqGU5nTeYHUGXLsISJHs8
 BkzlslQZXpAI03UV0WJ4oVP3AqiFCfOkcDpWOJuMCUout5vb9bbU0zCrj0V28G1wvmQmK58XOG
 k4VomNQpHvNbFYF4vcPaNt5D
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:25:48 -0700
IronPort-SDR: nFnnLvZCvvbSN8LQKDmpNwyxJRXXiAZ/hsZqxmRZieNpYfnRA5hvac0JT2+0lcGCJbFx/Zykvn
 +vmIojak/NW93frxsPn/XPdswDlUul1u9xLnW7+zPfG5uiuGvgT0aKbXYmlyg4+e1/kE/4gJOg
 QY0bqaCZKnVa6J1Q+F69L5LAw3MYKslREdMrIN0D4/grGVkefKbvA8fayM0tTkKmDrE+pIhY7q
 aVxj9CWqg0JxVGK9uhuGzDOFXTKKLPlekhuH8wvqgbUQ4jdiq7dQAhZoCe5AqrfpbVStAJXt0B
 pvE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:49:55 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ24f1jjqz1RvmK
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:49:54 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1633589393; x=1636181394; bh=7muA6Bb
 lBjgKS6MFJkpK3aWT4dKQtyogCxrBaIt3Dcs=; b=iIo8+wFOkggCg4AjkSoLxO4
 iS3nR2wQpsqAxWNZJrJNYF0/vc4qPd4ve9UoRtwl1K0cBzaDE8UOuqQVVLAZL786
 q6AzLkgrVcFmadUP0px9HgoRGjeaVPrNVs8C22UiQsFhLdOWJognHb69aINr3MkR
 cS4u3E53yOfVHp4baOL6R/3cl9U1yp4Zffmotx+AHpWXNXNfqJePz4NXroTGpQ7H
 Cyk6gF14HZf8nPJmAef9PFJs6J4n/tbwoexLfxXLTWj2S1kDpogN00M2Sw7JCvdR
 tHsc3y2Bbp2pBB80M2WOPyLTlo7oLr/d4nH4idLcb+MIkia8B46dcF0Jms7uCqw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 0tpQQzgrpRBW for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:49:53 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ24X5mpVz1RvTg;
 Wed,  6 Oct 2021 23:49:48 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 19/26] hw/char: shakti_uart: Register device in 'input' category
Date: Thu,  7 Oct 2021 16:47:44 +1000
Message-Id: <20211007064751.608580-20-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

The category of shakti_uart device is not set. Put it into the
'input' category.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210926105003.2716-2-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/char/shakti_uart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/shakti_uart.c b/hw/char/shakti_uart.c
index 6870821325..98b142c7df 100644
--- a/hw/char/shakti_uart.c
+++ b/hw/char/shakti_uart.c
@@ -168,6 +168,7 @@ static void shakti_uart_class_init(ObjectClass *klass=
, void *data)
     dc->reset =3D shakti_uart_reset;
     dc->realize =3D shakti_uart_realize;
     device_class_set_props(dc, shakti_uart_properties);
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
=20
 static const TypeInfo shakti_uart_info =3D {
--=20
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D5E424DB1
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 09:07:05 +0200 (CEST)
Received: from localhost ([::1]:54468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNUe-0004ym-TR
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 03:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNE0-0004uc-OU
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:53 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:53936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNDx-0006fx-JG
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589389; x=1665125389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sA0TrCcyxV0oaDsCs1x2bn8s4mToT7JsviG/C69VdnA=;
 b=Iyuyv54o4Rh3pZ6V5cklbllV5B3pekZWf3N9MdfjE4H1VPMlS/BWKBGU
 gS5eTebN7pdunV5fzPZe07W48BA/XZG0lu5nP3Fgbvme5O8ju+HwKchZW
 AOAF3YBiNrKz28BHoTDr7toaphzMh+BhvxCgho1xSACTyoAwoWlr4aZek
 Gxu1i7RigrYo+nsRZ3OzX1DYPKwt5jLP5D7QbePylB6fMZKzasp92jRbs
 EyJlMXXCq/QEkVJqki0mBmEOW2VCdW/SaiCoAP+CrJePK7j4QBWYeiwuI
 XtYt0iwOIJ41LH3t+V4U2mi2CEPdsg8iwWl4FjUIhdjgCQx8yDg3rMcJy A==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="293815510"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:49:48 +0800
IronPort-SDR: YmQdHUtZtoMPoEzCyiwZu6Z0F7UZ0/M1EqhJEmvzeEwjkNfJTsvmqYinof0lQ1XMAA4NZWVj31
 1ZW/TlG3o6qRSClT/XULCucNxMNAQxwN6AKa36RdtY4AHh71vbl4EENPkZhVh6Cslf4SPTzWPT
 CKQvGZUseo/RN7aM6Kg4WPK1NogFUdCIq0J6Hwect2bWPftbq0vCO9ZdU1JheuW6wmCiP3KaW0
 qRoPEOWTPdZqvpu4oKuhuQlr0WtNAZfOyYb39nMQGqgMeDK+7hb27N1MQYhZWIDLVcVg14pdSx
 sjSAb40uLMtyWgz7uSTT46Qz
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:25:42 -0700
IronPort-SDR: MeEh0foGQw+Oc+FNb+T6nt/NTAb6aFRqYnlDrfK5HBrk7Fjpuh9AmivvpRy+Qwz/WlotO7UAIe
 aFm3i2jeZajplcDduOIL3fcsaWXmFWIR7aWly4TjX0gdI5Jbc44zCzo4agR4FKk3W3yIAZxkr1
 pcjRpIWObe3PbO9XfaEZpa+A9A+jCV1fqBNGLJH4CEOPQ/y8J3scSuM78t/PnYGjLioSSf9I6X
 apEvYmYo6R6g7FtuyT8ccpFg4eU4DkUTt97UMSBoSz+IsiWW8LzmbR9d1DEo51sPXv01kqxnaY
 BEc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:49:49 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ24X0hfwz1RvmK
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:49:48 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1633589387; x=1636181388; bh=sA0TrCc
 yxV0oaDsCs1x2bn8s4mToT7JsviG/C69VdnA=; b=CgGVWod2JIM6wTeuZuxaV8A
 eACKZijB6kE36d9O7hXhE483FlJOz5YvQmAMU04Ilkv/V7aSn0LAmQFNLrQMPpKS
 9MfxiuZEVbHicnKt5hamS3Vdy9pvH/KJK0V1ilHuF6rXa0BPfkaHxdh9s4g8ha+o
 iuoccDlMsI4HtkJVwviYUGifzwmJKmqIW/h4DqwZXiJz+xABo1bAPFIFOnHjBDiG
 N2NDp1MaU2n3HPvTq8nLHOYtsK8aDO9s2nUtc3WNc0Jf4A81iAdRCgjxZ09Dkkze
 4+1vjZj0LDHQvLcBb81zqT9nFbWSifL+SBFYqMn9yLOKHReq7yb/DieCcYW957A=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 0qhGDUtwE0fC for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:49:47 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ24R3yWVz1RvTg;
 Wed,  6 Oct 2021 23:49:43 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 18/26] hw/char: ibex_uart: Register device in 'input' category
Date: Thu,  7 Oct 2021 16:47:43 +1000
Message-Id: <20211007064751.608580-19-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

The category of ibex_uart device is not set. Put it into the
'input' category.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210926105003.2716-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/char/ibex_uart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index 9b0a817713..e58181fcf4 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -550,6 +550,7 @@ static void ibex_uart_class_init(ObjectClass *klass, =
void *data)
     dc->realize =3D ibex_uart_realize;
     dc->vmsd =3D &vmstate_ibex_uart;
     device_class_set_props(dc, ibex_uart_properties);
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
=20
 static const TypeInfo ibex_uart_info =3D {
--=20
2.31.1



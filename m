Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25345EBB40
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:14:07 +0200 (CEST)
Received: from localhost ([::1]:48670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4n8-0005L5-SQ
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47m-00052R-U4
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:23 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47j-0001F1-Lm
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260279; x=1695796279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2aepwLmYndjeQUqiDDwWxQKp8PVopzzltTO9zBxY2SQ=;
 b=LLjrtoh3LfoeBO3Ypm6DDXuvM5A1pQFU8k8bSlf28if4S4e2cWbHO0GQ
 guKU6ATBHt+lR2iAaLTin+g+cRYrxrCGJ54AIDkTHvbTUAzJn+qLDaUYj
 36cx2RQWFLdEtTyilAaZhiFhVo0OHCFk+DMusJUvC0YBSKYFstgTR0sQq
 Lk90Zh3TuDcaZh/pEmJ1AYBuFASw2OeZnObQsyHqOns8uHQrK4I9bhgph
 HsdWoncABMqOplTA9tilwu8yYousawjqc0KKRZu5F8+vASKut/+SWhHlU
 +bXtf1Zr9LDMcWrnExRvqK0wsdSigvZui9pyyIQ2c3X3R3uHKWi9hAFVO A==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530808"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:14 +0800
IronPort-SDR: O+VlFrhXLY/Y59n1kDfYIhLrhi9spZSwM/gOs8JQOEkwBt6E+bIrB2KQgfIw0uXHQMqn//MPSX
 agJ8QXHYZcTtzahLj1TFHB4pUyBhxyptncqYE4FeXm6HoaJe2F6XnvvUZrAvqzvl8+crzYZLbW
 BUCt5GD/06RjjczdPrus8HNe4j7yJVZd4tJkRARRZDjlEjAP5+6FEeVEeFGqacNz5sXvAb3HYm
 TULt83YLaWLGry/scDjq3gx108QoZ9xxwlJW+zENuKHG7BlpDebrF6TQ9JSrwHUdLJQr0Mtg6h
 JrtX0rYG1s45/DmeQdQa+NRE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:11 -0700
IronPort-SDR: W6ghozHiRu/ECofBUz7wUmVuI6rpac4qJ0TyJcsLkM6EV4lOsDEaNiqDuaxiB0cFdHKRyWTcbz
 6TzmdaTH8nZNrNr6/M3VBsWzCeSIgqIBl/DUea5bP08wcSZQGBgpGyPKg3erDmjPULGmQhWCrP
 wC4eNL4NckiP7luFCs5n2bfeb9pSW8pVaLtPUr3VCoaZM5JT/hKAGpBqTEiX/rlAWsetPbxnOy
 cCyo8jQsJp1vodx5c4AjPkBgRvCpnr9Jx1ygF8HZNiighZNCtNw7AddPip77eHB2a9nyDUm6zm
 DoY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8sG11Ycz1RwqL
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:14 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1664260273; x=1666852274; bh=2aepwLm
 YndjeQUqiDDwWxQKp8PVopzzltTO9zBxY2SQ=; b=JfUVQOA+Ob1rA2q5QxfUgkF
 XVtSlCeoon9ayjHb1/lfAGwdwAcShUnZ2Uky/ylIX/15JZpZr6s5qplWi6hzaKFD
 i8cIQ7IG+yB0By/btf3nAo00/JAT0S5EO9cuOa6DWZ3Km1dQoCxf83QtQ5JDWRH5
 FrjEmTt2N/waEWUG4GUtLxYmDf6lyUfA8Ibad6rb64078K5YREn1BtKtszmk2Zi2
 w+cfK2B/DMPZ4rXQd9RDagXObXz5n78hzLK9G1p/qZaENv5nuWm215hCEjHka+lE
 dU81BtWuMZ1eY+I26hiuKL3+bSCkZV8UbImFwTiA6cCeo5eJVx/kno+FRJ4G8RQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id lE5fSWSTq7Mn for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:13 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8sD3QDCz1RvLy;
 Mon, 26 Sep 2022 23:31:12 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 03/22] docs/system: clean up code escape for riscv virt
 platform
Date: Tue, 27 Sep 2022 16:30:45 +1000
Message-Id: <20220927063104.2846825-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
References: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=262caef14=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

From: Alex Benn=C3=A9e <alex.bennee@linaro.org>

The example code is rendered slightly mangled due to missing code
block. Properly escape the code block and add shell prompt and qemu to
fit in with the other examples on the page.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220905163939.1599368-1-alex.bennee@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/virt.rst | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index f8ecec95f3..4b16e41d7f 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -168,14 +168,19 @@ Enabling TPM
=20
 A TPM device can be connected to the virt board by following the steps b=
elow.
=20
-First launch the TPM emulator
+First launch the TPM emulator:
=20
-    swtpm socket --tpm2 -t -d --tpmstate dir=3D/tmp/tpm \
+.. code-block:: bash
+
+  $ swtpm socket --tpm2 -t -d --tpmstate dir=3D/tmp/tpm \
         --ctrl type=3Dunixio,path=3Dswtpm-sock
=20
-Then launch QEMU with:
+Then launch QEMU with some additional arguments to link a TPM device to =
the backend:
+
+.. code-block:: bash
=20
-    ...
+  $ qemu-system-riscv64 \
+    ... other args .... \
     -chardev socket,id=3Dchrtpm,path=3Dswtpm-sock \
     -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
     -device tpm-tis-device,tpmdev=3Dtpm0
--=20
2.37.3



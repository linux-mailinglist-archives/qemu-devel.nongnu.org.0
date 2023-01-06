Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0676C65FA21
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:26:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdDo-0002uZ-AZ; Thu, 05 Jan 2023 22:16:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdDA-0002c6-EA
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:16:04 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdD8-00088g-O5
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:16:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974962; x=1704510962;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EJIuUim8WnKrgITooaCkYQ/d1sycDrIPLREYTeVySQQ=;
 b=dATuiYLslFASf4GqANDbVYZF0sVQqA1kmonOcN6yLYz6Zup/JiAD9cC5
 IMICpBviTsvtZDJCwhS0oQV8skxvukEdwKOz3pks2+M1OFUOkP9fFa1ah
 MRloifK8yC0QEy3HyKVOt6RvJqhdEkrlp0ggh5SvAr3RD11DsGRaz7BCF
 XHos9Bbe3++AcdSBxOAaqDq3ZB/tpHyF9QX9aiD7z7p6HfF2pwMlHOu2l
 EiqvReKnUJuyXmVscxKKWrJHsAkF/2Qm7M0bg8zLm8XRlptNUzwLs0t2N
 /0nt6wrQMwn8k6fzxL+DcbbPFl+PTNgkCbFUy+jmT6YTFpfF6eWxcRZ0E w==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254827"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:15:02 +0800
IronPort-SDR: qyoxNrunq6vXJmGTzH4Jbf60VGmax1a1tkd0tBm+VJZChfbprmxTMALJP35/6V+G494OtUu/jN
 zkin83UwoSVWlB+WoswvSAVNYLcSIWw6dt+7zPgD5VXl5C33uM513O/nZnSJvj9y1jV9faXZeh
 hvqat5GHUBnWRPZSogc5UnBvFqpwx1d6UA2J3b+HZJov0Ffef4iaoV5qdT5LVqt7yiKKvw2Z2L
 3sroUPk7HHwgx6r5vAH9tT8LLvOD1zjk3d4yjTcq+laK9Ug1Fi7OZQADejL7NwCIP14W3j09xU
 NH8=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:27:14 -0800
IronPort-SDR: UOUVn52+ZAqtnrk5G7EhDEhUu9msfnphvKk9C5sGORUdZc/MsdwnnhLX+UdZXH+YV7ULgoRAvM
 cXn4cpXgjuKwxiKVostjg+5EbqffZdkjD7ZnVZWhu7dGcPCAR9C2em5Jgj8zhXWmBaCw7BcHbI
 9e1210bKtBUu1opNY+8gYybnU8V/eZRGxqkQUR2vQOQHydzLzGpbfXSLO2NbF3DFkZswIe+g46
 zOfsHYOpb+heNtZTsJ7agDj2NVoThpEOkrcrnw5y8tzXwayC5N8y4QLOtp0xcbRhnQ8+/pwRQq
 /vU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:15:04 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7kG6kFyz1RvTp
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:15:02 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974902; x=1675566903; bh=EJIuUim8WnKrgITooa
 CkYQ/d1sycDrIPLREYTeVySQQ=; b=B6uElvj5lI+2NKq2CqqyxKBtwY0U6+Ckm8
 MdYb0Qrj1ApI6hdUa3CGfe1KApJtHvemdhuoXnWODlP+qTYL9v5ePcq/cp1Oftu2
 rfAjo3sGXb+3fvJxYA+wrfauR2TZcVgpmmyFJQt1Wf0WwD+50Z5yr/8NMDWt6VGY
 wJow1pUeFzTNCMQd3MprUKgs2uXZ3RE+aupO5DtN+uvbRH/pH+h4/UBRcaFt2oqH
 AVxo0owMyaiRBhrkJve0KFdotpPnV2sy+H9XmJEMXlhpBFwmqyX2gfXIgePsWB4u
 1U/Nzx1u0USPzQM726aRBKXpdyt/3guyjkSbUDOhQigHoCVh52Xg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Jg9Wq2fUkmpb for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:15:02 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7kF0L6Bz1Rwrq;
 Thu,  5 Jan 2023 19:15:00 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 33/43] hw/intc: sifive_plic: Drop PLICMode_H
Date: Fri,  6 Jan 2023 13:13:47 +1000
Message-Id: <20230106031357.777790-34-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
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

From: Bin Meng <bmeng@tinylab.org>

H-mode has been removed since priv spec 1.10. Drop it.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-6-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/intc/sifive_plic.h | 1 -
 hw/intc/sifive_plic.c         | 1 -
 2 files changed, 2 deletions(-)

diff --git a/include/hw/intc/sifive_plic.h b/include/hw/intc/sifive_plic.=
h
index 134cf39a96..d3f45ec248 100644
--- a/include/hw/intc/sifive_plic.h
+++ b/include/hw/intc/sifive_plic.h
@@ -33,7 +33,6 @@ DECLARE_INSTANCE_CHECKER(SiFivePLICState, SIFIVE_PLIC,
 typedef enum PLICMode {
     PLICMode_U,
     PLICMode_S,
-    PLICMode_H,
     PLICMode_M
 } PLICMode;
=20
diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 0c7696520d..936dcf74bc 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -42,7 +42,6 @@ static PLICMode char_to_mode(char c)
     switch (c) {
     case 'U': return PLICMode_U;
     case 'S': return PLICMode_S;
-    case 'H': return PLICMode_H;
     case 'M': return PLICMode_M;
     default:
         error_report("plic: invalid mode '%c'", c);
--=20
2.39.0



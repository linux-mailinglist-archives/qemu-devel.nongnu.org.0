Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CBD3FD125
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:17:56 +0200 (CEST)
Received: from localhost ([::1]:60686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLFp5-0005Vj-AM
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFiS-0005SW-8i
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:11:07 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:3883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFiQ-000818-Md
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:11:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462262; x=1661998262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OmTbtT6KcbJUXfEl5Y2bV/c0BZ1F3xDEsuVyCG3M1ns=;
 b=JxIYAfp15pukYbjIVL9nrwnbLJFrV8rUxKPcmBVBTYxPC8bUR82fXPec
 GfcK7zokeul5iYLKkqJl6vuE9AD65n4EAeb7kIxlb3FPP9ApQRdQRWBoc
 3g/ufwx3cc9W4JCt8qulP0QwQTe6EwdW+TBIBipS/wNsv/lksmCiwYz1x
 quEphs8Ukx3XihLMSbFxZYvbjvH1n62DISDCjuDUgeMev2IQgB9qCqnEe
 dqYA1U4I0Pg3aw+brRXMnmOB390M/hCco+f6LWTC2kRBNIPcY3CTk4Vsn
 9EFgMzbzTDhbCOzOvusIPTXSyZDkYOF0U3+DiKjTGN8Pio+6FEmRYBLGd A==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178910739"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:11:00 +0800
IronPort-SDR: 2hHz0+ggraXCPdB5FR4Ww/LXSanbm7E8Eam+ygweIANZaI5B7B8Spz7l038GhuGWopb8dTy3iC
 QH+bhB6UkTCuHqT1Z1Z7faAsSoFXX4wsRNrrU/iw8bDEghumEy3Hwed8r3cjOjBjT+SaudFbUe
 cr2n6ZEuKLaDNmlQMLnBz9a7dKlFoewOzKTf13MwIAOtHm2oLTtMsbT7ncUuKNq7zJUNwn7LMZ
 hVQDPc/Bhvo5Xi2V7kJUvGl5Ih74/B4bHb84vHPqDFYgyag3qVbatnGiILtXh+B5OlXEwk4nke
 jerJCAOxONgTL8bSeSAEqyA0
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:46:06 -0700
IronPort-SDR: Aed+9M9nuR5EZ+xTyMuWDa9D639t8VS2jCHCW4O8aoVU+BBaJBS3d6GK9oelQAG55q8S57FOZj
 BuDCoyaSvpPt/eUR1SRD+4unOSMvHWx14Y8z5R4D2N0o3mmJlm6StrV0MZ3oATRx/t1+THI+So
 dzO35etrQBAPXWcfa9qE2nrdI6qDP2a4g6tXDinPHSOnyJOE+nsunUr4/Mx9e327G6lXQ6qoCK
 zQem5yDuVXuYsEyKsJN5QNXQ1/DJdmSu1An5miJ3DCEuvLyZyJf1bGBj2sYbm59JJ0ky6HiI9n
 cQA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:11:01 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GznbS73tnz1RvlY
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:11:00 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1630462260; x=1633054261; bh=OmTbtT6
 KcbJUXfEl5Y2bV/c0BZ1F3xDEsuVyCG3M1ns=; b=bJZjTtgRdIKtFVycSjSm4kw
 ojdqRsGnvejdhlENrx6CkxaTqHWi0SY/YX7hEzvGkdf0Z//lBM+8mqn25P1Rvs+f
 4vRpz1nKTdwWdFX0kM21pFjAZHBhzU7OzObhB5tjyRhsEk9yJDZ2ko9iLFzkYlIG
 9w0dHP/GIBE6atF5SBk+27mlMYtF41uys7yKZ/di/KqNboP9yhTQf2C0zbLQ6w2K
 jYYwQ0kfFs8qGLuhuFW1pn6u1oYo8TMp9znqqJ3N/x0lZzi0/00jyS+Dw7xbiMh2
 KzbRhnL7Z/ahocDLD8qhadiVomWnmK+uYTXhHcapu9V/3nTsAbauswK4/p1+6Bw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id BFaGT6Dw1cY1 for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:11:00 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GznbN39DNz1Rvl9;
 Tue, 31 Aug 2021 19:10:55 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Joe Komlodi <joe.komlodi@xilinx.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 09/33] hw/registerfields: Use 64-bit bitfield for FIELD_DP64
Date: Wed,  1 Sep 2021 12:09:34 +1000
Message-Id: <20210901020958.458454-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

From: Joe Komlodi <joe.komlodi@xilinx.com>

If we have a field that's wider than 32-bits, we need a data type wide en=
ough to
be able to create the bitfield used to deposit the value.

Signed-off-by: Joe Komlodi <joe.komlodi@xilinx.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 1626805903-162860-3-git-send-email-joe.komlodi@xilinx.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/registerfields.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index 9a03ac55e4..f2a3c9c41f 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -95,7 +95,7 @@
     _d; })
 #define FIELD_DP64(storage, reg, field, val) ({                         =
  \
     struct {                                                            =
  \
-        unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;              =
  \
+        uint64_t v:R_ ## reg ## _ ## field ## _LENGTH;                \
     } _v =3D { .v =3D val };                                            =
      \
     uint64_t _d;                                                        =
  \
     _d =3D deposit64((storage), R_ ## reg ## _ ## field ## _SHIFT,      =
    \
--=20
2.31.1



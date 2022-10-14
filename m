Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1CF5FEA7C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 10:24:38 +0200 (CEST)
Received: from localhost ([::1]:48982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojFzh-0003rv-RN
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 04:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFbr-0003Gt-Ui
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:59:59 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:39343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFbq-0001xn-3f
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:59:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665734397; x=1697270397;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3AGcUvWkJwXeVKAc9zl/uhgQZiaQZ1QT3F8VeZDMNMQ=;
 b=CIueWYQxJaNZYMiR3F4hYbLJGmKmB8ExrP5eJJ6usCj5dfGf58kgIBke
 l1pKWD6yy3HyUhGgniIuAN9pQMzs0EMcRb3EAApPOQavUh5o+1GF7IxU0
 zakC4O5gGLanE3ilF7q0tL9jpRQvFCZ3uhW+swSw/D/1X01uKpXqOaYLE
 esZ+hu/srCw3y/vMv6odXpzSWU6+MpMitWa8DgtC5R7pR2ve+jbECaNAO
 ISlSWtn8uU8vfZSYc9tIeadFz0ot2J75RLjNXPVJ2UEbsJ7O0gCCEe7c7
 Ul9jVNT4p5yFZquBEQLY5UYbkAR/hHE7cF3TdljDUeyw6hedf+aN7S2jS g==;
X-IronPort-AV: E=Sophos;i="5.95,182,1661788800"; d="scan'208";a="212116336"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Oct 2022 15:59:54 +0800
IronPort-SDR: wpA0iVHuhfFYl901LafOzd+5+ZV04zZqYDz1+fQ9vKRwUZfle2lwEuV8WVgEqk9ZZp9/NE3z/W
 O8zSfy3iO7alAXWUNYiiR4x6NhACUUvEH2wco0aA8VAwNJ4jDhydWWU7AxAqUM+JvstAiBLw5m
 oTnC3lLshyKgPDyNH6Tl9AWigtQElmdfqfZhWY+mggwhybHH8TVOpcuy4Zpqh/EFTsHKd/YQPo
 jzlw08o0vfLUZkV3XdL/rnmLC0I5aM+YI8IGTha8q+ZGsb+/1FHdT3RDnO8wcBPcFNURvVoWco
 USlMR0EwAFQpeQ4ZbyO3vgc7
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 00:19:31 -0700
IronPort-SDR: 1W7BUokQTY5IZxJRfZc8/7qAMXMSbwoesx3L4A4dA3nCRo4vwocF8RZt6FaLjU+HEHAru7dQZ2
 bb8dHypcehJD2c5hJNB6KAY5a0u8HT7xy7iRZk0zdSOI5Q2+1a7BLL/SFpjoNeYfaKyKlokwhf
 /4wrdn7ZaxIHOmh1wttSBW0uSegggv5A137qan2ahqwxznpaQ7z01l3VlN0YVlOA35flUdyQq9
 R72nXH+Zt9NkGg2Fz96uIRKFGPh1qzuiIMw4AtjtUsEUpFpG0p6Ch/+BFzyI+zQarVk6g7Zurj
 we0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 00:59:54 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mpf1k0GZ0z1Rwrq
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 00:59:54 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1665734393; x=1668326394; bh=3AGcUvWkJwXeVKAc9z
 l/uhgQZiaQZ1QT3F8VeZDMNMQ=; b=S225UhV1LGnn0TnpiXcX1AZRgRcuo6DDkx
 XCFW+l3nGR3rqna3pg5Uxj33rJGCqCWgQEPWSWddjaV5MWEizSLTijkAtk7KDxb1
 fT/UDaiUZCrndgwkVPxp2ozmHjvOtgGk+EDFflZI/i7z5YUIDDbSSeQIkbtyHJj0
 JIw+ocDSJw+YZlGUepxTFfRVHN2jqProtBqbyJMukDyJUbF/27FBBBt6h2/voKXi
 ykXyLM1wtAcQLmcs4eJO41fKyS895bYHD/CwMirFGkgMzhlFvtPwX6AlaaGtsubn
 WkowlwmQs8O7UVnYu8yznTWxAjxQW+6jIVA3C9yD1rNomQ39vIDg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id FiSVRLT04UVh for <qemu-devel@nongnu.org>;
 Fri, 14 Oct 2022 00:59:53 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.19])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mpf1b65D2z1RvTp;
 Fri, 14 Oct 2022 00:59:47 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Jim Shu <jim.shu@sifive.com>,
 Emmanuel Blot <emmanuel.blot@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 08/10] hw/intc: sifive_plic: fix hard-coded max priority level
Date: Fri, 14 Oct 2022 17:58:28 +1000
Message-Id: <20221014075830.914722-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221014075830.914722-1-alistair.francis@opensource.wdc.com>
References: <20221014075830.914722-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=2798045df=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

From: Jim Shu <jim.shu@sifive.com>

The maximum priority level is hard-coded when writing to interrupt
priority register. However, when writing to priority threshold register,
the maximum priority level is from num_priorities Property which is
configured by platform.

Also change interrupt priority register to use num_priorities Property
in maximum priority level.

Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>
Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221003041440.2320-2-jim.shu@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index af4ae3630e..f864efa761 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -180,8 +180,10 @@ static void sifive_plic_write(void *opaque, hwaddr a=
ddr, uint64_t value,
     if (addr_between(addr, plic->priority_base, plic->num_sources << 2))=
 {
         uint32_t irq =3D ((addr - plic->priority_base) >> 2) + 1;
=20
-        plic->source_priority[irq] =3D value & 7;
-        sifive_plic_update(plic);
+        if (value <=3D plic->num_priorities) {
+            plic->source_priority[irq] =3D value;
+            sifive_plic_update(plic);
+        }
     } else if (addr_between(addr, plic->pending_base,
                             plic->num_sources >> 3)) {
         qemu_log_mask(LOG_GUEST_ERROR,
--=20
2.37.3



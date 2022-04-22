Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F4B50ACE6
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 02:44:03 +0200 (CEST)
Received: from localhost ([::1]:59070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhP0-0006gm-Rq
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 20:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhIh-0006U5-R9
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:37:32 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:40393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhIg-0005JO-7q
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587850; x=1682123850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uy8rQ+jkZvu98NoWfB7bhOKv1Zk0OvNEefdWzS8psn8=;
 b=g1Zxe7khXW+a1uJc3Rpx+Fcac3CYbv7nYkNqZDhMD5m4Q2FMktBByZAL
 9neohtryNfw2rA9ChT3USY/vKKqWz3BlYm4an/VdlQt7VXIpYCHv6vopI
 pl/WGup6CTVHO0Z5jkQthq0OePaTIgKDj3O38LnrGz6Q/JLh9WRTb42JF
 2D3wYh1buNIjmzxP7kvgZq3T10tI7PpJLrpTCUI4xc6XeApohbGq4exoa
 5SjqHOriFT3bd1/6GDa2ghC6J7HO4HHKuwe9ca8850IB6LEuvktKuZpZa
 lucXMT0J1csuM8eQ8Kg98JwzD8WkgLVSkY7vLzRnujoJrJV0XE8vTSewO g==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="302715722"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:37:22 +0800
IronPort-SDR: 3trchJ7KJjKQGRxyJrW6bQna6HRjjLhJZI1sylNzgPqWZDAfSRgKlxGXI3wYNh0eCLhvbT3HvO
 jacWNV+RYT4AUFguK/jGtDgJXRHBNoWBFqW/wrhD5xyA6qdsWJts+brl6zdp9Ka/ScNaMVQXzq
 g+xltiGCcJ8rioOZdAcOO87G8hGbYj0Op2RultIecRWlrrlnrDPQer70GIeNAlVVkdo7VLJCtU
 RuEs8C4J9FWqQv/W2NZxoXdXIN4+k01hEXst0zGLXCij+38y/ouWhLF1Uo4lC9GhMWoqzpLGMi
 WRjk+1hy63oTxkJYwP2Gw1hO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:07:39 -0700
IronPort-SDR: 6hPoEkaMV+AekpbdVM0YXR0QFETF9LTVX7NmdFuX5UThBZyaI9oMvNNbBvcWu01tlESSyQkBp9
 acLBY+OVrIN7H+R0In/2pSWvmAtebNhWJuCmKx7lf8efajw/kGJS+xet3quibpE2LllQrITfNY
 oshHbhied9PO7ItGkOmqOhgCHDkUbeIwQpupV29QdEEvXUrK6+/sXt/GC+Yx3qgso6HSSGD8h+
 /4JO5xekf5xKl3N0jLF2YVVCslgV2ylEuXv5W72LbURpBToXDQ4CTXUmUakzGAqZvMopUtsbAq
 n2w=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:37:22 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwTs73MFz1SHwl
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:37:21 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587841; x=1653179842; bh=uy8rQ+jkZvu98NoWfB
 7bhOKv1Zk0OvNEefdWzS8psn8=; b=Jm2Tb/vbiBrT9AxU51ROlkxJjsJK3tXUVb
 lslr/I9okJDELMBLyi0c2i5e6dwZF9fWnrfGMTd3mSE6WvHSN0C3lVnfpKzujzQP
 elGbkB7vny39DznxPpnhoY44SDrEn5kxk6PPa1uQ0cmcd9DR+UZkaazoe9lIXJEB
 xUUGuEo5tXdYGLPR3fMUsWnPAo9TjzvkQBhCNw5SAjBnO38y3V26z0HlvXF3L61Q
 GpL/DBWwpLih/9B9nDySlbTaO2OruhXmxNAdoo4qi1PijRUCN6Fqbr0EzrSi87o2
 xuFQPgsw7Gyz50XWQ0DxOCNJdBbKbWKahUtRlky56y/iPjHK/SPA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id jRaRGHN_qnZN for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:37:21 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwTq2PK0z1Rvlx;
 Thu, 21 Apr 2022 17:37:19 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 04/31] target/riscv: Add the privileged spec version 1.12.0
Date: Fri, 22 Apr 2022 10:36:29 +1000
Message-Id: <20220422003656.1648121-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
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

From: Atish Patra <atishp@rivosinc.com>

Add the definition for ratified privileged specification version v1.12

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Message-Id: <20220303185440.512391-3-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 345ec2c773..19c3b6610b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -86,6 +86,7 @@ enum {
 enum {
     PRIV_VERSION_1_10_0 =3D 0,
     PRIV_VERSION_1_11_0,
+    PRIV_VERSION_1_12_0,
 };
=20
 #define VEXT_VERSION_1_00_0 0x00010000
--=20
2.35.1



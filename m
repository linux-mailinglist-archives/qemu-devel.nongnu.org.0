Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB12C4B81A9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 08:36:57 +0100 (CET)
Received: from localhost ([::1]:36584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKErw-0007fs-Dk
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 02:36:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDoj-0004Oi-PQ
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:34 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:59472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDoh-0006Gk-L6
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644992970; x=1676528970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q6yJDJqIAw6QM8qy0fNUeXdxUdGcovlH4g3TuX9SCc4=;
 b=iyshMLF1RO1o0/Y94zUsZwN2zHs3YmrLO78lLbknqEkMAQn4SxF8HZMr
 G2hDTOIKwta5OyajR8bPqPNSX8yZdHOSrLu6PC5X4dOTMcBhRli2DSmMf
 oYrpIDdhQfXg/7n9H82hEmWL2WogEG5dSDNRCR9t5bN9Pf0HSKvHiiZjq
 lYS/dB4N7LwIvtZ5y/qjKa3EQ8uOwbNxtqYtvzZhvedOAmiyl0Q1D/o33
 0tmWddPyPSVpdO+kfmI1exDUuVGnXcTt1JCkPDSQEvCQtt1wEKz9kUG99
 FLmVDbya3pv4gZdgpKLwUw3elF2ECDCGduKlhEkiy8MDgz+52wERtpgxT w==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="193072670"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:29:30 +0800
IronPort-SDR: tiNTATvD84TMOoO/kyYzAjoYer0vu9TRmT7KZv64OJk9bVtyG0/0JcLpIKsf/WfoLL5SoXO/EN
 560bJbJhw+EN7mWuwOaEUL4TCzT9eTMn1eciwdKtBYmSd6IA5Bu0erT3FpAMNx9LICbPsTN1Fn
 h37uGwugVjV4ddZmoECymzt1bdm5csVauIVntn8McIHqTscRb3xq2Ihdl7qTK9UZkXIjtRiyWC
 joWCjMmi9LNrhqbmxij11/5T3AlcWJM+NzJ/NfakUsJaylPmLfNZq7KMXhw97H/oDtsz2PSmWZ
 dDDSFj81dmMNN9GcUx0kB+5A
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:02:19 -0800
IronPort-SDR: AxS1KwhuLCyB1jW4mDxGgIr1avnXMnLw8y7mFkKdsyEHrQwdr18rG1G2Fm2afQLWxv8+UUvT1K
 4GS6boCp01SyvOTPjoLeoYJ8bOsJ4MPA16H5ggmRP4Qdwje2ixOqJGBbvmqzoEIa9ghhXr0oYd
 hhv+WFWnxl8MybNJbLvJVIzi92/cerVW0Vtwse1fpFUY4ZJPKoPsq+b97ovnzwqKJN6jFkKETL
 JS87Qufkfv3pnbLVCq1j3DFtGufrocPBRXOVglBPRKNtrWSp8xhLrq4EiSsRRjORqu/FZfR3c0
 FXQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:29:31 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7NB4gg7z1Rwrw
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:29:30 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1644992970; x=1647584971; bh=Q6yJDJq
 IAw6QM8qy0fNUeXdxUdGcovlH4g3TuX9SCc4=; b=LgK4q5+Lx2ke2XSu2ud5tW2
 yENQMQ08lfuwmIF/QbDaG2rTKjd7WFhNFdZqUqETfiqgEBG+T5qPFlkHmUbiueNe
 WNLqn65YoRBA2lbgWNKhqku5xHmk0cXFL1uQf4NqN2tVsQsY3EU3tqQ5Vjw1eXin
 f2SyFsdyuWZNDWVg0s496T4l2kx6Mw6cXbzpKEs84pyrLOSHXDAi64d/41uODP/E
 irW5Hz4IYSJ3mLZMNQ/tf9/U4GJwfF/VjFKhwHFdCXb4NfDv2I5a7RbRaMjzOA8X
 YFm5sm3ZdGjDhNnckhu8TMx6CnWgSsNMhjs8ihmY6ebfEnMOrXPEFE/e8Z/Cjcw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 8WE8lpkMIsTu for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:29:30 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7N72sJwz1SVp2;
 Tue, 15 Feb 2022 22:29:26 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Petr Tesarik <ptesarik@suse.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 02/35] Allow setting up to 8 bytes with the generic loader
Date: Wed, 16 Feb 2022 16:28:39 +1000
Message-Id: <20220216062912.319738-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Petr Tesarik <ptesarik@suse.com>

The documentation for the generic loader says that "the maximum size of
the data is 8 bytes". However, attempts to set data-len=3D8 trigger the
following assertion failure:

../hw/core/generic-loader.c:59: generic_loader_reset: Assertion `s->data_=
len < sizeof(s->data)' failed.

The type of s->data is uint64_t (i.e. 8 bytes long), so I believe this
assert should use <=3D instead of <.

Fixes: e481a1f63c93 ("generic-loader: Add a generic loader")
Signed-off-by: Petr Tesarik <ptesarik@suse.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120092715.7805-1-ptesarik@suse.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/core/generic-loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index 9a24ffb880..504ed7ca72 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -56,7 +56,7 @@ static void generic_loader_reset(void *opaque)
     }
=20
     if (s->data_len) {
-        assert(s->data_len < sizeof(s->data));
+        assert(s->data_len <=3D sizeof(s->data));
         dma_memory_write(s->cpu->as, s->addr, &s->data, s->data_len,
                          MEMTXATTRS_UNSPECIFIED);
     }
--=20
2.34.1



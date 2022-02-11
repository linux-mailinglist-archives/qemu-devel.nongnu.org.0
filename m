Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 339354B31A9
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:06:54 +0100 (CET)
Received: from localhost ([::1]:34316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIfwD-0007d3-AK
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:06:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfqi-0004ly-RY
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:12 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:53000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfqd-00009V-P8
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624067; x=1676160067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q6yJDJqIAw6QM8qy0fNUeXdxUdGcovlH4g3TuX9SCc4=;
 b=UPlpHoMw3d3qYQSksXj/f+1iHUsQKNwKwRcB4E5vXh3ykGxkqUXyzOA+
 xVnZ816gt7Tv1JeDxskFaGF8kPmm8KPaw/k6D9o5GtFQtdFp0tf6H+TAp
 yR4S4CYoDV3TK0hwRQ5NXaaK3LWDGm30x8urLQhzfbD30gMyuxX4v5Yd3
 MDNE4eFkbWbTbYLQW5jEvuVlldLUhCBMsAK93NeD9BfOJyGWczRzpsEqU
 IHjBYkjwON1HVArru5lAOLUG4+Ele5vnLppBZOhoS3nerbdwD17l1eB17
 a+ZivQWh7ZriWmZE0v3gLYe3cq0l3289HiEq8aUh44uEtbJ5+ByeunhLc Q==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="304636191"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:01:05 +0800
IronPort-SDR: Yb3AvFoSaeQ/Dqj1EbHAkhynaWF91PTc4hsmd2aBELUQauWiQQiAmYZhShgBLDJxhZbzSODVGj
 EPBYvvqkZNwsbWaIhtn9MJaqlShu9vRZJ8uOOU04ISUy3WkemT9165UIiF2Pq0/KU3CTrf3NhD
 j8AgWthu4FwEmDduaqnEcnJDNpaUQs3MRzvVRtKZNliVRmJ5wOleJLypx608EI9KtBybUbbX+u
 hmDmVlq3zaYxUMgzakoq7qk1k522uNzSwA9uuCfYb/9Prdure/3YdTrg3sPmP3OeEwez1y66hD
 FwrgJNpuNFqXcpbdic9LkBMN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:34:00 -0800
IronPort-SDR: MtEp0ZAWg1HdELMWcX0qqwuQMJd6bixTd8jVcycITLt9i0XOB+OK2zS0MMzNJUXt2XdylnFJWt
 NE05UuisxJEjM9SVC2Ykuft0n3sZHjqayu64RYfFUEAx5pqoufa0VWHJZIZoAwNgw6+9QDaN/V
 kPeI6Iy0K9ySS0kMR3LzwSCKgNMX2i2ypjoG4NfdAigqQKUg0fUkAoZbSWWyzDevSSxtKL2nfX
 CMdD6AVKJh428QyM7Tj7zMc0/pMV4yR0yOYCcTDKhiYUTzitK5ZTl129nuatGlERb6xDs8OA8V
 dBw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:01:05 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVxs4pFmz1SVp0
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:01:05 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1644624065; x=1647216066; bh=Q6yJDJq
 IAw6QM8qy0fNUeXdxUdGcovlH4g3TuX9SCc4=; b=mkRph85a5otsy58Q0xpDs/t
 i03Swbhi3WR+wjnF3DMAksJSy7udiy5T5XUFT+uRyGhAlkvuLl3dUcjFnwo+HUgW
 BOvQpVP8QCboeXTnHOZX+wHe32nZjNzpOojB3JsXso89q5uSluAis0XQGawWHhqL
 AP+gCeGiIzh8jkDVje/Efrz6Wp9PA+K7w6FUQoxRpRKJKH4tl0R+35NSEPgRPW0e
 el9IMLD0+TE/UjsSIXNudNc9c1q0QPn0WkulJp5sky9BeBaVnxGMsHGb/ouJSVr/
 ImkXn+o4S/Svt3nASvLI4z0bLCtP5pXxk1LwogktW8g99vKvpnff35huEUCPgxw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 9iAVm_RJNU5K for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:01:05 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVxn3dHNz1Rwrw;
 Fri, 11 Feb 2022 16:01:01 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Petr Tesarik <ptesarik@suse.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 02/40] Allow setting up to 8 bytes with the generic loader
Date: Sat, 12 Feb 2022 09:59:53 +1000
Message-Id: <20220212000031.3946524-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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



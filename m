Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4633E4959C2
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 07:10:44 +0100 (CET)
Received: from localhost ([::1]:60832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAn8F-00023c-BO
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 01:10:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxw-0006sy-Ca
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:10 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:53743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxt-00047D-9f
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744799; x=1674280799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hm1MxAa5jY/LA0BJnYgvyDmUDhUVhqL9dhEd0OPYnqE=;
 b=CHBt40Uoqnm3BiomImsETBwziZ4SdlT5FS4unEKXIs1a5vfNq5/+NMsX
 IaCS1juCZxOXONVIGo806jk6Egvuzb3vNATYpigacKDWotIR39Avmkryc
 aCTyifVc/8ctOViQzG3uxq4fkuP6BlxBe+MJCzbbf5Wzwyr5H1AfhXvTq
 DMIRyrQJmipiH+LEMe0XO0nvC/Z7OqqLSSAsClxvKC528Segj6pjPcBvp
 JvYN8uyX4XIgOlFxdvAIiJCYMnuAK0sNUI5RorRXj5PgKgdvQ0ztvSV4N
 YGI/3+Z0XN+Uw/taoynZ914GSnPzF/vavfkBcLIW5XhZpv9vhLgUWBV1O w==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="195813986"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 13:59:57 +0800
IronPort-SDR: RLcpaMhAFoktC6NQL3i7ds6GBUWu1gdhIeL8oq+3JqbDvQObcYTUDqwICFXg+bxzhY38oAG9Y1
 2ix+BCj9z59uO6BkLWh0eBSX+x0+FIZ38GAkFvbjwF51OoiHAKBjfXUBgy5lvpF2KCKMInJv/l
 KSoETHE32TN8Pzxz1LDpjmK8JuQ61Os5jqL+kgGqEBAbaHHVngnRQPVzlwkW5ZxJl2hEKVfixe
 cAAp7bgdJMw4iWjikogFeCmFAaMIEFhdyaKrEZ0ABf8JIYVCjLed95RcgNjiJh98sYfJC/9Rku
 DQ4LDlOdLMS49raCnPL7xyg6
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:32:10 -0800
IronPort-SDR: HV2iUdyiVPeNHG7ew4/2dxpBaLNSsaBSyhcu1vjwKMW7txBp6/9NIy+ysnvwQEVTud2sFE6En3
 13ZotLkuL67snxXIxMwZBFXraEmXYoOS7+EmIX/8IT3oBrsIhy3AFMNyjPNHrsjVhYl1q9GcsN
 RZXcQPjzBZNypi3iGmZvw3cmMusF9lw96Dnsj5ThJvHk6a16/MobBa0Dw8hz35lJDiGvmNSirT
 VHM3XbsJ0B27YgaZHUT0N42/0ayYg1ac/rwDw6HOe3Gy2dF0kd1X0IkvgYTEL6oTlZhL3NFsGO
 sEE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:59:59 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7y7295wz1SVp4
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 21:59:59 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1642744798; x=1645336799; bh=hm1MxAa
 5jY/LA0BJnYgvyDmUDhUVhqL9dhEd0OPYnqE=; b=WoI0m4TgPHjIR1GfPfCpTPu
 9/QLhwaHYb46PPj4oQLhvkEQ/aw8uTj1iUtN5KkW9WvYWKWCBtJie9cTMk8wxB4D
 ow9koMVua0LzvWnshMDLr6H32v2udqmID4CACgOdf3+wZIquA+L6k3cc8nNa8NLp
 UauA+XaZUlgHeel4LLQCNOJV54W9HXWaGjAYuYVbEZ0sVT3OE/DJjW6ViaXBKI3g
 AqiUHzvIM/iY5txRgti/X9Xu6vZTCgbxYFcnJ9q1Wt8OlfZU3HYttDBJ3M83+HMM
 D+w6DkneJd5mVk2IWVyM+RIVI2TaEZqugh5IcjHJ13FfEm9/hdOfO1hjO4FYiYQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Ee0ha14uQvXL for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 21:59:58 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7y20c8Vz1RvlN;
 Thu, 20 Jan 2022 21:59:53 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Thomas Huth <thuth@redhat.com>,
 Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 17/61] softmmu/device_tree: Silence compiler warning with
 --enable-sanitizers
Date: Fri, 21 Jan 2022 15:57:46 +1000
Message-Id: <20220121055830.3164408-18-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
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

From: Thomas Huth <thuth@redhat.com>

If I configure my build with --enable-sanitizers, my GCC (v8.5.0)
complains:

.../softmmu/device_tree.c: In function =E2=80=98qemu_fdt_add_path=E2=80=99=
:
.../softmmu/device_tree.c:560:18: error: =E2=80=98retval=E2=80=99 may be =
used uninitialized
 in this function [-Werror=3Dmaybe-uninitialized]
     int namelen, retval;
                  ^~~~~~

It's a false warning since the while loop is always executed at least
once (p has to be non-NULL, otherwise the derefence in the if-statement
earlier will crash). Thus let's switch to a do-while loop here instead
to make the compiler happy in all cases.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Message-id: 20220107133844.145039-1-thuth@redhat.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 softmmu/device_tree.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 31d1066940..0a433c98e2 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -566,7 +566,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
         return -1;
     }
=20
-    while (p) {
+    do {
         name =3D p + 1;
         p =3D strchr(name, '/');
         namelen =3D p !=3D NULL ? p - name : strlen(name);
@@ -586,7 +586,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
         }
=20
         parent =3D retval;
-    }
+    } while (p);
=20
     return retval;
 }
--=20
2.31.1



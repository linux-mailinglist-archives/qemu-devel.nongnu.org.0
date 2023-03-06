Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 956FF6AC219
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:02:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBQ0-000163-Sp; Mon, 06 Mar 2023 09:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4224746ab=anthony.perard@citrix.com>)
 id 1pZBPn-0000ya-HA
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:02:17 -0500
Received: from esa1.hc3370-68.iphmx.com ([216.71.145.142])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4224746ab=anthony.perard@citrix.com>)
 id 1pZBPl-0006ad-BL
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:02:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1678111329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xqbhbmVsgYeksMRIYxPoEYSellA1egwE3nLd6Vki9DY=;
 b=bSXCiGkeymlGl07jzhe8BW+yDCTYOfNhJFV/GgBFSdOzUZI9obtdZqj0
 ofaQK9BcNmJY0u/mbwILrM8gsEvVUzKkuoToAcSOhVHHsyJ0U8MGvQuae
 Bcdt0d3FfbzOjj4ye3xDm2/eqHWOSoi+9d6cZw8ZukkEY7mpdxfX3VBRh E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100081144
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:RQfnka7AcQGgWA5ctePcfAxRtDDHchMFZxGqfqrLsTDasY5as4F+v
 jBOW2CHOKrZMDekL9ojaNyz8kIF6JeGmtc2QFdvqHpjHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasT4geE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m5
 PlFBTUSSR+/jPu6nreiZuVHvPUZBZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9xx7A/
 jKfpjilav0cHIbY8ybarHKNv/+Mxw7lYNMJDYfl3Nc/1TV/wURMUUZLBDNXu8KRk0O7RpdTJ
 lIZ/gIoqq498lHtScPyNzW9qWSBtwQRWPJRFfM78wCHzqfI4wefCXMARzQHY9sj3PLaXhRzi
 AXPxYmwQ2Uy7vvMEyn1GqqoQS2aKC1IAGodQiA4RhIJvdz6jI0YtCP1Z4M2eEKqteHdFTb1y
 jGMiSExgbQPkMIGv5mGEUD7byGE/caQEFNsjunDdif8t14iOtb5D2C9wQKDhcusOrp1WbVoU
 JIsv8GFpN4DApiW/MBmaLVcRer5jxpp3dC1vLKOI3XD327yk5JAVdoKiN2bGKuOGpdsRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QRMsAtLVXaoX0zOSZ8OlwBd2B2zMkC1
 WqzK57wXR7294w8pNZJewvt+eBynX1vrY8ibZv60w6mwdKjiI29EN843K+1Rrlhtsus+VyFm
 +uzwuPWk32zpsWiOHiImWPSRHhWRUUG6Wfe8pQLJ7Pde1c3QAnMyZb5mNscRmCspIwN/s+gw
 513chIDoLYjrRUr8Tm3V00=
IronPort-HdrOrdr: A9a23:ue0IKqur2Gk2j7RP1TCim3Bz7skDctV00zEX/kB9WHVpm62j+/
 xG+c5x6faaslkssR0b9+xoWpPhfZqsz/9ICOAqVN/JMTUO01HYT72Kg7GSpwHIKmnT8fNcyL
 clU4UWMqyWMbGit7eZ3OBvKadE/OW6
X-IronPort-AV: E=Sophos;i="5.98,238,1673931600"; d="scan'208";a="100081144"
To: <qemu-devel@nongnu.org>
CC: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PULL 2/2] hw/xen/xen_pt: fix uninitialized variable
Date: Mon, 6 Mar 2023 14:00:44 +0000
Message-ID: <20230306140044.44076-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230306140044.44076-1-anthony.perard@citrix.com>
References: <20230306140044.44076-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.145.142;
 envelope-from=prvs=4224746ab=anthony.perard@citrix.com;
 helo=esa1.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

xen_pt_config_reg_init() reads only that many bytes as the size of the
register that is being initialized. It uses
xen_host_pci_get_{byte,word,long} and casts its last argument to
expected pointer type. This means for smaller registers higher bits of
'val' are not initialized. Then, the function fails if any of those
higher bits are set.

Fix this by initializing 'val' with zero.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Message-Id: <20230127050815.4155276-1-marmarek@invisiblethingslab.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/xen/xen_pt_config_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index cde898b744..8b9b554352 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -1924,7 +1924,7 @@ static void xen_pt_config_reg_init(XenPCIPassthroughState *s,
     if (reg->init) {
         uint32_t host_mask, size_mask;
         unsigned int offset;
-        uint32_t val;
+        uint32_t val = 0;
 
         /* initialize emulate register */
         rc = reg->init(s, reg_entry->reg,
-- 
Anthony PERARD



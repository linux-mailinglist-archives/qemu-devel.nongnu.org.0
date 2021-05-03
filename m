Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8709D3712C5
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:58:53 +0200 (CEST)
Received: from localhost ([::1]:36710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUPk-0000eM-KO
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4m-0003X4-Rr; Mon, 03 May 2021 04:37:13 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:41957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4R-0000q7-4Q; Mon, 03 May 2021 04:37:07 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MORVA-1lvgdZ1yEI-00PvCJ; Mon, 03
 May 2021 10:36:43 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 19/23] mc146818rtc: put it into the 'misc' category
Date: Mon,  3 May 2021 10:36:19 +0200
Message-Id: <20210503083623.139700-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zhIPSCsIhPKYap5Pzy33dyqIaw7KS0ms6Jc6UpocJxhqkIfly4g
 gQs+CuNYlsXVHxB6wUuwKO5cFcyO9RtvV2WAX6lnUIIVphb3VDCg6FvoBK5VcvKUWZ0Dgrc
 vEx5E7/Hlq4zvWFa4a5o1acXftAh3Kkf+fKTacAUtYHC8UrK5bWlSBNuaEHNn1DEbfb4LKO
 HjoRgzKpVr7iygB8DHN7g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ajyf4CgFvCI=:yZ7L7LCWQLwEB2XQ6oQiM8
 ieunG/7aX0Jl0RQxCLzlggH9lG4PhjoRe2rpooPFt8lFz/zBBWv+cw2kI4RpijAQcmrvCiZXE
 ZDDmqiPP6uNyPcwNGTaFvEvLFSuGdjyyXTgg0uOMsa5Pv6BkyZU3WnP6FKNYD5TETN9Dh4Ik/
 6ZEBo6IyPcLdC2NTZFASDJIrPg1au7UgyVyyx+GpN2wdgrT9kfm/omrRlDk5nUbaXWKGSbCzF
 1n5EdWBz+yBVk8sUBG1X+VzRV2PwJXyNWb6HLwNrFpEyojD840z/GkZRYN4oeakNZFte2JI3n
 FmaE2y5trxzGtHcT/AX1mZ6fZh3HubWtH5yz05hzfelPGzE76sXNMlYUypbxOWQTdniKSzY7J
 FX0yu7bc+yrANg3fe2uWan7n9O3kOCsa/XWNCRW5yiBcs/aMgXkMmQYYS/PBzpLiMcIUiH3pn
 wfzwRvmdMjDNDIS07s3tuDgOOB8ovSJgLRsPtZ6rVhGFgiPkFWRL2LVd1YeNPpexHGZaR2Q0/
 HmeuRARd7cc0qCJ0JH7Wc0=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Gan Qixin <ganqixin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gan Qixin <ganqixin@huawei.com>

The category of the mc146818rtc device is not set, put it into the 'misc'
category.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201130083630.2520597-6-ganqixin@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/rtc/mc146818rtc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 36a2dbf62f9c..3d2d3854e716 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -1039,6 +1039,7 @@ static void rtc_class_initfn(ObjectClass *klass, void *data)
     dc->vmsd = &vmstate_rtc;
     isa->build_aml = rtc_build_aml;
     device_class_set_props(dc, mc146818rtc_properties);
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo mc146818rtc_info = {
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD2A9E97F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 15:35:20 +0200 (CEST)
Received: from localhost ([::1]:51548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2bd1-0007Cc-BP
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 09:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60174)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anthony.perard@citrix.com>) id 1i2bb2-0006Cn-8g
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 09:33:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anthony.perard@citrix.com>) id 1i2bb0-0004tD-W0
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 09:33:16 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:9216)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <anthony.perard@citrix.com>)
 id 1i2bb0-0004rj-Nz
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 09:33:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566912794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=il5wHWdG08K/WwVCv6LOoDJJTxpyyVsB6uhiMfXgDN0=;
 b=ZvbvAt6jzfftZJAoXN9qd5v18dj/RfKveihD+7scmzaJy1L2ABKAGJd4
 wbGiDLBU6HVGnFixDWRu2FkzWB8rukzZ4KzJnRJR8OPmkFhyFDsQzcU16
 gCkFViVgNqf8YI2+xfg32Z5k2TBQI+AOSg6ZBq3PFFaG952uZSMd02g4b 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: k6cQQl2ZxP20PgYhA2iJRLQBKsMiG/cpdwY4VI7aZXr7LYb+lz0iDggO69NpK4QXvFBfAMN1eP
 k5Xt+z58a2WzEyMwvPAXnVaAk7i1KUszcvLD4r3UBsLE1qwsHyV+7n9W0MYKVgkyRPkfEIDXZQ
 Hdh8lJhkkMFnG+7wH3dc2ChLnANfrea81ibnrQ9CWVML0DRFY3BWa161Wo3RuTZX/v2hx5cySp
 J9ixesfwyLaxc3faogJ9oUc0McjszPNSnLiyGpsJv6KnZBv2Wq6C2Gd85xseKS2XGPBE0nNF2t
 bQU=
X-SBRS: 2.7
X-MesageID: 4987741
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,437,1559534400"; 
   d="scan'208";a="4987741"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 27 Aug 2019 14:32:57 +0100
Message-ID: <20190827133259.32084-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827133259.32084-1-anthony.perard@citrix.com>
References: <20190827133259.32084-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.71.155.175
Subject: [Qemu-devel] [PULL 2/4] xen: cleanup IOREQ server on exit
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Druzhinin <igor.druzhinin@citrix.com>

Device model is supposed to destroy IOREQ server for itself.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
Acked-by: Paul Durrant <paul.durrant@citrix.com>
Message-Id: <1564428563-1006-1-git-send-email-igor.druzhinin@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/i386/xen/xen-hvm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 5d3e4750e6..6b5e5bb7f5 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -1247,6 +1247,8 @@ static void xen_exit_notifier(Notifier *n, void *data)
 {
     XenIOState *state = container_of(n, XenIOState, exit);
 
+    xen_destroy_ioreq_server(xen_domid, state->ioservid);
+
     xenevtchn_close(state->xce_handle);
     xs_daemon_close(state->xenstore);
 }
-- 
Anthony PERARD



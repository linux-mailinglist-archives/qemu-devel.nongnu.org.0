Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF4D6396C5
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Nov 2022 16:27:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyx40-0008UE-HZ; Sat, 26 Nov 2022 10:25:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1oyx3v-0008PP-T7
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 10:25:52 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1oyx3u-0006um-Hl
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 10:25:51 -0500
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 70D1FDA1166;
 Sat, 26 Nov 2022 16:25:49 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 6E34646000E; Sat, 26 Nov 2022 16:25:49 +0100 (CET)
To: qemu-devel@nongnu.org,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PATCH v3 for-7.2 5/6] MAINTAINERS: Add subprojects/libvhost-user to
 section "vhost"
Date: Sat, 26 Nov 2022 16:25:06 +0100
Message-Id: <20221126152507.283271-6-sw@weilnetz.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221126152507.283271-1-sw@weilnetz.de>
References: <20221126152507.283271-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf24910249..6966490c94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2005,6 +2005,7 @@ F: docs/interop/vhost-user.rst
 F: contrib/vhost-user-*/
 F: backends/vhost-user.c
 F: include/sysemu/vhost-user-backend.h
+F: subprojects/libvhost-user/
 
 virtio
 M: Michael S. Tsirkin <mst@redhat.com>
-- 
2.35.1



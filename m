Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB7A9A3A2
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 01:18:38 +0200 (CEST)
Received: from localhost ([::1]:48696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0wLl-0006Ov-O0
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 19:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53679)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i0wG1-0001FD-3u
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 19:12:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i0wG0-0006lo-3T
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 19:12:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49272)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i0wFz-0006lX-Uy; Thu, 22 Aug 2019 19:12:40 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3B26BA2E0EE;
 Thu, 22 Aug 2019 23:12:39 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96E111001938;
 Thu, 22 Aug 2019 23:12:34 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2019 01:12:31 +0200
Message-Id: <20190822231231.1306-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Thu, 22 Aug 2019 23:12:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] contrib/gitdm: Add RT-RK to the domain-map
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This company has at least 7 contributors, add a domain-map entry.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index fa9d454473..9efe066ec9 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -18,6 +18,7 @@ nokia.com       Nokia
 oracle.com      Oracle
 proxmox.com     Proxmox
 redhat.com      Red Hat
+rt-rk.com       RT-RK
 siemens.com     Siemens
 sifive.com      SiFive
 suse.de         SUSE
--=20
2.20.1



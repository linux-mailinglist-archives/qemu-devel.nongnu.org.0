Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F28D51867B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 10:02:59 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49980 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOe15-0003fV-6p
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 04:02:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1hOdzM-0002Rv-8z
	for qemu-devel@nongnu.org; Thu, 09 May 2019 04:01:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1hOdzL-00056R-Fh
	for qemu-devel@nongnu.org; Thu, 09 May 2019 04:01:12 -0400
Received: from hera.aquilenet.fr ([2a0c:e300::1]:44756)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <samuel.thibault@ens-lyon.org>)
	id 1hOdzL-00055Y-8d
	for qemu-devel@nongnu.org; Thu, 09 May 2019 04:01:11 -0400
Received: from localhost (localhost [127.0.0.1])
	by hera.aquilenet.fr (Postfix) with ESMTP id 193AA77CF;
	Thu,  9 May 2019 10:01:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
	by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FdH4chBEnWNM; Thu,  9 May 2019 10:01:05 +0200 (CEST)
Received: from function (dhcp-13-82.lip.ens-lyon.fr [140.77.13.82])
	by hera.aquilenet.fr (Postfix) with ESMTPSA id D37FB1E42;
	Thu,  9 May 2019 10:01:05 +0200 (CEST)
Received: from samy by function with local (Exim 4.92)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1hOdzF-0005nG-58; Thu, 09 May 2019 10:01:05 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Thu,  9 May 2019 10:01:05 +0200
Message-Id: <20190509080105.22228-2-samuel.thibault@ens-lyon.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509080105.22228-1-samuel.thibault@ens-lyon.org>
References: <20190509080105.22228-1-samuel.thibault@ens-lyon.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a0c:e300::1
Subject: [Qemu-devel] [PULL 1/1] Update upstream slirp
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, stefanha@redhat.com,
	jan.kiszka@siemens.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adds gitignore, README file, and fixes ident protocol parsing.

Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 slirp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/slirp b/slirp
index 0e79ba4856..f0da672620 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit 0e79ba48567ccfb3cc2cf2e98cce8811eee7e455
+Subproject commit f0da6726207b740f6101028b2992f918477a4b08
--=20
2.20.1



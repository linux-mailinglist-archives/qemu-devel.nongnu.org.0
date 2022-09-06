Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FB55ADCCB
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 03:07:23 +0200 (CEST)
Received: from localhost ([::1]:45080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVN3i-000878-36
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 21:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1oVN1G-0006aj-F3
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 21:04:50 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:13726
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1oVN1E-00026Y-RS
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 21:04:50 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4MM6c25JyRz8PbN;
 Mon,  5 Sep 2022 21:04:34 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=date:from
 :to:cc:subject:message-id:mime-version:content-type; s=default;
 bh=1k/AhecjVFlUXF1HzxE+FNY7DlA=; b=bS+gfZhHtnF2hpgaPQI6/QPWjPBG
 7afoNnnjgwpA3Ury3tNEv290GCX1X0ycWU8J5962Uq7ZfwZXiI9Jl7AbeC9jG8Av
 sCJWQRgcmasOJh2wc369sbAswB9RpQIvIhrAs07c+WZHFC6jLkMo4km8Sl0kebU6
 U2Mwjfe0xtrhRm4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=date:from:to
 :cc:subject:message-id:mime-version:content-type; q=dns; s=
 default; b=aoowE3vQGQn/FFhpEtl0Ycdif7j7FdzsfB6Q0eRleCwVybYS95kQN
 eMQ6940JXR/3vNl+TwiU8yGzDnsXbSUMY2ByppINLWPecfBVcjZ9YHPlroDK8U8/
 tqGUAPu2GdIc1BmCuRKIX54uXGANEP8DlxQt5hZbvg5mfAEbrDUu/w=
Received: from humpty.home.comstyle.com (unknown
 [IPv6:2001:470:b050:3:7fec:5011:28d9:4198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4MM6c24dw6z8PbK;
 Mon,  5 Sep 2022 21:04:34 -0400 (EDT)
Date: Mon, 5 Sep 2022 21:04:33 -0400
From: Brad Smith <brad@comstyle.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Alex Benn_e <alex.bennee@linaro.org>,
 Philippe Mathieu-Daud_ <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH] tests/vm: update NetBSD to 9.3
Message-ID: <YxacoSbT1cZR4SKr@humpty.home.comstyle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

tests/vm: update NetBSD to 9.3

Signed-off-by: Brad Smith <brad@comstyle.com>
---
 tests/vm/netbsd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index da6773ff59..aa54338dfa 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -22,8 +22,8 @@ class NetBSDVM(basevm.BaseVM):
     name = "netbsd"
     arch = "x86_64"
 
-    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.2/images/NetBSD-9.2-amd64.iso"
-    csum = "5ee0ea101f73386b9b424f5d1041e371db3c42fdd6f4e4518dc79c4a08f31d43091ebe93425c9f0dcaaed2b51131836fe6774f33f89030b58d64709b35fda72f"
+    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.3/images/NetBSD-9.3-amd64.iso"
+    csum = "2bfce544f762a579f61478e7106c436fc48731ff25cf6f79b392ba5752e6f5ec130364286f7471716290a5f033637cf56aacee7fedb91095face59adf36300c3"
     size = "20G"
     pkgs = [
         # tools
-- 
2.37.2



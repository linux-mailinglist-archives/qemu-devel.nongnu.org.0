Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BF4AD915
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Sep 2019 14:34:29 +0200 (CEST)
Received: from localhost ([::1]:56062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7IsG-0003HP-6V
	for lists+qemu-devel@lfdr.de; Mon, 09 Sep 2019 08:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49925)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1i7IqZ-0002OD-7G
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 08:32:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1i7IqX-0006mM-P9
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 08:32:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57574)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1i7IqW-0006ih-Km
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 08:32:41 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 009137BDA0
 for <qemu-devel@nongnu.org>; Mon,  9 Sep 2019 12:32:40 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-63.ams2.redhat.com
 [10.36.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CEEB5C1D8
 for <qemu-devel@nongnu.org>; Mon,  9 Sep 2019 12:32:38 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  9 Sep 2019 14:32:37 +0200
Message-Id: <20190909123237.20243-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 09 Sep 2019 12:32:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH qemu-web] use precompiled sassc
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

---
 Gemfile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Gemfile b/Gemfile
index 200f2c4..b76a4fd 100644
--- a/Gemfile
+++ b/Gemfile
@@ -22,3 +22,6 @@ gem "minima", "~> 2.5"
 group :jekyll_plugins do
    gem "jekyll-feed", "~> 0.12"
 end
+
+# for https://github.com/sass/sassc-ruby/issues/146
+gem "sassc", "< 2.2.0"
--=20
2.21.0



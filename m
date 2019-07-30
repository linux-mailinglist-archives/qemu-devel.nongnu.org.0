Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EC27B4C8
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 23:08:58 +0200 (CEST)
Received: from localhost ([::1]:36424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsZMf-0003SD-KD
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 17:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39267)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hsZLG-0002Q5-4o
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 17:07:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hsZLF-0001Dn-5d
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 17:07:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37186)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hsZLC-00017k-FA
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 17:07:27 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 477E43082E61;
 Tue, 30 Jul 2019 21:07:20 +0000 (UTC)
Received: from localhost (ovpn-116-22.gru2.redhat.com [10.97.116.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7DC05D9CA;
 Tue, 30 Jul 2019 21:07:19 +0000 (UTC)
Date: Tue, 30 Jul 2019 18:07:18 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190730210718.GU4313@habkost.net>
References: <20190726120542.9894-1-armbru@redhat.com>
 <20190726120542.9894-24-armbru@redhat.com>
 <20190729194414.GG4313@habkost.net>
 <87d0hreqh3.fsf_-_@dusky.pond.sub.org>
 <8bea0201-f796-d682-22e6-069985b45523@redhat.com>
 <0eb2518f-147c-2b47-f48c-3af26bf5d264@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0eb2518f-147c-2b47-f48c-3af26bf5d264@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 30 Jul 2019 21:07:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC] HACKING: Document 'struct' keyword usage
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sometimes we use the 'struct' keyword to help us reduce
dependencies between header files.  Document that practice.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
I wonder if this is too terse?  Should we give examples?
---
 HACKING | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/HACKING b/HACKING
index 0fc3e0fc04..112685bdaf 100644
--- a/HACKING
+++ b/HACKING
@@ -101,6 +101,8 @@ it points to, or it is aliased to another pointer that is.
 
 2.3. Typedefs
 Typedefs are used to eliminate the redundant 'struct' keyword.
+However, the 'struct' keyword may be sometimes used in header
+files to avoid unnecessary dependencies between headers.
 
 2.4. Reserved namespaces in C and POSIX
 Underscore capital, double underscore, and underscore 't' suffixes should be
-- 
2.21.0


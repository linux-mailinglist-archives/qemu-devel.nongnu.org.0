Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD851A5246
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Apr 2020 15:07:13 +0200 (CEST)
Received: from localhost ([::1]:51830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jNFqq-0003vb-Ru
	for lists+qemu-devel@lfdr.de; Sat, 11 Apr 2020 09:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33239)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jNFnQ-00078C-JD
 for qemu-devel@nongnu.org; Sat, 11 Apr 2020 09:03:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jNFnO-0002ZU-Hg
 for qemu-devel@nongnu.org; Sat, 11 Apr 2020 09:03:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31484
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jNFnO-0002ZD-Dx
 for qemu-devel@nongnu.org; Sat, 11 Apr 2020 09:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586610218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XRLWXRytzTGVO0r/GudLCTGjNoCUKmXsKyZKPig2BiY=;
 b=ArOgNnEJ6ys8w9vRw72K0aJIr+DEBoXuUgcjWU5beSGAMLy1rptjtlDlFFmBb8Ra0M6b2x
 uEXm2T8lV+LsN/7jEYWJzAgaztB8Lj+U7/IW5nQRCP8Nlx9W4a1YRNluEl3kJjLPkax/A8
 04OHeAOfz4nFhVipCPCdk8dBMTUmktc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-1MyM_bcwPpOwxYSS4gWyrw-1; Sat, 11 Apr 2020 09:03:36 -0400
X-MC-Unique: 1MyM_bcwPpOwxYSS4gWyrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97A38107ACC4
 for <qemu-devel@nongnu.org>; Sat, 11 Apr 2020 13:03:35 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 615CC98A2B
 for <qemu-devel@nongnu.org>; Sat, 11 Apr 2020 13:03:35 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/8] rcu: do not mention atomic_mb_read/set in documentation
Date: Sat, 11 Apr 2020 09:03:27 -0400
Message-Id: <20200411130330.1993-6-pbonzini@redhat.com>
In-Reply-To: <20200411130330.1993-1-pbonzini@redhat.com>
References: <20200411130330.1993-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rcu.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/devel/rcu.txt b/docs/devel/rcu.txt
index d83fed2f79..0ce15ba198 100644
--- a/docs/devel/rcu.txt
+++ b/docs/devel/rcu.txt
@@ -132,7 +132,7 @@ The core RCU API is small:
=20
      typeof(*p) atomic_rcu_read(p);
=20
-        atomic_rcu_read() is similar to atomic_mb_read(), but it makes
+        atomic_rcu_read() is similar to atomic_load_acquire(), but it make=
s
         some assumptions on the code that calls it.  This allows a more
         optimized implementation.
=20
@@ -154,7 +154,7 @@ The core RCU API is small:
=20
      void atomic_rcu_set(p, typeof(*p) v);
=20
-        atomic_rcu_set() is also similar to atomic_mb_set(), and it also
+        atomic_rcu_set() is similar to atomic_store_release(), though it a=
lso
         makes assumptions on the code that calls it in order to allow a mo=
re
         optimized implementation.
=20
--=20
2.18.2




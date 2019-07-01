Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A327920EFA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 May 2019 20:55:35 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRLXS-0002t5-Tl
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 14:55:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hRLVW-00024y-1Z
	for qemu-devel@nongnu.org; Thu, 16 May 2019 14:53:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hRLVV-0003Fj-8b
	for qemu-devel@nongnu.org; Thu, 16 May 2019 14:53:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50652)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hRLVV-0003Fc-3V
	for qemu-devel@nongnu.org; Thu, 16 May 2019 14:53:33 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D465730605EF
	for <qemu-devel@nongnu.org>; Thu, 16 May 2019 18:53:24 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-28.ams2.redhat.com
	[10.36.112.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D5C51001E67;
	Thu, 16 May 2019 18:53:21 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 16 May 2019 20:53:20 +0200
Message-Id: <20190516185320.28340-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 16 May 2019 18:53:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] target/i386: add MDS-NO feature
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
Cc: berrange@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Microarchitectural Data Sampling is a hardware vulnerability which allows
unprivileged speculative access to data which is available in various CPU
internal buffers.

Some Intel processors use the ARCH_CAP_MDS_NO bit in the
IA32_ARCH_CAPABILITIES
MSR to report that they are not vulnerable, make it available to guests.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 722c5514d4..558347e6c3 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1184,7 +1184,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WO=
RDS] =3D {
         .type =3D MSR_FEATURE_WORD,
         .feat_names =3D {
             "rdctl-no", "ibrs-all", "rsba", "skip-l1dfl-vmentry",
-            "ssb-no", NULL, NULL, NULL,
+            "ssb-no", "mds-no", NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
--=20
2.21.0



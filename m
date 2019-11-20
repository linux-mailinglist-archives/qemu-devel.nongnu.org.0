Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6171D104170
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 17:52:02 +0100 (CET)
Received: from localhost ([::1]:60602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXTCz-0001zB-Dp
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 11:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48552)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iXTAR-0007NR-PS
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 11:49:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iXTAQ-0003xq-Qf
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 11:49:23 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33552
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iXTAQ-0003xm-N6
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 11:49:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574268562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R1RAWgOV2CTblgrdYixaE4iETE7/42c/P03VYu6Ffq0=;
 b=aKZTUsqyZfRieTLtP6IXeqavxvnUz8lCygyxJ+fOnnQb0OriPG77jSTINU+5ELnA5y2CsG
 vLRP7KT6+7Sp8oo3gsAk7taoNeC2Xe9XK5mIVZcp/JTTfHGTXAf12WAznKS2TYBoyeQeNL
 kfrTYPFzfI/PDykOEAHBkck6qf7fGzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-5cncTbPON4-lDRjPkoxGvA-1; Wed, 20 Nov 2019 11:49:19 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 514F18024EE;
 Wed, 20 Nov 2019 16:49:18 +0000 (UTC)
Received: from localhost (ovpn-116-6.gru2.redhat.com [10.97.116.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6EE651334;
 Wed, 20 Nov 2019 16:49:17 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-4.2 2/2] i386: Add -noTSX aliases for hle=off,
 rtm=off CPU models
Date: Wed, 20 Nov 2019 13:49:12 -0300
Message-Id: <20191120164912.32384-3-ehabkost@redhat.com>
In-Reply-To: <20191120164912.32384-1-ehabkost@redhat.com>
References: <20191120164912.32384-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 5cncTbPON4-lDRjPkoxGvA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiri Denemark <jdenemar@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have been trying to avoid adding new aliases for CPU model
versions, but in the case of changes in defaults introduced by
the TAA mitigation patches, the aliases might help avoid user
confusion when applying host software updates.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 0267e08612..56eb98ef35 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -2476,6 +2476,7 @@ static X86CPUDefinition builtin_x86_defs[] =3D {
             },
             {
                 .version =3D 3,
+                .alias =3D "Skylake-Client-noTSX-IBRS",
                 .props =3D (PropValue[]) {
                     { "hle", "off" },
                     { "rtm", "off" },
@@ -2551,6 +2552,7 @@ static X86CPUDefinition builtin_x86_defs[] =3D {
             },
             {
                 .version =3D 3,
+                .alias =3D "Skylake-Server-noTSX-IBRS",
                 .props =3D (PropValue[]) {
                     { "hle", "off" },
                     { "rtm", "off" },
@@ -2625,6 +2627,7 @@ static X86CPUDefinition builtin_x86_defs[] =3D {
               },
             },
             { .version =3D 3,
+              .alias =3D "Cascadelake-Server-noTSX",
               .props =3D (PropValue[]) {
                   { "hle", "off" },
                   { "rtm", "off" },
@@ -2692,6 +2695,7 @@ static X86CPUDefinition builtin_x86_defs[] =3D {
             { .version =3D 1 },
             {
                 .version =3D 2,
+                .alias =3D "Icelake-Client-noTSX",
                 .props =3D (PropValue[]) {
                     { "hle", "off" },
                     { "rtm", "off" },
@@ -2762,6 +2766,7 @@ static X86CPUDefinition builtin_x86_defs[] =3D {
             { .version =3D 1 },
             {
                 .version =3D 2,
+                .alias =3D "Icelake-Server-noTSX",
                 .props =3D (PropValue[]) {
                     { "hle", "off" },
                     { "rtm", "off" },
--=20
2.21.0



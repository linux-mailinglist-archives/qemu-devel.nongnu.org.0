Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3601F182541
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 23:54:41 +0100 (CET)
Received: from localhost ([::1]:59124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCAFM-0008KS-7t
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 18:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35575)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1jCACZ-00059t-8g
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 18:51:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1jCACY-0001Kb-5e
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 18:51:47 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59581
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1jCACY-0001Ix-2E
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 18:51:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583967105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6CeyFxpE0dbipoK5qOLRsfpJ9qo8SQO0msMtHg6OK8o=;
 b=DLmPeZ/452Cc2pFK8Nhbr4wLiNl+/8C3CuyZjn/60zKVm2UtaWtl5Jt7DGeTeFBK5ldZLg
 D1GXgU4f9ZfaMJHLIIdaGI+1Zs4dGHZYmxJ4jPKMC9MGjxqAq8/0Tusv0Nzlju3EVUbSTx
 CnArSFwXCU1+A41ZQ0wNFRzsRVk7Hwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-PTrbyr-cPZSkR3kDPa8KTA-1; Wed, 11 Mar 2020 18:51:42 -0400
X-MC-Unique: PTrbyr-cPZSkR3kDPa8KTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F24FBDB60;
 Wed, 11 Mar 2020 22:51:40 +0000 (UTC)
Received: from localhost (unused-10-15-17-6.yyz.redhat.com [10.15.17.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44DF35D9E5;
 Wed, 11 Mar 2020 22:51:38 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] mmap-alloc: Include osdep.h before checking CONFIG_LINUX
Date: Wed, 11 Mar 2020 18:51:30 -0400
Message-Id: <20200311225130.1599619-3-ehabkost@redhat.com>
In-Reply-To: <20200311225130.1599619-1-ehabkost@redhat.com>
References: <20200311225130.1599619-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, jingqi.liu@intel.com,
 Paolo Bonzini <pbonzini@redhat.com>, jtomko@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The CONFIG_LINUX check at the top of mmap-alloc.c never worked
because it was done before including osdep.h.

This means MAP_SYNC and MAP_SHARED_VALIDATE would always be set
to 0 at the beginning of the file.  Luckily, this didn't break
when using recent glibc versions (2.28+), because those macros
were redefined by glibc headers.

Move the CONFIG_LINUX check after the main include lines, so the
CONFIG_LINUX check works and we actually include <linux/mman.h>.
This will make MAP_SYNC and MAP_SHARED_VALIDATE available even if
the host has an older glibc version.

Reported-by: Jingqi Liu <jingqi.liu@intel.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 util/mmap-alloc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 27dcccd8ec..7c2ce98eb0 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -9,6 +9,9 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or
  * later.  See the COPYING file in the top-level directory.
  */
+#include "qemu/osdep.h"
+#include "qemu/mmap-alloc.h"
+#include "qemu/host-utils.h"
=20
 #ifdef CONFIG_LINUX
 #include <linux/mman.h>
@@ -17,10 +20,6 @@
 #define MAP_SHARED_VALIDATE   0x0
 #endif /* CONFIG_LINUX */
=20
-#include "qemu/osdep.h"
-#include "qemu/mmap-alloc.h"
-#include "qemu/host-utils.h"
-
 #define HUGETLBFS_MAGIC       0x958458f6
=20
 #ifdef CONFIG_LINUX
--=20
2.24.1



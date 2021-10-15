Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC7642ED8B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:25:43 +0200 (CEST)
Received: from localhost ([::1]:34910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJTC-0002TR-4A
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mbJKS-0003Py-47
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:16:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mbJKQ-0001kY-GB
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:16:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634289397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UGDPpjqpQeHrXsmjltWUwnqUzIsX8Ibz8jD/HlvLcfc=;
 b=A3ZKOlqYLL9wSOz/GoFp0E+DGtWGcQ7JLZRSxoaeIa4Fm2L6I12zC/8DXg/FFXCkyUWG4Y
 hMYGF8snD+qBqn5kkcdyyGXbMMdXqhLqXtW6H94zrX6VALLmY14tvCbx6CeJx4NkU0+UCx
 NljjxefkLEnlMuMem9td/qr8OUNyvgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-1paqSPI4OpmlKkHlOkobiQ-1; Fri, 15 Oct 2021 05:16:32 -0400
X-MC-Unique: 1paqSPI4OpmlKkHlOkobiQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9A4CA40C0;
 Fri, 15 Oct 2021 09:16:31 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC7FF1B5C0;
 Fri, 15 Oct 2021 09:16:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 6/6] dtc: Update to version 1.6.1
Date: Fri, 15 Oct 2021 11:16:22 +0200
Message-Id: <20211015091622.1302433-7-thuth@redhat.com>
In-Reply-To: <20211015091622.1302433-1-thuth@redhat.com>
References: <20211015091622.1302433-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The dtc submodule is currently pointing to non-release commit. It's nicer
if submodules point to release versions instead and since dtc 1.6.1 is
available now, let's update to that version.

Message-Id: <20210827120901.150276-4-thuth@redhat.com>
Acked-by: Greg Kurz <groug@kaod.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 dtc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dtc b/dtc
index 85e5d83984..b6910bec11 160000
--- a/dtc
+++ b/dtc
@@ -1 +1 @@
-Subproject commit 85e5d839847af54efab170f2b1331b2a6421e647
+Subproject commit b6910bec11614980a21e46fbccc35934b671bd81
-- 
2.27.0



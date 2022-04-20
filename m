Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFABA508D9B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:45:46 +0200 (CEST)
Received: from localhost ([::1]:36822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDSb-0000vE-Rb
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nhCnb-0006MT-Fo
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:03:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nhCnZ-0005Sa-SV
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:03:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650470601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sKUPHbueU81GQeEGpcVJ2R2Is9ShraGTxlyWsPeHcTQ=;
 b=MzI1MWs+q7AWr+dBm+BnPRmHiwjJEvVCI34OPe42kUa8nP57JvrNOYL27K0L0a4/GNSzU1
 9t9BRu2kTqR/DMfikt6L4UPs1rjw5/+JX2vFSNtKyGD/z/JlVIVaSTOrsbsmHkBm+jX9xg
 59p62Id4FTqRXZUKeTXrVHNlSqM+Ztk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-Q_rASa2gNsuvglPce9VVIw-1; Wed, 20 Apr 2022 12:03:19 -0400
X-MC-Unique: Q_rASa2gNsuvglPce9VVIw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 828421C05141
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 16:03:19 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB8A2200B663;
 Wed, 20 Apr 2022 16:03:18 +0000 (UTC)
From: Andrea Bolognani <abologna@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] docs: build-platforms: Clarify stance on minor releases
 and backports
Date: Wed, 20 Apr 2022 18:03:11 +0200
Message-Id: <20220420160311.248079-3-abologna@redhat.com>
In-Reply-To: <20220420160311.248079-1-abologna@redhat.com>
References: <20220420160311.248079-1-abologna@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These changes match those made in the following libvirt commits:

  2ac78307af docs: Clarify our stance on backported packages
  78cffd450a docs: Spell out our policy concerning minor releases

Since QEMU's platform support policy is based on libvirt's, it
makes sense to mirror these recent changes made to the latter.

The policy is not altered significantly - we're simply spelling
out some rules that were likely already being implicitly
enforced.

Signed-off-by: Andrea Bolognani <abologna@redhat.com>
---
 docs/about/build-platforms.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index e9163ba556..dce6557bd4 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -71,7 +71,10 @@ The project aims to support the most recent major version at all times. Support
 for the previous major version will be dropped 2 years after the new major
 version is released or when the vendor itself drops support, whichever comes
 first. In this context, third-party efforts to extend the lifetime of a distro
-are not considered, even when they are endorsed by the vendor (eg. Debian LTS).
+are not considered, even when they are endorsed by the vendor (eg. Debian LTS);
+the same is true of repositories that contain packages backported from later
+releases (e.g. Debian backports). Within each major release, only the most
+recent minor release is considered.
 
 For the purposes of identifying supported software versions available on Linux,
 the project will look at CentOS, Debian, Fedora, openSUSE, RHEL, SLES and
-- 
2.35.1



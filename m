Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9EF3A98DF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 13:09:16 +0200 (CEST)
Received: from localhost ([::1]:35946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltTQ3-0007p8-EJ
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 07:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ltTOU-0005iz-4w
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 07:07:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ltTOQ-0000E7-U5
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 07:07:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623841652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4K4+LOxvsL81Ia4tWHSqkCovDNLAINuwxFoaFyzSnKo=;
 b=NskUeMjVENnTfkGfMpgy2lYMKUFd8AidP2DpXtbOV93lH4+UI+KG90duzUS4DDGDox/STu
 Y/PiS9wGn4bOuQr8AH6U978ysTl8LM9DFNYnOvZFKQSQ/ynunCyR/2TuDxCqWBsm2wWnQH
 LXD4zQ0dyIRpdh6ctSv2ZSt+wIdvzdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-HLk2IEL_Pq-WAuyDF_VYUA-1; Wed, 16 Jun 2021 07:07:30 -0400
X-MC-Unique: HLk2IEL_Pq-WAuyDF_VYUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC5FD1084F4A
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 11:07:29 +0000 (UTC)
Received: from thuth.com (ovpn-114-83.ams2.redhat.com [10.36.114.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7507360853;
 Wed, 16 Jun 2021 11:07:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [qemu-web PATCH 1/4] Show only the latest three releases on the
 website
Date: Wed, 16 Jun 2021 13:07:17 +0200
Message-Id: <20210616110720.880586-2-thuth@redhat.com>
In-Reply-To: <20210616110720.880586-1-thuth@redhat.com>
References: <20210616110720.880586-1-thuth@redhat.com>
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
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_OTHER_BAD_TLD=1.997, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: berrange@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is only maintaining the very latest releases, so this
could be the current RC version, followed by the current stable release
and maybe also still the previous stable release (in case there are
severe bugs). But it does not make sense to show a fourth release that
we very likely do not update anymore. Thus don't show the fourth release
anymore to avoid that people still get the impression that we support
it (and then report bugs in that old release that we do not maintain
anymore).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 _includes/releases.html | 2 +-
 assets/css/style.css    | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/_includes/releases.html b/_includes/releases.html
index 2e95631..5600e10 100644
--- a/_includes/releases.html
+++ b/_includes/releases.html
@@ -1,5 +1,5 @@
 <ul>
-{% for release in site.data.releases offset: 0 limit: 4 %}
+{% for release in site.data.releases offset: 0 limit: 3 %}
 <li><strong><a
   href="https://download.qemu.org/qemu-{{release.branch}}.{{release.patch}}.tar.xz">{{release.branch}}.{{release.patch}}</a></strong>
   {{release.date}}<br><a
diff --git a/assets/css/style.css b/assets/css/style.css
index 7f018b4..6ee82c4 100644
--- a/assets/css/style.css
+++ b/assets/css/style.css
@@ -477,13 +477,15 @@
 	#releases ul, #releases p
 	{
 		margin: 0em;
+		padding-left: 0.2em;
+		padding-right: 0.2em;
 	}
 
 	#releases ul > li
 	{
 		list-style: none;
 		display: inline-block;
-		width: 40%;
+		width: 30%;
 		margin: 1em 0em;
 	}
 
-- 
2.27.0



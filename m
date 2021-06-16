Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AB73A98E6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 13:10:53 +0200 (CEST)
Received: from localhost ([::1]:40690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltTRc-00030G-CT
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 07:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ltTOV-0005jI-2H
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 07:07:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ltTOT-0000GF-Bo
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 07:07:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623841656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yUkuOGdOUg+sN3O5jx7J8jR5fAg+di6+WUj0FI8ii9o=;
 b=BQ7O5t2RUbcd5iiBYxnHy+ZVbWc6WrManu8nkc4k10/9VQoUwRib9NU7nHuk7eqYN2YCUg
 M5gMFU3grMLx3/t0ScI1bJTgp4y1DIqQGo7ydzwinnoZffTMpexCFgRX7FQ2HY1/uSgkya
 iHNBnIcBAZa4pp3H/TBP13HA0nJs6bw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-IKrX3hOYN9ytA_Q6O0wJhA-1; Wed, 16 Jun 2021 07:07:35 -0400
X-MC-Unique: IKrX3hOYN9ytA_Q6O0wJhA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15515801B12
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 11:07:34 +0000 (UTC)
Received: from thuth.com (ovpn-114-83.ams2.redhat.com [10.36.114.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8DBB60853;
 Wed, 16 Jun 2021 11:07:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [qemu-web PATCH 4/4] Present the source code on the first tab of the
 download page
Date: Wed, 16 Jun 2021 13:07:20 +0200
Message-Id: <20210616110720.880586-5-thuth@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The QEMU project provides the source code of QEMU, and not any
binaries. So most people will come here for downloading the latest
version of the source code and not for getting instructions on
how to install the pre-packaged QEMU of their favourite distribution.
Thus let's put the information about the source code first.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 download.html | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/download.html b/download.html
index e3fc789..a2e4187 100644
--- a/download.html
+++ b/download.html
@@ -5,12 +5,19 @@ permalink: /download/
 
 <div class="horiz-menu">
 <ul style="display: none;">
+<li><a href="#source">Source code</a></li>
 <li><a href="#linux">Linux</a></li>
 <li><a href="#macos">macOS</a></li>
 <li><a href="#windows">Windows</a></li>
-<li><a href="#source">Source code</a></li>
 </ul>
 
+<article id="source" class="active">
+	<header>
+	<h2>Source code</h2>
+	</header>
+	{% include_relative _download/source.html %}
+</article>
+
 <article id="linux" class="active">
 	<header>
 	<h2>Linux</h2>
@@ -32,12 +39,6 @@ permalink: /download/
 	{% markdown_relative _download/windows.md %}
 </article>
 
-<article id="source" class="active">
-	<header>
-	<h2>Source code</h2>
-	</header>
-	{% include_relative _download/source.html %}
-</article>
 </div>
 
 <h2>Version numbering</h2>
-- 
2.27.0



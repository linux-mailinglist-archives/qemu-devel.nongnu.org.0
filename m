Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4F43A98E8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 13:11:50 +0200 (CEST)
Received: from localhost ([::1]:42892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltTSX-0004a1-L3
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 07:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ltTOe-00066n-9A
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 07:07:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ltTOb-0000My-AJ
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 07:07:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623841664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cYchyjIs12O3xvBHNPz0VFv5riBNvjvkLrpYavtgQxI=;
 b=fPypU70ZceG1YfhZPLSrGOs/0OU7EtZvBNHKw41iGzYbjHZ9frkJRdBi+aXwRxaqmUP9Jl
 /5XXTlf0d4r0t5jgbrEEGLGR3eYXAH0h7EmUSRkaNhDENDPPyUoQSzLTFQTMJBnApqVf9g
 xFITvv6sr4Cdw5TvWABbDj5fbjpgkaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-_nIsaoyxOCmg-aIPEdImow-1; Wed, 16 Jun 2021 07:07:33 -0400
X-MC-Unique: _nIsaoyxOCmg-aIPEdImow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9645D800C60
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 11:07:32 +0000 (UTC)
Received: from thuth.com (ovpn-114-83.ams2.redhat.com [10.36.114.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7573360853;
 Wed, 16 Jun 2021 11:07:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [qemu-web PATCH 3/4] State that there is no official support for
 older releases
Date: Wed, 16 Jun 2021 13:07:19 +0200
Message-Id: <20210616110720.880586-4-thuth@redhat.com>
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

Looking at some new tickets in the bug tracker, some people still
seem to expect support for older releases. Let's make it a little
bit more clear that the QEMU project only focuses on the very latest
version.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 support.md | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support.md b/support.md
index b622362..82f7af1 100644
--- a/support.md
+++ b/support.md
@@ -13,7 +13,8 @@ through your distribution's support channels. This includes questions
 about a specifically packaged version of QEMU. The QEMU developers are
 generally concerned with the latest release and the current state of
 the [master branch](https://gitlab.com/qemu-project/qemu) and do not
-provide support for QEMU binaries shipped by Linux distributions.
+provide support for older releases or QEMU binaries shipped by third
+party distributions.
 
 Questions about complex configurations of networking and storage are
 usually met with a recommendation to use management tools like
-- 
2.27.0



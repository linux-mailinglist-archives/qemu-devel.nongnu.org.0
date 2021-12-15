Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAB3476464
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 22:14:39 +0100 (CET)
Received: from localhost ([::1]:41642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbbh-0003TR-CP
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 16:14:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbWB-0003nE-Gl
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:08:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbW7-0006a1-NF
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:08:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639602527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=90bZQlHdiLMIw1BVb5+Nt9AjomLDQPfh2SOKL5Mzu8s=;
 b=MOIlBBAPOayCOMaccqiS9CGsT9hG9VvVvUMZNp/ghMrq28ul7Uc/GG+gnmZAQ6Jm2oWJ9n
 QIVEHiTsakp8ozGREwTQl5U2Ez1RDmS8bE0/UI5QVoyjpug4J0pN7YF6vhh96ZO+2ByKfk
 a1cAcIAuOMG5Td5FPoHPXKz2s2S8ToM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-LDbEkwwdOOicZRRbOMAVqQ-1; Wed, 15 Dec 2021 16:08:46 -0500
X-MC-Unique: LDbEkwwdOOicZRRbOMAVqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11E71760CC;
 Wed, 15 Dec 2021 21:08:45 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BD2B5F4EF;
 Wed, 15 Dec 2021 21:08:35 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu.qmp PATCH 05/24] Update project URLs
Date: Wed, 15 Dec 2021 16:06:15 -0500
Message-Id: <20211215210634.3779791-6-jsnow@redhat.com>
In-Reply-To: <20211215210634.3779791-1-jsnow@redhat.com>
References: <20211215210634.3779791-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Point to this library's URLs instead of the entire project's.

FIXME: In development, the URLs here are jsnow/qemu.qmp. It is intended
that the production version that gets pushed to qemu-project/qemu.qmp
will use URLs that reflect that repository appropriately.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 setup.cfg | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/setup.cfg b/setup.cfg
index 9946875..0f14bda 100644
--- a/setup.cfg
+++ b/setup.cfg
@@ -5,8 +5,10 @@ author = John Snow
 author_email = jsnow@redhat.com
 maintainer = QEMU Project
 maintainer_email = qemu-devel@nongnu.org
-url = https://www.qemu.org/
-download_url = https://www.qemu.org/download/
+# NOTE: Remember to update the commit message when changing these URLs.
+url = https://gitlab.com/jsnow/qemu.qmp
+download_url = https://gitlab.com/jsnow/qemu.qmp/-/packages
+# NOTE: Remember to update the commit message when changing these URLs.
 description = QEMU Monitor Protocol library.
 long_description = file:PACKAGE.rst
 long_description_content_type = text/x-rst
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6241628546E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 00:22:04 +0200 (CEST)
Received: from localhost ([::1]:42588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPvLP-0001sB-Ef
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 18:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPv9h-0006vu-0M
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 18:10:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPv9d-0006Pu-KH
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 18:09:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602022192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6j4I3T1AQxgWNexEUqKVfn14dDoHgmXBvUQWwTTcuq4=;
 b=G2udnyJ5qc+nJUtR7Os8zr7HwnZG9hFIMhY0afIHjncUuEgjGUAlpNofeF+l90TwLBItnr
 Zz2BbfAtbM1ru+M5URqsWt+mCt62aYmafsCf7Mh1ZHz7pb243JNXP/CAELMP991KVbHDmG
 H3rlI174mURBFEnw1urIpcNPdA71hCM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-1HVqyq8EM9igAnVVgrSDGQ-1; Tue, 06 Oct 2020 18:09:50 -0400
X-MC-Unique: 1HVqyq8EM9igAnVVgrSDGQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADD218064B1;
 Tue,  6 Oct 2020 22:09:49 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70C936EF47;
 Tue,  6 Oct 2020 22:09:49 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 11/21] docs/devel/qom: Fix indentation of bulleted list
Date: Tue,  6 Oct 2020 18:09:20 -0400
Message-Id: <20201006220930.908275-12-ehabkost@redhat.com>
In-Reply-To: <20201006220930.908275-1-ehabkost@redhat.com>
References: <20201006220930.908275-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 00:55:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The list was incorrectly parsed as a literal block due to
indentation.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201003025424.199291-3-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 docs/devel/qom.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
index 0b943b2a1a..c4857d95c8 100644
--- a/docs/devel/qom.rst
+++ b/docs/devel/qom.rst
@@ -8,9 +8,9 @@ The QEMU Object Model provides a framework for registering user creatable
 types and instantiating objects from those types.  QOM provides the following
 features:
 
- - System for dynamically registering types
- - Support for single-inheritance of types
- - Multiple inheritance of stateless interfaces
+- System for dynamically registering types
+- Support for single-inheritance of types
+- Multiple inheritance of stateless interfaces
 
 .. code-block:: c
    :caption: Creating a minimal type
-- 
2.26.2



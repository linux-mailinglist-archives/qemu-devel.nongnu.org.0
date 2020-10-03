Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33312820AE
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Oct 2020 04:56:51 +0200 (CEST)
Received: from localhost ([::1]:55180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOXj8-000273-Ot
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 22:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kOXh0-0000Jn-C8
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 22:54:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kOXgx-0006lE-2s
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 22:54:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601693674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2A5cF6gZOkcZ7CSA+401TXofEcmZp/VoxSCPPiuAYaE=;
 b=d4rMCy4NyVn3ytFvHlUZTgkynUauMxlER1Ho1ClxXYLgMeJVZJ7JgG3zFOnnGQCYp/cmd+
 BUumQMPoPlH1OfYYhLpRXW302VowDcINNuoq0XmXEpFTAGnYkp5mv4IYHr6Nq8U+K8fvKc
 MIqBWqXxDmZTQEnFx+UtYkJNHN+u3Kk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-5JBEQCVIOdiVcbdrgbErtg-1; Fri, 02 Oct 2020 22:54:32 -0400
X-MC-Unique: 5JBEQCVIOdiVcbdrgbErtg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7201C1074648
 for <qemu-devel@nongnu.org>; Sat,  3 Oct 2020 02:54:31 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 377161992F;
 Sat,  3 Oct 2020 02:54:31 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] docs/devel/qom: Use *emphasis* for emphasis
Date: Fri,  2 Oct 2020 22:54:22 -0400
Message-Id: <20201003025424.199291-5-ehabkost@redhat.com>
In-Reply-To: <20201003025424.199291-1-ehabkost@redhat.com>
References: <20201003025424.199291-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 21:59:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

<emphasis> is not valid reST syntax.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 docs/devel/qom.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
index a47e1b9a239..0c610e20d62 100644
--- a/docs/devel/qom.rst
+++ b/docs/devel/qom.rst
@@ -174,17 +174,17 @@ dynamically cast it to an object that implements the interface.
 Methods
 =======
 
-A <emphasis>method</emphasis> is a function within the namespace scope of
+A *method* is a function within the namespace scope of
 a class. It usually operates on the object instance by passing it as a
 strongly-typed first argument.
 If it does not operate on an object instance, it is dubbed
-<emphasis>class method</emphasis>.
+*class method*.
 
 Methods cannot be overloaded. That is, the #ObjectClass and method name
 uniquely identity the function to be called; the signature does not vary
 except for trailing varargs.
 
-Methods are always <emphasis>virtual</emphasis>. Overriding a method in
+Methods are always *virtual*. Overriding a method in
 #TypeInfo.class_init of a subclass leads to any user of the class obtained
 via OBJECT_GET_CLASS() accessing the overridden function.
 The original function is not automatically invoked. It is the responsibility
-- 
2.26.2



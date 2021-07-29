Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7AE3DAA9D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 20:01:41 +0200 (CEST)
Received: from localhost ([::1]:34210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9ALj-0002SF-PF
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 14:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m9AGO-0006VO-Vs
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:56:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m9AGL-0007vj-Sb
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627581364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ONvZn/eqpVhDcFV+idKq4az2nOISBx6LR+BPKVwnOls=;
 b=IKx9DLuTLOzcuMS7KoKzjc4PzMZKnCq/SZCn+PvZ0tm7I3EzIzaTlBYWUn32CjBsB7yYvx
 YzQnSQqrzaAJFkK44Z0QwwvH2AGPkL0mtCk6PQgRKwTWnQKURy/lYjJ3P/1+rXzYImXjax
 qC1G3FNaLhiBzeV3V+M0U34JQhW72xk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-Oi-Vmm3NNAGwKJs8bn1X3Q-1; Thu, 29 Jul 2021 13:56:03 -0400
X-MC-Unique: Oi-Vmm3NNAGwKJs8bn1X3Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F2E2800D55
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 17:56:02 +0000 (UTC)
Received: from localhost (unknown [10.22.18.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 130EE60875;
 Thu, 29 Jul 2021 17:55:58 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 05/10] docs: qom: Add subsection headings to
 declaration/definition macros section
Date: Thu, 29 Jul 2021 13:55:49 -0400
Message-Id: <20210729175554.686474-6-ehabkost@redhat.com>
In-Reply-To: <20210729175554.686474-1-ehabkost@redhat.com>
References: <20210729175554.686474-1-ehabkost@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Add two new subsection headings to make the separation between
"declaration macros" and "definition macros" more visible.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 docs/devel/qom.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
index 3f48016aa8f..05d045bf570 100644
--- a/docs/devel/qom.rst
+++ b/docs/devel/qom.rst
@@ -285,6 +285,9 @@ convention. To reduce the amount of boilerplate code that needs to be
 written for a new type there are two sets of macros to generate the
 common parts in a standard format.
 
+Type declaration macros
+-----------------------
+
 A type is declared using the ``OBJECT_DECLARE`` macro family. In types
 which do not require any virtual functions in the class, the
 `OBJECT_DECLARE_SIMPLE_TYPE` macro is suitable, and is commonly placed
@@ -323,6 +326,9 @@ struct, then the alternative `OBJECT_DECLARE_TYPE()` macro can be
 used. This does the same as `OBJECT_DECLARE_SIMPLE_TYPE()`, but without
 the 'struct MyDeviceClass' definition.
 
+Type definition macros
+----------------------
+
 To implement the type, the ``OBJECT_DEFINE`` macro family is available.
 In the simple case the `OBJECT_DEFINE_TYPE()` macro is suitable:
 
-- 
2.31.1



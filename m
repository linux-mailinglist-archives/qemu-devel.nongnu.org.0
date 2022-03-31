Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D644EDAFF
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 15:58:44 +0200 (CEST)
Received: from localhost ([::1]:55262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZvJz-0004hv-3a
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 09:58:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nZvIU-0003Hg-Do
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:57:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nZvIR-0008Lz-2z
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648735026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w8CWsUaPmFaz0qsqJ/uPESvf/AZ6rVMQM+s/fOt6XGI=;
 b=XnWvQzN9dNO8g4ITC85QN8y4fHLSMl1H3SGlZr7PuPgBPSPUsvgpNnVyiDE7rroVROwtqO
 V/eB1M+hFLBXCGFN3siF5b2ZqEDMMNogJuKmBypAWo/jGcfOE59hGr16/c3JwDeInpc1eV
 BDyZRUb6NSsE5TBusPeFgu++0gsUauo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-2pdeOqcbNmaExgJ_uRgvZw-1; Thu, 31 Mar 2022 09:57:05 -0400
X-MC-Unique: 2pdeOqcbNmaExgJ_uRgvZw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F4402800F88
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 13:57:04 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B13C140265A;
 Thu, 31 Mar 2022 13:56:54 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] doc/build-platforms: document supported compilers
Date: Thu, 31 Mar 2022 17:56:47 +0400
Message-Id: <20220331135647.1686375-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220331135647.1686375-1-marcandre.lureau@redhat.com>
References: <20220331135647.1686375-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

According to our configure checks, this is the list of supported
compilers.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/about/build-platforms.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index c29a4b8fe649..1980c5d2476f 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -92,6 +92,16 @@ hosted on Linux (Debian/Fedora).
 The version of the Windows API that's currently targeted is Vista / Server
 2008.
 
+Supported compilers
+-------------------
+
+To compile, QEMU requires either:
+
+- GCC >= 7.4.0
+- Clang >= 6.0
+- XCode Clang >= 10.0
+
+
 .. _HomeBrew: https://brew.sh/
 .. _MacPorts: https://www.macports.org/
 .. _Repology: https://repology.org/
-- 
2.35.1.693.g805e0a68082a



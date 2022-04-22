Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9B350C010
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 21:00:52 +0200 (CEST)
Received: from localhost ([::1]:34452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhyWR-00020G-74
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 15:00:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhyLl-0000Tz-Bq
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:49:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhyLj-0007tc-OU
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650653387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EdB9jcPw4+NI6vzZJGsKEeZnSzyww1lHLdpZN+d/qKc=;
 b=AKBNv6ausSdfjTbPBnSBfzKLK7EnZttL3ujKoXHiW2jL62tsKx13wsXsAKqnqDEcZqjWqO
 emQaNuva2+pDkG0HTbZwK/Yh1ZYtTCrehJpPJwEmHx2dqmXGpi7yLwHO0loErg4qojAaEy
 nvZJshQv8NuatrurAtvUj3GBUKk4U/g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-ulp043kqPjiOgm01oz91Rw-1; Fri, 22 Apr 2022 14:49:45 -0400
X-MC-Unique: ulp043kqPjiOgm01oz91Rw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A228D1066682
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 18:49:45 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.10.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 629C71468940;
 Fri, 22 Apr 2022 18:49:45 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu.qmp PATCH 12/12] update VERSION to 0.0.0a1
Date: Fri, 22 Apr 2022 14:49:40 -0400
Message-Id: <20220422184940.1763958-13-jsnow@redhat.com>
In-Reply-To: <20220422184940.1763958-1-jsnow@redhat.com>
References: <20220422184940.1763958-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: John Snow <jsnow@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu.qmp will be independently versioned, without regard to QEMU
version. While the repo is being established here, set the version to
something impossibly low.

Later, I intend to introduce automatic versioning based on git
tags. While the repo is being established it's going to be
easier to have a static version while we get bootstrapped.

(Note: PyPI already has a 0.0.0a0 version which I uploaded without prior
review to aid in developing and testing this series. This version, and
all 0.0.0 pre-release versions, will be buried after the first "real"
release, expected to be 0.0.1.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 VERSION | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/VERSION b/VERSION
index c19f3b8..7741e1a 100644
--- a/VERSION
+++ b/VERSION
@@ -1 +1 @@
-0.6.1.0a1
+0.0.0a1
-- 
2.34.1



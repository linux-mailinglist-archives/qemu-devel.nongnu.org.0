Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D851E0F53
	for <lists+qemu-devel@lfdr.de>; Mon, 25 May 2020 15:22:00 +0200 (CEST)
Received: from localhost ([::1]:44054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdD3I-0000An-0P
	for lists+qemu-devel@lfdr.de; Mon, 25 May 2020 09:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jdD0L-0003kS-9T
 for qemu-devel@nongnu.org; Mon, 25 May 2020 09:18:57 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20460
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jdD0K-0004C9-Ka
 for qemu-devel@nongnu.org; Mon, 25 May 2020 09:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590412735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IM3RMQWtmr0vX7tqqXmDotr9iKEnvD2UUAMbokanaaI=;
 b=LegjlOZ/UlPXYBeOVQBSdFnOctJ2cJaZU5T4acBmaEefOBe3qIVLJszPqnrwJdnCQgjfvw
 PpHuCAe7rKqmOvRqT3cTSRWD3IdJdmdowCCRWTUqhy36yKv9z9gb1lfyqPCiiZDYwJLnVk
 FZ+zNzEobLYfnMWP18PqK6MspYWSLNc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-8Ev-_w7-NbatEXYialJoyg-1; Mon, 25 May 2020 09:18:53 -0400
X-MC-Unique: 8Ev-_w7-NbatEXYialJoyg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C04CF8014D7;
 Mon, 25 May 2020 13:18:52 +0000 (UTC)
Received: from thuth.com (ovpn-113-78.ams2.redhat.com [10.36.113.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC0875C1BB;
 Mon, 25 May 2020 13:18:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] gitlab-ci: Remove flex/bison packages
Date: Mon, 25 May 2020 15:18:18 +0200
Message-Id: <20200525131823.715-3-thuth@redhat.com>
In-Reply-To: <20200525131823.715-1-thuth@redhat.com>
References: <20200525131823.715-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 02:40:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

QEMU does not use flex/bison packages.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200515163029.12917-4-philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b889fb96b6..994774250f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -4,7 +4,7 @@ include:
 
 before_script:
  - apt-get update -qq
- - apt-get install -y -qq flex bison libglib2.0-dev libpixman-1-dev genisoimage
+ - apt-get install -y -qq libglib2.0-dev libpixman-1-dev genisoimage
 
 build-system1:
  script:
-- 
2.18.1



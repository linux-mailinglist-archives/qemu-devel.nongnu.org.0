Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847142AD47F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:13:52 +0100 (CET)
Received: from localhost ([::1]:53458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRax-0000MN-G7
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRZ4-00071o-Om
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:11:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRZ2-0004ZX-Ie
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:11:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605006711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uhF69qYTmE8UeEZ865ZbtiAAzJc8rpDcWvWTvBwG7fk=;
 b=M2W8dkN3k7JodqEWATrDQi+xd7ZezRc8MrVgJxnPEZvdp5tAYZ9fjBBcAa+9glxBiAhBSw
 EEIdVoeHOCAgSBPmChf8Zh8aklj5oVijTLr7K7FeWdwXnVcnrDrQnaR6cp5s9jSrsOwO3x
 BsoFZUolwpRuSdmj+aklMumPBF8+eXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-vZmYuV0rPXmEdWk5AKzkrA-1; Tue, 10 Nov 2020 06:11:49 -0500
X-MC-Unique: vZmYuV0rPXmEdWk5AKzkrA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 885561006C9B;
 Tue, 10 Nov 2020 11:11:48 +0000 (UTC)
Received: from thuth.com (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEA5F1002C11;
 Tue, 10 Nov 2020 11:11:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/19] gitlab-ci: Drop generic cache rule
Date: Tue, 10 Nov 2020 12:11:19 +0100
Message-Id: <20201110111132.559399-7-thuth@redhat.com>
In-Reply-To: <20201110111132.559399-1-thuth@redhat.com>
References: <20201110111132.559399-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

This cache rule is meant for Avocado artifacts, but affects
all jobs. Moreover the 'acceptance_template' template already
include a more detailled rule to cache artifacts.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201108221925.2344515-2-philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3b15ae5c30..5763318d37 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -7,12 +7,6 @@ stages:
   - build
   - test
 
-# We assume GitLab has it's own caching set up for RPM/APT repositories so we
-# just take care of avocado assets here.
-cache:
-  paths:
-    - $HOME/avocado/data/cache
-
 include:
   - local: '/.gitlab-ci.d/edk2.yml'
   - local: '/.gitlab-ci.d/opensbi.yml'
-- 
2.18.4



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E78453BC706
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 09:21:11 +0200 (CEST)
Received: from localhost ([::1]:43004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0fOI-0006Ku-Er
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 03:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0fN1-0005Me-0v
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:19:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0fMz-0003J9-44
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625555987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LXdZjpLT0Q4F8B7U8BcYIWVyLI5QRxT948YAxO/QHk8=;
 b=HvsZiMpVYb/mYeB9zoabYdLERs5G91TEQ6/znOUc9oo0PyjGn8KST61jWJOEbnszfIg6DC
 Lq8i9wriXvBOO0AchRVdwAGHqIA2WplC42SpoZ+X/fNqJiKOHYnx3KdN4IrixE39DuWUL4
 aKi5t+nPUalU806kqn3qB79XWdyABgk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-ObaOKVpJMQucYTWXWyktmA-1; Tue, 06 Jul 2021 03:19:46 -0400
X-MC-Unique: ObaOKVpJMQucYTWXWyktmA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48556106B7E0;
 Tue,  6 Jul 2021 07:19:38 +0000 (UTC)
Received: from thuth.com (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F77860877;
 Tue,  6 Jul 2021 07:19:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: Remove the OBJCC variable from config-host.mak
Date: Tue,  6 Jul 2021 09:19:34 +0200
Message-Id: <20210706071934.1054496-1-thuth@redhat.com>
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
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The last user of this variable has been removed in commit
660f793093 ("Makefile: inline the relevant parts of rules.mak"),
so we don't need this variable in config-host.mak anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index e799d908a3..068716a56c 100755
--- a/configure
+++ b/configure
@@ -5888,7 +5888,6 @@ if $iasl -h > /dev/null 2>&1; then
   echo "CONFIG_IASL=$iasl" >> $config_host_mak
 fi
 echo "CXX=$cxx" >> $config_host_mak
-echo "OBJCC=$objcc" >> $config_host_mak
 echo "AR=$ar" >> $config_host_mak
 echo "ARFLAGS=$ARFLAGS" >> $config_host_mak
 echo "AS=$as" >> $config_host_mak
-- 
2.27.0



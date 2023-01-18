Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DA3671AC4
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 12:35:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI6iq-0004mX-1c; Wed, 18 Jan 2023 06:35:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI6iB-0004P3-Gh
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:34:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI6i5-0007WE-UK
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:34:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674041669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zK7qevaWSFAlMrFDDCx9A8hQMQQt6ex6SAGQK4qS7Ug=;
 b=U1KBjcwLvTe4h3L4mHBEU7KjoH622mkRdTYhL1eJsjIncQ8a3DZfwhCNE7nM0hJy/dFMye
 fXwojiVaDv0kv1vEIpWJZfGUEwob4sFnLF+dzOOs/IuhEEnGHqXf/0BjbAr6PVaybj5pxE
 FKUpLG1lGe0P+xCGo4ryr8NltyE5MRA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-69n91BqBMSu9PBfsglSrDw-1; Wed, 18 Jan 2023 06:34:26 -0500
X-MC-Unique: 69n91BqBMSu9PBfsglSrDw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD51F3C1485A;
 Wed, 18 Jan 2023 11:34:25 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C655492B00;
 Wed, 18 Jan 2023 11:34:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 4/9] MAINTAINERS: Remove bouncing mail address from Kamil
 Rytarowski
Date: Wed, 18 Jan 2023 12:34:13 +0100
Message-Id: <20230118113418.1650416-5-thuth@redhat.com>
In-Reply-To: <20230118113418.1650416-1-thuth@redhat.com>
References: <20230118113418.1650416-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When sending mail to Kamil's address, it's bouncing with a message
that the mailbox is full. This already happens since summer 2022,
and the last message that Kamil sent to the qemu-devel mailing list
is from November 2021 (as far as I can see), so we unfortunately
have to assume that this e-mail address is not valid anymore.

Message-Id: <20230113081735.1148057-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0fe50d01e3..08ad1e5341 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -511,7 +511,6 @@ F: target/i386/hax/
 Guest CPU Cores (NVMM)
 ----------------------
 NetBSD Virtual Machine Monitor (NVMM) CPU support
-M: Kamil Rytarowski <kamil@netbsd.org>
 M: Reinoud Zandijk <reinoud@netbsd.org>
 S: Maintained
 F: include/sysemu/nvmm.h
@@ -536,7 +535,6 @@ F: util/*posix*.c
 F: include/qemu/*posix*.h
 
 NETBSD
-M: Kamil Rytarowski <kamil@netbsd.org>
 M: Reinoud Zandijk <reinoud@netbsd.org>
 M: Ryo ONODERA <ryoon@netbsd.org>
 S: Maintained
-- 
2.31.1



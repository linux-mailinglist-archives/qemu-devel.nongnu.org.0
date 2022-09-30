Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D555F1062
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 19:01:48 +0200 (CEST)
Received: from localhost ([::1]:32794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJOV-0000ox-Ih
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 13:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFh-0006Jg-3u
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFf-0006cH-9c
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664556758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8qSo02TotYw46cBXRjZ8qmCKqDqS+X3AiZQSOMsYcYU=;
 b=K77d8USe9mu5XlImB6sVHCBrXUeJC/GeZfW6Cx9pWiq+qPbiNiIdC/kVLfrNcH6OtP382r
 RIvydOYm0ghi/wqpT15kh3grOzK70891l1p9OZBOGc9pMM6UFMu6sEMwi38iREelCjmB77
 CX7nvszSdYlrZiJdDUy44LNSa5hSxYY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-m4ZEjpOqNsyytJhyO6wOzw-1; Fri, 30 Sep 2022 12:52:37 -0400
X-MC-Unique: m4ZEjpOqNsyytJhyO6wOzw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFF473C10228;
 Fri, 30 Sep 2022 16:52:36 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B67217582;
 Fri, 30 Sep 2022 16:52:36 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 03/18] qemu-img: Wean documentation and help output off '?' for
 help
Date: Fri, 30 Sep 2022 18:52:07 +0200
Message-Id: <20220930165222.249716-4-kwolf@redhat.com>
In-Reply-To: <20220930165222.249716-1-kwolf@redhat.com>
References: <20220930165222.249716-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

'?' for help is deprecated since commit c8057f951d "Support 'help' as
a synonym for '?' in command line options", v1.2.0.  We neglected to
update output of qemu-img --help and the manual.  Do that now.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20220908130842.641410-1-armbru@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/tools/qemu-img.rst | 2 +-
 qemu-img.c              | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 85a6e05b35..15aeddc6d8 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -57,7 +57,7 @@ cases. See below for a description of the supported disk formats.
 *OUTPUT_FMT* is the destination format.
 
 *OPTIONS* is a comma separated list of format specific options in a
-name=value format. Use ``-o ?`` for an overview of the options supported
+name=value format. Use ``-o help`` for an overview of the options supported
 by the used format or see the format descriptions below for details.
 
 *SNAPSHOT_PARAM* is param used for internal snapshot, format is
diff --git a/qemu-img.c b/qemu-img.c
index 7d4b33b3da..cab9776f42 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -164,8 +164,8 @@ void help(void)
            "  'output_filename' is the destination disk image filename\n"
            "  'output_fmt' is the destination format\n"
            "  'options' is a comma separated list of format specific options in a\n"
-           "    name=value format. Use -o ? for an overview of the options supported by the\n"
-           "    used format\n"
+           "    name=value format. Use -o help for an overview of the options supported by\n"
+           "    the used format\n"
            "  'snapshot_param' is param used for internal snapshot, format\n"
            "    is 'snapshot.id=[ID],snapshot.name=[NAME]', or\n"
            "    '[ID_OR_NAME]'\n"
-- 
2.37.3



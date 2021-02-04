Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEF230F478
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:03:34 +0100 (CET)
Received: from localhost ([::1]:33476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fEL-0005Hi-9h
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7fCa-0003a2-09
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:01:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7fCY-00004t-7S
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:01:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612447300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CLZyu0xeNug+J4rbD4bynzsC2eGgIubJLWgJz4ygpMs=;
 b=RAC+zPcXqG3wOZ3jLwaMCJ97XlmZLElcEJ0LQ1p12sA12t7bGNW7CK83ROnx2DQlmq1KFH
 IMTX5DcH98QW/ry7nFFblZJS/edCutbPmmo+oRggSqw4OM3JGB90Gu9dEqZvN4lOLb4ztg
 iidUurSjDs43YPXRlzpLQMUYNSqNVWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-cB8UECnHMGyg5B9JKEWs2g-1; Thu, 04 Feb 2021 09:01:39 -0500
X-MC-Unique: cB8UECnHMGyg5B9JKEWs2g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20EC6C73A3;
 Thu,  4 Feb 2021 14:01:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D18371007613;
 Thu,  4 Feb 2021 14:01:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 67E39113865F; Thu,  4 Feb 2021 15:01:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] QMP patches patches for 2021-02-04
Date: Thu,  4 Feb 2021 15:01:27 +0100
Message-Id: <20210204140136.2769065-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit db754f8ccaf2f073c9aed46a4389e9c0c2080399:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210202' into staging (2021-02-03 19:35:57 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qmp-2021-02-04

for you to fetch changes up to 88daf0996cd0488e93e67bcb0af258f2c24f117a:

  qmp: Resume OOB-enabled monitor before processing the request (2021-02-04 13:20:29 +0100)

----------------------------------------------------------------
QMP patches patches for 2021-02-04

----------------------------------------------------------------
Markus Armbruster (4):
      docs/interop/qmp-spec: Document the request queue limit
      qmp: Fix up comments after commit 9ce44e2ce2
      qmp: Add more tracepoints
      qmp: Resume OOB-enabled monitor before processing the request

Peter Maydell (1):
      monitor/qmp-cmds.c: Don't include ui/vnc.h

Zhang Han (4):
      qobject: open brace '{' following struct go on the same line
      qobject: code indent should never use tabs
      qobject: spaces required around that operators
      qobject: braces {} are necessary for all arms of this statement

 docs/interop/qmp-spec.txt |  8 +++++---
 monitor/qmp-cmds.c        |  2 +-
 monitor/qmp.c             | 44 ++++++++++++++++++++++++++++++++++++--------
 qobject/json-parser.c     |  3 +--
 qobject/qdict.c           | 12 +++++++-----
 qobject/qjson.c           |  3 +--
 monitor/trace-events      |  4 ++++
 7 files changed, 55 insertions(+), 21 deletions(-)

-- 
2.26.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3326D3677DC
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 05:21:25 +0200 (CEST)
Received: from localhost ([::1]:43484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZPu8-0003ls-8y
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 23:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPh0-0006Zv-RI
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgr-0006VO-2s
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619060859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZEo10Eg0ZqkzmOrOO561Y1EeBbIUSFERGFxAWWmJjtY=;
 b=eVDOxELZ4qfSN7A0pyjkpwaMZBNJFcVFD6NCVufSprePaHzPgkjZceqtmAPff+pDOngDAj
 7H0BW2vcr2kk8pWQE/fqqpHHCLamqn+07lk7kDsoP7dvc1QFcnZV0YF43fCDKbSUNDbD/1
 IpHxU+oNgglgtdiqp8vDLVBa2p1FL8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-jaUGUhBSNkuUQu56kpgbJw-1; Wed, 21 Apr 2021 23:07:37 -0400
X-MC-Unique: jaUGUhBSNkuUQu56kpgbJw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC6288189C7;
 Thu, 22 Apr 2021 03:07:36 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCB88607CB;
 Thu, 22 Apr 2021 03:07:35 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/22] CHECKPOINT
Date: Wed, 21 Apr 2021 23:07:15 -0400
Message-Id: <20210422030720.3685766-18-jsnow@redhat.com>
In-Reply-To: <20210422030720.3685766-1-jsnow@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUBJ_ALL_CAPS=0.5 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As of here, parser is actually fully typed, and QAPIDoc is not. Below,
there are a few extra patches that "prove" this, but they are not
necessarily meant for inclusion.

They could theoretically be included anyway, but a few of them would
need to be squashed together to ensure our "no intermediate breakages"
rule, and a few things would need to be re-ordered.

Consider them [RFC], but optional and completely safe to drop.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/mypy.ini | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/qapi/mypy.ini b/scripts/qapi/mypy.ini
index 54ca4483d6d..d7bbb2dc9c7 100644
--- a/scripts/qapi/mypy.ini
+++ b/scripts/qapi/mypy.ini
@@ -4,6 +4,7 @@ disallow_untyped_calls = False
 python_version = 3.6
 
 [mypy-qapi.parser]
+# QAPISchemaParser is done, I promise!
 disallow_untyped_defs = False
 disallow_incomplete_defs = False
 check_untyped_defs = False
-- 
2.30.2



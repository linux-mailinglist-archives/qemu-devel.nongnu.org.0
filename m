Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC99537B18D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 00:19:33 +0200 (CEST)
Received: from localhost ([::1]:54344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgaiz-0002Nz-0n
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 18:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaWG-0007zY-Hv
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaWE-0006WB-E4
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620770781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZEo10Eg0ZqkzmOrOO561Y1EeBbIUSFERGFxAWWmJjtY=;
 b=B9V+WYRzFnF/JhX+puQLOc1rj5+V7a1IBo7m3p1gJDC9h0wyGZR+QgKUthfkL+osyJv7KC
 kWvQIQCAu4Pc3Qaz7eT0HiBCA72GB6KbZQ+We9dF0pJx9TaHfFRQnSfvs9PG200XafHYU+
 r12gFghoGLqDUN863QmCRzDLwnDGc1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-EK-mT9bDPP6c18YT5MaWQQ-1; Tue, 11 May 2021 18:06:19 -0400
X-MC-Unique: EK-mT9bDPP6c18YT5MaWQQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2656101371B;
 Tue, 11 May 2021 22:06:18 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 037CBBA6F;
 Tue, 11 May 2021 22:06:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/21] CHECKPOINT
Date: Tue, 11 May 2021 18:05:56 -0400
Message-Id: <20210511220601.2110055-17-jsnow@redhat.com>
In-Reply-To: <20210511220601.2110055-1-jsnow@redhat.com>
References: <20210511220601.2110055-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
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



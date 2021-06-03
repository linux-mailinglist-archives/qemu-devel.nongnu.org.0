Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D5139972A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 02:44:47 +0200 (CEST)
Received: from localhost ([::1]:44390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lobTa-0003dH-4R
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 20:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMe-0004WO-QX
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMd-0004gD-C4
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622680654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rblE+LPPgTFyHMW8myRMdZGbUuBbsfjrLi2dFr26rG8=;
 b=EjEmO5R0PifyOuZSOcr1Pl0rTiujY714HzTPJAI+CaeJefncUCZQ+QbKUzMCWjMANWBZrR
 wO9YDa4unzr1mXdlbdgUEylLDJ29Nhmb9HUbdxMgZYp4opFApUy8sSobjxeiZtO8K0DYRv
 IjBAVE/D8npT3iT0apKVw1uUbmjNwxU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-_stiEtBWPheOSUNvJ8dfZA-1; Wed, 02 Jun 2021 20:37:33 -0400
X-MC-Unique: _stiEtBWPheOSUNvJ8dfZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D57F801817;
 Thu,  3 Jun 2021 00:37:32 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 905AD10013D6;
 Thu,  3 Jun 2021 00:37:31 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/19] python: Add 'fh' to known-good variable names
Date: Wed,  2 Jun 2021 20:37:09 -0400
Message-Id: <20210603003719.1321369-10-jsnow@redhat.com>
In-Reply-To: <20210603003719.1321369-1-jsnow@redhat.com>
References: <20210603003719.1321369-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fd and fh are fine: we often use these for "file descriptor" or "file
handle" accordingly. It is rarely the case that you need to enforce a
more semantically meaningful name beyond "This is the file we are using
right now."

While we're here: add comments for all of the non-standard pylint
names. (And the underscore.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/setup.cfg | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/python/setup.cfg b/python/setup.cfg
index a19029d5388..c9b9445af98 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -78,9 +78,10 @@ good-names=i,
            k,
            ex,
            Run,
-           _,
-           fd,
-           c,
+           _,   # By convention: Unused variable
+           fh,  # fh = open(...)
+           fd,  # fd = os.open(...)
+           c,   # for c in string: ...
 
 [pylint.similarities]
 # Ignore imports when computing similarities.
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE6B4046E7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 10:18:21 +0200 (CEST)
Received: from localhost ([::1]:53912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOFGH-0006ed-NF
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 04:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mOFAs-0000d0-FH
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:12:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mOFAi-00006o-02
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:12:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631175152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=br5IqGDzputsPwccWtyKTtL49wVTpV3XJrzxFzfjDZ8=;
 b=dNhYcXsCujrkXQIgrwP+nUyWqVFli0FbeycIwTCLo8Rfy3keiKHxZbSjDabglE0z7ZU1iC
 sSB9CDPcy720MIjFTT254mp46zkBxKqSc57fiX6c6nKrWTZN4+l9EqrOchBHWvXuSH0gUt
 T5pL9TM4goxte5p8hTvhnbC9FOIOK2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400--FC9QxHXOM-aigfC-0gckw-1; Thu, 09 Sep 2021 04:12:31 -0400
X-MC-Unique: -FC9QxHXOM-aigfC-0gckw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A213F1023F4D
 for <qemu-devel@nongnu.org>; Thu,  9 Sep 2021 08:12:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4946C100E107;
 Thu,  9 Sep 2021 08:12:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C230011385C7; Thu,  9 Sep 2021 10:12:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hmp: Drop a bogus sentence from set_password's
 documentation
Date: Thu,  9 Sep 2021 10:12:19 +0200
Message-Id: <20210909081219.308065-3-armbru@redhat.com>
In-Reply-To: <20210909081219.308065-1-armbru@redhat.com>
References: <20210909081219.308065-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, dgilbert@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hmp-commands.hx | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 8e45bce2cd..cf723c69ac 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1522,12 +1522,11 @@ ERST
 
 SRST
 ``set_password [ vnc | spice ] password [ action-if-connected ]``
-  Change spice/vnc password.  Use zero to make the password stay valid
-  forever.  *action-if-connected* specifies what should happen in
-  case a connection is established: *fail* makes the password change
-  fail.  *disconnect* changes the password and disconnects the
-  client.  *keep* changes the password and keeps the connection up.
-  *keep* is the default.
+  Change spice/vnc password.  *action-if-connected* specifies what
+  should happen in case a connection is established: *fail* makes the
+  password change fail.  *disconnect* changes the password and
+  disconnects the client.  *keep* changes the password and keeps the
+  connection up.  *keep* is the default.
 ERST
 
     {
-- 
2.31.1



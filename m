Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E440B31C405
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 23:27:16 +0100 (CET)
Received: from localhost ([::1]:58212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBmKq-0001Oq-1P
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 17:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lBmJA-0000UU-S0
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 17:25:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lBmJ9-0006um-88
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 17:25:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613427930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eMJbVVrapwCTlQ/k9NwlUe5lTYZ/ZE79HXLTFE0FgYI=;
 b=horD0G8PDS6JclxkGjqGnZX/eC9LbkpWEDrPhmAHcz/GH6iYBV3FTz0dhkxUFEiCR0llNE
 m9eLA1Pw4A/ot0RQV4C7BHtk7+sqj5PJH6uQvvZFXHeXlS2N9mA9VHdxuuZpGvIRE4oOlg
 lgCcWjoWYTfiKDOePLYHdp0CtZaB3VQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-z14V6QchPT-MEvBjlxEGrw-1; Mon, 15 Feb 2021 17:25:28 -0500
X-MC-Unique: z14V6QchPT-MEvBjlxEGrw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15D7D80403E
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 22:25:27 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-50.phx2.redhat.com [10.3.112.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF2372BFEC;
 Mon, 15 Feb 2021 22:25:26 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] maint: Tell git that *.py files should use python diff hunks
Date: Mon, 15 Feb 2021 16:25:24 -0600
Message-Id: <20210215222524.1820223-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: jsnow@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Git's default hunk pattern recognizer favors the C language, but it
also includes several built-in diff styles that give saner results in
other languages.  In particular, telling git to treat all .py files as
python changes the beginning of diff hunks as follows:

|  --- a/python/qemu/machine.py
|  +++ b/python/qemu/machine.py
| -@@ -337,12 +337,12 @@ class QEMUMachine:
| +@@ -337,12 +337,12 @@ def _post_shutdown(self) -> None:
|               self._qmp.close()

which makes it much easier to tell what function a patch is touching,
rather than a non-descript listing of what class contains the changes.

Sadly, our python files that don't use .py suffix (such as numerous
iotests) do not benefit from this glob.

Reported-by: John Snow <jsnow@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 .gitattributes | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitattributes b/.gitattributes
index 3d2fe2ecda8b..3e03ee01c0d9 100644
--- a/.gitattributes
+++ b/.gitattributes
@@ -1,2 +1,3 @@
 *.c.inc         diff=c
 *.h.inc         diff=c
+*.py            diff=python
-- 
2.30.1



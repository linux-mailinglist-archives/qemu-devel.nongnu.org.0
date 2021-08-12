Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776F23EA350
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 13:11:11 +0200 (CEST)
Received: from localhost ([::1]:50548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE8cA-0006is-In
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 07:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mE8au-0005o3-IW
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 07:09:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mE8at-0005n5-6o
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 07:09:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628766589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jcUgur2Xij9D7soYGVPcytT/qkyGZvZ04hRIGe31SGk=;
 b=LNDwkJVzsbUBvBMls1ncge4jabLfIc7TPkRHf8FG4d2CKUSlq9HnHM8o6b+RNkhKkQ6bWa
 3MADBY9B5Vp9EZWhEgFniu5b/eWzCXfmxROteF3FnZqbX7TWCy+gaGtbl2iljJG1dr6WpH
 dBrlAo8rAgYhBO2BHYqOAoXvU8vWJ18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-tR-H99TkMSOgKQ-OINnPRg-1; Thu, 12 Aug 2021 07:09:48 -0400
X-MC-Unique: tR-H99TkMSOgKQ-OINnPRg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6AD26409B
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 11:09:47 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC9565D9D5;
 Thu, 12 Aug 2021 11:09:46 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	eblake@redhat.com,
	philmd@redhat.com
Subject: [PATCH] configure: Remove spurious [] from tr
Date: Thu, 12 Aug 2021 12:09:42 +0100
Message-Id: <20210812110942.19065-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

ShellCheck points out that tr '[a-z]' actually replaces the []'s
and only the a-z is needed.

Remove the spurious [] - although in this use it will make no
difference.

Fixes: bb55b712e8dc4d4eb515144d5c26798fea178cba
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 9a79a004d7..5bb8c2a59d 100755
--- a/configure
+++ b/configure
@@ -4549,7 +4549,7 @@ if test "$gprof" = "yes" ; then
 fi
 echo "CONFIG_AUDIO_DRIVERS=$audio_drv_list" >> $config_host_mak
 for drv in $audio_drv_list; do
-    def=CONFIG_AUDIO_$(echo $drv | LC_ALL=C tr '[a-z]' '[A-Z]')
+    def=CONFIG_AUDIO_$(echo $drv | LC_ALL=C tr 'a-z' 'A-Z')
     echo "$def=y" >> $config_host_mak
 done
 if test "$alsa" = "yes" ; then
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79E03FFBA5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 10:17:06 +0200 (CEST)
Received: from localhost ([::1]:43548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM4Nl-0005Om-3R
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 04:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mM4L2-0002eI-NJ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:14:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mM4Ky-0005ND-AS
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630656851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eMrbLRRNlrIB6+OD6pWTwlgo81s3pYPSUc1CRfUUm9k=;
 b=im57y7iuIpRQ+rhRGQD+WV8VB1gHnW/Y8R5IUOS6KpQyRZJrwLkGVpksy/gWGzvjo4irHS
 fjQltJ5nZHKGmRBtVhv9bjmdP9jW4HCJ2VNkN/qpeU7kkrU+Na/lcXGcMuSjMl7QO5XSNK
 Gg37L6kMxGyYn5/mVmngrMWbJZPGSAo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-yfRZYbIrPgm-wPV4L-cYyA-1; Fri, 03 Sep 2021 04:14:09 -0400
X-MC-Unique: yfRZYbIrPgm-wPV4L-cYyA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59A6BFC82
 for <qemu-devel@nongnu.org>; Fri,  3 Sep 2021 08:14:08 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39CF25C261;
 Fri,  3 Sep 2021 08:14:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 0/5] Use meson_options.txt in the configure script
Date: Fri,  3 Sep 2021 10:13:53 +0200
Message-Id: <20210903081358.956267-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's cumbersome to maintain the build options twice, one time in the
configure script and one time in meson_options.txt. Thus let's add some
logic to the configure script to look at the meson_options.txt file
instead of handling every option twice.

Note: Unlike Paolo's earlier version (which can bee found on
https://patchew.org/QEMU/20210107140039.467969-1-pbonzini@redhat.com/ ),
this version only uses some lines of shell code to parse meson_options.txt
instead of adding an additional Python or Perl script. It's likely not
as robust as Paolo's version, but it's way smaller and has a way nicer
diffstat.

v2:
 - Improved shell code according to the suggestions of Eric
 - Split the vnc change into a separate patch
 - Add a comment to meson_options.txt in the new final patch

Thomas Huth (5):
  configure: Add the possibility to read options from meson_options.txt
  meson_options.txt: Switch the default value for the vnc option to
    'auto'
  configure: Remove options that can be handled via meson_options.txt
    instead
  configure: Get help text from meson_options.txt
  meson_options.txt: Document that "configure" reads this file, too

 configure         | 435 +++++++---------------------------------------
 meson_options.txt |   8 +-
 2 files changed, 65 insertions(+), 378 deletions(-)

-- 
2.27.0



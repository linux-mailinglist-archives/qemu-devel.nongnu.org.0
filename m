Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5915A3FAD73
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 19:34:00 +0200 (CEST)
Received: from localhost ([::1]:51616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKOgw-00073M-Vk
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 13:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mKOfY-0005hB-7C
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 13:32:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mKOfV-0007da-4h
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 13:32:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630258347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UrW+vgTPDJufHn7m4FwakaJDncEXludGvkl8UyIkzBM=;
 b=WYYJzHa3p1hjqpA7INbBMaYlv/uwpBR/pYUWj2aqb6l5Js9Rcg4lHxLxxpAVVE80c0K4Qm
 l+ejsJ5LlwzsbXaul8gI2EmmoGhvU5Nc9OKs90oHgs4dx2uSf4sEz3D3a/YjtxhFSTprpC
 COTlEqZ+kPaSK1rqDcwarEBBdkAPduA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-Q4w3GbDdPMCvvDAFYBO5yQ-1; Sun, 29 Aug 2021 13:32:25 -0400
X-MC-Unique: Q4w3GbDdPMCvvDAFYBO5yQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54565871807
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 17:32:24 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6946660939;
 Sun, 29 Aug 2021 17:32:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/3] Use meson_options.txt in the configure script
Date: Sun, 29 Aug 2021 19:32:07 +0200
Message-Id: <20210829173210.39562-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's cumbersome to maintain the build options twice, one time in the
configure script and one time in meson_options.txt. Thus let's add some
logic to the configure script to look at the meson_options.txt file
instead of handling every option twice.

Thomas Huth (3):
  configure: Add the possibility to read options from meson_options.txt
  configure: Remove options that can be handled via meson_options.txt
    instead
  configure: Get help text from meson_options.txt

 configure         | 429 ++++++----------------------------------------
 meson_options.txt |   2 +-
 2 files changed, 53 insertions(+), 378 deletions(-)

-- 
2.27.0



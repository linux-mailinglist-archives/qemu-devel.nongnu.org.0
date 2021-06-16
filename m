Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 856FD3A98E1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 13:09:22 +0200 (CEST)
Received: from localhost ([::1]:36438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltTQ9-0008AK-Ic
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 07:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ltTOZ-0005u2-Tv
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 07:07:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ltTOY-0000KK-8N
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 07:07:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623841661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=30iIOlHVFD6QzDUtIgi2y4PzIKf1th2ixs4m4OFAK68=;
 b=VPUB+45D13R9AQb9ZV64v6tK1HpcjI0U0qnimkGXJuQbEgxS/jUjVjrRPJhyOmU2QqsiNo
 5p87ci1qJvpBJPJy6OWw5I3Pa3zC33diQLAsvnSm6yOdQlANb4jjpBDwbAcwd35OxZl7A9
 alQOGzE4dzCCFw/t9swKvQcIpxtTWYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-iCtpdbIWPOmCVdKlNn1QCQ-1; Wed, 16 Jun 2021 07:07:29 -0400
X-MC-Unique: iCtpdbIWPOmCVdKlNn1QCQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BBC1EC1A3
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 11:07:28 +0000 (UTC)
Received: from thuth.com (ovpn-114-83.ams2.redhat.com [10.36.114.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFD0560853;
 Wed, 16 Jun 2021 11:07:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [qemu-web PATCH 0/4] Improve the download information on the website
Date: Wed, 16 Jun 2021 13:07:16 +0200
Message-Id: <20210616110720.880586-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: berrange@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make it more clear that QEMU only supports the latest versions,
improve the color of a button, and put the emphasis on the 
source code tarballs.

Thomas Huth (4):
  Show only the latest three releases on the website
  css: Improve the hover effect of the buttons
  State that there is no official support for older releases
  Present the source code on the first tab of the download page

 _includes/releases.html |  2 +-
 assets/css/style.css    |  6 ++++--
 download.html           | 15 ++++++++-------
 support.md              |  3 ++-
 4 files changed, 15 insertions(+), 11 deletions(-)

-- 
2.27.0



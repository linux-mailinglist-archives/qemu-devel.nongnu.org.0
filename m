Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C323743E8BE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 21:02:37 +0200 (CEST)
Received: from localhost ([::1]:37622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgAfc-0005Bm-E0
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 15:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mgAcb-0003HN-Jq
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 14:59:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mgAcV-0008CR-HF
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 14:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635447561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h3HDc3jqsefwLYTogqmN83Unp5HRf45tPkY5hX5Yl6s=;
 b=EFt+DVUgAr91oBZCOE+bwiTLKN5YHaAQc5egxILHSl1Vu6MQ3s8csjfwKaa1L4Rpyg219q
 E1dAms6Lepm3+nS+DYeKJF5gvdVJRBqJ54z4lwZk3GOXjkvtR2fZKsWhoKZ5TMt+aGxDVf
 wIXpY30oTd2pl3XfcThfJFm/CKxxJVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-Q42CkbtFNN2cCduB4LrOMw-1; Thu, 28 Oct 2021 14:59:17 -0400
X-MC-Unique: Q42CkbtFNN2cCduB4LrOMw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEB6F1054F93
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 18:59:14 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C71D85BAE2;
 Thu, 28 Oct 2021 18:59:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/4] configure and meson.build improvements
Date: Thu, 28 Oct 2021 20:59:06 +0200
Message-Id: <20211028185910.1729744-1-thuth@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Some clean-ups for configure, moving feature tests to meson.build.

Thomas Huth (4):
  configure: Remove the check for the __thread keyword
  Move the l2tpv3 test from configure to meson.build
  Move CONFIG_XFS handling to meson.build
  Move the libssh setup from configure to meson.build

 configure                     | 86 -----------------------------------
 meson.build                   | 22 +++++++--
 meson_options.txt             |  4 ++
 net/meson.build               |  4 +-
 scripts/meson-buildoptions.sh |  6 +++
 5 files changed, 30 insertions(+), 92 deletions(-)

-- 
2.27.0



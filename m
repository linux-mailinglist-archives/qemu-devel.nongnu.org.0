Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D22B2AF1BA
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:10:43 +0100 (CET)
Received: from localhost ([::1]:54566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcpta-0004e2-1m
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:10:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kcprq-0002pm-92
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:08:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kcpro-0000u5-M3
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:08:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605100131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cY2pG3kirc9P4dUNjEfYQuzOECqM3FmB35duBGZ1S0Y=;
 b=M/iGH4+tAKq0Ti7XrhP2p4+5ER9Wpq8HjnKUfs4gRQLDSU+PoRr9/CbP958xSO4nDaMfg2
 62AxyLDK4mfJ407ZsvzFAsSgC+BN+BgYJOO1WeHPhcIwhdTzG3fz+jm36oKEbO/9qyAd30
 XFIwY+wiXvuHsQm52pjyUNhHlf/FOQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-Fbvmu96eNJaScOqiM3kEDA-1; Wed, 11 Nov 2020 08:08:50 -0500
X-MC-Unique: Fbvmu96eNJaScOqiM3kEDA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3975A10866AD
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 13:08:49 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-124.ams2.redhat.com [10.36.114.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C4735C1C4;
 Wed, 11 Nov 2020 13:08:40 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] char: Deprecate backend aliases
Date: Wed, 11 Nov 2020 14:08:32 +0100
Message-Id: <20201111130834.33985-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, libvir-list@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These aliases only work the command line, but not in QMP. Command line
QAPIfication involves writing some compatibility glue for them, which
I'm doing, but I think it's desirable to unify accepted values of both
paths. So deprecate the aliases so that we can drop the compatibility
glue later.

In the deprecation documentation I assumed that this is for 6.0, but if
we want to include it in 5.2 still, this can be changed, of course.

Kevin Wolf (2):
  char: Skip CLI aliases in query-chardev-backends
  char: Deprecate backend aliases 'tty' and 'parport'

 docs/system/deprecated.rst |  6 ++++++
 chardev/char.c             | 32 ++++++++++++++++++++++++--------
 2 files changed, 30 insertions(+), 8 deletions(-)

-- 
2.28.0



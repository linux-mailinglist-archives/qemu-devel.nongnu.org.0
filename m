Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C69311BE44
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 21:46:42 +0100 (CET)
Received: from localhost ([::1]:50524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1if8sH-0001Sd-ID
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 15:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45481)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1if8qW-0000U4-IS
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 15:44:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1if8qV-0007tH-Iu
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 15:44:32 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54876
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1if8qV-0007rF-EO
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 15:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576097070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+np0/kABttJSZ38E7yI19vCrH7tfteWhzd5l2eAS4j8=;
 b=jPgJQndzDWdKus+0ds5qYDWoSnsw4bH3vXdIbou/C/diYiR1c7r9czJCBtNFaVmq6y7k6S
 25qNTLwZh9SG3yzx0Kt8kSqUvCtK2AZYFnVgF4nmrTF5EmQK3EjNgZDTILSJj+oYnJ6bqm
 cJb6J2TXUkYZ1TvEbml8ELMAxW91irg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-MiiUIKGlP3aHSNENl-x3Yg-1; Wed, 11 Dec 2019 15:44:29 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD60A107B796
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 20:44:28 +0000 (UTC)
Received: from virtlab501.virt.lab.eng.bos.redhat.com
 (virtlab501.virt.lab.eng.bos.redhat.com [10.19.152.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5936B7C850;
 Wed, 11 Dec 2019 20:44:28 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] tests/Makefile: Show check-report.tap in check-help
Date: Wed, 11 Dec 2019 15:44:26 -0500
Message-Id: <20191211204427.4681-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: MiiUIKGlP3aHSNENl-x3Yg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simple fix to commit 9df43317b82 that didn't adjust check-help.

Wainer dos Santos Moschetta (1):
  tests/Makefile: Fix check-report.* targets shown in check-help

 tests/Makefile.include | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

--=20
2.21.0



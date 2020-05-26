Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C47D51ABD48
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 11:51:38 +0200 (CEST)
Received: from localhost ([::1]:60118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jP1BJ-0007Qz-IT
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 05:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58134)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1jP1AC-0006Xq-Og
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 05:50:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1jP1AB-0006aS-Ta
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 05:50:28 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:31620
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1jP1AB-0006a9-Qc
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 05:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587030627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Da2kHy9rCuWX+s8DequUldhUtm+v+scjA3/I/OCWXjo=;
 b=DFtt85ycdvKqZtJg4ZCRLgi4kZOWqG28eIfM7LqJayo/5Mo0unLHYgmo21ZKfgfrlEhZRx
 EwiJv2LGsYwZZTQ/5PAcJo7Pzt996hwhFxZqsb6l6BNwmPv/BBevRzcfpmMb99fTHDJFEb
 yJSsQqS170hVcEQjmSxFxYOEmxPMjuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-Ebm1dDtPObyPW9UlRLyueg-1; Thu, 16 Apr 2020 05:50:24 -0400
X-MC-Unique: Ebm1dDtPObyPW9UlRLyueg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1538C8017F5;
 Thu, 16 Apr 2020 09:50:23 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 845BE6EF91;
 Thu, 16 Apr 2020 09:50:21 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] LUKS: Fix error message when underlying fs don't support
 large enough files
Date: Thu, 16 Apr 2020 12:50:18 +0300
Message-Id: <20200416095019.4406-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a repost of the same trivial patch I already, which fell through th=
e cracks.
Could someone queue it up so I close the bugzilla I have for this?

Best regards,
=09Maxim Levitsky

Maxim Levitsky (1):
  block/crypto: better error message when creating too large files

 block/crypto.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

--=20
2.17.2



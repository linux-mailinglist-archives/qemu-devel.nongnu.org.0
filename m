Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B48FFE270
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 17:15:18 +0100 (CET)
Received: from localhost ([::1]:41342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVeFg-0007gN-GR
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 11:15:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1iVeEI-0006Sx-Ax
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:13:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1iVeEG-0002jT-9R
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:13:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35592
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1iVeEG-0002iv-5n
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:13:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573834427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s650u6KuExgO0iql268j58FEXPrhFZnL2HdvfQ659cY=;
 b=g4U5n0YfVuKePakic1WRGTDr9ELVkLyM908Weag8QVKMHOeQPPVC1RJ79fPkepu9CbETyA
 mzTi06GpluGOktOqGP6VE+nw4G8+LTCL1PagcqICi6CQUBe+GNJI/a3SQsDHoCvY9jYc4i
 NRge53e9VbkGxZL9j8NiegSQIE3sBE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-GRFICHNpO7yn9wxYobTOrQ-1; Fri, 15 Nov 2019 11:13:44 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA508100B3D
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 16:13:42 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83F075DDA9;
 Fri, 15 Nov 2019 16:13:39 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] docs/microvm.rst: fix alignment and explain shut down
Date: Fri, 15 Nov 2019 17:13:36 +0100
Message-Id: <20191115161338.42864-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: GRFICHNpO7yn9wxYobTOrQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the alignment in the "Limitations" section and include an
explanation about the particularities of the microvm machine type when
it comes to triggering a guest initiated shut down.

Sergio Lopez (2):
  docs/microvm.rst: fix alignment in "Limitations"
  docs/microvm.rst: add instructions for shutting down the guest

 docs/microvm.rst | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

--=20
2.23.0



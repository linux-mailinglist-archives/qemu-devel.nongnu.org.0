Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D3C1ACE06
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 18:50:52 +0200 (CEST)
Received: from localhost ([::1]:37104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jP7j1-0007tx-RO
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 12:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32908)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1jP7hZ-0006Y4-AX
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 12:49:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1jP7hX-00005P-NX
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 12:49:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25685
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1jP7hX-0008WE-BS
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 12:49:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587055758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VQB3NvLv8s5PrSVXXLuWZOBRJdO3qFSPT+MlMxzDwN0=;
 b=PMwsPsghgdROVSC9zsp88nKVCGWqorq3r8s9gcC2+2qThu+Yt7hrgfpaJQL/nsPAcf1D0G
 UCUm5Lswgxnb4NBmpOVcbmEAfc9D6aaNZyGiMF9+jTowSwm03IuSpblDMKVbVCn6dl3r99
 TiOmgZJd7MxDyUKAkdXmVtm0IiarLFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-qCEmT6htPNKwXcF9eNA49g-1; Thu, 16 Apr 2020 12:49:16 -0400
X-MC-Unique: qCEmT6htPNKwXcF9eNA49g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 334A59B806
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 16:49:15 +0000 (UTC)
Received: from localhost (ovpn-114-223.ams2.redhat.com [10.36.114.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52EA21059101;
 Thu, 16 Apr 2020 16:49:09 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] virtiofsd: drop Linux capabilities(7)
Date: Thu, 16 Apr 2020 17:49:05 +0100
Message-Id: <20200416164907.244868-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dmlydGlvZnNkIGRvZXNuJ3QgbmVlZCBvZiBhbGwgTGludXggY2FwYWJpbGl0aWVzKDcpIGF2YWls
YWJsZSB0byByb290LiAgS2VlcCBhCndoaXRlbGlzdGVkIHNldCBvZiBjYXBhYmlsaXRpZXMgdGhh
dCB3ZSByZXF1aXJlLiAgVGhpcyBpbXByb3ZlcyBzZWN1cml0eSBpbgpjYXNlIHZpcnRpb2ZzZCBp
cyBjb21wcm9taXNlZCBieSBtYWtpbmcgaXQgaGFyZCBmb3IgYW4gYXR0YWNrZXIgdG8gZ2FpbiBm
dXJ0aGVyCmFjY2VzcyB0byB0aGUgc3lzdGVtLgoKU3RlZmFuIEhham5vY3ppICgyKToKICB2aXJ0
aW9mc2Q6IG9ubHkgcmV0YWluIGZpbGUgc3lzdGVtIGNhcGFiaWxpdGllcwogIHZpcnRpb2ZzZDog
ZHJvcCBhbGwgY2FwYWJpbGl0aWVzIGluIHRoZSB3YWl0IHBhcmVudCBwcm9jZXNzCgogdG9vbHMv
dmlydGlvZnNkL3Bhc3N0aHJvdWdoX2xsLmMgfCA1MSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKykKCi0tIAoyLjI1LjEKCg==



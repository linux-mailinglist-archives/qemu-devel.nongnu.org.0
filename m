Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423F718B265
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Mar 2020 12:34:39 +0100 (CET)
Received: from localhost ([::1]:36450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEtRe-00055P-Af
	for lists+qemu-devel@lfdr.de; Thu, 19 Mar 2020 07:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39945)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1jEtQE-0004M4-U5
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 07:33:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1jEtQ9-00079E-TL
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 07:33:10 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:57229)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1jEtQ9-000797-PL
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 07:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584617585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aP/uGE5kqUK/kCg/sqxIO8kCBYWH5iFuZ6U1jUbXiXk=;
 b=Y8cAhLo1p4N0LRwrcJz5N1L+c5WzzUzTOsxtcQbc8HqmUajOdo/r2ikYN4HY79IdBkK/eK
 +Vs1BBhkOnWc5a2lnns0N3Cy+1U2Exam86d8bG1zwJ9w4nzK9HwbwAxsPSqSIbOz92fnFz
 Z33MVVdhWXFLqcIiNKMW904EBQ44L44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-sbIBNZNDOCubT66GSOEXjA-1; Thu, 19 Mar 2020 07:29:17 -0400
X-MC-Unique: sbIBNZNDOCubT66GSOEXjA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 178A01857BEB;
 Thu, 19 Mar 2020 11:29:16 +0000 (UTC)
Received: from localhost (unknown [10.36.110.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E917F5C1D8;
 Thu, 19 Mar 2020 11:29:12 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Slirp patches
Date: Thu, 19 Mar 2020 12:29:10 +0100
Message-Id: <20200319112911.353244-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: samuel.thibault@ens-lyon.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f57587c7d47b35b2d9b31def3a74d81bdb5475d7=
:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2020-03-17' i=
nto staging (2020-03-19 10:18:07 +0000)

are available in the Git repository at:

  https://github.com/elmarco/qemu.git tags/slirp-pull-request

for you to fetch changes up to 9f6b9fcc153f6d4f2e10193014d2eaf7329fa181:

  slirp: update submodule to v4.2.0 + mingw-fix (2020-03-19 12:17:43 +0100)

----------------------------------------------------------------

----------------------------------------------------------------

Marc-Andr=C3=A9 Lureau (1):
  slirp: update submodule to v4.2.0 + mingw-fix

 slirp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--=20
2.25.0.rc2.1.g09a9a1a997



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68169115608
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 18:03:42 +0100 (CET)
Received: from localhost ([::1]:41420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idH13-0000ec-0U
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 12:03:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47894)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1idF8f-0003KO-TV
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:03:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1idF8b-0000X1-0i
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:03:25 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60229
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1idF8a-0000Vt-Qg
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:03:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575644599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZVY7hsbkfAbjAJQryBAGQ6zBwwrR2bRYYs+npeVj+ag=;
 b=dLDteIUBHYohPRatpiYYQVjlOkIbonphIx4BPxlSq1OF+cvbr+n9/tjEb7I60i0w4w9KiD
 6PBEOBM5Dj2Ns8vukKufXEpyHz1/M0nr3uroIPupdxAyvmUsRysv4/ceACseJxbhoJstls
 vcN4IjP9OIYNbg1rD7G0gSp9buuER+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-9H7hTUYjMQmiBNufaeDl-A-1; Fri, 06 Dec 2019 10:03:15 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C7F2801E78;
 Fri,  6 Dec 2019 15:03:14 +0000 (UTC)
Received: from dhcp-17-72.bos.redhat.com (dhcp-17-72.bos.redhat.com
 [10.18.17.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 023735D9E1;
 Fri,  6 Dec 2019 15:03:07 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH 0/1] Fix for acceptance test for 4.2-rc2
Date: Fri,  6 Dec 2019 10:03:05 -0500
Message-Id: <20191206150306.19513-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 9H7hTUYjMQmiBNufaeDl-A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Philippe Mathieu-Daud=C3=A9 (1):
  tests/boot_linux_console: Fetch assets from Debian snapshot archives

 tests/acceptance/boot_linux_console.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--=20
2.21.0



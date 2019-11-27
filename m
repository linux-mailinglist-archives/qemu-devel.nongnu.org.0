Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A1110AD50
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 11:12:18 +0100 (CET)
Received: from localhost ([::1]:36552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZuIy-0000Yd-GF
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 05:12:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60422)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iZuHf-000898-0f
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 05:10:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iZuHc-0008Nq-LR
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 05:10:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60759
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iZuHc-0008M1-I7
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 05:10:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574849451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y+n5VV+lG5TzROH2FIlFDwhkq5XaOLziMrqQbRkIA8g=;
 b=eWsqjgrEwzeiSIVdi0mn4Lwkt5GhmLcSL9lvaaYkhOvkD6wPvLsmY2rjAagsdfPdpsTF2d
 VwJgoNIEofPeg3VyF8lu1RsAa7T3XGBb4ifYChk3vw7boV2O45JVKtplEULCYqrSmBnXf4
 kwBwj6r74PjkzcsITkifpaBJ0GcHuIA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-4v8SDNv0Mm6U-hIXqIdmxg-1; Wed, 27 Nov 2019 05:10:49 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C4F6800EBD
 for <qemu-devel@nongnu.org>; Wed, 27 Nov 2019 10:10:48 +0000 (UTC)
Received: from localhost (ovpn-112-17.ams2.redhat.com [10.36.112.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 514B6600CA;
 Wed, 27 Nov 2019 10:10:43 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] analyze-migration.py: require python 3
Date: Wed, 27 Nov 2019 14:10:36 +0400
Message-Id: <20191127101038.327080-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 4v8SDNv0Mm6U-hIXqIdmxg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

The following 2 patches fix some error and deprecation warnings with
python 3. It drops usage of numpy and python 2 support.

Marc-Andr=C3=A9 Lureau (2):
  analyze-migration.py: fix find() type error
  analyze-migration.py: replace numpy with python 3.2

 scripts/analyze-migration.py | 39 +++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 18 deletions(-)

--=20
2.24.0



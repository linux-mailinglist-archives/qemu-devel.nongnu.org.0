Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE2C1529A1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 12:07:25 +0100 (CET)
Received: from localhost ([::1]:45001 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izIWi-00011x-6Z
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 06:07:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45770)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1izITW-0004zW-Jj
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 06:04:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1izITV-0000EX-M0
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 06:04:06 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21251
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1izITV-000067-Fx
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 06:04:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580900644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2XSUAcIDVQSIjm/GCG1nCfRuWw3vYyfoaH2YeV7OZ/8=;
 b=ZcJyh24dk8yxVvOFk9ukKgLrVGKl60sf2vgVV9hAF+tgpR9mFv2LJp4g0yTEM3TfaIEfG2
 ihmTMQsclK7TGPEXuBZ19zV8ltrlPXKJvjgUmnkgMpp3vVudLk6wbNnqztWrxAh/BroKp3
 zCG2eiNMo6zWXjcsV2SrnS43Ni3Oc/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-RxWZaJsMM_ewP8sS166Eig-1; Wed, 05 Feb 2020 06:04:03 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55A69801E77;
 Wed,  5 Feb 2020 11:04:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5562A19C7F;
 Wed,  5 Feb 2020 11:03:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7E041A1E0; Wed,  5 Feb 2020 12:03:56 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] ui: rework -show-cursor option
Date: Wed,  5 Feb 2020 12:03:51 +0100
Message-Id: <20200205110356.3491-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: RxWZaJsMM_ewP8sS166Eig-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 jpewhacker@gmail.com, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Gerd Hoffmann (5):
  ui: add show-cursor option
  ui/gtk: implement show-cursor option
  ui/sdl: implement show-cursor option
  ui: wire up legacy -show-cursor option
  ui: deprecate legacy -show-cursor option

 include/sysemu/sysemu.h |  1 -
 ui/gtk.c                |  8 +++++++-
 ui/sdl2.c               | 28 ++++++++++++++++++++--------
 vl.c                    |  6 ++++--
 qapi/ui.json            |  2 ++
 qemu-deprecated.texi    |  5 +++++
 6 files changed, 38 insertions(+), 12 deletions(-)

--=20
2.18.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8DB188ED5
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 21:18:52 +0100 (CET)
Received: from localhost ([::1]:40814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEIfr-0000ns-JG
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 16:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33187)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jEIeL-0008DP-Tp
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 16:17:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jEIeK-0007tV-Tg
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 16:17:17 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:49097)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jEIeK-0007pH-16
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 16:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584476235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EmpM/rxTKoNnfk3N1oGrInTiYZAKsb89WrQ1YGhBg3w=;
 b=c/iMNbfALkeHeZRNkAUs0XdeGBC7INZovfWCFlVw/LSyRvh2HB2XrJIgrjBThktgiED1JX
 kqAdQ4xG0x5ArcGrkBa/KOnb4dL00WtUAcMtWJivLY8SgHYLhMcjd/DW915ZKt4s9ozeZu
 sfVyKhGwVJMNF9r7lEA/Lfe8yCB6f6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-xCfHI7UZPAKdoWcSCUH3vA-1; Tue, 17 Mar 2020 16:17:13 -0400
X-MC-Unique: xCfHI7UZPAKdoWcSCUH3vA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DA78800D5A;
 Tue, 17 Mar 2020 20:17:12 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-193.phx2.redhat.com [10.3.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E28A810016EB;
 Tue, 17 Mar 2020 20:17:11 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] netdev qapification
Date: Tue, 17 Mar 2020 15:17:09 -0500
Message-Id: <20200317201711.322764-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: lekiravi@yandex-team.ru, jasowang@redhat.com, armbru@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In v2:
- patch 1 contents unchanged, but commit message improved [Markus]
- patch 2 is new

Eric Blake (2):
  net: Complete qapi-fication of netdev_add
  net: Track netdevs in NetClientState rather than QemuOpt

 include/net/net.h |  2 +-
 monitor/misc.c    |  6 +-----
 net/net.c         | 39 ++++++++++++---------------------------
 qapi/net.json     | 14 +-------------
 4 files changed, 15 insertions(+), 46 deletions(-)

--=20
2.25.1



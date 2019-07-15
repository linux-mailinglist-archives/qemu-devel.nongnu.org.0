Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE3068800
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 13:15:45 +0200 (CEST)
Received: from localhost ([::1]:37244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmyxM-0005rp-Cq
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 07:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47129)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hmyws-0004nj-4V
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 07:15:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hmywq-0002Ra-3N
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 07:15:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34608)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hmywp-0002Ot-SP
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 07:15:12 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BDB56356E4
 for <qemu-devel@nongnu.org>; Mon, 15 Jul 2019 11:15:09 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-181.ams2.redhat.com
 [10.36.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 307EC1001DCF;
 Mon, 15 Jul 2019 11:15:03 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	dinechin@redhat.com
Date: Mon, 15 Jul 2019 12:15:00 +0100
Message-Id: <20190715111501.22368-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Mon, 15 Jul 2019 11:15:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/1] hmp queue
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit 298ad7b5a4519d2ae547df46103b2f8d49ca6f=
95:

  Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20190714' into =
staging (2019-07-15 09:46:15 +0100)

are available in the Git repository at:

  git://github.com/dagrh/qemu.git tags/pull-hmp-20190715

for you to fetch changes up to ea73f37062a9012a4f151f47f2427011b18569c8:

  Fix build error when VNC is configured out (2019-07-15 11:26:26 +0100)

----------------------------------------------------------------
HMP pull 2019-07-15

Just Christophe's build fix

----------------------------------------------------------------
Christophe de Dinechin (1):
      Fix build error when VNC is configured out

 monitor/hmp-cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


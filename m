Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39ECCCC85
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Oct 2019 21:46:11 +0200 (CEST)
Received: from localhost ([::1]:58632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGq0I-0002kB-As
	for lists+qemu-devel@lfdr.de; Sat, 05 Oct 2019 15:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37982)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iGpzB-0001vu-PX
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 15:45:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iGpzA-0008GP-A6
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 15:45:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40950)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1iGpz6-0008Dd-Tu; Sat, 05 Oct 2019 15:44:57 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BE7A68AC6E0;
 Sat,  5 Oct 2019 19:44:54 +0000 (UTC)
Received: from probe.redhat.com (ovpn-120-66.rdu2.redhat.com [10.10.120.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EFE35D717;
 Sat,  5 Oct 2019 19:44:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] MAINTAINERS: Add Vladimir as a reviewer for bitmaps
Date: Sat,  5 Oct 2019 15:44:47 -0400
Message-Id: <20191005194448.16629-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Sat, 05 Oct 2019 19:44:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Qemu-block <qemu-block@nongnu.org>, John Snow <jsnow@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; I'll be going away on an extended trip this November and have made
arrangements for reviews to be handled in my absence. I've asked Vladimir
to take point on any reviews for patches he didn't author, and have asked
Eric to take point on reviewing any of Vladimir's patches for this tree.

Because Virtuozzo contributes so heavily to this area, I've always liked
to get Vladimir's approval on patches before merging them anyway, so
this change formalizes the existing practice.

John Snow (1):
  MAINTAINERS: Add Vladimir as a reviewer for bitmaps

 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--=20
2.21.0



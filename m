Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6740C2E0A2
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 17:10:54 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56001 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hW0E8-0007t9-WB
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 11:10:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hW0CJ-00075d-D6
	for qemu-devel@nongnu.org; Wed, 29 May 2019 11:09:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hW0CI-0001u0-LM
	for qemu-devel@nongnu.org; Wed, 29 May 2019 11:08:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41618)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hW0CI-0001tb-Fy
	for qemu-devel@nongnu.org; Wed, 29 May 2019 11:08:58 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A28B3001789
	for <qemu-devel@nongnu.org>; Wed, 29 May 2019 15:08:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-250.ams2.redhat.com
	[10.36.117.250])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2826864026
	for <qemu-devel@nongnu.org>; Wed, 29 May 2019 15:08:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 997871138648; Wed, 29 May 2019 17:08:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 29 May 2019 17:08:50 +0200
Message-Id: <20190529150853.9772-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Wed, 29 May 2019 15:08:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/3] MAINTAINERS: Clean up and improve section
 headlines
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster (3):
  MAINTAINERS: Drop redundant L: qemu-devel@nongnu.org
  MAINTAINERS: Improve section headlines
  MAINTAINERS: Polish headline decorations

 MAINTAINERS | 113 +++++++++++++++++++++++-----------------------------
 1 file changed, 50 insertions(+), 63 deletions(-)

-- 
2.17.2



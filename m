Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A338131329
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 18:55:35 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46420 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWkoY-0002Pv-QW
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 12:55:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wainersm@redhat.com>) id 1hWkmf-0001WT-4J
	for qemu-devel@nongnu.org; Fri, 31 May 2019 12:53:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wainersm@redhat.com>) id 1hWkme-0000wb-3V
	for qemu-devel@nongnu.org; Fri, 31 May 2019 12:53:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:22912)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1hWkmd-0000ve-Ug
	for qemu-devel@nongnu.org; Fri, 31 May 2019 12:53:36 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 19598C004BA8
	for <qemu-devel@nongnu.org>; Fri, 31 May 2019 16:53:35 +0000 (UTC)
Received: from virtlab501.virt.lab.eng.bos.redhat.com
	(virtlab501.virt.lab.eng.bos.redhat.com [10.19.152.162])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A533E58C92;
	Fri, 31 May 2019 16:53:34 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 31 May 2019 12:53:33 -0400
Message-Id: <20190531165334.20403-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 31 May 2019 16:53:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/1] accel: get rid of AccelClass::opt_name
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
Cc: thuth@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AccelClass::opt_name is not used. Unless there is a reason
for keeping hat attribute, this patch remove it.

Git: https://github.com/wainersm/qemu
Branch: accel_del_opt_name
Travis: https://travis-ci.org/wainersm/qemu/builds/539721285
(Failed test case is not related with this change as well as
fails on master too.)

Wainer dos Santos Moschetta (1):
  accel: Remove unused AccelClass::opt_name attribute

 include/sysemu/accel.h | 1 -
 1 file changed, 1 deletion(-)

--=20
2.21.0



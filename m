Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54D527C88
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 14:15:37 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35079 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTmdE-0004Oy-Pj
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 08:15:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hTmau-0003GG-98
	for qemu-devel@nongnu.org; Thu, 23 May 2019 08:13:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hTmas-0002Q3-6J
	for qemu-devel@nongnu.org; Thu, 23 May 2019 08:13:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60622)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1hTmaq-0002A4-8S; Thu, 23 May 2019 08:13:08 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27F6230A5A5E;
	Thu, 23 May 2019 12:12:35 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-187.bos.redhat.com [10.18.17.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A02D795B3;
	Thu, 23 May 2019 12:12:31 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Thu, 23 May 2019 08:12:28 -0400
Message-Id: <20190523121230.17193-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 23 May 2019 12:12:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/2] Add QMP lexer for annotated JSON to
 Sphinx
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
	John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QMP isn't json. It turns out Pygments cares about this.
Teach Pygments to go with the annotated flow.

V2:
 - Change GPL2 to GPLv2+ (Peter Maydell)
 - Change "highlights" to "lexes" in docstrings
 - Fix typo ("Sphinx()" =3D> "Sphinx") in docstring

Reported-by: Aarushi Mehta <mehta.aaru20@gmail.com>

John Snow (2):
  sphinx: add qmp_lexer
  docs/bitmaps: use QMP lexer instead of json

 docs/conf.py             |  4 +--
 docs/interop/bitmaps.rst | 54 ++++++++++++++++++++--------------------
 docs/sphinx/qmp_lexer.py | 34 +++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 29 deletions(-)
 create mode 100644 docs/sphinx/qmp_lexer.py

--=20
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02DED5E08
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 10:59:34 +0200 (CEST)
Received: from localhost ([::1]:45918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJwCT-00044D-Fh
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 04:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57353)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iJwAI-0002cL-PT
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 04:57:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iJwAH-0001Jf-NU
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 04:57:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49552)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1iJwAF-0001Fq-8l; Mon, 14 Oct 2019 04:57:15 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BCA903082132;
 Mon, 14 Oct 2019 08:57:13 +0000 (UTC)
Received: from localhost (unknown [10.36.118.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD26B600CD;
 Mon, 14 Oct 2019 08:57:10 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Tracing patches
Date: Mon, 14 Oct 2019 09:57:07 +0100
Message-Id: <20191014085709.26812-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 14 Oct 2019 08:57:13 +0000 (UTC)
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
 qemu-block@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 98b2e3c9ab3abfe476a2b02f8f51813edb90e7=
2d:

  Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request'=
 into staging (2019-10-08 16:08:35 +0100)

are available in the Git repository at:

  https://github.com/stefanha/qemu.git tags/tracing-pull-request

for you to fetch changes up to a1f4fc951a277c49a25418cafb028ec5529707fa:

  trace: avoid "is" with a literal Python 3.8 warnings (2019-10-14 09:54:=
46 +0100)

----------------------------------------------------------------
Pull request

----------------------------------------------------------------

Stefan Hajnoczi (2):
  trace: add --group=3Dall to tracing.txt
  trace: avoid "is" with a literal Python 3.8 warnings

 docs/devel/tracing.txt        | 3 ++-
 scripts/tracetool/__init__.py | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

--=20
2.21.0



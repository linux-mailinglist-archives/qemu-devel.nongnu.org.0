Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1147A6A00
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 15:37:42 +0200 (CEST)
Received: from localhost ([::1]:46192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5909-0002NN-79
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 09:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51121)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i58pm-0001qC-NG
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 09:26:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i58pl-0000YO-Jq
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 09:26:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47410)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i58pl-0000YG-Ev
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 09:26:57 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8948F106E282;
 Tue,  3 Sep 2019 13:26:56 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-102.brq.redhat.com [10.40.204.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 274CF5C21A;
 Tue,  3 Sep 2019 13:26:51 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  3 Sep 2019 15:26:39 +0200
Message-Id: <20190903132649.20226-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Tue, 03 Sep 2019 13:26:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 00/10] travis: Use caching when possible
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series tries to reduce Travis CI failures due to network
issues, and tries to speed builds a bit, reducing failures due
to job timeouting.

Travis feature: https://docs.travis-ci.com/user/caching/

To see improvement over time, I recommend to apply this series
on top of different merge commit on master, to see changes in
cache use.

Few patches come from:
https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg04935.html

Regards,

Phil.

Philippe Mathieu-Daud=C3=A9 (10):
  .travis.yml: Enable multiple caching features
  .travis.yml: Increase cache timeout from 3min to 20min
  .travis.yml: Cache Python PIP packages
  .travis.yml: Cache Avocado cache
  .travis.yml: Improve ccache use
  .travis.yml: Enable ccache on OSX
  .travis.yml: Document how the build matrix use caches
  .travis.yml: Cache Linux/GCC 'debug profile' jobs together
  .travis.yml: Cache Linux/GCC 'non-debug profile' jobs together
  .travis.yml: Cache Linux/Clang jobs together

 .travis.yml | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

--=20
2.20.1



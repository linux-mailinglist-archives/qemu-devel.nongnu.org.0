Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E43129EB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 10:31:23 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36567 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMTbG-0002qi-RM
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 04:31:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55084)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <ao2@ao2.it>)
	id 1hMTXu-0000yf-RZ
	for qemu-devel@nongnu.org; Fri, 03 May 2019 04:27:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ao2@ao2.it>) id 1hMTXt-0006vg-Lo
	for qemu-devel@nongnu.org; Fri, 03 May 2019 04:27:54 -0400
Received: from mail.ao2.it ([2001:4b98:dc0:41:216:3eff:fe7c:639b]:39645
	helo=ao2.it)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ao2@ao2.it>) id 1hMTXt-0006tx-BM
	for qemu-devel@nongnu.org; Fri, 03 May 2019 04:27:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ao2.it;
	s=20180927; 
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
	bh=/n5pvoac7LRZ0llHugQlJ7DQ8ouXO/PE/l4Rvl0bA5M=; 
	b=fg8JLlxrwtcD2DJYXfNlLknjpQEXd/hP18hHjtDh1p+k4dvyRKB0qW+4Kv9FMO0aBBNGzCAmgKDwQk7C5TuDFxqHktrijfo5qFP90UYceZjylniVWGrtG6ql7nx/Ql6TckC4p8iu/CgWLp7odc6re06hGIefMBQfSV6KVoBZA9sVRjyKmVURBYJHrPquk3MpRpvPdkBm4D6Z2UXpnvrya+RHMGtc9ITnLmyf42XhkKUBky+Bbc4T7ebEP/1OZs8IBTdVQlcnQAPYaTZPCVZcXBbYH96nm4bV31mwHJ7M+H9iX4eEHD7aul2InowULdaajKRaz6+QKwv+V2hUBGlc/A==;
Received: from localhost ([::1] helo=jcn)
	by ao2.it with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.84_2) (envelope-from <ao2@ao2.it>)
	id 1hMTXl-0001Ln-OH; Fri, 03 May 2019 10:27:45 +0200
Received: from ao2 by jcn with local (Exim 4.92) (envelope-from <ao2@ao2.it>)
	id 1hMTXm-0004Ie-C3; Fri, 03 May 2019 10:27:46 +0200
From: Antonio Ospite <ao2@ao2.it>
To: qemu-devel@nongnu.org
Date: Fri,  3 May 2019 10:27:26 +0200
Message-Id: <20190503082728.16485-1-ao2@ao2.it>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:4b98:dc0:41:216:3eff:fe7c:639b
Subject: [Qemu-devel] [PATCH v2 0/2] configure: disallow spaces and colons
 in source path and build path
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Antonio Ospite <ao2@ao2.it>,
	Antonio Ospite <antonio.ospite@collabora.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Here is a v2 patch set to address
https://bugs.launchpad.net/qemu/+bug/1817345

The series follows up to:
https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg05290.html
https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg05573.html

Changes since v1:
  - Add a preparatory patch to set source_path only once and in a more
    robust way.

  - Move the checks in configure after the source_path definition to
    avoid using realpath which is not available everywhere.

  - Cover also the build path in Makefile. An extensive explanation of
    why I think this is needed is here:
    https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg05398.html

Thanks,
   Antonio

Antonio Ospite (2):
  configure: set source_path only once and make its definition more
    robust
  configure: disallow spaces and colons in source path and build path

 Makefile  |  4 ++++
 configure | 12 +++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

-- 
Antonio Ospite
https://ao2.it
https://twitter.com/ao2it

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?


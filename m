Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C470183FE5
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 05:07:14 +0100 (CET)
Received: from localhost ([::1]:53532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCbbN-0004np-L8
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 00:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44144)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jCba7-0003Pf-6y
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 00:05:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jCba6-00076J-3r
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 00:05:54 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52087 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jCba5-0006re-7J; Fri, 13 Mar 2020 00:05:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48dsYj11NPz9sST; Fri, 13 Mar 2020 15:05:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1584072345;
 bh=xk5URsV6qPM0+u0mwlF1cpAvKC3i1XxhgadQKekgkEo=;
 h=From:To:Cc:Subject:Date:From;
 b=hGFndJCt+5WFnNBzpBDkg40AzBSgFS+sNxV3ywt67zvaLQyW1rBnUlhJi8m1/HD75
 1Xuzcijy2znv7y6UcWTVTGcd+c3Sqieuf8vdEAXumZ4kAthlj9i4GmB8rBTVBLdUEv
 YGh2VvUao4hoEvavSu4h6fPE6x/7FLWamSLkA4zc=
From: David Gibson <david@gibson.dropbear.id.au>
To: groug@kaod.org,
	clg@kaod.org,
	philmd@redhat.com
Subject: [PATCH 0/4] spapr: Assorted minor cleanups
Date: Fri, 13 Mar 2020 15:05:35 +1100
Message-Id: <20200313040539.819138-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here's a handful of cleanups that came out of larger bits of work but
which aren't intimately tied to those.  For one reason or another they
got forgotten for a while, but I've now dug them out, polished them a
bit and hope to get them in just in time for the qemu-5.0 soft freeze.

David Gibson (4):
  spapr: Move creation of ibm,dynamic-reconfiguration-memory dt node
  spapr: Move creation of ibm,architecture-vec-5 property
  spapr: Rename DT functions to newer naming convention
  spapr: Fold spapr_node0_size() into its only caller

 hw/ppc/spapr.c              | 597 ++++++++++++++++++------------------
 hw/ppc/spapr_ovec.c         |   4 +-
 include/hw/ppc/spapr_ovec.h |   4 +-
 3 files changed, 294 insertions(+), 311 deletions(-)

--=20
2.24.1



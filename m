Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D860418E83
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 06:57:18 +0200 (CEST)
Received: from localhost ([::1]:37620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUihZ-00017m-Gb
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 00:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUiYt-0000Bb-BE; Mon, 27 Sep 2021 00:48:19 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:35843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUiYp-00008l-RW; Mon, 27 Sep 2021 00:48:19 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HHqrq0SHzz4xbV; Mon, 27 Sep 2021 14:48:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632718091;
 bh=CyR5jkEjxV9S7GHqYfmoOSY7wBBLJZHfuIQ6sy2zmSE=;
 h=From:To:Cc:Subject:Date:From;
 b=Yfc60d250yNi8T/wQrdC/GTPl1NvifoAiRU91c8VjLk02SQ1y/uYH9YrG+akM+Cdd
 +2DpoRRiDdSlrrc7Zjt3jXCZcUsBSlCxMgCTv5h7rKGJg1mz0S6dhSxqSTy5uhIKJT
 +hIzhw24MOXbKqBhm49cVd8llmvFGvDSo/IIMHAI=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 0/7] Reduce load on ppc target maintainers
Date: Mon, 27 Sep 2021 14:48:01 +1000
Message-Id: <20210927044808.73391-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, aik@ozlabs.ru,
 mark.cave-ayland@ilande.co.uk, groug@kaod.org, wainersm@redhat.com,
 hpoussin@reactos.org, clg@kaod.org, crosa@redhat.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Greg Kurz and myself have been co-maintainers for the ppc and ppc64=0D
targets for some time now.  However, both our day job responsibilities=0D
and interests are leading us towards other areas, so we have less time=0D
to devote to this any more.=0D
=0D
Therefore, here's a bunch of updates to MAINTAINERS, intended to=0D
reduce the load on us.  Mostly this is marking fairly obscure=0D
platforms as orphaned (if someone wants to take over maintainership,=0D
let me know ASAP).  Bigger changes may be coming, but we haven't=0D
decided exactly what that's going to look like yet.=0D
=0D
Changes since v2:=0D
 * Clarified overly broad TCG CPUs entry=0D
Changes since v1:=0D
 * Reworked how OpenPIC is listed=0D
=0D
David Gibson (7):=0D
  qemu: Split machine_ppc.py acceptance tests=0D
  MAINTAINERS: Remove machine specific files from ppc TCG CPUs entry=0D
  MAINTAINERS: Remove David & Greg as reviewers for a number of boards=0D
  MAINTAINERS: Orphan obscure ppc platforms=0D
  MAINTAINERS: Remove David & Greg as reviewers/co-maintainers of=0D
    powernv=0D
  MAINTAINERS: Add information for OpenPIC=0D
  MAINTAINERS: Demote sPAPR from "Supported" to "Maintained"=0D
=0D
 MAINTAINERS                          | 51 ++++++++------------=0D
 tests/acceptance/machine_ppc.py      | 69 ----------------------------=0D
 tests/acceptance/ppc_mpc8544ds.py    | 32 +++++++++++++=0D
 tests/acceptance/ppc_pseries.py      | 35 ++++++++++++++=0D
 tests/acceptance/ppc_virtex_ml507.py | 34 ++++++++++++++=0D
 5 files changed, 121 insertions(+), 100 deletions(-)=0D
 delete mode 100644 tests/acceptance/machine_ppc.py=0D
 create mode 100644 tests/acceptance/ppc_mpc8544ds.py=0D
 create mode 100644 tests/acceptance/ppc_pseries.py=0D
 create mode 100644 tests/acceptance/ppc_virtex_ml507.py=0D
=0D
-- =0D
2.31.1=0D
=0D


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D046A2590C0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 16:38:21 +0200 (CEST)
Received: from localhost ([::1]:55040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD7QS-0005JX-Su
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 10:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kD78t-0001P7-GN
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 10:20:11 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:22578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kD78r-00053g-8H
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 10:20:11 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-TpQ5wt9wNR-N_Ys0eh2XZg-1; Tue, 01 Sep 2020 10:20:05 -0400
X-MC-Unique: TpQ5wt9wNR-N_Ys0eh2XZg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBC89801AB9
 for <qemu-devel@nongnu.org>; Tue,  1 Sep 2020 14:20:04 +0000 (UTC)
Received: from bahia.lan (ovpn-112-6.ams2.redhat.com [10.36.112.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B93C60BE2;
 Tue,  1 Sep 2020 14:20:04 +0000 (UTC)
Subject: [PATCH 0/2] Makefile: A few post-meson-conversion fixes
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Tue, 01 Sep 2020 16:20:02 +0200
Message-ID: <159896923655.442705.11922948674073863022.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 10:20:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The meson conversion broke the ability to use cscope, etags and ctags
without running configure beforehand, which is a bit painful. This series
restore the previous behavior.

---

Greg Kurz (2):
      Makefile: Add back TAGS/ctags/cscope rules
      Makefile: Fix in-tree clean/distclean


 Makefile |   33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

--
Greg



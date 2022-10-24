Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BC960B918
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 22:03:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on3WW-0007G1-4Y; Mon, 24 Oct 2022 15:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1on3WQ-0007FY-W8
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 15:54:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1on3WO-0005Hh-0p
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 15:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666641240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7rMcZxHr7FZAFpqhktj8R7Vg5aQD1sqGm4nPNR3oXW0=;
 b=bhUP3UNS3RtstvYvUxQ0Ss7jt2gn0+9vdu3oW0ibz01/QjqdXdXRJq/8A1g5E2LNIcgmN1
 WhZzY1NyhtQdy98oEDqSSk8lfLAPjJ9wViOkLcZkz/zIDh81UCW5CPoY9Vop2aEv6ADH0D
 K+3nCdS2lTD64SrpWJXVjOV9NPoaCuc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-gJxfRxG7OhC00akSo6ETbQ-1; Mon, 24 Oct 2022 15:53:58 -0400
X-MC-Unique: gJxfRxG7OhC00akSo6ETbQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70F931C0513C
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 19:53:57 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98ED31415114;
 Mon, 24 Oct 2022 19:53:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH 0/2] python: misc machine.py improvements
Date: Mon, 24 Oct 2022 15:53:53 -0400
Message-Id: <20221024195355.860504-1-jsnow@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Improve machine.py logging and fix a shutdown bug that we *probably*=0D
weren't actually hitting anywhere.=0D
=0D
Changes for console input logging are on the way, but separate because=0D
it will touch avocado.=0D
=0D
More comprehensive fixes for multiple socket polling are also on the=0D
way, but decidedly separate. This is the simple stuff that might make it=0D
easier to diagnose failures in the meantime.=0D
=0D
John Snow (2):=0D
  python/machine: Add debug logging to key state changes=0D
  python/machine: Handle termination cases without QMP=0D
=0D
 python/qemu/machine/machine.py | 24 ++++++++++++++++++++++++=0D
 1 file changed, 24 insertions(+)=0D
=0D
-- =0D
2.37.3=0D
=0D



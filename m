Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B40534A4D0E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 18:24:38 +0100 (CET)
Received: from localhost ([::1]:59740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEaPt-0003RT-OX
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 12:24:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEa6e-0001Od-SL
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:04:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEa6Z-0007QU-Px
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643648678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jCKISQM8OVQV1lxNT0aldNojbl/K7adwSsG0axxYeVA=;
 b=MFqrlxWL/ySNkN2UFT+hqeB2yCwP4gK/ER/53YNKu9gVOqoZ8UJje/vM9Rj2eamG8axYMj
 IUv0yFmpcVUHmXQyj3Kc/7n1BNiqi/C41LGsjBEuN+X7+moMnCrmxjF7SbBObbzSw3w1wP
 tqc+HRZ2ngNHpfcYu0IZrj7XEkaui+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-9sBP1T8cMuiu2sL-OEIe6Q-1; Mon, 31 Jan 2022 12:04:37 -0500
X-MC-Unique: 9sBP1T8cMuiu2sL-OEIe6Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74FD6190B2D7;
 Mon, 31 Jan 2022 17:04:19 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6B7610A48DC;
 Mon, 31 Jan 2022 17:04:17 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/5] docs: Don't document disabled features
Date: Mon, 31 Jan 2022 18:04:06 +0100
Message-Id: <20220131170411.125198-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 timao@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It was reported that it's confusing that the QEMU man page contains
documentation of features that aren't even available in the build
because they were disabled during configure.

This series makes documentation for some block drivers conditional so
that it is only included in the man page (and other documentation) when
the feature is actually available in the build.

Kevin Wolf (5):
  docs: Pass disabled configure options to sphinx
  docs: Only mention iscsi in the man page when available
  docs: Only mention ssh in the man page when available
  docs: Only mention curl in the man page when available
  docs: Only mention gluster in the man page when available

 docs/meson.build                      |  10 +
 docs/system/device-url-syntax.rst.inc | 252 +++++++++++++-------------
 qemu-options.hx                       |   9 +-
 3 files changed, 146 insertions(+), 125 deletions(-)

-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F336412D0
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Dec 2022 01:54:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1Gmp-0002cX-41; Fri, 02 Dec 2022 19:53:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1p1Gml-0002aV-GC
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 19:53:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.145.221.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1p1GmN-0004Cd-FS
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 19:53:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670028797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SGxhlgvAdkcE8FY+GpQUKLoD96pgMGnyNcVIxklK8jY=;
 b=czWCZOyKzlPLQTE5MFr9z1Qyw6/Oz9pw5OLB8IMRa5CPDC0Pi7nXoN7ap8nrqrFNQXBf31
 Cl6yMuydnu/qnjxsmMlqVO8fkJhJhcHOTUI6PQZPrwqEHn4agZfLLRwV6JrWIan0lYZRlt
 LdKe7QN7Zg+eCFNP6ke0K+ZWPZeIHUA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-kLNQrDUqMCGQfMzGRRB9GA-1; Fri, 02 Dec 2022 19:53:16 -0500
X-MC-Unique: kLNQrDUqMCGQfMzGRRB9GA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFC63833AF0;
 Sat,  3 Dec 2022 00:52:55 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C56740C94CE;
 Sat,  3 Dec 2022 00:52:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-block@nongnu.org,
 Beraldo Leal <bleal@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH 0/3] python: testing fixes
Date: Fri,  2 Dec 2022 19:52:31 -0500
Message-Id: <20221203005234.620788-1-jsnow@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: permerror client-ip=216.145.221.124;
 envelope-from=jsnow@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

A few tiny touchups needed for cutting edge 'flake8' tooling, a minor=0D
type touchup in iotests, and extending the python tests to cover the=0D
recently released Python 3.11.=0D
=0D
John Snow (3):=0D
  Python: fix flake8 config=0D
  iotests/check: Fix typing for sys.exit() value=0D
  python: add 3.11 to supported list=0D
=0D
 python/setup.cfg         | 6 ++++--=0D
 tests/qemu-iotests/check | 2 +-=0D
 2 files changed, 5 insertions(+), 3 deletions(-)=0D
=0D
-- =0D
2.38.1=0D
=0D



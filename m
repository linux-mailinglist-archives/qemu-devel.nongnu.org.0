Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE56274BCE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 00:03:38 +0200 (CEST)
Received: from localhost ([::1]:47180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKqNt-0006FH-GR
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 18:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpj3-00038f-Px
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:21:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpj1-00074j-SV
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:21:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600809683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=X+Rbeql97Nua52db8mYi11B7/W48z48bdtrk2XfVR7w=;
 b=H9ilRlPKhpxrRc47dDM+bpAepdfTpnerqkzbWhUJrjk3gcGQPI3jcGBZX1Qqpi7RFv8Fev
 kngpJ6G7ddW70/ndiiXQfDNj9CLSadegOMt1/llZxNGCz8JCKXop5tpVNIRnHpQyfR22kT
 nTWrdOPTlZzl0N3Fl3VYaMBOvpYDnak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-nEbkCAXbMLGUx5xPQ1ATPw-1; Tue, 22 Sep 2020 17:21:20 -0400
X-MC-Unique: nEbkCAXbMLGUx5xPQ1ATPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED559186DD27;
 Tue, 22 Sep 2020 21:21:19 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C56515DA7B;
 Tue, 22 Sep 2020 21:21:15 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 0/6] qapi: static typing conversion, pt4
Date: Tue, 22 Sep 2020 17:21:09 -0400
Message-Id: <20200922212115.4084301-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 02:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

based-on: <20200922211802.4083666-1-jsnow@redhat.com>=0D
          [PATCH 00/14] qapi: static typing conversion, pt3=0D
=0D
Hi, this series adds static type hints to the QAPI module.=0D
This is part four!=0D
=0D
Part 4: https://gitlab.com/jsnow/qemu/-/tree/python-qapi-cleanup-pt4=0D
Everything: https://gitlab.com/jsnow/qemu/-/tree/python-qapi-cleanup-pt6=0D
=0D
- Requires Python 3.6+=0D
- Requires mypy 0.770 or newer (for type analysis only)=0D
- Requires pylint 2.6.0 or newer (for lint checking only)=0D
=0D
This part of the series focuses on error.py.=0D
=0D
Type hints are added in patches that add *only* type hints and change no=0D
other behavior. Any necessary changes to behavior to accommodate typing=0D
are split out into their own tiny patches.=0D
=0D
Every commit should pass with:=0D
 - flake8 qapi/=0D
 - pylint --rcfile=3Dqapi/pylintrc qapi/=0D
 - mypy --config-file=3Dqapi/mypy.ini qapi/=0D
=0D
John Snow (6):=0D
  qapi/error.py: refactor error classes=0D
  qapi/parser.py: remove parser context from QAPIDoc=0D
  qapi/error.py: move QAPIParseError to parser.py=0D
  qapi/parser.py: refactor QAPIParseError=0D
  qapi/error.py: enable mypy checks=0D
  qapi/error.py: enable pylint checks=0D
=0D
 scripts/qapi/error.py  |  41 +++++++-------=0D
 scripts/qapi/main.py   |   2 +-=0D
 scripts/qapi/mypy.ini  |   5 --=0D
 scripts/qapi/parser.py | 120 ++++++++++++++++++++++++-----------------=0D
 scripts/qapi/pylintrc  |   3 +-=0D
 scripts/qapi/schema.py |   4 +-=0D
 6 files changed, 94 insertions(+), 81 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBFF39BC7A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:02:31 +0200 (CEST)
Received: from localhost ([::1]:43160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCHG-0004dn-M9
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCAe-0000vJ-Ch
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:55:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCAc-0001Re-4B
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622822137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g5UN4pky3jS8IU/CN8AIiXR472m0rAmPdlHRDzM+nFk=;
 b=EKOGFKV7m6CmiK83Bd2mvdGypPU9IxSvhKQCxk2Ojrgqbdfizje7PhAhI6PK0aevHvaVgp
 bvRfobyXzKwWtE+FaTXEyKeDadsMiarBZHraweMzhiN3BLOpwq7Z4wUd18N0b++il+PT6Y
 VyQz68IAjdmrD4oHRTKQI3CnJQwl0pU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-5exCqI4YNkyXWamru8hu5w-1; Fri, 04 Jun 2021 11:55:35 -0400
X-MC-Unique: 5exCqI4YNkyXWamru8hu5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76B6A189C446;
 Fri,  4 Jun 2021 15:55:34 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37A8C620DE;
 Fri,  4 Jun 2021 15:55:33 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] python: move /scripts/qmp/gemu-ga-client.py to qemu.qmp
 package
Date: Fri,  4 Jun 2021 11:55:21 -0400
Message-Id: <20210604155532.1499282-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Delint and type the qemu-ga-client and move it over into=0D
/python/qemu/qmp/qemu_ga_client.py.=0D
=0D
Based-on: <20210603003719.1321369-1-jsnow@redhat.com>=0D
GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-package-qga=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/315122004=0D
=0D
(Weakly based on "[PATCH v3 00/19] Python: move /scripts/qmp/qom* to=0D
/python/qemu/qmp/qom*", for the purposes of avoiding context conflicts=0D
in /python/setup.cfg, but is trivially rebased without it.)=0D
=0D
Add a new console entrypoint to the package under "qemu-ga-client",=0D
keeping the old name. (This makes a script named "qemu-ga-client"=0D
available in your $PATH when you use pip to install the qemu.qmp=0D
package.)=0D
=0D
Add a forwarder shim back to /scripts/qmp/qemu-ga-client.py that=0D
forwards to the new script, keeping functionality as it was in the old=0D
location, at least for a little while. I intend to eventually deprecate=0D
these forwarders, but not yet. (This allows you to use "qemu-ga-client"=0D
from the scripts directory without needing to install the qemu.qmp=0D
package.)=0D
=0D
Now this script is protected against regressions against the qemu.qmp=0D
package because it's part of it, and validated regularly by GitLab CI.=0D
=0D
John Snow (11):=0D
  scripts/qemu-ga-client: apply isort rules=0D
  scripts/qemu-ga-client: apply (most) flake8 rules=0D
  scripts/qemu-ga-client: Fix exception handling=0D
  scripts/qemu-ga-client: replace deprecated optparse with argparse=0D
  scripts/qemu-ga-client: add module docstring=0D
  scripts/qemu-ga-client: apply (most) pylint rules=0D
  python/qmp: Correct type of QMPReturnValue=0D
  scripts/qemu-ga-client: add mypy type hints=0D
  scripts/qemu-ga-client: move to python/qemu/qmp/qemu_ga_client.py=0D
  python/qemu-ga-client: add entry point=0D
  scripts/qemu-ga-client: Add forwarder shim=0D
=0D
 python/qemu/qmp/__init__.py       |  25 ++-=0D
 python/qemu/qmp/qemu_ga_client.py | 323 ++++++++++++++++++++++++++++++=0D
 python/setup.cfg                  |   1 +=0D
 scripts/qmp/qemu-ga-client        | 297 +--------------------------=0D
 4 files changed, 341 insertions(+), 305 deletions(-)=0D
 create mode 100644 python/qemu/qmp/qemu_ga_client.py=0D
=0D
--=20=0D
2.31.1=0D
=0D



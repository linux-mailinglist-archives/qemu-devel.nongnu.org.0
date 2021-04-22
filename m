Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62BD3677BB
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 05:09:14 +0200 (CEST)
Received: from localhost ([::1]:41718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZPiL-0007uY-9n
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 23:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgm-0006Jr-Df
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgc-0006Pm-UX
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619060845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tC8WYdTkhSftBth9WPYLVPMEk22+lih2yt4Z9ES9ZSk=;
 b=JJ07tVb50WilMSLtvQ6bLipqRaxEsIBTQmdcj8oyU4z28BECNwMO0FFD8uJEaSni1tqVnd
 GQzWDX+6avKwpeaB9KCEqw6AT8FzWEiJu0YJxA0cuPuBZtRlTV2mZB/keEthM1+ISdHvQ8
 24XpeW6qZ95VjfpfHZUMQEvZFchT11c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-YCVGUPnaP3C04HhRBdJXlw-1; Wed, 21 Apr 2021 23:07:22 -0400
X-MC-Unique: YCVGUPnaP3C04HhRBdJXlw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 642CD801814;
 Thu, 22 Apr 2021 03:07:21 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A28F45DDAD;
 Thu, 22 Apr 2021 03:07:20 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/22] qapi: static typing conversion, pt5a
Date: Wed, 21 Apr 2021 23:06:58 -0400
Message-Id: <20210422030720.3685766-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is part five, and focuses on QAPISchemaParser in parser.py.=0D
It does not touch QAPIDoc yet, which will be covered next.=0D
=0D
gitlab: https://gitlab.com/jsnow/qemu/-/commits/python-qapi-cleanup-pt5a=0D
merge-request (and CI): https://gitlab.com/jsnow/qemu/-/merge_requests/3=0D
=0D
I encourage you to leave comments on the gitlab MR request link!  Let's=0D
try an experiment. (Of course, I will still response to critique on the=0D
list, as usual.)=0D
=0D
The patches that belong to just part five start here:=0D
https://gitlab.com/jsnow/qemu/-/merge_requests/3/diffs?commit_id=3D7cc329b5=
7bbc5504cba7552be6c0502081aca5f0=0D
=0D
At the top near "Viewing commit 7cc329b5", you can click "Next" to move=0D
on to the next patch after you're done leaving comments on a single=0D
commit.=0D
=0D
Give it a whirl!=0D
=0D
Requirements:=0D
- Python 3.6+=0D
- mypy >=3D 0.770=0D
- pylint >=3D 2.6.0 (2.7.0+ when using Python 3.9+)=0D
=0D
Every commit should pass with:=0D
 - `isort -c qapi/`=0D
 - `flake8 qapi/`=0D
 - `pylint --rcfile=3Dqapi/pylintrc qapi/`=0D
 - `mypy --config-file=3Dqapi/mypy.ini qapi/`=0D
=0D
John Snow (22):=0D
  qapi/parser: Don't try to handle file errors=0D
  qapi/source: [RFC] add "with_column" contextmanager=0D
  qapi/source: Remove line number from QAPISourceInfo initializer=0D
  qapi/parser: factor parsing routine into method=0D
  qapi/parser: Assert lexer value is a string=0D
  qapi/parser: assert get_expr returns object in outer loop=0D
  qapi/parser: assert object keys are strings=0D
  qapi/parser: Use @staticmethod where appropriate=0D
  qapi: add match_nofail helper=0D
  qapi/parser: Fix typing of token membership tests=0D
  qapi/parser: Rework _check_pragma_list_of_str as a TypeGuard=0D
  qapi/parser: add type hint annotations=0D
  qapi/parser: [RFC] overload the return type of get_expr=0D
  qapi/parser: Remove superfluous list constructor=0D
  qapi/parser: allow 'ch' variable name=0D
  qapi/parser: add docstrings=0D
  CHECKPOINT=0D
  qapi: [WIP] Rip QAPIDoc out of parser.py=0D
  qapi: [WIP] Add type ignores for qapidoc.py=0D
  qapi: [WIP] Import QAPIDoc from qapidoc Signed-off-by: John Snow=0D
    <jsnow@redhat.com>=0D
  qapi: [WIP] Add QAPIDocError=0D
  qapi: [WIP] Enable linters on parser.py=0D
=0D
 scripts/qapi/common.py  |   8 +-=0D
 scripts/qapi/error.py   |   8 +-=0D
 scripts/qapi/expr.py    |   2 +-=0D
 scripts/qapi/main.py    |  14 +-=0D
 scripts/qapi/mypy.ini   |   2 +-=0D
 scripts/qapi/parser.py  | 566 +++++++++++++---------------------------=0D
 scripts/qapi/pylintrc   |   3 +-=0D
 scripts/qapi/qapidoc.py | 360 +++++++++++++++++++++++++=0D
 scripts/qapi/source.py  |  32 ++-=0D
 9 files changed, 581 insertions(+), 414 deletions(-)=0D
 create mode 100644 scripts/qapi/qapidoc.py=0D
=0D
--=20=0D
2.30.2=0D
=0D



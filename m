Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65FE3896EA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:44:04 +0200 (CEST)
Received: from localhost ([::1]:54978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljS6t-0001tn-P6
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljRhA-0001L9-D0
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:17:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljRh7-0005Rl-S7
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:17:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621451845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ksmN5GDtZ8IIzDV26hV0ioMEXOiqhYtNTad+oBXgGqY=;
 b=UcVPUBrtI7nO/qATpd+mP4OlFhp7sL/WgThKv5UVBVhCzt6cOSmSkqAVR1iVEpGX7JTP61
 zVKhS5I9ggstaK9InenznLKb1Dwa/VFvpzxWVigRFIVobvPrLqD/KO42EHIXHRdDLrFxi+
 NTJjD/2zf1hsCTJoTNBLrbF1/MIjB1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-SlFlk37fMTmKq3TUrQkWHA-1; Wed, 19 May 2021 15:17:21 -0400
X-MC-Unique: SlFlk37fMTmKq3TUrQkWHA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3603E106BB24;
 Wed, 19 May 2021 19:17:20 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A0A15D9CC;
 Wed, 19 May 2021 19:17:19 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] qapi: static typing conversion, pt5b
Date: Wed, 19 May 2021 15:17:12 -0400
Message-Id: <20210519191718.3950330-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is part five (b), and focuses on QAPIDoc in parser.py.=0D
=0D
gitlab: https://gitlab.com/jsnow/qemu/-/commits/python-qapi-cleanup-pt5b=0D
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
John Snow (6):=0D
  qapi/parser.py: remove unused check_args_section arguments=0D
  qapi/parser: Allow empty QAPIDoc Sections=0D
  qapi/parser.py: add type hint annotations (QAPIDoc)=0D
  qapi/parser.py: enable mypy checks=0D
  qapi/parser.py: Silence too-few-public-methods warning=0D
  qapi/parser.py: enable pylint checks=0D
=0D
 scripts/qapi/mypy.ini  |  5 ---=0D
 scripts/qapi/parser.py | 85 ++++++++++++++++++++++++++----------------=0D
 scripts/qapi/pylintrc  |  3 +-=0D
 3 files changed, 54 insertions(+), 39 deletions(-)=0D
=0D
--=20=0D
2.30.2=0D
=0D



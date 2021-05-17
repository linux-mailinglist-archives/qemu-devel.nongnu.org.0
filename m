Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4C3383D47
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:27:52 +0200 (CEST)
Received: from localhost ([::1]:34644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiu7-0003t5-Hp
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1liiHt-00013h-B4
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:48:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1liiHq-0006tA-25
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621277297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ojBQ5fZ9jKOJb6yfEoSsq5NDls6KcXbvgafDUBVfoG4=;
 b=PE4ONSpcOUQfvjPAvXL2jqraSsg51KsrLEen616SERGhlJSeIeYXwHPW+OGncwUUFgIjUv
 ntcgn2Sj8sCLkx63M6fgsJ9arJKLLCfQ+7E3fOWeAS55mWWYCw3pPs0dasIr+I8uo8AE6K
 UMxkrhc0ySSwna/OeRWg6yhIqP7K79M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-rWuvbpf7PGuicFGKa_ytDA-1; Mon, 17 May 2021 14:48:14 -0400
X-MC-Unique: rWuvbpf7PGuicFGKa_ytDA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D42E1854E29
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 18:48:13 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB87A19C46;
 Mon, 17 May 2021 18:48:08 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] Python: delint python library
Date: Mon, 17 May 2021 14:48:02 -0400
Message-Id: <20210517184808.3562549-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gitlab CI: https://gitlab.com/jsnow/qemu/-/pipelines/304224309=0D
branch: https://gitlab.com/jsnow/qemu/-/commits/python-package-pre-cleanup=
=0D
=0D
This series serves as a pre-requisite for packaging the python series=0D
and getting the linters running via CI. The first patch fixes a linter=0D
error we've had for a while now; the subsequent ones fix a new warning=0D
that was recently added to pylint 2.8.x.=0D
=0D
V2:=0D
 - iotest bits already handled, dropped here.=0D
 - Changed patch #3 based on feedback from Wainer.=0D
=0D
John Snow (6):=0D
  python/console_socket: avoid one-letter variable=0D
  python/machine: use subprocess.DEVNULL instead of=0D
    open(os.path.devnull)=0D
  python/machine: use subprocess.run instead of subprocess.Popen=0D
  python/console_socket: Add a pylint ignore=0D
  python/machine: Disable pylint warning for open() in _pre_launch=0D
  python/machine: disable warning for Popen in _launch()=0D
=0D
 python/qemu/console_socket.py | 11 ++++++-----=0D
 python/qemu/machine.py        | 28 ++++++++++++++++++----------=0D
 2 files changed, 24 insertions(+), 15 deletions(-)=0D
=0D
--=20=0D
2.30.2=0D
=0D



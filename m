Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E3A4E7A9D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 21:08:10 +0100 (CET)
Received: from localhost ([::1]:47420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXqEC-0007AM-QQ
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 16:08:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXqAw-0003Q9-Hc
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 16:04:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXqAs-0001it-QU
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 16:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648238681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nzCp9OlxwnR5RAPqLiuzOoF/ncj9OOWZB2eijhM3QDE=;
 b=UoPJqxU8u8GD0ozGG9LXHkIgBXi/hFpcJtnt459B80AemlWGC5ZjQXZ9PbjSpCkuFEr4dg
 Gcc+Zw5WhKx1iYFmHfZ3rFVxHroKQI6tVXzA8YCvww6jPhLxBmYcMjMFUFo3/SbTmsTJ14
 oEyH1kboYM25HZJ+4fqjaH0hJB0EPYg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-sWTYllL9NKWmwwEBeybn9Q-1; Fri, 25 Mar 2022 16:04:39 -0400
X-MC-Unique: sWTYllL9NKWmwwEBeybn9Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0DCE80159B
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 20:04:38 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 908E263BB20;
 Fri, 25 Mar 2022 20:04:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] Python: relicense async qmp as LGPLv2+
Date: Fri, 25 Mar 2022 16:04:34 -0400
Message-Id: <20220325200438.2556381-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Daniel Berrange <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Eric Blake <eblake@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch 2 explains most of the why.=0D
=0D
The only dangling exception is legacy.py (patch 1), which I have plans=0D
to replace "soon" :tm: (after I fork this code out of qemu.git.)=0D
=0D
John Snow (4):=0D
  python/aqmp: add explicit GPLv2 license to legacy.py=0D
  python/aqmp: relicense as LGPLv2+=0D
  python/qmp-shell: relicense as LGPLv2+=0D
  python/aqmp-tui: relicense as LGPLv2+=0D
=0D
 python/qemu/aqmp/__init__.py  |  6 +++---=0D
 python/qemu/aqmp/aqmp_tui.py  |  2 +-=0D
 python/qemu/aqmp/legacy.py    | 11 +++++++++++=0D
 python/qemu/aqmp/qmp_shell.py |  7 ++++---=0D
 4 files changed, 19 insertions(+), 7 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D



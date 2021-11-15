Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC5C44FFC4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 09:08:44 +0100 (CET)
Received: from localhost ([::1]:36500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmX2h-0000Ug-62
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 03:08:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mmWxp-0003jJ-Qe
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 03:03:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mmWxo-0007fr-7D
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 03:03:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636963419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M5scYZGPAWwiUZomtLzFgF/1Qwk95VrUl8Q/sJyYlX0=;
 b=aQpiyNWpBwY153CqCUx9KcdyY3UIXTyIp7BRhpwz7wo6FfUSl7X8xZUL++N5vVPfXNiux/
 xW3kD2wTn2cEMOl0eg71j4phB9g+Nm1MAoagU1Qcnfwdr8tdsGbZOKPRJOK4NL+eV68Vtw
 iUfBPxk+7HvXhTk+VW7mQkeSbF51SpA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-3bFBoWD-PeCdYxz0aBsKTw-1; Mon, 15 Nov 2021 03:03:25 -0500
X-MC-Unique: 3bFBoWD-PeCdYxz0aBsKTw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 378BF824F8D
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:03:24 +0000 (UTC)
Received: from localhost (unknown [10.39.208.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 004515C1BB;
 Mon, 15 Nov 2021 08:03:15 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] qemu-options: define -spice only #ifdef CONFIG_SPICE
Date: Mon, 15 Nov 2021 12:03:10 +0400
Message-Id: <20211115080312.64692-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, berrange@redhat.com, armbru@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
This is v2 of "[PATCH] qemu-options.hx: remove -spice options from --help",=
=0D
after Markus comment on patch title.=0D
=0D
Marc-Andr=C3=A9 Lureau (2):=0D
  qemu-options: define -spice only #ifdef CONFIG_SPICE=0D
  vl: typo fix in a comment=0D
=0D
 softmmu/vl.c    | 4 +++-=0D
 qemu-options.hx | 2 ++=0D
 2 files changed, 5 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.33.0.721.g106298f7f9=0D
=0D



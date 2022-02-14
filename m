Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F0F4B5AE6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 21:16:47 +0100 (CET)
Received: from localhost ([::1]:58134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJhmA-0002xy-CG
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 15:16:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nJhjg-0000jW-TS
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 15:14:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nJhjc-0003j5-Uz
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 15:14:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644869647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xUGsTMHBN5yrH4GkdZzvZ8LVqQJ0WmM4FjDOrC4KEUw=;
 b=KS71tsu7QdpRZtB23L/bG33ahGi9cq3FVbiaWyL8T0Shd+/LLujKvYOMP9TAoPEZHTuPOA
 9XijcgtWOb3mFwjD3FdexS+hpLJcNqEnyqwqr8s49Wkmr/7jx3sGdkmwwMfk6q4BEU27u7
 7xJhUYn22w4bLBjElDIaK7iQgewK6cs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-vEQVYE4BPK28fK1cWYYgGg-1; Mon, 14 Feb 2022 15:14:01 -0500
X-MC-Unique: vEQVYE4BPK28fK1cWYYgGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BB9F34831;
 Mon, 14 Feb 2022 20:14:00 +0000 (UTC)
Received: from localhost (unknown [10.39.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2CBF56F67;
 Mon, 14 Feb 2022 20:13:40 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] GL console related fixes
Date: Tue, 15 Feb 2022 00:13:34 +0400
Message-Id: <20220214201337.1814787-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, akihiko.odaki@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
In the thread "[PATCH 0/6] ui/dbus: Share one listener for a console", Akih=
iko=0D
Odaki reported a number of issues with the GL and D-Bus display. His series=
=0D
propose a different design, and reverting some of my previous generic conso=
le=0D
changes to fix those issues.=0D
=0D
However, as I work through the issue so far, they can be solved by reasonab=
le=0D
simple fixes while keeping the console changes generic (not specific to the=
=0D
D-Bus display backend).=0D
=0D
Thanks a lot Akihiko for reporting the issues and trying to solve them! Ple=
ase=0D
test this alternative series and let me know of any further issues. My=0D
understanding is that you are mainly concerned with the Cocoa backend, and =
I=0D
don't have a way to test it, so please check it. If necessary, we may well =
have=0D
to revert my earlier changes and go your way, eventually.=0D
=0D
Marc-Andr=C3=A9 Lureau (3):=0D
  ui/console: fix crash when using gl context with non-gl listeners=0D
  ui/console: fix texture leak when calling surface_gl_create_texture()=0D
  ui: do not create a surface when resizing a GL scanout=0D
=0D
 ui/console-gl.c |  4 ++++=0D
 ui/console.c    | 29 ++++++++++++++++++-----------=0D
 2 files changed, 22 insertions(+), 11 deletions(-)=0D
=0D
--=20=0D
2.34.1.428.gdcc0cd074f0c=0D
=0D



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1A1493F0F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:28:49 +0100 (CET)
Received: from localhost ([::1]:60010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAElM-0007N6-HP
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:28:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nAEbN-0002AO-8C
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:18:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nAEbJ-00005O-SF
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:18:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642612689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xtNd4Z32m6BGc0A/Cx3zIFJssO9RhAUW837KIelcV4s=;
 b=K6Y8oS+QYD7m6lTq87EJbAlu56rU8mXNn6lQDXId59/oul+0a9R7V391qces2Pu3bOzvy6
 a6YRFBAM9fKIHNn6KSeGSyTVM1b6ZVJHIEkC7U50HZeYhTraCRm/xn7HVtgBk893BRLVZD
 Zn9et5e53lLXRAwvtq6i8ywjao+LdcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-EroSibgoOf2gNVNPPrOfFw-1; Wed, 19 Jan 2022 12:18:04 -0500
X-MC-Unique: EroSibgoOf2gNVNPPrOfFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6FF51966320;
 Wed, 19 Jan 2022 17:18:03 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.194.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA15F7EFFE;
 Wed, 19 Jan 2022 17:18:02 +0000 (UTC)
From: Andrea Bolognani <abologna@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] meson: Don't pass 'method' to dependency()
Date: Wed, 19 Jan 2022 18:17:57 +0100
Message-Id: <20220119171800.491703-1-abologna@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=abologna@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

See [1] for recent discussion about libgcrypt specifically, which the=0D
first patch is about.=0D
=0D
After writing that one, I realized that there is no point in=0D
explicitly passing 'method' to dependency() because Meson will do the=0D
right thing by default - hence the next two patches.=0D
=0D
[1] https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg01224.html=0D
=0D
Andrea Bolognani (3):=0D
  meson: Don't force use of libgcrypt-config=0D
  meson: Don't pass 'method' to dependency()=0D
  docs: Don't recommend passing 'method' to dependency()=0D
=0D
 docs/devel/build-system.rst |  1 -=0D
 meson.build                 | 75 +++++++++++++++----------------------=0D
 tcg/meson.build             |  2 +-=0D
 3 files changed, 31 insertions(+), 47 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D



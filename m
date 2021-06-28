Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D113B5D2D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 13:33:44 +0200 (CEST)
Received: from localhost ([::1]:54668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxpWJ-0004y9-T8
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 07:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lxpTj-0002bo-14
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 07:31:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lxpTg-0000o8-3S
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 07:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624879859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W58AYkOBPLX5Q2+BZqZtjiaH+COPpETXuvYdKOIJ478=;
 b=h1iGL7cfvg86yQ2T0x2sFVf8HJtEHVNXKzQqw12p0h3JFg5bdnlZ7zONXbipZ8mcPtxOvO
 0rJhRJAZ/zGXDxEgEODgdkh5MDOgBg9KY9klXVuxiIx6AfaL3EvZu3Ud/Ew3c19GXhLL+J
 zLaZLQNtz/K0OTlMc3kXJLv8AS//Apo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-WP0kcjU3Mq-wWtm2QdceRg-1; Mon, 28 Jun 2021 07:30:54 -0400
X-MC-Unique: WP0kcjU3Mq-wWtm2QdceRg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AF04100B3AD;
 Mon, 28 Jun 2021 11:30:52 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-35.ams2.redhat.com
 [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2A1560C5F;
 Mon, 28 Jun 2021 11:30:49 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] docs: improve -smp documentation
Date: Mon, 28 Jun 2021 12:30:43 +0100
Message-Id: <20210628113047.462498-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Cc: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a spin off from this thread:=0D
=0D
  https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg06135.html=0D
=0D
to improve the documentation of the current behaviour of -smp=0D
arg. In that thread it is suggested that we change the behaviour=0D
to prefer use of cores over sockets, when topology is omitted. This=0D
documentation update explicitly notes that default topology is liable=0D
to change, to allow for this enhancement.=0D
=0D
Daniel P. Berrang=C3=A9 (4):=0D
  docs: fix typo s/Intel/AMD/ in CPU model notes=0D
  qemu-options: re-arrange CPU topology options=0D
  qemu-options: tweak to show that CPU count is optional=0D
  qemu-options: rewrite help for -smp options=0D
=0D
 docs/system/cpu-models-x86.rst.inc |  2 +-=0D
 qemu-options.hx                    | 37 ++++++++++++++++++++----------=0D
 2 files changed, 26 insertions(+), 13 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D



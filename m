Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001F93EDF0A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 23:07:38 +0200 (CEST)
Received: from localhost ([::1]:54602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFjpa-0006hH-1U
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 17:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mFjoB-0004oF-Hf
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 17:06:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mFjo9-0004pB-Uy
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 17:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629147968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0A/Shx2phoNgH0FdRIi4RQtIIQJcyCzOH7p+BQWTwUY=;
 b=cmrUFipOVgYCdpyaY0q3S/eDOVsJvbymdTooi2ui5xkH/8YvYEmsqRDkg6CXnH0XMErl1g
 SXjPystLj5TM3xiEUw4BFuI7gZ07fGmaoe3A3f5vqWdHAehIPI10S0J+lIHanc+tNDay5d
 tN7evPUe50dYTRGL/Q+A3g8uXG30iJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-RGid5mcqM3alxTrVn6F3tA-1; Mon, 16 Aug 2021 17:06:05 -0400
X-MC-Unique: RGid5mcqM3alxTrVn6F3tA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 762E2192CC42;
 Mon, 16 Aug 2021 21:06:04 +0000 (UTC)
Received: from localhost (unknown [10.22.10.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CFA119C44;
 Mon, 16 Aug 2021 21:06:04 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/1] Last minute fix for -rc4
Date: Mon, 16 Aug 2021 17:06:02 -0400
Message-Id: <20210816210603.42337-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit bd44d64a3879bb6b0ca19bff3be16e0093502fac=
:=0D
=0D
  Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021=
-08-11' into staging (2021-08-15 16:46:23 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/ehabkost/qemu.git tags/machine-next-pull-request=0D
=0D
for you to fetch changes up to bbd0db9dc4751b6ab0884e92421fa4b2c3d3b532:=0D
=0D
  machine: Disallow specifying topology parameters as zero (2021-08-16 16:5=
5:39 -0400)=0D
=0D
----------------------------------------------------------------=0D
Last minute fix for -rc4=0D
=0D
Bug fix:=0D
* Disallow specifying topology parameters as zero=0D
  (Yanan Wang)=0D
=0D
----------------------------------------------------------------=0D
=0D
Yanan Wang (1):=0D
  machine: Disallow specifying topology parameters as zero=0D
=0D
 hw/core/machine.c | 14 ++++++++++++++=0D
 qapi/machine.json |  6 +++---=0D
 qemu-options.hx   | 12 +++++++-----=0D
 3 files changed, 24 insertions(+), 8 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094A23F7CE3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 21:56:17 +0200 (CEST)
Received: from localhost ([::1]:54886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIz0S-0007wD-1j
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 15:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mIyz1-0005Gh-Rx
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 15:54:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mIyyy-0008Gn-5y
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 15:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629921282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9dYKFc4OfqHw4xCNE1kenXHAOWj187sU5GEAgzwtChc=;
 b=TBVI7DCd60iCkwQJtbBngU1//kiNkHgRd+kykhRxrl3x/aER2Q3UVA3pHmYroLc7k6z+mM
 RKSBp5h98TcL+eyLJ0Zpkb2TLfmoxJlmCXIfQVEMokfOztKaEgjiCWQ3Jv8EodzNEXVVwH
 SWKfLxsjnz1w8yTRgfxh3or8UwET8o0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-E5m9oPMlND6sst_n_iO5WA-1; Wed, 25 Aug 2021 15:54:40 -0400
X-MC-Unique: E5m9oPMlND6sst_n_iO5WA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D400A760C4;
 Wed, 25 Aug 2021 19:54:39 +0000 (UTC)
Received: from localhost (unknown [10.22.32.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 880E860C0F;
 Wed, 25 Aug 2021 19:54:39 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/2] x86 queue, 2021-08-25
Date: Wed, 25 Aug 2021 15:54:36 -0400
Message-Id: <20210825195438.914387-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.745, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d42685765653ec155fdf60910662f8830bdb2cef=
:=0D
=0D
  Open 6.2 development tree (2021-08-25 10:25:12 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/ehabkost/qemu.git tags/x86-next-pull-request=0D
=0D
for you to fetch changes up to f429dbf8fc526a9cacf531176b28d0c65701475a:=0D
=0D
  i386/cpu: Remove AVX_VNNI feature from Cooperlake cpu model (2021-08-25 1=
2:36:49 -0400)=0D
=0D
----------------------------------------------------------------=0D
x86 queue, 2021-08-25=0D
=0D
Bug fixes:=0D
* Remove split lock detect in Snowridge CPU model (Chenyi Qiang)=0D
* Remove AVX_VNNI feature from Cooperlake cpu model (Yang Zhong)=0D
=0D
----------------------------------------------------------------=0D
=0D
Chenyi Qiang (1):=0D
  target/i386: Remove split lock detect in Snowridge CPU model=0D
=0D
Yang Zhong (1):=0D
  i386/cpu: Remove AVX_VNNI feature from Cooperlake cpu model=0D
=0D
 target/i386/cpu.c | 10 +++++++++-=0D
 1 file changed, 9 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1C33C7496
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:33:17 +0200 (CEST)
Received: from localhost ([::1]:58614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LLQ-0000Jk-0f
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3LJE-0005xr-7I
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:31:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3LJB-0006P4-9V
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626193856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cfAvBv9OYufbEJfecDd0MBl21N2h8Psouex/8b6h380=;
 b=h7RDE1Dvibb1xvZo1hnGCyrg6gYFH/CfU1KSj2R2gvamVAJE1BwroC6w1CGMEn0ciKXss/
 Yv8x01PgOdYFW0gDofaUmuNSgG0uVAD0AaVW1kRUQZe4+x2DKi+AYD1gRV64IYVHPfO9ZH
 GWCNzWdQE7oZom78nYvMOZIqs+VXHpw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-04VUR0sENMarFYf402-KzQ-1; Tue, 13 Jul 2021 12:30:54 -0400
X-MC-Unique: 04VUR0sENMarFYf402-KzQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18452804146;
 Tue, 13 Jul 2021 16:30:54 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-1.ams2.redhat.com
 [10.36.113.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65A9E60C5F;
 Tue, 13 Jul 2021 16:30:52 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] docs: improve -smp documentation
Date: Tue, 13 Jul 2021 17:30:47 +0100
Message-Id: <20210713163051.2133045-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changed in v2:=0D
=0D
 - Fix misplaced ',' breaking build=0D
 - Two small typo fixes=0D
=0D
Daniel P. Berrang=C3=A9 (4):=0D
  docs: fix typo s/Intel/AMD/ in CPU model notes=0D
  qemu-options: re-arrange CPU topology options=0D
  qemu-options: tweak to show that CPU count is optional=0D
  qemu-options: rewrite help for -smp options=0D
=0D
 docs/system/cpu-models-x86.rst.inc |  2 +-=0D
 qemu-options.hx                    | 41 ++++++++++++++++++++----------=0D
 2 files changed, 28 insertions(+), 15 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D



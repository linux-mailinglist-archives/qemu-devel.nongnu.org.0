Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCA4282098
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Oct 2020 04:44:56 +0200 (CEST)
Received: from localhost ([::1]:47496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOXXb-0006YW-GC
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 22:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kOXUK-0002OG-Ux
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 22:41:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kOXUH-0002f8-UH
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 22:41:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601692888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZYvgHcR2UjUfUAs9WJ2WnlOfWSXhEXeYDUaCe5V5gBU=;
 b=VkIJvVFxif4w48vDOjQz6NTM1e493XxPJy7YmOm7AuWHR3W3b0KNYISIMMgE6tD+fAursI
 Y5Wp1dDAzvpHifdp5gOwc/z7u0uBsk5iTPOdhxGoL8l1fh+0aer/IxDUxxo+NyLQbbbzWM
 s+9HbkhY/gLKtMvlo77ZltRTv1AD2LY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-ugnN8MHEMTS1wXp0uN_qsA-1; Fri, 02 Oct 2020 22:41:26 -0400
X-MC-Unique: ugnN8MHEMTS1wXp0uN_qsA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2536A107464C;
 Sat,  3 Oct 2020 02:41:25 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD4D95D9D3;
 Sat,  3 Oct 2020 02:41:24 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] kernel-doc ixes
Date: Fri,  2 Oct 2020 22:41:18 -0400
Message-Id: <20201003024123.193840-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 21:59:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Among other fixes in kernel-doc, this series get rid of=0D
QEMU-specific $decl_type=3D'type name' hack in kernel-doc, because=0D
it made it impossible to document macros with names starting with=0D
uppercase letters (like most of the macros at qom/object.h).=0D
=0D
Eduardo Habkost (5):=0D
  kernel-doc: Handle function typedefs that return pointers=0D
  kernel-doc: Handle function typedefs without asterisks=0D
  qom: Explicitly tag doc comments for typedefs and structs=0D
  memory: Explicitly tag doc comments for structs=0D
  kernel-doc: Remove $decl_type=3D'type name' hack=0D
=0D
 include/exec/memory.h |  6 +++---=0D
 include/qom/object.h  | 22 +++++++++++-----------=0D
 scripts/kernel-doc    | 16 +++-------------=0D
 3 files changed, 17 insertions(+), 27 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D



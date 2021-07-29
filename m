Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0027C3DAA89
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 19:57:48 +0200 (CEST)
Received: from localhost ([::1]:47244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9AI0-0000gq-2G
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 13:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m9AGH-0006Kz-GC
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:56:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m9AGE-0007qz-Q8
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627581357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NqR2FGz3fK9LxdhaAwW5gBDPYkCl2Yy5X5Y5ZKJJdyw=;
 b=i0RQZtEsl9j7Wf35XxEHekbIFumNSoPb4yB7p+FpJuuPPLB+VPlZ/IFe9uH81o80zl9nE3
 ouhUgsIOIhv8711IkGtJt0/U/xNS1RIQJfHx2OLYquhMYMPpH4N/YapHKn1jhT+JuZVFaW
 FsewRKv+Mzd9Iy/gwqFmDD+axCzxcS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-fSyox6HvNLmcyJ8cmV2I8A-1; Thu, 29 Jul 2021 13:55:55 -0400
X-MC-Unique: fSyox6HvNLmcyJ8cmV2I8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 161F08799E0
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 17:55:55 +0000 (UTC)
Received: from localhost (unknown [10.22.18.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7D4B60875;
 Thu, 29 Jul 2021 17:55:54 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 00/10] QOM documentation updates
Date: Thu, 29 Jul 2021 13:55:44 -0400
Message-Id: <20210729175554.686474-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series includes a few fixes to the QOM documentation, and=0D
add some changes to avoid encouraging people from defining=0D
typecast macros manually.=0D
=0D
Eduardo Habkost (10):=0D
  docs: qom: Replace old GTK-Doc #symbol syntax with `symbol`=0D
  docs: qom: Use Sphinx cross references more often=0D
  docs: qom: Fix autoptr expansion example=0D
  docs: qom: Fix "API Reference" heading level=0D
  docs: qom: Add subsection headings to declaration/definition macros=0D
    section=0D
  docs: qom: Remove unnecessary class typedefs from example=0D
  docs: qom: Fix OBJECT_DECLARE_SIMPLE_TYPE documentation=0D
  docs: qom: Show actual typecast functions in examples=0D
  docs: qom: Remove OBJECT_CHECK macro examples=0D
  MAINTAINERS: Add qom.rst to QOM section=0D
=0D
 MAINTAINERS        |   1 +=0D
 docs/devel/qom.rst | 147 ++++++++++++++++++++++++++++-----------------=0D
 2 files changed, 94 insertions(+), 54 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D



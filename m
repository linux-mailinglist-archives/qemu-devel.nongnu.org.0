Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F81E508D86
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:42:01 +0200 (CEST)
Received: from localhost ([::1]:53508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDOw-0001Qy-7Q
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nhCnZ-00069r-HZ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:03:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nhCnW-0005SF-C5
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:03:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650470596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MgntCgM7i9jwJWDJ6xsS5SagH4RnVcHCYPctIxVtsS4=;
 b=duUJGDLV1htkSZ2UL287uqxrtQexpBxuedYlx3b5URssJN6tSaaKlv+ZrQk/Oo3V6ksPmP
 MZDYmnbl6+IUneRcg0qHN/gcaA3rrcymwNvRVLoDipK9m9kTOQLxM/u+s3hpDzQ+tUsKw3
 ZFsUzhH4RWaXNGPL+MRUZnL0aNkaHXU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-FivqP5gBM-SUz-4llxMkmA-1; Wed, 20 Apr 2022 12:03:15 -0400
X-MC-Unique: FivqP5gBM-SUz-4llxMkmA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AF001014A89
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 16:03:15 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 458052024CBB;
 Wed, 20 Apr 2022 16:03:13 +0000 (UTC)
From: Andrea Bolognani <abologna@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] docs: build-platforms: Fix and clarify
Date: Wed, 20 Apr 2022 18:03:09 +0200
Message-Id: <20220420160311.248079-1-abologna@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

=0D
=0D
Andrea Bolognani (2):=0D
  docs: build-platforms: Fix spelling for Homebrew=0D
  docs: build-platforms: Clarify stance on minor releases and backports=0D
=0D
 docs/about/build-platforms.rst | 9 ++++++---=0D
 1 file changed, 6 insertions(+), 3 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E91145A710
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 17:01:28 +0100 (CET)
Received: from localhost ([::1]:35236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpYEZ-0006DQ-MK
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 11:01:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mpYCX-0004D0-Ce
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 10:59:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mpYCU-0007fa-CV
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 10:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637683156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RerfjYp6wWt7X8SpQQLeqha7vtuZvjdPhcpykRkvmws=;
 b=BnEo0aOBEXCyCst/UwFSyLAFQrwbfGcIf2ysWhsZeDHFb1qXYjgySg161PHA3e5GEi54J6
 Um9k5wzfFp8LAH+PDuhkA0xPSpFk5hKqyfU2HEc5OTdOpi17S5d1LD1AnsBOMRJxftCjfl
 PuoI48L335udMbZqVXevVT1yYIjnMqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-kR8uLg2hPNqA7t9VWw4u-A-1; Tue, 23 Nov 2021 10:59:13 -0500
X-MC-Unique: kR8uLg2hPNqA7t9VWw4u-A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E21985C707;
 Tue, 23 Nov 2021 15:59:12 +0000 (UTC)
Received: from localhost (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09E6D100760F;
 Tue, 23 Nov 2021 15:59:11 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 0/3] Block patches
Date: Tue, 23 Nov 2021 16:59:06 +0100
Message-Id: <20211123155909.717547-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 73e0f70e097b7c92a5ce16ee35b53afe119b20d7:

  Merge tag 'pull-lu-20211123' of https://gitlab.com/rth7680/qemu into staging (2021-11-23 11:33:14 +0100)

are available in the Git repository at:

  https://gitlab.com/hreitz/qemu.git tags/pull-block-2021-11-23

for you to fetch changes up to 4dd218fd0717ed3cddb69c01eeb9da630107d89d:

  iotests/149: Skip on unsupported ciphers (2021-11-23 15:39:12 +0100)

----------------------------------------------------------------
Block patches for 6.2-rc2:
- Fix memory leak in vvfat when vvfat_open() fails
- iotest fixes for the gnutls crypto backend

----------------------------------------------------------------
Daniella Lee (1):
  block/vvfat.c fix leak when failure occurs

Hanna Reitz (2):
  iotests: Use aes-128-cbc
  iotests/149: Skip on unsupported ciphers

 block/vvfat.c              | 16 ++++++++++++----
 tests/qemu-iotests/149     | 23 ++++++++++++++++++-----
 tests/qemu-iotests/206     |  4 ++--
 tests/qemu-iotests/206.out |  6 +++---
 tests/qemu-iotests/210     |  4 ++--
 tests/qemu-iotests/210.out |  6 +++---
 6 files changed, 40 insertions(+), 19 deletions(-)

-- 
2.33.1



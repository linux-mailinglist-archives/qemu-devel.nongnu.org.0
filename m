Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB7B372285
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 23:39:10 +0200 (CEST)
Received: from localhost ([::1]:44908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldgHV-0007Pk-EN
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 17:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ldgEe-0006KK-Fu
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:36:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ldgEX-0005C3-HH
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620077764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SPSmh0bz3yLxpNiLUKox/kEw/o7dc08ferw4GBE8oA0=;
 b=c6n1rlYbQc5VoVnqJOs70cVR+G+KN4D28EPx/5M1v8j5IvhUPJHSB0PhzNhtHLOrEsf5nO
 jt+W36naUzkfzUJimHweYufqfZIK4G6sAq7Ot0FETSW7YwQfiAl0SBp+KXUkz3TVNZ5/pf
 tklZrLOubWxJLc04zUL65cpt63dfNeM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-2ESJAasEMhyl6gfO0fsBYw-1; Mon, 03 May 2021 17:36:02 -0400
X-MC-Unique: 2ESJAasEMhyl6gfO0fsBYw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 788AF107ACC7
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 21:36:01 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-144.phx2.redhat.com [10.3.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 453F360C05
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 21:36:01 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Remove deprecated qemu-img backing file without format
Date: Mon,  3 May 2021 16:35:58 -0500
Message-Id: <20210503213600.569128-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We've gone enough release cycles without noticeable pushback on our
intentions, so time to make it harder to create images that can form a
security hole due to a need for format probing rather than an explicit
format.

Eric Blake (2):
  qcow2: Prohibit backing file changes in 'qemu-img amend'
  qemu-img: Require -F with -b backing image

 docs/system/deprecated.rst       | 32 ---------------------------
 docs/system/removed-features.rst | 31 ++++++++++++++++++++++++++
 block.c                          | 37 ++++++++++----------------------
 block/qcow2.c                    | 13 ++++-------
 qemu-img.c                       |  6 ++++--
 tests/qemu-iotests/061           |  3 +++
 tests/qemu-iotests/061.out       |  3 ++-
 tests/qemu-iotests/082.out       |  6 ++++--
 tests/qemu-iotests/114           | 18 ++++++++--------
 tests/qemu-iotests/114.out       | 11 ++++------
 tests/qemu-iotests/301           |  4 +---
 tests/qemu-iotests/301.out       | 16 ++------------
 12 files changed, 75 insertions(+), 105 deletions(-)

-- 
2.31.1



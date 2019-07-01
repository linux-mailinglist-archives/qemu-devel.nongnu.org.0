Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E54442769
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 15:27:31 +0200 (CEST)
Received: from localhost ([::1]:60442 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hb3Hm-0003GO-9j
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 09:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36473)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <david@redhat.com>) id 1hb3G8-0002BR-T7
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 09:25:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1hb3G7-0003yw-Tt
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 09:25:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38908)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1hb3G7-0003vq-OZ; Wed, 12 Jun 2019 09:25:47 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F1699330265;
 Wed, 12 Jun 2019 13:25:35 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-159.ams2.redhat.com [10.36.116.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0964E1001B03;
 Wed, 12 Jun 2019 13:25:27 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 12 Jun 2019 15:25:24 +0200
Message-Id: <20190612132526.8905-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Wed, 12 Jun 2019 13:25:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v1 0/2] s390x/cpumodel: Rework CPU feature
 definition
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rework the feature initialization, making it harder to make mistakes.
While at it, rename the enum names of the KDSA features.

David Hildenbrand (2):
  s390x/cpumodel: Rework CPU feature definition
  s390x/cpumodel: Prepend KDSA features with "KDSA"

 target/s390x/cpu_features.c         | 352 +-------------------------
 target/s390x/cpu_features_def.h     | 352 +-------------------------
 target/s390x/cpu_features_def.inc.h | 369 ++++++++++++++++++++++++++++
 target/s390x/gen-features.c         |  30 +--
 4 files changed, 401 insertions(+), 702 deletions(-)
 create mode 100644 target/s390x/cpu_features_def.inc.h

--=20
2.21.0



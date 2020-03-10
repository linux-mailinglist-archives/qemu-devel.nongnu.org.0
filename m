Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B691805CA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 19:06:55 +0100 (CET)
Received: from localhost ([::1]:38034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBjHK-0000cD-IR
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 14:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51552)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1jBjFq-0007an-AU
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 14:05:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1jBjFp-0004q0-DR
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 14:05:22 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24228
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1jBjFp-0004nS-9x
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 14:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583863520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AskQw9qgYsEMOV22AdOqjDiWjiymP47kaacwlM6/4Xc=;
 b=dgt+AbCh9NJXQmXukvSuAxIMZLUw/v7ddgcSrh+DR4SbHw3NglNi9L86HNZgf7AsyyF2D5
 wF/1pYw3VNTjhRooT7B4//y/WPJUzekb8S9qRdZifYdiTYzg7jAyanvXySPSz5F6o72dAf
 j+FJ6GPj+oTWKO01kgiESPgf4v9paUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-rgO0qu1qN4GGZQElMZMvMg-1; Tue, 10 Mar 2020 14:05:19 -0400
X-MC-Unique: rgO0qu1qN4GGZQElMZMvMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04E05189D6C1;
 Tue, 10 Mar 2020 18:05:18 +0000 (UTC)
Received: from localhost.localdomain (ovpn-125-115.rdu2.redhat.com
 [10.10.125.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A428927184;
 Tue, 10 Mar 2020 18:05:12 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/mem/pc-dimm: Trivial code changes
Date: Tue, 10 Mar 2020 15:05:08 -0300
Message-Id: <20200310180510.19489-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: qemu-trivial@nongnu.org, imammedo@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Improve one error message and fix one code style warning.

Wainer dos Santos Moschetta (2):
  hw/mem/pc-dimm: Print slot number on error at pc_dimm_pre_plug()
  hw/mem/pc-dimm: Fix line over 80 characters warning

 hw/mem/pc-dimm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--=20
2.24.1



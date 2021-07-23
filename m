Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DFE3D3BFF
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 16:49:14 +0200 (CEST)
Received: from localhost ([::1]:33888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6wUC-0005Wl-Uz
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 10:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m6wRT-0002ex-Ot
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 10:46:24 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:29661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m6wRP-0007O6-Fw
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 10:46:23 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-XN45O_3LN4usXJ3ZhdIOmQ-1; Fri, 23 Jul 2021 10:46:05 -0400
X-MC-Unique: XN45O_3LN4usXJ3ZhdIOmQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E986802E3D;
 Fri, 23 Jul 2021 14:46:03 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DFF35D6AD;
 Fri, 23 Jul 2021 14:46:01 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] configure: Fixes for --cross-cc-FOO
Date: Fri, 23 Jul 2021 16:45:59 +0200
Message-Id: <20210723144601.1038381-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fixes some issues I've hit while trying to compile=0D
TCG checks with a cross-compiler, as an alternative to using=0D
docker.=0D
=0D
This isn't a regression in QEMU 6.1: the issues have been around=0D
since they got merged in QEMU 3.0. Hence clearly QEMU 6.2 material.=0D
=0D
Greg Kurz (2):=0D
  configure: Fix trivial typo in --cross-cc-cflags-FOO=0D
  configure: Fix excessive error detection when handling --cross-cc-FOO=0D
=0D
 configure              | 29 ++++++++++++++++++-----------=0D
 docs/devel/testing.rst |  2 +-=0D
 2 files changed, 19 insertions(+), 12 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D



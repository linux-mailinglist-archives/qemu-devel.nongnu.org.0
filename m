Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38827D6C4
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 09:57:45 +0200 (CEST)
Received: from localhost ([::1]:46260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ht5y4-0007YK-Mm
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 03:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46439)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ppandit@redhat.com>) id 1ht5xc-00078M-Uz
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 03:57:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ppandit@redhat.com>) id 1ht5xb-0000f6-Td
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 03:57:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36490)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ppandit@redhat.com>) id 1ht5xb-0000cB-Oa
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 03:57:15 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1B40030860C1;
 Thu,  1 Aug 2019 07:57:14 +0000 (UTC)
Received: from kaapi (unknown [10.74.10.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C89AA10013D9;
 Thu,  1 Aug 2019 07:57:11 +0000 (UTC)
Date: Thu, 1 Aug 2019 13:27:09 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: Markus Armbruster <armbru@redhat.com>
In-Reply-To: <87zhku5tcv.fsf@dusky.pond.sub.org>
Message-ID: <nycvar.YSQ.7.76.1908011325430.28117@xnncv>
References: <20190731091933.17363-1-ppandit@redhat.com>
 <87zhku5tcv.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 01 Aug 2019 07:57:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5] net: tap: replace snprintf with
 g_strdup_printf calls
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>,
 =?ISO-8859-15?Q?Daniel_P_=2E_Berrang=E9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+-- On Wed, 31 Jul 2019, Markus Armbruster wrote --+
| However, the code is still rather ugly, and I'd be tempted to use the
| opportunity to clean up some more.  Untested sketch:

Patch v3 did a similar change 
  -> https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg00578.html

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 485FE85E95
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 11:35:55 +0200 (CEST)
Received: from localhost ([::1]:47866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvepu-00052w-FJ
	for lists+qemu-devel@lfdr.de; Thu, 08 Aug 2019 05:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51211)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ppandit@redhat.com>) id 1hvepP-0004XN-4o
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 05:35:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ppandit@redhat.com>) id 1hvepO-0004R6-7W
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 05:35:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60456)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ppandit@redhat.com>) id 1hvepO-0004Qb-2I
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 05:35:22 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4D3F4309BDAA;
 Thu,  8 Aug 2019 09:35:21 +0000 (UTC)
Received: from kaapi (unknown [10.65.150.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 023AC10016E9;
 Thu,  8 Aug 2019 09:35:17 +0000 (UTC)
Date: Thu, 8 Aug 2019 15:05:15 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: Stefano Garzarella <sgarzare@redhat.com>
In-Reply-To: <20190808082007.qkgkeyajxb3bere2@steredhat>
Message-ID: <nycvar.YSQ.7.76.1908081504330.30966@xnncv>
References: <20190808063340.23833-1-ppandit@redhat.com>
 <20190808082007.qkgkeyajxb3bere2@steredhat>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 08 Aug 2019 09:35:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] scsi: lsi: exit infinite loop while
 executing script (CVE-2019-12068)
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Bugs SysSec <bugs-syssec@rub.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+-- On Thu, 8 Aug 2019, Stefano Garzarella wrote --+
| > +    if (++insn_processed > 10000) {
|                               ^
| Since we are using this "magic" number in several lines,
| should we define a macro?

Sent patch v2. Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F


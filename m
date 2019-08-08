Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEAC85EFA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 11:49:36 +0200 (CEST)
Received: from localhost ([::1]:47916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvf39-0001h0-8O
	for lists+qemu-devel@lfdr.de; Thu, 08 Aug 2019 05:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53869)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ppandit@redhat.com>) id 1hvf2I-0000xB-94
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 05:48:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ppandit@redhat.com>) id 1hvf2H-0003Vx-BJ
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 05:48:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37000)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ppandit@redhat.com>) id 1hvf2H-0003Vm-6C
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 05:48:41 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3C74B3064FD3;
 Thu,  8 Aug 2019 09:48:40 +0000 (UTC)
Received: from kaapi (unknown [10.65.150.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43B68600C8;
 Thu,  8 Aug 2019 09:48:37 +0000 (UTC)
Date: Thu, 8 Aug 2019 15:18:35 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <aa654255-8124-8a76-56c8-47c8bdf19a08@redhat.com>
Message-ID: <nycvar.YSQ.7.76.1908081510580.30966@xnncv>
References: <20190808063340.23833-1-ppandit@redhat.com>
 <aa654255-8124-8a76-56c8-47c8bdf19a08@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 08 Aug 2019 09:48:40 +0000 (UTC)
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
Cc: Fam Zheng <fam@euphon.net>, Bugs SysSec <bugs-syssec@rub.de>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+-- On Thu, 8 Aug 2019, Paolo Bonzini wrote --+
| I am not sure this is worth a CVE. 

True, it is a low one, as QEMU consumes cycles on the host.

| The kernel can cause QEMU to break, but is there a practical case in which 
| an unprivileged user can do that?

QEMU does not break, it keeps running in interruptible sleep 'S' state. 
They've a reproducer wherein guest does mmio calls to trigger the issue.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F


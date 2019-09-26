Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8070BF78D
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 19:27:06 +0200 (CEST)
Received: from localhost ([::1]:41590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDXXl-0004vm-Oj
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 13:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54692)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iDXNV-0004Ib-To
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 13:16:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iDXNS-0006d9-Ln
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 13:16:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35744)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>)
 id 1iDXNS-0006Ue-Fx; Thu, 26 Sep 2019 13:16:26 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A4DC589810D;
 Thu, 26 Sep 2019 17:16:24 +0000 (UTC)
Received: from localhost (ovpn-116-45.gru2.redhat.com [10.97.116.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C67A60923;
 Thu, 26 Sep 2019 17:16:23 +0000 (UTC)
Date: Thu, 26 Sep 2019 14:16:22 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Tao Xu <tao3.xu@intel.com>
Subject: Re: [PATCH v2] numa: Introduce MachineClass::auto_enable_numa for
 implicit NUMA node
Message-ID: <20190926171622.GA16849@habkost.net>
References: <20190905083238.1799-1-tao3.xu@intel.com>
 <e84bd22f-fce4-ea39-38a0-0933ff30237b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e84bd22f-fce4-ea39-38a0-0933ff30237b@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Thu, 26 Sep 2019 17:16:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 24, 2019 at 11:34:40AM +0800, Tao Xu wrote:
> Hi Eduardo,
> 
> How about this version of patch? Last month this patch is reverted from pull
> request. And I submitted this version.

Sorry for taking so long to reply.  I will queue it this week.

-- 
Eduardo


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC552C1D55
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 10:47:52 +0200 (CEST)
Received: from localhost ([::1]:47376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iErLT-0004t4-PJ
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 04:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53809)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iErJl-00044M-9Q
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 04:46:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iErJi-0004wk-Px
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 04:46:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41098)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iErJi-0004nd-J8
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 04:46:02 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E891418C8914;
 Mon, 30 Sep 2019 08:45:58 +0000 (UTC)
Received: from work-vm (ovpn-117-232.ams2.redhat.com [10.36.117.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A8005D9CA;
 Mon, 30 Sep 2019 08:45:54 +0000 (UTC)
Date: Mon, 30 Sep 2019 09:45:51 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: Arch info lost in "info cpus"
Message-ID: <20190930084551.GB2759@work-vm>
References: <87blv2i5ha.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87blv2i5ha.fsf@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Mon, 30 Sep 2019 08:45:58 +0000 (UTC)
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
Cc: imammedo@redhat.com, tao3.xu@intel.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com, mihajlov@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Sergio Lopez (slp@redhat.com) wrote:
> Hi,
> 
> Commit 137b5cb6ab565cb3781d5337591e155932b4230e (hmp: change
> hmp_info_cpus to use query-cpus-fast) updated the "info cpus" commit to
> make it more lightweight, but also removed the ability to get the
> architecture specific status of each vCPU.
> 
> This information was really useful to diagnose certain Guest issues,
> without the need of using GDB, which is more intrusive and requires
> enabling it in advance.
> 
> Is there an alternative way of getting something equivalent to what
> "info cpus" provided previously (in 2.10)?

Even the qemp equivalent, query-cpus is deprecated.
(Although we do call the underlying query-cpus in 'info numa' as well)

Dave

> Thanks,
> Sergio.


--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


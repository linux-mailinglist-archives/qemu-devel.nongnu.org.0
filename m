Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E26958F8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 09:54:52 +0200 (CEST)
Received: from localhost ([::1]:34410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzyyh-0008TQ-VI
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 03:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50346)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1hzyxY-0007da-In
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:53:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1hzyxU-0007Uk-NL
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:53:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38156)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1hzyxS-0007TB-PO
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:53:35 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 48A56106E96E;
 Tue, 20 Aug 2019 07:53:32 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C76D86092F;
 Tue, 20 Aug 2019 07:53:30 +0000 (UTC)
Date: Tue, 20 Aug 2019 09:53:28 +0200
From: Andrew Jones <drjones@redhat.com>
To: "Zhang, Lei" <zhang.lei@jp.fujitsu.com>
Message-ID: <20190820075328.ew6kfiozom2ptcjv@kamzik.brq.redhat.com>
References: <8898674D84E3B24BA3A2D289B872026A78C0BF32@G01JPEXMBKW03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8898674D84E3B24BA3A2D289B872026A78C0BF32@G01JPEXMBKW03>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Tue, 20 Aug 2019 07:53:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 00/15] target/arm/kvm: enable SVE in
 guests
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
Cc: "Mizuma, Masayoshi" <masayoshi.mizuma@fujitsu.com>, "Okamoto,
 Takayuki" <tokamoto@jp.fujitsu.com>,
 "'qemu-devel@nongnu.org'" <qemu-devel@nongnu.org>, abologna@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 20, 2019 at 06:08:04AM +0000, Zhang, Lei wrote:
> Hi Andrew,
> 
> I have tested your patch on kernel- 5.2.7 + QEMU (4.0.94 + patch).

Thanks for the testing! I guess it's time for me to get back to this
series and spin a v4 (so we can test some more :-)

> 
> This patch series works fine for my tests when use qemu-system-aarch64 directly.
> But I can't startup kvm when I use virsh[1].
> 
> Command I executed.
> # virsh start test1
> 
> The error message is [internal error: CPU features not supported by hypervisor for aarch64 architecture.]
> Do you have any ideas for this error? 

I've CC'ed Andrea.

Thanks,
drew

> 
> [1]
> https://www.redhat.com/archives/libvir-list/2019-July/msg01524.html
> 
> Best Regards,
> Lei Zhang


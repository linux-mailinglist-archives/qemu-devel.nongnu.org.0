Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD01E4AE4C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 00:55:40 +0200 (CEST)
Received: from localhost ([::1]:33994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdN0u-0003k7-47
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 18:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56778)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hdMzN-0003Gy-79
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 18:54:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hdMzM-0002u6-6K
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 18:54:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52864)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hdMzM-0002t6-11
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 18:54:04 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 47B1B3082E71;
 Tue, 18 Jun 2019 22:54:02 +0000 (UTC)
Received: from localhost (ovpn-116-76.gru2.redhat.com [10.97.116.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0C9719C69;
 Tue, 18 Jun 2019 22:54:01 +0000 (UTC)
Date: Tue, 18 Jun 2019 19:54:00 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Roman Kagan <rkagan@virtuozzo.com>
Message-ID: <20190618225400.GL19178@habkost.net>
References: <20190618110659.14744-1-rkagan@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618110659.14744-1-rkagan@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 18 Jun 2019 22:54:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] i386: make 'hv-spinlocks' a regular uint32
 property
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vadim Rozenfeld <vrozenfe@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 18, 2019 at 11:07:06AM +0000, Roman Kagan wrote:
> X86CPU.hv-spinlocks is a uint32 property that has a special setter
> validating the value to be no less than 0xFFF and no bigger than
> UINT_MAX.  The latter check is redundant; as for the former, there
> appears to be no reason to prohibit the user from setting it to a lower
> value.
> 
> So nuke the dedicated getter/setter pair and convert 'hv-spinlocks' to a
> regular uint32 property.
> 
> Signed-off-by: Roman Kagan <rkagan@virtuozzo.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

Queued on x86-next.  Thanks!

-- 
Eduardo


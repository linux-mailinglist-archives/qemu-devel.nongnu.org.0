Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B7262A84
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 22:42:27 +0200 (CEST)
Received: from localhost ([::1]:44612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkaSw-0000yX-1A
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 16:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53802)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hkaRk-0000XH-Iz
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 16:41:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hkaRj-0003D2-LF
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 16:41:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59544)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hkaRj-00038m-Fw
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 16:41:11 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2267B83F51;
 Mon,  8 Jul 2019 20:40:55 +0000 (UTC)
Received: from localhost (ovpn-116-30.gru2.redhat.com [10.97.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 836DD579B7;
 Mon,  8 Jul 2019 20:40:53 +0000 (UTC)
Date: Mon, 8 Jul 2019 17:40:52 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Laurent Desnogues <laurent.desnogues@gmail.com>
Message-ID: <20190708204052.GP5198@habkost.net>
References: <20190705221504.25166-1-ehabkost@redhat.com>
 <20190705221504.25166-11-ehabkost@redhat.com>
 <CABoDooPx3i4RhsXLJoca83ghN-ejhBbLGj3ZTJXvvdkZKCbbNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABoDooPx3i4RhsXLJoca83ghN-ejhBbLGj3ZTJXvvdkZKCbbNg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 08 Jul 2019 20:41:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL v6 10/42] vl.c: Replace smp global variables
 with smp machine properties
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Like Xu <like.xu@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 08, 2019 at 04:56:56PM +0200, Laurent Desnogues wrote:
> Hi,
> 
> On Sat, Jul 6, 2019 at 12:40 AM Eduardo Habkost <ehabkost@redhat.com> wrote:
> >
> > From: Like Xu <like.xu@linux.intel.com>
> >
> > The global smp variables in vl.c are completely replaced with machine properties.
> >
> > Form this commit, the smp_cpus/smp_cores/smp_threads/max_cpus are deprecated
> > and only machine properties within MachineState are fully applied and enabled.
> 
> Wouldn't it make sense to now remove the declarations in
> include/sysemu/cpus.h and include/sysemu/sysemu.h?

You're right.  This will be done in a follow up patch.

-- 
Eduardo


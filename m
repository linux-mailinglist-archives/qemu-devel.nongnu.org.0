Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B37181C4A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 16:27:59 +0100 (CET)
Received: from localhost ([::1]:54160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3H4-0006PY-Os
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 11:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57181)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jC3GJ-0005ys-Dc
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:27:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jC3GI-0001Mg-79
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:27:11 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:25302
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jC3GI-0001J1-1y
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:27:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583940429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QL56QuBwjeuTbyP5OcFLcsptYtmT9htgVwMdGFXDpEI=;
 b=P1DL/2pqjc/C/ry/QwkUSn1IS18ATv9vsJ0VJUAnR6tTyoO/YcjDmP+p/XlPNeV279HmZI
 fWm8GfqlzcGafnYM7R6YxBXA1DmfXYxef8jGhj5LTRZuCqu3FxuL1ATl8RVJ8GpXRgS/UC
 dso9PPG3Z/zpBuTSRx79Kt2zmLdYW50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-lL4w9fbFPnOQcqKZL3jMOA-1; Wed, 11 Mar 2020 11:27:05 -0400
X-MC-Unique: lL4w9fbFPnOQcqKZL3jMOA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AC611005510;
 Wed, 11 Mar 2020 15:27:04 +0000 (UTC)
Received: from localhost (ovpn-200-28.brq.redhat.com [10.40.200.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12E2F1001B34;
 Wed, 11 Mar 2020 15:26:57 +0000 (UTC)
Date: Wed, 11 Mar 2020 16:26:56 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v6 01/13] hw/i386: Introduce X86CPUTopoInfo to contain
 topology info
Message-ID: <20200311162656.13eb8675@redhat.com>
In-Reply-To: <f506eba6-49b9-041e-80a3-58a3968beb93@amd.com>
References: <158389385028.22020.7608244627303132902.stgit@naples-babu.amd.com>
 <158389400579.22020.10755767480575663831.stgit@naples-babu.amd.com>
 <20200311123955.29a4c0d1@redhat.com>
 <f506eba6-49b9-041e-80a3-58a3968beb93@amd.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, rth@twiddle.net,
 ehabkost@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Mar 2020 09:02:58 -0500
Babu Moger <babu.moger@amd.com> wrote:

> On 3/11/20 6:39 AM, Igor Mammedov wrote:
> > On Tue, 10 Mar 2020 21:33:25 -0500
> > Babu Moger <babu.moger@amd.com> wrote:
> >   
> >> This is an effort to re-arrange few data structure for better readability.
> >>
> >> 1. Add X86CPUTopoInfo which will have all the topology informations
> >>    required to build the cpu topology. There is no functional changes.
> >>
> >> 2. Introduce init_topo_info to initialize X86CPUTopoInfo members from
> >>    X86MachineState.
> >>
> >> 3. Update x86 unit tests for new calling convention with parameter X86CPUTopoInfo
> >>
> >> There is no functional changes.  
> > 
> > patch doesn't apply to current master, so I can't really test it  
> 
> I generated the patches on top of Eduardo's tree.
> 
> It should work if you apply after this patch.
> 
> https://lore.kernel.org/qemu-devel/158326541877.40452.17535023236841538507.stgit@naples-babu.amd.com/
thanks it helps
other than minor nit patch looks fine to me, so

Acked-by: Igor Mammedov <imammedo@redhat.com>

> Do you want me to generate on top of master ?
no need, if series is not based on master we usually
put in the cover letter a link to the tree and branch series depends on

> 
> >>
> >> Signed-off-by: Babu Moger <babu.moger@amd.com>
> >> ---
> >>  hw/i386/pc.c               |   12 ++++++------
> >>  hw/i386/x86.c              |   32 ++++++++++++++++++++++++--------
> >>  include/hw/i386/topology.h |   38 ++++++++++++++++++++++++--------------
> >>  include/hw/i386/x86.h      |    3 +++
> >>  tests/test-x86-cpuid.c     |   43 ++++++++++++++++++++++++-------------------
> >>  5 files changed, 81 insertions(+), 47 deletions(-)
> >>  
> > [...]  
> >> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> >> index 322fb6abbc..03b8962c98 100644
> >> --- a/hw/i386/x86.c
> >> +++ b/hw/i386/x86.c
> >> @@ -57,6 +57,16 @@
> >>  /* Physical Address of PVH entry point read from kernel ELF NOTE */
> >>  static size_t pvh_start_addr;
> >>  
> >> +inline void init_topo_info(X86CPUTopoInfo *topo_info,
> >> +                                  const X86MachineState *x86ms)  
> > 
> > not aligned properly  
> 
> Will fix it.
> 
> > 
> > [...]
> >   
> 



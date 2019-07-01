Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C666411C79
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 17:18:27 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52951 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMDTf-0001uS-02
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 11:18:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hMDLI-0003nB-KN
	for qemu-devel@nongnu.org; Thu, 02 May 2019 11:09:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hMDLE-0002a2-Vm
	for qemu-devel@nongnu.org; Thu, 02 May 2019 11:09:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43166)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hMDLD-0002Uk-0L; Thu, 02 May 2019 11:09:44 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 004D33082E72;
	Thu,  2 May 2019 15:09:36 +0000 (UTC)
Received: from Igors-MacBook-Pro (unknown [10.40.205.168])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7764B174B1;
	Thu,  2 May 2019 15:09:34 +0000 (UTC)
Date: Thu, 2 May 2019 17:09:28 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Like Xu <like.xu@linux.intel.com>
Message-ID: <20190502170928.001c01df@Igors-MacBook-Pro>
In-Reply-To: <a765e3ac-45e6-310e-aa66-7036b5717a26@linux.intel.com>
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
	<1553849325-44201-3-git-send-email-like.xu@linux.intel.com>
	<20190404162555.0a2267ee@redhat.com>
	<a765e3ac-45e6-310e-aa66-7036b5717a26@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 02 May 2019 15:09:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/9] cpu/topology: add general support for
 machine properties
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, "Dr.
	David Alan Gilbert" <dgilbert@redhat.com>, like.xu@intel.com,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 30 Apr 2019 15:30:31 +0800
Like Xu <like.xu@linux.intel.com> wrote:

> On 2019/4/4 22:25, Igor Mammedov wrote:
> > On Fri, 29 Mar 2019 16:48:38 +0800
> > Like Xu <like.xu@linux.intel.com> wrote:
> > 

[...]

> 
> The division of responsibility for this case (refactoring 
> qemu_init_vcpu) seems to be a poisonous apple.
> 
> The prerequisite for setting cpu-> nr_cores / nr_threads from the parent 
> is that the CPU has been created, so if any process during 
> initialization needs this topo information, it will use the default 
> values form cpu_common_initfn() instead of user-configured parameters.

can you point to concrete place that needs access to nr_cores / nr_threads
before cpu is 'realized'?

 
> We may not want to repeat those assignment operations using the new 
> values and what do you think, Igor?
> 
> <snipp>
> 



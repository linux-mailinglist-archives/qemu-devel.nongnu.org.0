Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4993C3D24E3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 15:52:50 +0200 (CEST)
Received: from localhost ([::1]:38748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Z85-0006hn-6T
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 09:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m6Z4U-0002EA-5y
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:49:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m6Z4P-00064y-Dn
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:49:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626961737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9nbyfsZL9jHrsLqTBbLwf028h6vjDeU1TSdRDuTJiDY=;
 b=IReLS3P0cneRCLQD++nA3AyxQ78S7ZdzMNJYsJBto8o6Xp4Kq4gjeqX3cnd/k9tP9B+NiH
 ifpLTHqF1XAxbg0ffkIZ7upM2+vJ2e6ZtKmeyTULdmu8NOSUA0OoJeVedkTRYEp+u4aTDF
 Tu2bes4cEWj8eOEwfxwJ/L+H771Ddnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-D1mQt_B1OrCl9WfWNsOTXA-1; Thu, 22 Jul 2021 09:48:56 -0400
X-MC-Unique: D1mQt_B1OrCl9WfWNsOTXA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10E2F1812FC5;
 Thu, 22 Jul 2021 13:48:55 +0000 (UTC)
Received: from localhost (ovpn-112-132.ams2.redhat.com [10.36.112.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 507285D6A8;
 Thu, 22 Jul 2021 13:48:54 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH for-6.1 0/1] machine: Disallow specifying topology
 parameters as zero
In-Reply-To: <20210722133759.db2kjcoucf6rsz4o@gator>
Organization: Red Hat GmbH
References: <20210722021512.2600-1-wangyanan55@huawei.com>
 <87y29y7uon.fsf@redhat.com> <20210722133759.db2kjcoucf6rsz4o@gator>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Thu, 22 Jul 2021 15:48:52 +0200
Message-ID: <87eebq792z.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.472, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22 2021, Andrew Jones <drjones@redhat.com> wrote:

> On Thu, Jul 22, 2021 at 08:02:16AM +0200, Cornelia Huck wrote:
>> On Thu, Jul 22 2021, Yanan Wang <wangyanan55@huawei.com> wrote:
>> 
>> > In the SMP configuration, we should either specify a topology
>> > parameter with a reasonable value (equal to or greater than 1)
>> > or just leave it omitted and QEMU will calculate its value.
>> > Configurations which explicitly specify the topology parameters
>> > as zero like "sockets=0" are meaningless, so disallow them.
>> >
>> > However; the commit 1e63fe685804d
>> > (machine: pass QAPI struct to mc->smp_parse) has documented that
>> > '0' has the same semantics as omitting a parameter in the qapi
>> > comment for SMPConfiguration. So this patch fixes the doc and
>> > also adds the corresponding sanity check in the smp parsers.
>> 
>> Are we expecting any real users to have used that 'parameter=0'
>> behaviour? I expect that libvirt and other management software already
>> did the right thing; unfortunately, sometimes weird configuration lines
>> tend to persist in search results.
>
> I understand this concern. I think the only documentation we had prior to
> commit 1e63fe685804 was
>
> DEF("smp", HAS_ARG, QEMU_OPTION_smp,
>     "-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]\n"
>     "                set the number of CPUs to 'n' [default=1]\n"
>     "                maxcpus= maximum number of total cpus, including\n"
>     "                offline CPUs for hotplug, etc\n"
>     "                cores= number of CPU cores on one socket (for PC, it's on one die)\n"
>     "                threads= number of threads on one CPU core\n"
>     "                dies= number of CPU dies on one socket (for PC only)\n"
>     "                sockets= number of discrete sockets in the system\n",
>         QEMU_ARCH_ALL)
> SRST
> ``-smp [cpus=]n[,cores=cores][,threads=threads][,dies=dies][,sockets=sockets][,maxcpus=maxcpus]``
>     Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs
>     are supported. On Sparc32 target, Linux limits the number of usable
>     CPUs to 4. For the PC target, the number of cores per die, the
>     number of threads per cores, the number of dies per packages and the
>     total number of sockets can be specified. Missing values will be
>     computed. If any on the three values is given, the total number of
>     CPUs n can be omitted. maxcpus specifies the maximum number of
>     hotpluggable CPUs.
> ERST
>
> This doesn't mention zero inputs and even implies non-zero inputs.

Yes, hopefully that kept people away from using 0 magic, unless they
read the code.

>
> I'm not sure if we need to worry about the odd command line that used zero
> for some parameters. What do you think?

I did a cursory search for bad examples, and nothing popped up. So this
should be reasonably painless.



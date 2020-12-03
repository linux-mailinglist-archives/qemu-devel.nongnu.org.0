Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE362CDCA1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 18:45:54 +0100 (CET)
Received: from localhost ([::1]:36148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kksfx-0004cV-Pg
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 12:45:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kksZ0-0008Ok-4g
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:38:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kksYw-00007w-Pz
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:38:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607017117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aEGlcoWFOehx5SbpCPGszyvCyR/uUMBHtiiFnsCDTTo=;
 b=Xbst/HYDAhyUgXo0XdS6cB+BtaCaQJoawM+FWA0Uk5MLep31XYdWCxP20j4sLOxiHRnyMP
 YcxUetAZ6pvW6a7xstdS1WTQI2cwXQPtGjUPtNeSQg/Dr24JLhmc/OGGUcvQyzui6AfCnI
 6pSoroy6GbHtiv6QYekO9zXSIPgjAWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-tpjMf-5_MBerJ0sKTs1Gkw-1; Thu, 03 Dec 2020 12:38:33 -0500
X-MC-Unique: tpjMf-5_MBerJ0sKTs1Gkw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A63C48030A8;
 Thu,  3 Dec 2020 17:38:32 +0000 (UTC)
Received: from gondolin (ovpn-113-106.ams2.redhat.com [10.36.113.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59FDA5D6CF;
 Thu,  3 Dec 2020 17:38:24 +0000 (UTC)
Date: Thu, 3 Dec 2020 18:38:21 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/acceptance: test hot(un)plug of ccw devices
Message-ID: <20201203183821.42e57e8e.cohuck@redhat.com>
In-Reply-To: <71a7ee0f-8ca1-e3d0-8817-e51d0cb4c02c@redhat.com>
References: <20201203153917.66685-1-cohuck@redhat.com>
 <71a7ee0f-8ca1-e3d0-8817-e51d0cb4c02c@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Dec 2020 18:22:35 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 03/12/2020 16.39, Cornelia Huck wrote:
> > Hotplug a virtio-net-ccw device, and then hotunplug it again.  
> 
> Good idea! ... is it also possible with a pci device?

It should be, I guess; it's not part of my normal test workflow,
however.

> 
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> > 
> > This is on top of "tests/acceptance: enhance s390x devices test"
> > 
> > ---
> >  tests/acceptance/machine_s390_ccw_virtio.py | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
> > index 53b8484f8f9c..487c25c31d3c 100644
> > --- a/tests/acceptance/machine_s390_ccw_virtio.py
> > +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> > @@ -97,3 +97,17 @@ class S390CCWVirtioMachine(Test):
> >          exec_command_and_wait_for_pattern(self,
> >                                            'cat /sys/bus/pci/devices/000a\:00\:00.0/function_id',
> >                                            '0x0000000c')
> > +        # add another device
> > +        self.vm.command('device_add', driver='virtio-net-ccw',
> > +                        devno='fe.0.4711', id='xxx')  
> 
> Could we use a different id, please? xxx sounds so ... well, use your
> imagination.

It is taken straight from my usual testing workflow :) But yeah, I can
call this net_4711 or so.

> 
> > +        exec_command_and_wait_for_pattern(self, 'dmesg | tail -n 1', 'CRW')  
> 
> That looks like it could be a little bit racy ... what if the kernel outputs
> another log message by chance, so that tail -n 1 reports that instead.
> 
> I think it would be better to clear the dmesg log ("dmesg -c") before
> plugging, and then look at all the new output of "dmesg" without using
> "tail" afterwards.

Yes, good idea. Would need to do the same dance below as well (we get a
new crw).

> 
> > +        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
> > +                                          '0.0.4711')
> > +        # and detach it again
> > +        self.vm.command('device_del', id='xxx')
> > +        self.vm.event_wait(name='DEVICE_DELETED',
> > +                           match={'data': {'device': 'xxx'}})
> > +        exec_command_and_wait_for_pattern(self, 'dmesg | tail -n 1', 'CRW')  
> 
> dito
> 
> > +        exec_command_and_wait_for_pattern(self,
> > +                                          'ls /sys/bus/ccw/devices/0.0.4711',
> > +                                          'No such file or directory')
> >   
> 
>  Thomas
> 
> 
> PS: Another idea for a test: Looks like that initrd also has a
> virtio-balloon driver ... we could maybe start with "-device
> virito-balloon", then change the size of the balloon and check whether the
> MemTotal in /proc/meminfo changed...

Added to my to-test list.

Thanks!



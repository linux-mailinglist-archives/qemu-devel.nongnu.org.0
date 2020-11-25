Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF5A2C42EB
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 16:32:07 +0100 (CET)
Received: from localhost ([::1]:50196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khwm5-0005iz-W6
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 10:32:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1khwks-0005Ge-0P
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 10:30:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1khwko-0003SN-On
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 10:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606318245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z9pITAHddIpRSs7o1xPf057RaxAvIVYC5UZFNGgbeJw=;
 b=By8qgnJ+qdh8yMLm0RXd+npxb7RDSSKRY247scLjpyGRRqKKeKs9SUzrw6dbvXPo+ZLZLU
 kj+Cbuqgeov1FXPI+qckBlvPHcvHygciyoKiKFdKJT0rIFa4HuzkhpvlyQv1HwIpkpMm9p
 l1IVyjeHBxOdtUVoWx+Xf4xt3/PQNr4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-5AOmABqGOEG0MRn3O_T-lQ-1; Wed, 25 Nov 2020 10:30:43 -0500
X-MC-Unique: 5AOmABqGOEG0MRn3O_T-lQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C5298A8F29;
 Wed, 25 Nov 2020 15:30:42 +0000 (UTC)
Received: from gondolin (ovpn-113-39.ams2.redhat.com [10.36.113.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 871DE19D61;
 Wed, 25 Nov 2020 15:30:37 +0000 (UTC)
Date: Wed, 25 Nov 2020 16:30:34 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH RFC] tests/acceptance: add a test for devices on s390x
Message-ID: <20201125163034.5a935baa.cohuck@redhat.com>
In-Reply-To: <148a7ef1-aae2-89ae-88f7-3c70c9f02999@redhat.com>
References: <20201125135820.1442611-1-cohuck@redhat.com>
 <148a7ef1-aae2-89ae-88f7-3c70c9f02999@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-s390x@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Nov 2020 16:03:13 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 25/11/2020 14.58, Cornelia Huck wrote:
> > This adds a very basic test for checking that we present devices
> > in a way that Linux can consume: boot with both virtio-net-ccw and
> > virtio-net-pci attached and then verify that Linux is able to see
> > and detect these devices.  
> 
> Thanks for tackling it!
> 
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> > 
> > A very basic test, but it would have caught the recent zPCI regression.
> > 
> > If anyone has a better idea than using early debug shells in the Debian
> > install image, please let me know. At least it's quick, as we can check
> > for the devices quite early in the boot sequence.
> > 
> > Not sure if running under both kvm and tcg on an s390 host would add
> > useful extra coverage. Also not sure if this needs fencing on any of the
> > public CIs (have not tried yet).  
> 
> We're only running the acceptance tests in the gitlab-CI, no worries about
> the others.
> 
> > ---
> >  tests/acceptance/s390_devices.py | 68 ++++++++++++++++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >  create mode 100644 tests/acceptance/s390_devices.py
> > 
> > diff --git a/tests/acceptance/s390_devices.py b/tests/acceptance/s390_devices.py
> > new file mode 100644
> > index 000000000000..6ce47061f35d
> > --- /dev/null
> > +++ b/tests/acceptance/s390_devices.py  
> 
> s390x_devices.py ?
> 
> Or maybe even machine_s390x.py instead, like the other machine*.py files?

Makes sense.

> 
> > @@ -0,0 +1,68 @@
> > +# Functional test that boots an s390x Linux guest with ccw and PCI devices
> > +# attached and checks whether the devices are recognized by Linux
> > +#
> > +# Copyright (c) 2020 Red Hat, Inc.
> > +#
> > +# Author:
> > +#  Cornelia Huck <cohuck@redhat.com>
> > +#
> > +# This work is licensed under the terms of the GNU GPL, version 2 or
> > +# later.  See the COPYING file in the top-level directory.
> > +
> > +
> > +import os
> > +
> > +from avocado_qemu import Test
> > +from avocado_qemu import exec_command_and_wait_for_pattern
> > +from avocado_qemu import wait_for_console_pattern
> > +
> > +class CheckS390xDevices(Test):
> > +    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
> > +
> > +    def wait_for_console_pattern(self, success_message, vm=None):
> > +        wait_for_console_pattern(self, success_message,
> > +                                 failure_message='Kernel panic - not syncing',
> > +                                 vm=vm)
> > +
> > +    timeout = 60  
> 
> Running on public CIs can be slow ... I'd maybe directly start with 90 or
> 120 here.

Ok; I found it hard to pick a sensible value here.

> 
> > +    def test(self):
> > +
> > +        """
> > +        :avocado: tags=arch:s390x
> > +        :avocado: tags=machine:s390-ccw-virtio
> > +        """
> > +
> > +        # XXX: switch to https when debian fixes their certificate
> > +        kernel_url = ('http://archive.debian.org/debian/dists/jessie/main'
> > +                      '/installer-s390x/current/images/generic/kernel.debian')
> > +        kernel_hash = '5af1aa839754f4d8817fb5878b4d55dfc887f45d'
> > +        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
> > +
> > +        initrd_url = ('http://archive.debian.org/debian/dists/jessie/main'
> > +                      '/installer-s390x/current/images/generic/initrd.debian')
> > +        initrd_hash = '99252b28306184b876f979585e2d4bfe96b27464'
> > +        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
> > +
> > +        self.vm.set_console()
> > +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> > +                              'console=sclp0 root=/dev/ram0 BOOT_DEBUG=3')
> > +        self.vm.add_args('-nographic',
> > +                         '-kernel', kernel_path,
> > +                         '-initrd', initrd_path,
> > +                         '-append', kernel_command_line,
> > +                         '-device', 'virtio-net-ccw,devno=fe.1.1111',
> > +                         '-device', 'virtio-net-pci')  
> 
> Maybe use '-device', 'virtio-net-pci,addr=6' or something similar to check a
> non-default PCI address, too?

Not sure if addr= will do the trick, I may need to add a zpci device.

> 
> > +        self.vm.launch()
> > +
> > +        shell_ready = "sh: can't access tty; job control turned off"
> > +        self.wait_for_console_pattern(shell_ready)
> > +        # first debug shell is too early, we need to wait for device detection
> > +        exec_command_and_wait_for_pattern(self, 'exit', shell_ready)
> > +
> > +        ccw_bus_id="0.1.1111"
> > +        pci_bus_id="0000:00:00.0"
> > +        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
> > +                                          ccw_bus_id)
> > +        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/pci/devices/',
> > +                                          pci_bus_id)
> >   
> 
> Additional ideas (likely for later patches): Set a custom mac address for
> the virtio-net devices and check whether they show up correctly in the
> guest... Use "ping" to send some packets around (with -netdev user)...

This needs a fully running userspace, though. I was planning on adding
more device types first.



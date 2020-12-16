Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2D62DBFA0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 12:43:13 +0100 (CET)
Received: from localhost ([::1]:60784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpVD6-0002SX-0a
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 06:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kpVAY-00014n-JX
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:40:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kpVAW-0005oM-Uw
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:40:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608118832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KLI0Wla3sMgkeiRYb4GSRkzsFYBBAffb8lixctDfbLA=;
 b=P1HRpGz7yj1pGoUDeWioxgH+f+HK6rAJSh+3/UHh1k8ADZ4kxcrm3c4/uVgNvHE/27eq7m
 eZuSd/u2Bfff6HWBgSEswDyH9GrqClpIuTIYRCT0/qem81SomWDd3ezEjdzVEr/32v5Ug6
 u9xkwJg4F5WiZFYH4lgKKHaCZX/gho4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-qrMaJ98YNAiRbe_YA_yfMw-1; Wed, 16 Dec 2020 06:40:28 -0500
X-MC-Unique: qrMaJ98YNAiRbe_YA_yfMw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99CD51005504;
 Wed, 16 Dec 2020 11:40:27 +0000 (UTC)
Received: from gondolin (ovpn-113-163.ams2.redhat.com [10.36.113.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5863219C48;
 Wed, 16 Dec 2020 11:40:19 +0000 (UTC)
Date: Wed, 16 Dec 2020 12:40:16 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/acceptance: Add a test with the Fedora 31 kernel
 and initrd
Message-ID: <20201216124016.5beb891a.cohuck@redhat.com>
In-Reply-To: <fd6c8fc8-f78f-5443-254f-3cdd2b70ecae@redhat.com>
References: <20201216105711.14796-1-thuth@redhat.com>
 <20201216123238.03c922b2.cohuck@redhat.com>
 <fd6c8fc8-f78f-5443-254f-3cdd2b70ecae@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Willian Rampazzo <willianr@redhat.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Dec 2020 12:36:13 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 16/12/2020 12.32, Cornelia Huck wrote:
> > On Wed, 16 Dec 2020 11:57:11 +0100
> > Thomas Huth <thuth@redhat.com> wrote:
> >   
> >> This initrd contains a virtio-net and a virtio-gpu kernel module,
> >> so we can check that we can set a MAC address for the network device
> >> and that we can successfully write some stuff into the emulated
> >> framebuffer of the virtio-gpu device.
> >>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >> ---
> >>  Based-on: 20201215183623.110128-1-thuth@redhat.com
> >>
> >>  tests/acceptance/machine_s390_ccw_virtio.py | 78 +++++++++++++++++++++
> >>  1 file changed, 78 insertions(+)
> >>
> >> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
> >> index abe25a08f0..a5be26b38e 100644
> >> --- a/tests/acceptance/machine_s390_ccw_virtio.py
> >> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> >> @@ -9,6 +9,8 @@
> >>  # This work is licensed under the terms of the GNU GPL, version 2 or
> >>  # later.  See the COPYING file in the top-level directory.
> >>  
> >> +import re
> >> +import tempfile
> >>  
> >>  from avocado_qemu import Test
> >>  from avocado_qemu import exec_command_and_wait_for_pattern
> >> @@ -150,3 +152,79 @@ class S390CCWVirtioMachine(Test):
> >>          self.vm.command('human-monitor-command', command_line='balloon 128')
> >>          exec_command_and_wait_for_pattern(self, 'head -n 1 /proc/meminfo',
> >>                                            'MemTotal:         115640 kB')
> >> +
> >> +
> >> +    def test_s390x_fedora(self):
> >> +
> >> +        """
> >> +        :avocado: tags=arch:s390x
> >> +        :avocado: tags=machine:s390-ccw-virtio
> >> +        """
> >> +
> >> +        kernel_url = ('https://archives.fedoraproject.org/pub/archive'
> >> +                      '/fedora-secondary/releases/31/Server/s390x/os'
> >> +                      '/images/kernel.img')
> >> +        kernel_hash = 'b93d1efcafcf29c1673a4ce371a1f8b43941cfeb'
> >> +        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
> >> +
> >> +        initrd_url = ('https://archives.fedoraproject.org/pub/archive'
> >> +                      '/fedora-secondary/releases/31/Server/s390x/os'
> >> +                      '/images/initrd.img')
> >> +        initrd_hash = '3de45d411df5624b8d8ef21cd0b44419ab59b12f'
> >> +        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
> >> +
> >> +        self.vm.set_console()
> >> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> >> +                              ' audit=0 rd.rescue')
> >> +        self.vm.add_args('-nographic',
> >> +                         '-smp', '4',
> >> +                         '-m', '512',
> >> +                         '-name', 'Some Guest Name',
> >> +                         '-uuid', '30de4fd9-b4d5-409e-86a5-09b387f70bfa',
> >> +                         '-kernel', kernel_path,
> >> +                         '-initrd', initrd_path,
> >> +                         '-append', kernel_command_line,
> >> +                         '-device', 'virtio-net-pci,mac=02:ca:fe:fa:ce:12',
> >> +                         '-device', 'virtio-rng-ccw',
> >> +                         '-device', 'virtio-gpu-ccw')  
> > 
> > Would it make sense to explicitly specify bus ids for the ccw devices?
> > You could check for them below, and it would potentially be more clear
> > *what* actually failed (e.g. handling the mac address vs device
> > detection).  
> 
> Do you mean PCI or CCW bus ids? The MAC address is only used for a PCI
> device here... but sure, I can add some addresses if you like.

The PCI device would need a zpci device with an uid instead of the bus
id.



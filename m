Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A892D0EDD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 12:20:57 +0100 (CET)
Received: from localhost ([::1]:47984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmEZa-00022i-LJ
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 06:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmERd-0000HX-Cy
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:12:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmERL-0001VN-Cb
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:12:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607339539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HEAn28GYTKadKJYANH1wOONhjtBlPGS4jA3MIhBgJPU=;
 b=EdlgpyWQf3Z40MJ5OPrZP2EbX0iCpIVzcOA/nndemn8c5YnQkz7Exu0BazC1KQcoZBcEYt
 Hq02LhboMaPT4whdgYCTXD2lHaAkAOGfUTHwyL8i8/cHD3tUz8SwEO1s4+GdKwvv4Qf8C+
 WTqNpcnCRldIWGN9hrMqrNtEu+c3yAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-qssFtRmDMPirc_NLoqwvBg-1; Mon, 07 Dec 2020 06:12:17 -0500
X-MC-Unique: qssFtRmDMPirc_NLoqwvBg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC2D41005D56;
 Mon,  7 Dec 2020 11:12:16 +0000 (UTC)
Received: from gondolin (ovpn-113-45.ams2.redhat.com [10.36.113.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F41055D6B1;
 Mon,  7 Dec 2020 11:12:11 +0000 (UTC)
Date: Mon, 7 Dec 2020 12:12:09 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v2] tests/acceptance: test hot(un)plug of ccw devices
Message-ID: <20201207121209.44b029ee.cohuck@redhat.com>
In-Reply-To: <4c9e76e8-54d1-068f-0567-d59bea094a34@redhat.com>
References: <20201204121450.120730-1-cohuck@redhat.com>
 <887409fe-4627-b5d7-69e1-d84560cb3999@redhat.com>
 <20201204150809.7a616a4e.cohuck@redhat.com>
 <4c9e76e8-54d1-068f-0567-d59bea094a34@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Dec 2020 17:13:22 -0300
Wainer dos Santos Moschetta <wainersm@redhat.com> wrote:

> On 12/4/20 11:08 AM, Cornelia Huck wrote:
> > On Fri, 4 Dec 2020 11:05:34 -0300
> > Wainer dos Santos Moschetta <wainersm@redhat.com> wrote:
> >  
> >> Hi,
> >>
> >> On 12/4/20 9:14 AM, Cornelia Huck wrote:  
> >>> Hotplug a virtio-net-ccw device, and then hotunplug it again.
> >>>
> >>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> >>> ---
> >>>
> >>> v1->v2:
> >>> - switch device id
> >>> - clear out dmesg before looking for CRW messages
> >>>
> >>> ---
> >>>    tests/acceptance/machine_s390_ccw_virtio.py | 16 ++++++++++++++++
> >>>    1 file changed, 16 insertions(+)
> >>>
> >>> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
> >>> index 53b8484f8f9c..83c00190621b 100644
> >>> --- a/tests/acceptance/machine_s390_ccw_virtio.py
> >>> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> >>> @@ -97,3 +97,19 @@ class S390CCWVirtioMachine(Test):
> >>>            exec_command_and_wait_for_pattern(self,
> >>>                                              'cat /sys/bus/pci/devices/000a\:00\:00.0/function_id',
> >>>                                              '0x0000000c')
> >>> +        # add another device
> >>> +        exec_command_and_wait_for_pattern(self, 'dmesg -c', ' ')  
> >>
> >> The problem is that `dmesg -c` will fail if you run the test with
> >> unprivileged user.  
> > Hm, why should that make a difference for a guest command?  
> 
> 
> Never mind, my brain mix host and guest very often....

I'm sure you're not the only one :)

> 
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

Thanks!

> 
> 
> >  
> >> - Wainer
> >>  
> >>> +        self.vm.command('device_add', driver='virtio-net-ccw',
> >>> +                        devno='fe.0.4711', id='net_4711')
> >>> +        exec_command_and_wait_for_pattern(self, 'dmesg', 'CRW')
> >>> +        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
> >>> +                                          '0.0.4711')
> >>> +        # and detach it again
> >>> +        exec_command_and_wait_for_pattern(self, 'dmesg -c', ' ')
> >>> +        self.vm.command('device_del', id='net_4711')
> >>> +        self.vm.event_wait(name='DEVICE_DELETED',
> >>> +                           match={'data': {'device': 'net_4711'}})
> >>> +        exec_command_and_wait_for_pattern(self, 'dmesg', 'CRW')
> >>> +        exec_command_and_wait_for_pattern(self,
> >>> +                                          'ls /sys/bus/ccw/devices/0.0.4711',
> >>> +                                          'No such file or directory')  



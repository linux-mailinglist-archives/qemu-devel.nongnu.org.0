Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B022D1602
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 17:33:50 +0100 (CET)
Received: from localhost ([::1]:32898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmJSP-0005kv-7e
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 11:33:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmJPZ-00052u-UM
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:30:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmJPX-0006p6-KV
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:30:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607358649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KCqcAEYj+wbeB8FVCOC9UUNLDSolXmhOWYMxZluZKPw=;
 b=chJoHW7c2QaGwErz9pMLuVBRPsORlG5PUWFAYnxs2LMD1tkDhl30yBt7r5/zxdQsjDOsrH
 eP159Uae9BMLYsfSMi2VMUpH2mf1NcgjZd/5Ho7p8PZdPEIfij2Ryw168NLJTpUevoRA+v
 wOONURfZlgPqKz3j7RL6jfBmK/wJTWM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-0HJxwkJVPP6HijGc24Z-ng-1; Mon, 07 Dec 2020 11:30:47 -0500
X-MC-Unique: 0HJxwkJVPP6HijGc24Z-ng-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC3BE18C89C4;
 Mon,  7 Dec 2020 16:30:46 +0000 (UTC)
Received: from gondolin (ovpn-113-45.ams2.redhat.com [10.36.113.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9488F5D6AB;
 Mon,  7 Dec 2020 16:30:41 +0000 (UTC)
Date: Mon, 7 Dec 2020 17:30:39 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] tests/acceptance: test hot(un)plug of ccw devices
Message-ID: <20201207173039.0678eef3.cohuck@redhat.com>
In-Reply-To: <c3c60abd-2a38-8267-aafa-9a7534d5bf24@redhat.com>
References: <20201204121450.120730-1-cohuck@redhat.com>
 <c3c60abd-2a38-8267-aafa-9a7534d5bf24@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Dec 2020 15:28:47 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 04/12/2020 13.14, Cornelia Huck wrote:
> > Hotplug a virtio-net-ccw device, and then hotunplug it again.
> > 
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> > 
> > v1->v2:
> > - switch device id
> > - clear out dmesg before looking for CRW messages
> > 
> > ---
> >  tests/acceptance/machine_s390_ccw_virtio.py | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
> > index 53b8484f8f9c..83c00190621b 100644
> > --- a/tests/acceptance/machine_s390_ccw_virtio.py
> > +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> > @@ -97,3 +97,19 @@ class S390CCWVirtioMachine(Test):
> >          exec_command_and_wait_for_pattern(self,
> >                                            'cat /sys/bus/pci/devices/000a\:00\:00.0/function_id',
> >                                            '0x0000000c')
> > +        # add another device
> > +        exec_command_and_wait_for_pattern(self, 'dmesg -c', ' ')
> > +        self.vm.command('device_add', driver='virtio-net-ccw',
> > +                        devno='fe.0.4711', id='net_4711')
> > +        exec_command_and_wait_for_pattern(self, 'dmesg', 'CRW')  
> 
> Looking at this twice, I'm a little bit afraid that this could be racy -
> what if the kernel decides to emit the line with the "CRW" just after we
> executed the dmesg command? I'd maybe use something like this instead:
> 
> exec_command_and_wait_for_pattern(self,
>  'while ! dmesg -c | grep CRW ; do sleep 1 ; done', '~ #')

Yes, you're right. Unless anyone can think of a better incantation?

> 
> > +        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
> > +                                          '0.0.4711')
> > +        # and detach it again
> > +        exec_command_and_wait_for_pattern(self, 'dmesg -c', ' ')  
> 
> If adapt my above change, you could also get rid of this dmesg -c here
> (since it's done in the while loop already)

I don't think so (there are two CRWs posted, and the loop might have
caught the first one only.)

> 
> > +        self.vm.command('device_del', id='net_4711')
> > +        self.vm.event_wait(name='DEVICE_DELETED',
> > +                           match={'data': {'device': 'net_4711'}})
> > +        exec_command_and_wait_for_pattern(self, 'dmesg', 'CRW')  
> 
> dito
> 
> > +        exec_command_and_wait_for_pattern(self,
> > +                                          'ls /sys/bus/ccw/devices/0.0.4711',
> > +                                          'No such file or directory')  
> 
> With my suggestion applied:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>



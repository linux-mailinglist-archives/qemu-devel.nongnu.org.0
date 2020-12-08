Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59152D29E7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 12:45:25 +0100 (CET)
Received: from localhost ([::1]:52478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmbQp-0006fh-ON
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 06:45:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmbP4-0006CF-Hm
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:43:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmbP2-00083q-5P
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:43:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607427810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HOYehiiLglSp6LdTKF7rNCRxYPx/TwUJvyB+/Fza0ok=;
 b=RIy29VmbnVHfTZX2zLBo04gfw4oIRcxjPoEFc3g4YAwMXi6DY90KQwW2+ECiQt5jmdo950
 nlScpG/3viOCJkxNC1sH8xhKHxbRKSrKijhObfqi9HSAPYkdofbyrdg1Y+gqwx2zynJBmr
 bF/qDxxljO3TpC4qLVjPhWRcCHtjXRc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-RBJZ-Xq1PhCHvsESio6Ekg-1; Tue, 08 Dec 2020 06:43:28 -0500
X-MC-Unique: RBJZ-Xq1PhCHvsESio6Ekg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F8D8802B46;
 Tue,  8 Dec 2020 11:43:27 +0000 (UTC)
Received: from gondolin (ovpn-113-5.ams2.redhat.com [10.36.113.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4B2C60BF1;
 Tue,  8 Dec 2020 11:43:21 +0000 (UTC)
Date: Tue, 8 Dec 2020 12:43:19 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] tests/acceptance: test hot(un)plug of ccw devices
Message-ID: <20201208124319.01dc60ba.cohuck@redhat.com>
In-Reply-To: <5ef2b665-3f21-bff2-5f16-649d0b5a2d7c@redhat.com>
References: <20201204121450.120730-1-cohuck@redhat.com>
 <c3c60abd-2a38-8267-aafa-9a7534d5bf24@redhat.com>
 <20201207173039.0678eef3.cohuck@redhat.com>
 <960b49b9-337f-429d-907e-f3548d1b5b80@redhat.com>
 <5ef2b665-3f21-bff2-5f16-649d0b5a2d7c@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On Mon, 7 Dec 2020 19:40:36 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 07/12/2020 17.34, Thomas Huth wrote:
> > On 07/12/2020 17.30, Cornelia Huck wrote:  
> >> On Mon, 7 Dec 2020 15:28:47 +0100
> >> Thomas Huth <thuth@redhat.com> wrote:
> >>  
> >>> On 04/12/2020 13.14, Cornelia Huck wrote:  
> >>>> Hotplug a virtio-net-ccw device, and then hotunplug it again.
> >>>>
> >>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> >>>> ---  
> >  
> [...]
> >>>> +        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
> >>>> +                                          '0.0.4711')
> >>>> +        # and detach it again
> >>>> +        exec_command_and_wait_for_pattern(self, 'dmesg -c', ' ')    
> >>>
> >>> If adapt my above change, you could also get rid of this dmesg -c here
> >>> (since it's done in the while loop already)  
> >>
> >> I don't think so (there are two CRWs posted, and the loop might have
> >> caught the first one only.)  
> > 
> > Oh, you're right. So let's better be safe than sorry and keep this dmesg -c.  
> 
> Ok, as we had to discover during some testing, it's a bad idea to only wait
> for ' ' after the 'dmesg -c' since it matches too early, so that the device
> gets added while the dmesg command is still running.
> 
> The following code is working for me instead:
> 
>          # add another device
>          exec_command_and_wait_for_pattern(self,
>                      'dmesg -c > /dev/null; echo dm-clear\ 1', 'dm-clear 1')
>          self.vm.command('device_add', driver='virtio-net-ccw',
>                          devno='fe.0.4711', id='net_4711')
>          exec_command_and_wait_for_pattern(self,
>                          'while ! (dmesg -c | grep CRW) ; do sleep 1 ; done',
>                          'CRW reports')
>          exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
>                                            '0.0.4711')
>          # and detach it again
>          exec_command_and_wait_for_pattern(self,
>                      'dmesg -c > /dev/null; echo dm-clear\ 2', 'dm-clear 2')
>          self.vm.command('device_del', id='net_4711')
>          self.vm.event_wait(name='DEVICE_DELETED',
>                             match={'data': {'device': 'net_4711'}})
>          exec_command_and_wait_for_pattern(self,
>                          'while ! (dmesg -c | grep CRW) ; do sleep 1 ; done',
>                          'CRW reports')
>          exec_command_and_wait_for_pattern(self,
>                                            'ls /sys/bus/ccw/devices/0.0.4711',
>                                            'No such file or directory')

Thanks for tracking this down, this works for me as well. I'll send a
v3.



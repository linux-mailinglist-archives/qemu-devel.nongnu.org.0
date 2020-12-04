Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73D32CEF63
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 15:08:41 +0100 (CET)
Received: from localhost ([::1]:36466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klBlJ-0003gp-1a
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 09:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1klBic-0000ez-W9
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:05:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1klBia-0005xD-NN
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:05:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607090751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ii8kuhaMcJXJaI9ck0mA8O0MgAvcnew7om4yFYXVp3w=;
 b=De0/t2jngstk9nWj1tEbnuswZBhmWpWL9LZF2nvm9X9E64e0mgfrUaVBX2KJsorOMEfvsB
 SWmGVOQHdG4dMjv7p9VLv5Y0EwpL87/Q/XZxmhP3Js25lSmd3o13uHNp12mwZRJT+sxVys
 ztmM+CalGeVIZxpks+iaxqdZNeMS3B0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-Q1rOTLQZOred5MvatWLlfw-1; Fri, 04 Dec 2020 09:05:49 -0500
X-MC-Unique: Q1rOTLQZOred5MvatWLlfw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA3DE8145E1;
 Fri,  4 Dec 2020 14:05:47 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-88.gru2.redhat.com
 [10.97.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71D955D9CA;
 Fri,  4 Dec 2020 14:05:36 +0000 (UTC)
Subject: Re: [PATCH v2] tests/acceptance: test hot(un)plug of ccw devices
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
References: <20201204121450.120730-1-cohuck@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <887409fe-4627-b5d7-69e1-d84560cb3999@redhat.com>
Date: Fri, 4 Dec 2020 11:05:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201204121450.120730-1-cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 12/4/20 9:14 AM, Cornelia Huck wrote:
> Hotplug a virtio-net-ccw device, and then hotunplug it again.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>
> v1->v2:
> - switch device id
> - clear out dmesg before looking for CRW messages
>
> ---
>   tests/acceptance/machine_s390_ccw_virtio.py | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
> index 53b8484f8f9c..83c00190621b 100644
> --- a/tests/acceptance/machine_s390_ccw_virtio.py
> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> @@ -97,3 +97,19 @@ class S390CCWVirtioMachine(Test):
>           exec_command_and_wait_for_pattern(self,
>                                             'cat /sys/bus/pci/devices/000a\:00\:00.0/function_id',
>                                             '0x0000000c')
> +        # add another device
> +        exec_command_and_wait_for_pattern(self, 'dmesg -c', ' ')


The problem is that `dmesg -c` will fail if you run the test with 
unprivileged user.

- Wainer

> +        self.vm.command('device_add', driver='virtio-net-ccw',
> +                        devno='fe.0.4711', id='net_4711')
> +        exec_command_and_wait_for_pattern(self, 'dmesg', 'CRW')
> +        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
> +                                          '0.0.4711')
> +        # and detach it again
> +        exec_command_and_wait_for_pattern(self, 'dmesg -c', ' ')
> +        self.vm.command('device_del', id='net_4711')
> +        self.vm.event_wait(name='DEVICE_DELETED',
> +                           match={'data': {'device': 'net_4711'}})
> +        exec_command_and_wait_for_pattern(self, 'dmesg', 'CRW')
> +        exec_command_and_wait_for_pattern(self,
> +                                          'ls /sys/bus/ccw/devices/0.0.4711',
> +                                          'No such file or directory')



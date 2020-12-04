Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 818102CEEFB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 14:49:28 +0100 (CET)
Received: from localhost ([::1]:52750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klBSh-00033Q-2u
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 08:49:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1klBRG-0002bk-UL
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 08:47:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1klBRF-0008C8-4y
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 08:47:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607089676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=daMk273mzc5eZASCO5IJbQvgOrLxdcr0uODre63YoDM=;
 b=CQqj/+AZGzAcoOY7yat2qHhLTA1bbmAWkjbv2IQfyF9Wc8Yx/21vWLizhdi7PnLqfuPiPf
 0dWsB8tv1uq4W14q8GrcS9jh6FBVLa5Hk4L4HQpl73S1oduc6Esra/FUDxU7tGnoESr05f
 IEz3uB7QKrhoDql/3UJcWqrGpESAeoM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-miDG46HsMzWGR5TCU37DJQ-1; Fri, 04 Dec 2020 08:47:52 -0500
X-MC-Unique: miDG46HsMzWGR5TCU37DJQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83D8BC73B3;
 Fri,  4 Dec 2020 13:47:47 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-88.gru2.redhat.com
 [10.97.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5B355D6D7;
 Fri,  4 Dec 2020 13:47:37 +0000 (UTC)
Subject: Re: [PATCH 2/3] tests/acceptance: verify s390x device detection
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
References: <20201130180216.15366-1-cohuck@redhat.com>
 <20201130180216.15366-3-cohuck@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <0fdfd10a-36a2-2fcf-449c-adf5ccd761c4@redhat.com>
Date: Fri, 4 Dec 2020 10:47:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130180216.15366-3-cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


On 11/30/20 3:02 PM, Cornelia Huck wrote:
> The kernel/initrd combination does not provide the virtio-net
> driver; therefore, simply check whether the presented device type
> is indeed virtio-net for the two virtio-net-{ccw,pci} devices.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   tests/acceptance/machine_s390_ccw_virtio.py | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
> index 683b6e0dac2e..e203ee304264 100644
> --- a/tests/acceptance/machine_s390_ccw_virtio.py
> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> @@ -80,3 +80,14 @@ class S390CCWVirtioMachine(Test):
>           exec_command_and_wait_for_pattern(self,
>                                             'cat /sys/bus/ccw/devices/0.3.1234/virtio?/features',
>                                             virtio_rng_features)
> +        # verify that we indeed have virtio-net devices (without having the
> +        # virtio-net driver handy)
> +        exec_command_and_wait_for_pattern(self,
> +                                          'cat /sys/bus/ccw/devices/0.1.1111/cutype',
> +                                          '3832/01')
> +        exec_command_and_wait_for_pattern(self,
> +                                          'cat /sys/bus/pci/devices/0005\:00\:00.0/subsystem_vendor',
> +                                          '0x1af4')
> +        exec_command_and_wait_for_pattern(self,
> +                                          'cat /sys/bus/pci/devices/0005\:00\:00.0/subsystem_device',
> +                                          '0x0001')

Here I think it's ok to do...

exec_command_and_wait_for_pattern(self,
         'cat /sys/bus/ccw/devices/0.1.1111/cutype',
         '3832/01')

... so checkpatch is happy, everybody is happy.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>




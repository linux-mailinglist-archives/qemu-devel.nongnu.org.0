Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF822CEEDF
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 14:38:06 +0100 (CET)
Received: from localhost ([::1]:43460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klBHh-00070y-1u
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 08:38:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1klBGW-0006CX-55
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 08:36:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1klBGR-0004Lz-OU
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 08:36:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607089005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pHPPUMuD+0xnj4Vv8d4/LHFFI39nnnf/Y4qj3EgIzOg=;
 b=R9zRdWfCbJaJneXuSsAlOEZlbwMHiv6dNPrsMdefCXK1LHJe1W26oRH1yi/8VwaORHVarP
 ukNg/9QtHD439GB7xQ6jAztLV+rLzkM3Mu3DKGDpFvFuXDEkw0Y8eQm7SOXr/FHJ5VCpI2
 Q3/lbzUuI41cnWQrRHQPgVwvyW+RlM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-8Tce68exOKWN8jlUxLU1vA-1; Fri, 04 Dec 2020 08:36:43 -0500
X-MC-Unique: 8Tce68exOKWN8jlUxLU1vA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB1FA1937FC0;
 Fri,  4 Dec 2020 13:36:42 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-88.gru2.redhat.com
 [10.97.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB01C620D7;
 Fri,  4 Dec 2020 13:36:36 +0000 (UTC)
Subject: Re: [PATCH 1/3] tests/acceptance: test virtio-ccw revision handling
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
References: <20201130180216.15366-1-cohuck@redhat.com>
 <20201130180216.15366-2-cohuck@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <ac7b78a0-4ba5-5eea-4bff-85c04d783ecb@redhat.com>
Date: Fri, 4 Dec 2020 10:36:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130180216.15366-2-cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 11/30/20 3:02 PM, Cornelia Huck wrote:
> The max_revision prop of virtio-ccw devices can be used to force
> an older revision for compatibility handling. The easiest way to
> check this is to force a device to revision 0, which turns off
> virtio-1.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   tests/acceptance/machine_s390_ccw_virtio.py | 18 ++++++++++++++++--
>   1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
> index db6352c44434..683b6e0dac2e 100644
> --- a/tests/acceptance/machine_s390_ccw_virtio.py
> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> @@ -51,6 +51,10 @@ class S390CCWVirtioMachine(Test):
>                            '-initrd', initrd_path,
>                            '-append', kernel_command_line,
>                            '-device', 'virtio-net-ccw,devno=fe.1.1111',
> +                         '-device',
> +                         'virtio-rng-ccw,devno=fe.2.0000,max_revision=0',
> +                         '-device',
> +                         'virtio-rng-ccw,devno=fe.3.1234,max_revision=2',
>                            '-device', 'zpci,uid=5,target=zzz',
>                            '-device', 'virtio-net-pci,id=zzz')
>           self.vm.launch()
> @@ -60,9 +64,19 @@ class S390CCWVirtioMachine(Test):
>           # first debug shell is too early, we need to wait for device detection
>           exec_command_and_wait_for_pattern(self, 'exit', shell_ready)
>   
> -        ccw_bus_id="0.1.1111"
> +        ccw_bus_ids="0.1.1111  0.2.0000  0.3.1234"
>           pci_bus_id="0005:00:00.0"
>           exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
> -                                          ccw_bus_id)
> +                                          ccw_bus_ids)
>           exec_command_and_wait_for_pattern(self, 'ls /sys/bus/pci/devices/',
>                                             pci_bus_id)
> +        # check that the device at 0.2.0000 is in legacy mode, while the
> +        # device at 0.3.1234 has the virtio-1 feature bit set
> +        virtio_rng_features="0000000000000000000000000000110010000000000000000000000000000000"
> +        virtio_rng_features_legacy="0000000000000000000000000000110000000000000000000000000000000000"

Do something like...

virtio_rng_features="0000000000000000000000000000" + \
     "110010000000000000000000000000000000"

... and checkpatch should not complain.


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


> +        exec_command_and_wait_for_pattern(self,
> +                                          'cat /sys/bus/ccw/devices/0.2.0000/virtio?/features',
> +                                          virtio_rng_features_legacy)
> +        exec_command_and_wait_for_pattern(self,
> +                                          'cat /sys/bus/ccw/devices/0.3.1234/virtio?/features',
> +                                          virtio_rng_features)



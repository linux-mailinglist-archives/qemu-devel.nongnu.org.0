Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 305F02CA096
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:58:16 +0100 (CET)
Received: from localhost ([::1]:33536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3MN-0007qf-7q
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:58:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kk3H2-0001lF-5f
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:52:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kk3H0-0001VL-Mj
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:52:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606819962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KPcYwWBmcBU4gSml+q+vIXXKrh/8MommGfmMVxWJuAk=;
 b=MzKbff0Nd1wymuqxiDsHArtQ9WBQ6CORr0liXsm9h9ym/1gHMi5hDk1mu+qUC1RaRVbx+y
 quRNiwkbIL3QgsQpKNM7GzjtwMjX5DcwaEKrxFJ01/v60+6mX5fnQOq5BjNDbSYvDg6Qpz
 ebnm3DLcRdWOaqelvZ+/i56JYiB8cWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-TCOSwkJ_MN6opV7E-U_9Nw-1; Tue, 01 Dec 2020 05:52:38 -0500
X-MC-Unique: TCOSwkJ_MN6opV7E-U_9Nw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EA53185E485;
 Tue,  1 Dec 2020 10:52:37 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-117.ams2.redhat.com [10.36.112.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 706E819C44;
 Tue,  1 Dec 2020 10:52:32 +0000 (UTC)
Subject: Re: [PATCH 3/3] tests/acceptance: test s390x zpci fid propagation
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
References: <20201130180216.15366-1-cohuck@redhat.com>
 <20201130180216.15366-4-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b2c24c76-7a1f-9414-de62-46241a708c37@redhat.com>
Date: Tue, 1 Dec 2020 11:52:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201130180216.15366-4-cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/11/2020 19.02, Cornelia Huck wrote:
> Verify that a fid specified on the command line shows up correctly
> as the function_id in the guest.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  tests/acceptance/machine_s390_ccw_virtio.py | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
> index e203ee304264..53b8484f8f9c 100644
> --- a/tests/acceptance/machine_s390_ccw_virtio.py
> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> @@ -56,7 +56,9 @@ class S390CCWVirtioMachine(Test):
>                           '-device',
>                           'virtio-rng-ccw,devno=fe.3.1234,max_revision=2',
>                           '-device', 'zpci,uid=5,target=zzz',
> -                         '-device', 'virtio-net-pci,id=zzz')
> +                         '-device', 'virtio-net-pci,id=zzz',
> +                         '-device', 'zpci,uid=0xa,fid=12,target=serial',
> +                         '-device', 'virtio-serial-pci,id=serial')
>          self.vm.launch()
>  
>          shell_ready = "sh: can't access tty; job control turned off"
> @@ -65,11 +67,11 @@ class S390CCWVirtioMachine(Test):
>          exec_command_and_wait_for_pattern(self, 'exit', shell_ready)
>  
>          ccw_bus_ids="0.1.1111  0.2.0000  0.3.1234"
> -        pci_bus_id="0005:00:00.0"
> +        pci_bus_ids="0005:00:00.0  000a:00:00.0"
>          exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
>                                            ccw_bus_ids)
>          exec_command_and_wait_for_pattern(self, 'ls /sys/bus/pci/devices/',
> -                                          pci_bus_id)
> +                                          pci_bus_ids)
>          # check that the device at 0.2.0000 is in legacy mode, while the
>          # device at 0.3.1234 has the virtio-1 feature bit set
>          virtio_rng_features="0000000000000000000000000000110010000000000000000000000000000000"
> @@ -91,3 +93,7 @@ class S390CCWVirtioMachine(Test):
>          exec_command_and_wait_for_pattern(self,
>                                            'cat /sys/bus/pci/devices/0005\:00\:00.0/subsystem_device',
>                                            '0x0001')
> +        # check fid propagation
> +        exec_command_and_wait_for_pattern(self,
> +                                          'cat /sys/bus/pci/devices/000a\:00\:00.0/function_id',
> +                                          '0x0000000c')
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>



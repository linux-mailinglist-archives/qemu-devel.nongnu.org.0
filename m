Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE29D2D8028
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 21:46:50 +0100 (CET)
Received: from localhost ([::1]:47654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knpJR-0001FH-L3
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 15:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1knpFe-0008UI-11
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 15:42:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1knpFP-0004H6-78
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 15:42:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607719358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4GM4y3U399xh5LxokCri0MsCDbD1a3K+o1UAcN5BpjI=;
 b=Ym4DZiHZlygQnCGds5m1i6yG0mw+qosifMMgiPalS2+KUbMN+MA+DFLbexNbWBEMKJLEk7
 xUWF8TwwSkRDF31OVipTocurCpALxzwaCeMAoPjD8uB0ddhVKrnYUxp6B9HGb8vU6KdeNZ
 fnejMHyHD2F74G+ugCOkTZvDxW7VzMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-rC9AU8I0MFKWT_lnmQQ3PA-1; Fri, 11 Dec 2020 15:42:36 -0500
X-MC-Unique: rC9AU8I0MFKWT_lnmQQ3PA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4B84107ACE8;
 Fri, 11 Dec 2020 20:42:34 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-114-123.rdu2.redhat.com
 [10.10.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A38F61992D;
 Fri, 11 Dec 2020 20:42:32 +0000 (UTC)
Subject: Re: [PATCH 3/3] tests/acceptance/machine_s390_ccw_virtio: Test the
 virtio-balloon device
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>
References: <20201211173134.376078-1-thuth@redhat.com>
 <20201211173134.376078-4-thuth@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <e40469ac-8237-36b5-6ece-90ea93f0c4e0@redhat.com>
Date: Fri, 11 Dec 2020 17:42:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201211173134.376078-4-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12/11/20 2:31 PM, Thomas Huth wrote:
> Inflate the balloon and check whether the size of the memory changes.
Yeah, because a true balloon should inflate :D
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/acceptance/machine_s390_ccw_virtio.py | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
> index 7d0a78139b..81f6c066c7 100644
> --- a/tests/acceptance/machine_s390_ccw_virtio.py
> +++ b/tests/acceptance/machine_s390_ccw_virtio.py
> @@ -70,7 +70,8 @@ class S390CCWVirtioMachine(Test):
>                            '-device', 'zpci,uid=5,target=zzz',
>                            '-device', 'virtio-net-pci,id=zzz',
>                            '-device', 'zpci,uid=0xa,fid=12,target=serial',
> -                         '-device', 'virtio-serial-pci,id=serial')
> +                         '-device', 'virtio-serial-pci,id=serial',
> +                         '-device', 'virtio-balloon-ccw')
>           self.vm.launch()
>   
>           shell_ready = "sh: can't access tty; job control turned off"
> @@ -140,3 +141,12 @@ class S390CCWVirtioMachine(Test):
>           exec_command_and_wait_for_pattern(self,
>                                             'ls /sys/bus/ccw/devices/0.0.4711',
>                                             'No such file or directory')
> +        # test the virtio-balloon device
> +        exec_command_and_wait_for_pattern(self, 'head -n 1 /proc/meminfo',
> +                                          'MemTotal:         115640 kB')
> +        self.vm.command('human-monitor-command', command_line='balloon 96')
> +        exec_command_and_wait_for_pattern(self, 'head -n 1 /proc/meminfo',
> +                                          'MemTotal:          82872 kB')
> +        self.vm.command('human-monitor-command', command_line='balloon 128')
> +        exec_command_and_wait_for_pattern(self, 'head -n 1 /proc/meminfo',
> +                                          'MemTotal:         115640 kB')



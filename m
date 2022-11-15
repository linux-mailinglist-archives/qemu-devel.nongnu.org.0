Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4699B62962C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 11:45:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1outQc-00031z-GR; Tue, 15 Nov 2022 05:44:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1outQX-00031M-VY
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 05:44:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1outQU-0004fo-02
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 05:44:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668509055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EaJlL6NgzwHi1UAh/5SxgApyDe7Vq1kF6RqRXz4qAks=;
 b=TNZ2u3Mx9YLcjS4SBNRUfyuj/WE4Zc9CcK8tvoa3mZ5IEASQ90jundRMpOzCojEgT/R/1u
 AWYz2/2UF4qni2RcLuAOxWrp+jKdGYJivZS/Xa10yvltJlgb+OqxKkY7/XessWTR+1NrC6
 0LYG+pjJoWqOu7dGZvIyUXCFR0mWfCQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-3YDBQuJTMkOOwgAnJ5ngdQ-1; Tue, 15 Nov 2022 05:44:11 -0500
X-MC-Unique: 3YDBQuJTMkOOwgAnJ5ngdQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B38A7811E7A;
 Tue, 15 Nov 2022 10:44:10 +0000 (UTC)
Received: from localhost (unknown [10.39.193.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF6A32166B2B;
 Tue, 15 Nov 2022 10:44:09 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Greg Kurz <groug@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Yanan Wang
 <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>, Daniel Henrique
 Barboza <danielhb413@gmail.com>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, David
 Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH for-8.0] hw: Add compat machines for 8.0
In-Reply-To: <20221115113941.123db1e8@bahia>
Organization: Red Hat GmbH
References: <20221111124534.129111-1-cohuck@redhat.com>
 <20221115113941.123db1e8@bahia>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 15 Nov 2022 11:44:06 +0100
Message-ID: <87leoccxah.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 15 2022, Greg Kurz <groug@kaod.org> wrote:

> On Fri, 11 Nov 2022 13:45:34 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:
>
>> Add 8.0 machine types for arm/i440fx/m68k/q35/s390x/spapr.
>> 
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>  hw/arm/virt.c              |  9 ++++++++-
>>  hw/core/machine.c          |  3 +++
>>  hw/i386/pc.c               |  3 +++
>>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>>  hw/m68k/virt.c             |  9 ++++++++-
>>  hw/ppc/spapr.c             | 15 +++++++++++++--
>>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>>  include/hw/boards.h        |  3 +++
>>  include/hw/i386/pc.h       |  3 +++
>>  10 files changed, 79 insertions(+), 7 deletions(-)
>> 
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index b87135085610..2a46660980e7 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -3096,10 +3096,17 @@ static void machvirt_machine_init(void)
>>  }
>>  type_init(machvirt_machine_init);
>>  
>> +static void virt_machine_8_0_options(MachineClass *mc)
>> +{
>> +}
>> +DEFINE_VIRT_MACHINE_AS_LATEST(8, 0)
>> +
>>  static void virt_machine_7_2_options(MachineClass *mc)
>>  {
>> +    virt_machine_8_0_options(mc);
>> +    compat_props_add(mc->compat_props, hw_compat_7_2, hw_compat_7_2_len);
>>  }
>> -DEFINE_VIRT_MACHINE_AS_LATEST(7, 2)
>> +DEFINE_VIRT_MACHINE(7, 2)
>>  
>>  static void virt_machine_7_1_options(MachineClass *mc)
>>  {
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 8d34caa31dc8..f264fb53b46c 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -40,6 +40,9 @@
>>  #include "hw/virtio/virtio-pci.h"
>>  #include "qom/object_interfaces.h"
>>  
>> +GlobalProperty hw_compat_7_2[] ={};
>
> Missing space between '=' and '{}'.

Oops. Maybe this can be fixed up by whoever ends up applying this, or
maybe this will be changed by another patch immediately anyway.

>
> Anyway, for ppc parts:
>
> Reviewed-by: Greg Kurz <groug@kaod.org>

Thanks :)



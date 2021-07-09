Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3E13C20BF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 10:23:45 +0200 (CEST)
Received: from localhost ([::1]:50772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1lnU-0000VX-7Y
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 04:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1lmg-0008HJ-FF
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 04:22:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1lme-0006eB-Qn
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 04:22:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625818972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o8and971sAV3sJCnb5GToOG6cOSMhxkmun04ZY28yZc=;
 b=XzWMBVYeC0SZ/zmeN/EavjKLMAPXHGz/T0MOCNpBHNzhC6RKRfs0OnaPn/T9rGDbR3L78r
 FYqG6EXFkVtTpQHdo6Wy+7J66WoBTyZZWeItJSPqNnEdEXzV3GlzWUR9x/pcV6y1AbRE57
 ZLq8lLdoKcY6gtqJG02l2BARgnAV7kM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-FMK92W-XP7ik2-WydH9rkw-1; Fri, 09 Jul 2021 04:22:49 -0400
X-MC-Unique: FMK92W-XP7ik2-WydH9rkw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36C0F804141;
 Fri,  9 Jul 2021 08:22:48 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 795D819D9F;
 Fri,  9 Jul 2021 08:22:43 +0000 (UTC)
Date: Fri, 9 Jul 2021 10:22:42 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v8 9/9] qtest/hyperv: Introduce a simple hyper-v test
Message-ID: <20210709102242.2a7cd7f7@redhat.com>
In-Reply-To: <20210708210222.arl4zzquuw75ptwp@habkost.net>
References: <20210608120817.1325125-1-vkuznets@redhat.com>
 <20210608120817.1325125-10-vkuznets@redhat.com>
 <20210708210222.arl4zzquuw75ptwp@habkost.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Jul 2021 17:02:22 -0400
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Tue, Jun 08, 2021 at 02:08:17PM +0200, Vitaly Kuznetsov wrote:
> > For the beginning, just test 'hv-passthrough' and a couple of custom
> > Hyper-V  enlightenments configurations through QMP. Later, it would
> > be great to complement this by checking CPUID values from within the
> > guest.
> > 
> > Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>  
> [...]
> > +static bool kvm_has_sys_hyperv_cpuid(void)
> > +{
> > +    int fd = open("/dev/kvm", O_RDWR);
> > +    int ret;
> > +
> > +    g_assert(fd > 0);  
> 
> This crashes when /dev/kvm doesn't exist.  See:
> https://gitlab.com/ehabkost/qemu/-/jobs/1404084459

maybe reuse qtest_has_accel()
 https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg06864.html

instead of op encoding it.

> I'm removing it from the queue.
> 



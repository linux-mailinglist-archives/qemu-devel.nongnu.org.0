Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BCC3C1AEB
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 23:18:00 +0200 (CEST)
Received: from localhost ([::1]:37266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1bPC-0008Rs-RC
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 17:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1bAI-0004Yn-74
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:02:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1bAF-00060V-QP
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:02:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625778150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K6MYOS24G1fWfThZ0aChLTUnlkytI4OqH2oPoBorJzM=;
 b=TFouarjSGxdzSxQZt2ToFL10ss6hBXe5SBP235f1PmdzIr94PC7cqWfHJJlHyQmQh3LWy+
 Xaa8HM4erhtGO9ehH3+HfO71LFMYf5iWMrtqYt5pBqx+LYjH09CYfDwM/rGJzB287WYWqY
 RS7wkkSp4Kj8gMPtim8Gta/HeU6sm2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-DWtjrLG8NQOWap4l4NKaYA-1; Thu, 08 Jul 2021 17:02:27 -0400
X-MC-Unique: DWtjrLG8NQOWap4l4NKaYA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83F4110C1ADC;
 Thu,  8 Jul 2021 21:02:26 +0000 (UTC)
Received: from localhost (unknown [10.22.8.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C8B5100EB3D;
 Thu,  8 Jul 2021 21:02:22 +0000 (UTC)
Date: Thu, 8 Jul 2021 17:02:22 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v8 9/9] qtest/hyperv: Introduce a simple hyper-v test
Message-ID: <20210708210222.arl4zzquuw75ptwp@habkost.net>
References: <20210608120817.1325125-1-vkuznets@redhat.com>
 <20210608120817.1325125-10-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210608120817.1325125-10-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
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
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 02:08:17PM +0200, Vitaly Kuznetsov wrote:
> For the beginning, just test 'hv-passthrough' and a couple of custom
> Hyper-V  enlightenments configurations through QMP. Later, it would
> be great to complement this by checking CPUID values from within the
> guest.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
[...]
> +static bool kvm_has_sys_hyperv_cpuid(void)
> +{
> +    int fd = open("/dev/kvm", O_RDWR);
> +    int ret;
> +
> +    g_assert(fd > 0);

This crashes when /dev/kvm doesn't exist.  See:
https://gitlab.com/ehabkost/qemu/-/jobs/1404084459

I'm removing it from the queue.

-- 
Eduardo



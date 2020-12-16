Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C70AA2DBB5A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 07:46:05 +0100 (CET)
Received: from localhost ([::1]:44100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQZY-0008K3-Rc
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 01:46:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kpQXf-0007gg-JC
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 01:44:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kpQXc-0001SR-Ru
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 01:44:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608101043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wcza4gvWhaFqDoP8VtrDuLYucz6EpPowrBdkki8zJ4A=;
 b=G/ghZDp+m0e8Dsh8JbFMFwqBf6IM3KGW7W2kHTfXlPb/MNFANqMZyliSE+w/I2NL7qmGrg
 m1aVr2z38eV6h2hAsDcJyvcMjuWRcNTK6msp3n7/T4ExQIMDJBxxbTloQ7IcmscBik/ZJi
 qI8wcU+za8k+yQAEV6bZGeA2pJ5pbdc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-zQ9TAPXZMiK_d1FEaNg1wg-1; Wed, 16 Dec 2020 01:44:00 -0500
X-MC-Unique: zQ9TAPXZMiK_d1FEaNg1wg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 821B4800D53;
 Wed, 16 Dec 2020 06:43:58 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1C335C67A;
 Wed, 16 Dec 2020 06:43:56 +0000 (UTC)
Date: Wed, 16 Dec 2020 07:43:53 +0100
From: Andrew Jones <drjones@redhat.com>
To: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [PATCH] hw/arm/virt: Remove virt machine state 'smp_cpus'
Message-ID: <20201216064353.2n4evhicybkkuf7z@kamzik.brq.redhat.com>
References: <20201215174815.51520-1-drjones@redhat.com>
 <cun8s9zorr3.fsf@zarquon.hh.sledj.net>
MIME-Version: 1.0
In-Reply-To: <cun8s9zorr3.fsf@zarquon.hh.sledj.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fangying1@huawei.com, peter.maydell@linaro.org, salil.mehta@huawei.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 15, 2020 at 06:20:48PM +0000, David Edmondson wrote:
> On Tuesday, 2020-12-15 at 18:48:15 +01, Andrew Jones wrote:
> 
> > virt machine's 'smp_cpus' and machine->smp.cpus must always have the
> > same value. And, anywhere we have virt machine state we have machine
> > state. So let's remove the redundancy. Also, to make it easier to see
> > that machine->smp is the true source for "smp_cpus" and "max_cpus",
> > avoid passing them in function parameters, preferring instead to get
> > them from the state.
> >
> > No functional change intended.
> >
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> 
> Minor question below...
> 
> Reviewed-by: David Edmondson <david.edmondson@oracle.com>

Thanks

> >  static void fdt_add_cpu_nodes(const VirtMachineState *vms)
> >  {
> > -    int cpu;
> > -    int addr_cells = 1;
> >      const MachineState *ms = MACHINE(vms);
> > +    int smp_cpus = ms->smp.cpus, cpu;
> 
> Is it house-style to have initialised and un-initialised local variables
> declared on the same line?
>

checkpatch.pl doesn't complain and a grep of qemu shows hundreds of other
examples. That said, I only see one other example in hw/arm/virt.c, so if
we'd rather avoid it, I'll repost.

Thanks,
drew



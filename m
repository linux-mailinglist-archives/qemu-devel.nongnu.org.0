Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98952C849F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:04:12 +0100 (CET)
Received: from localhost ([::1]:54342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjiqh-0007Vr-Qc
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:04:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kjiUX-0006ub-Or
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:41:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kjiUT-0006uv-L7
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:41:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606740070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HUcwUhrDdeSOsVsarC8vEXRRrpz0G92tcDvD8NLxk+M=;
 b=EulCk5eb3k3sD75qnfby0KrndZ0CN64l1Rj+UB3tcgTBcz0a8K824rA0Mgc6w+0ZU6LfBi
 ZNCpBkg+w+AuLdwz40JHw4roXRi7JlQOMf+RNpYUBCmQisDIUocV8aHxbahU0EQGvWsqzu
 lpZVBdF36Y/p2ZMzz2G4ctha2hbgO1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-gnNkj7cyOB2FtYrGT9thkg-1; Mon, 30 Nov 2020 07:41:08 -0500
X-MC-Unique: gnNkj7cyOB2FtYrGT9thkg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CC5F8030C0
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 12:41:07 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38C6960C4D;
 Mon, 30 Nov 2020 12:41:04 +0000 (UTC)
Date: Mon, 30 Nov 2020 13:41:02 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 26/36] remove preconfig state
Message-ID: <20201130134102.07e58393@redhat.com>
In-Reply-To: <638fe67e-a6fb-b8c9-621e-4a3daf2129ae@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
 <20201123141435.2726558-27-pbonzini@redhat.com>
 <20201126195551.7b761db9@redhat.com>
 <f356049d-36e1-9b63-b50d-0a9ca2d1cb96@redhat.com>
 <20201127115033.187f20ee@redhat.com>
 <638fe67e-a6fb-b8c9-621e-4a3daf2129ae@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Nov 2020 12:50:39 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 27/11/20 11:50, Igor Mammedov wrote:
> > it works in context of this series since
> > 
> >    +    qemu_init_board();
> >    +    qemu_create_cli_devices();
> >    +    qemu_machine_creation_done();
> > 
> > are called within the same command qmp_x_exit_preconfig,
> > if preconfig is enabled we happen to call qmp_set_numa_node()
> > and if (qdev_hotplug) {error} work as expected, since qemu_init_board()
> > hasn't been called yet.
> > 
> > but I'm thinking about what happens beyond this series, when we start
> > splitting qmp_x_exit_preconfig() after this series on separate stages.  
> 
> Ok, so that's the source of confusion.  I don't think anymore that 
> x-exit-preconfig should be split in separate stages; I'm not looking 
> anymore at being able to do device-add from "qemu-system-x86_64 
> -preconfig".  Instead, I'm looking at having a completely separate 
> executable for QMP-only machine creation, which would not use vl.c 
> command line parsing at all.
> 
> For this reason I've left MachinePhase to a separate series, which I 
> still plan for 6.0.  But I will add it here instead.
Assuming that qmp_x_exit_preconfig() won't be split:

 Reviewed-by: Igor Mammedov <imammedo@redhat.com>


> FWIW I intend to have four parts: 1) this 2) QemuOpts->keyval switch for 
> -object/-M/-accel 3) making Machine's memdev property a 
> link<memory-backend> 4) making -smp/-boot/-m sugar for non-scalar 
> properties of Machine.  I'll definitely need your review on part 3 too!

I can review #3, #4 and your ram_size cleanup, which I'm somewhat familiar with.

> 
> Thanks,
> 
> Paolo
> 
> > By using qdev_hotplug here, we practically loose dependency tracking
> > on qemu_init_board() not being yet called. And if later we forget that,
> > then it would allow to call qmp_set_numa_node() after qemu_init_board()
> > but before qemu_machine_creation_done()
> > 
> > So for this intermediate stage, instead of abusing qdev_hotplug adding
> > a temporary is_board_created might be used. And when we introduce
> > new phases you've described below, is_board_created could be replaced
> > with appropriate phase check.  
> 



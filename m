Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AADD41364E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 17:37:32 +0200 (CEST)
Received: from localhost ([::1]:50554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mShpr-0004IU-9D
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 11:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mShnL-0001yC-MY
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 11:34:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mShnK-0003ar-1j
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 11:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632238493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rBs4gfdd2DrxSPEKcZAccO5Dh4lDmeyTeYlqeiOzvMU=;
 b=dYuKTkhadtIssSRaiLb/x/0BCLsK6vTZZjtGIatwhghnBmPuKQ6klgcTSL0v12VE4DcQqW
 4pB083R9bmeg/CJ4pS3ygxqC8wS/POPWn5fH28xTgAo7swcywVEt0Jl4hmcW0qF0Z2aC7S
 nasdj9yRAGJIpghg0dxCd089MiqNL3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-xoA7OjyiNRmEAEVd2Zu2Fg-1; Tue, 21 Sep 2021 11:34:52 -0400
X-MC-Unique: xoA7OjyiNRmEAEVd2Zu2Fg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04242BAF81;
 Tue, 21 Sep 2021 15:34:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F0AF100EBD0;
 Tue, 21 Sep 2021 15:34:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D9AC0180098D; Tue, 21 Sep 2021 17:34:48 +0200 (CEST)
Date: Tue, 21 Sep 2021 17:34:48 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Jose R. Ziviani" <jziviani@suse.de>
Subject: Re: [PATCH 1/2] meson: introduce modules_arch
Message-ID: <20210921153448.hagpsj3ygvxefask@sirius.home.kraxel.org>
References: <20210917012904.26544-1-jziviani@suse.de>
 <20210917012904.26544-2-jziviani@suse.de>
 <20210917071404.efhv3tlnad2ezz3e@sirius.home.kraxel.org>
 <YUSS0Jp+GBwNwYg3@pizza>
 <20210920051532.tzanl2asdqzuxlzn@sirius.home.kraxel.org>
 <YUiGcjBviIqPIyJB@pizza>
 <20210921052542.h4ehwc3ovt2wo2en@sirius.home.kraxel.org>
 <YUnfiJyiEMjMcksQ@pizza>
MIME-Version: 1.0
In-Reply-To: <YUnfiJyiEMjMcksQ@pizza>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 21, 2021 at 10:35:04AM -0300, Jose R. Ziviani wrote:
> Hello!!
> 
> On Tue, Sep 21, 2021 at 07:25:42AM +0200, Gerd Hoffmann wrote:
> >   Hi,
> > 
> > > But, in anyway, I'll still need to store the target architecture that
> > > can use such core module, like I did here in this patch. Otherwise,
> > > if I compile different targets at the same time, I'll end up with the
> > > same problem of targets trying to load wrong modules.
> > 
> > That all works just fine today.  If you have target-specific modules
> > (i.e. source files added to specific_ss instead of softmmu_ss when
> > compiling into core qemu) you only need to add those to the
> > target_modules[] (instead of modules[]) and you are set.
> > 
> > In-tree example: qtest accelerator.
> 
> Exactly, but what it doesn't seem to work (or I'm not understanding it
> well) is: how the target will know whether it can or cannot load a
> module.

Well, for target-specific modules that is easy:  You get one module per
target, and each target loads the matching module only.

> For example, suppose I build target-list=s390x-softmmu,x86_64-softmmu.
> Both targets will be linked to the same modinfo.c object, which will
> have a 'hw-display-virtio-gpu-pci' entry (it wouldn't if I build only
> s390x-softmmu). When I execute ./qemu-system-s390x, it will try to
> load hw-display-virtio-gpu-pci and will throw the errors I mentioned
> earlier.

Yes.  That isn't a target-specific module.  It will load into any target
which has pci support.  You can add aarch64-softmmu to the list above,
and then notice that both aarch64-softmmu and x86_64-softmmu can load
the very same hw-display-virtio-gpu-pci module.

> If, for example, I add that module_need(PCI_BUS), we will continue
> not knowing whether the target in execution has the required bus
> (without injecting dependencies in module.c).

Yes, you'll need a 'module_provides(PCI_BUS)' somewhere in the pci
initialization code (likewise for the other features), so the module
code knows which features are present and can check that against the
list of 'module_needs(...)' of the module.

Trying to have kconfig export that information instead of adding
"module_needs()" + "module_provides()" annotations to the source
should work too.  Not sure which is easier.

With the kconfig approach you have all information needed at compile
time, so you can do compile-time filtering and build per-target modinfo
lists (paolo's idea) instead of using a single list with
runtime-filtering (which is what we have now).

take care,
  Gerd



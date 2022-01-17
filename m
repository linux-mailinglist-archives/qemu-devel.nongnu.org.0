Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 295D94902CD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 08:13:06 +0100 (CET)
Received: from localhost ([::1]:41220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9MCP-0002Z5-2u
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 02:13:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jarkko@kernel.org>) id 1n9LyT-0006at-27
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 01:58:41 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:40304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jarkko@kernel.org>) id 1n9LyF-0005hi-99
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 01:58:40 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5EAC9B80DEF;
 Mon, 17 Jan 2022 06:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8792AC36AE3;
 Mon, 17 Jan 2022 06:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642402700;
 bh=CIdMFP/wxHSUrB+5c2DLxDopAZ7ik6qzqInWfiFDhRw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PzMWkm684QyvEfJHoZcx4uKnk4ZN3YV41i/VzaEHB7W/zNo2zEx3w2R3Oupu0iH9A
 VPos7LTgHULRxYgzjEr+psCvQABwrW0nbnH21cs39augbngA3dU16LJyZI7suyoZvG
 tUya9ZKqoLQieFYF+aeT3uKRgeKlSVfeGW9MofYe9nqMbVRb7mhtpA9M7q70fQ1bFi
 SUWejBcjJ+4c8bUj8oENNjD9J40wzmxBVCpFRV32j3FM1PH4vMCK3RdP1B1GeyEyB6
 H5RC037U0D6FnbQIx+a6lC1vvjXv1h2wVisyvSERCZti+cJhoCvP5lIeKst6yGLHMc
 O5FY/tiX4oSfQ==
Date: Mon, 17 Jan 2022 08:58:05 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: unable to execute QEMU command 'qom-get': Property
 'sgx-epc.unavailable-features' not found
Message-ID: <YeUTfZd4ppreJPlL@iki.fi>
References: <20211125124722.GA25401@yangzhon-Virtual>
 <20211130121536.GA32686@yangzhon-Virtual> <YeTaOVpWeGLa2xzb@iki.fi>
 <20220117060900.GA20805@yangzhon-Virtual>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220117060900.GA20805@yangzhon-Virtual>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=jarkko@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 linux-sgx@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 17, 2022 at 02:09:00PM +0800, Yang Zhong wrote:
> On Mon, Jan 17, 2022 at 04:53:45AM +0200, Jarkko Sakkinen wrote:
> > On Tue, Nov 30, 2021 at 08:15:36PM +0800, Yang Zhong wrote:
> > > On Thu, Nov 25, 2021 at 08:47:22PM +0800, Yang Zhong wrote:
> > > > Hello Paolo,
> > > > 
> > > > Our customer used the Libvirt XML to start a SGX VM, but failed.
> > > > 
> > > > libvirt.libvirtError: internal error: unable to execute QEMU command 'qom-get': Property 'sgx-epc.unavailable-features' not found
> > > > 
> > > > The XML file,
> > > > <qemu:commandline>
> > > >     <qemu:arg value="-cpu"/>
> > > >     <qemu:arg value="host,+sgx,+sgx-debug,+sgx-exinfo,+sgx-kss,+sgx-mode64,+sgx-provisionkey,+sgx-tokenkey,+sgx1,+sgx2,+sgxlc"/>
> > > >     <qemu:arg value="-object"/>
> > > >     <qemu:arg value="memory-backend-epc,id=mem1,size=16M,prealloc=on"/>
> > > >     <qemu:arg value="-M"/>
> > > >     <qemu:arg value="sgx-epc.0.memdev=mem1"/>
> > > >   </qemu:commandline>
> > > > 
> > > > The new compound property command should be located in /machine path,
> > > > which are different with old command '-sgx-epc id=epc1,memdev=mem1'.
> > > > 
> > > > I also tried this from Qemu monitor tool, 
> > > > (qemu) qom-list /machine
> > > > type (string)
> > > > kernel (string)
> > > > ......
> > > > sgx-epc (SgxEPC)
> > > > ......
> > > > sgx-epc[0] (child<memory-region>)
> > > > ......
> > > > 
> > > > We can find sgx-epc from /machine list.
> > > > 
> > > 
> > >   This issue is clear now, which is caused by Libvirt to get the CPU's unavailable-features by below command:
> > >   {"execute":"qom-get","arguments":{"path":"/machine/unattached/device[0]","property":"unavailable-features"}
> > > 
> > >   but in SGX vm, since the sgx is initialized before VCPU because sgx need set the virtual EPC info in the cpuid.  
> > > 
> > >   So the /machine/unattached/device[0] is occupied by sgx, which fail to get the unvailable-features from
> > >   /machine/unattached/device[0].
> > > 
> > > 
> > >   We need fix this issue, but this can be done in Qemu or Libvirt side.
> > > 
> > >   1) Libvirt side
> > >      If the libvirt support SGX EPCs, libvirt can use /machine/unattached/device[n] to check "unavailable-features".
> > >      n is the next number of sgx's unattached_count.
> > > 
> > >   2) Qemu side
> > >     
> > >      One temp patch to create one /sgx in the /machine in the device_set_realized() 
> > > diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> > > index 84f3019440..4154eef0d8 100644
> > > --- a/hw/core/qdev.c
> > > +++ b/hw/core/qdev.c
> > > @@ -497,7 +497,7 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
> > >      NamedClockList *ncl;
> > >      Error *local_err = NULL;
> > >      bool unattached_parent = false;
> > > -    static int unattached_count;
> > > +    static int unattached_count, sgx_count;
> > > 
> > >      if (dev->hotplugged && !dc->hotpluggable) {
> > >          error_setg(errp, QERR_DEVICE_NO_HOTPLUG, object_get_typename(obj));
> > > @@ -509,7 +509,15 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
> > >              goto fail;
> > >          }
> > > 
> > > -        if (!obj->parent) {
> > > +        if (!obj->parent && !strcmp(object_get_typename(obj), "sgx-epc")) {
> > > +            gchar *name = g_strdup_printf("device[%d]", sgx_count++);
> > > +
> > > +            object_property_add_child(container_get(qdev_get_machine(),
> > > +                                                    "/sgx"),
> > > +                                      name, obj);
> > > +            unattached_parent = true;
> > > +            g_free(name);
> > > +        } else if (!obj->parent) {
> > >              gchar *name = g_strdup_printf("device[%d]", unattached_count++);
> > > 
> > >              object_property_add_child(container_get(qdev_get_machine()
> > >    
> > >     This patch can make sure vcpu is still /machine/unattached/device[0].
> > > 
> > > 
> > >     Which solution is best?  thanks!
> > 
> > Has either of the fixes reached yet reached upstream or not?
> 
> 
>   Jarkko, I sent out one patch to fix this issue last week,
>   https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg02502.html
> 
>   Daniel regarded this fix is special code for SGX in the generic object code.
>   So, this fix can be done in Libvirt side. Did you face this issue? or you can
>   use this patch as TEMP fix. thanks!

Great, thank you! You can add my tested-by to the patch.

>   Yang  

BR, Jarkko


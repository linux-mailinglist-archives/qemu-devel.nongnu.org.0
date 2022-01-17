Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B78490061
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 03:55:04 +0100 (CET)
Received: from localhost ([::1]:57950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9IAg-00084a-NZ
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 21:55:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jarkko@kernel.org>) id 1n9I9n-0007OJ-A5
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 21:54:07 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:37964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jarkko@kernel.org>) id 1n9I9k-0006Ag-R4
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 21:54:06 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3D3DFB80CBC;
 Mon, 17 Jan 2022 02:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A129C36AE9;
 Mon, 17 Jan 2022 02:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642388040;
 bh=KFx+a5BYMMi2f+IK88CebpOMSE3REIsFxRXjxNpUz28=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PumacI+zRxX+OE6k7LMEN9GskZl0C0usGSqq37e2YuyJ/y2E8me2ELRdcTc04+1wT
 NEY3tG8HdlVMwi/OQBVqT5Ne4THGTooboRw/HGq6u8Y6tQIqOjxdMcs8DpGwNNvrGd
 ctY3K6Vt0J+iRXrYw8LfL/7XdQKmgogLnjy5MjVsCLmP/VPevwho3ggwhSvgBJzJL6
 4cvioOOzaRP6bG5JtpJFmQ2SBFX2GN+u1fV5ikyAiJKI60gxHsjEWd5C61cV99KMcE
 ZmeNzOZCAW3DT4DgRPYiA3iDQJ8sDZyqI2LlNNlR0n7N+pHr6v4LGxvh5rYC9dgzoO
 yfCosbmn4VuRQ==
Date: Mon, 17 Jan 2022 04:53:45 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: unable to execute QEMU command 'qom-get': Property
 'sgx-epc.unavailable-features' not found
Message-ID: <YeTaOVpWeGLa2xzb@iki.fi>
References: <20211125124722.GA25401@yangzhon-Virtual>
 <20211130121536.GA32686@yangzhon-Virtual>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211130121536.GA32686@yangzhon-Virtual>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=jarkko@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

On Tue, Nov 30, 2021 at 08:15:36PM +0800, Yang Zhong wrote:
> On Thu, Nov 25, 2021 at 08:47:22PM +0800, Yang Zhong wrote:
> > Hello Paolo,
> > 
> > Our customer used the Libvirt XML to start a SGX VM, but failed.
> > 
> > libvirt.libvirtError: internal error: unable to execute QEMU command 'qom-get': Property 'sgx-epc.unavailable-features' not found
> > 
> > The XML file,
> > <qemu:commandline>
> >     <qemu:arg value="-cpu"/>
> >     <qemu:arg value="host,+sgx,+sgx-debug,+sgx-exinfo,+sgx-kss,+sgx-mode64,+sgx-provisionkey,+sgx-tokenkey,+sgx1,+sgx2,+sgxlc"/>
> >     <qemu:arg value="-object"/>
> >     <qemu:arg value="memory-backend-epc,id=mem1,size=16M,prealloc=on"/>
> >     <qemu:arg value="-M"/>
> >     <qemu:arg value="sgx-epc.0.memdev=mem1"/>
> >   </qemu:commandline>
> > 
> > The new compound property command should be located in /machine path,
> > which are different with old command '-sgx-epc id=epc1,memdev=mem1'.
> > 
> > I also tried this from Qemu monitor tool, 
> > (qemu) qom-list /machine
> > type (string)
> > kernel (string)
> > ......
> > sgx-epc (SgxEPC)
> > ......
> > sgx-epc[0] (child<memory-region>)
> > ......
> > 
> > We can find sgx-epc from /machine list.
> > 
> 
>   This issue is clear now, which is caused by Libvirt to get the CPU's unavailable-features by below command:
>   {"execute":"qom-get","arguments":{"path":"/machine/unattached/device[0]","property":"unavailable-features"}
> 
>   but in SGX vm, since the sgx is initialized before VCPU because sgx need set the virtual EPC info in the cpuid.  
> 
>   So the /machine/unattached/device[0] is occupied by sgx, which fail to get the unvailable-features from
>   /machine/unattached/device[0].
> 
> 
>   We need fix this issue, but this can be done in Qemu or Libvirt side.
> 
>   1) Libvirt side
>      If the libvirt support SGX EPCs, libvirt can use /machine/unattached/device[n] to check "unavailable-features".
>      n is the next number of sgx's unattached_count.
> 
>   2) Qemu side
>     
>      One temp patch to create one /sgx in the /machine in the device_set_realized() 
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 84f3019440..4154eef0d8 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -497,7 +497,7 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
>      NamedClockList *ncl;
>      Error *local_err = NULL;
>      bool unattached_parent = false;
> -    static int unattached_count;
> +    static int unattached_count, sgx_count;
> 
>      if (dev->hotplugged && !dc->hotpluggable) {
>          error_setg(errp, QERR_DEVICE_NO_HOTPLUG, object_get_typename(obj));
> @@ -509,7 +509,15 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
>              goto fail;
>          }
> 
> -        if (!obj->parent) {
> +        if (!obj->parent && !strcmp(object_get_typename(obj), "sgx-epc")) {
> +            gchar *name = g_strdup_printf("device[%d]", sgx_count++);
> +
> +            object_property_add_child(container_get(qdev_get_machine(),
> +                                                    "/sgx"),
> +                                      name, obj);
> +            unattached_parent = true;
> +            g_free(name);
> +        } else if (!obj->parent) {
>              gchar *name = g_strdup_printf("device[%d]", unattached_count++);
> 
>              object_property_add_child(container_get(qdev_get_machine()
>    
>     This patch can make sure vcpu is still /machine/unattached/device[0].
> 
> 
>     Which solution is best?  thanks!

Has either of the fixes reached yet reached upstream or not?

>     Yang

BR, Jarkko


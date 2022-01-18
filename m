Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0D04915F7
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 03:32:32 +0100 (CET)
Received: from localhost ([::1]:54832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9eIR-0004qY-0S
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 21:32:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n9eGn-00041T-LB
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 21:30:49 -0500
Received: from mga09.intel.com ([134.134.136.24]:1127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n9eGl-00058R-3r
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 21:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642473047; x=1674009047;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5eLdad3S1vdQkGSJ7/2dKqAr5TdzYhYyNViEe7h+WMc=;
 b=G28No5+j4h7/mhHMVpKCS/+9L01r4R47ttB/4CFOIrBjse70yaTSb3ti
 H3fvDNSmPm4yTnUV9rD0VzvzH/y8XaHM44+NPSxa/QcafQfCDuK7DTC5h
 SH73pWBFG9yT6tsX0VL3dqMUBYZeLYTw/qsdmLDge6IVrXu20h2mDyCW5
 PIx0Au25EMjpQYeXlX27RdXNslooamukxZc/SSTQUlFnBV25uu6neXaLW
 jy6EUCBZwAt4J638VtOGflHxxwz56amvesJbltnjS8H0jvSiuVLP7+6gf
 dSDqrB8UIWnCuuAbhahvLX96LDIdpb3uBgHDTpJZqS5ZfK5cIgW+GO6aQ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="244519077"
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="244519077"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 18:30:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="625360871"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 17 Jan 2022 18:30:40 -0800
Date: Tue, 18 Jan 2022 10:15:24 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/2] hw/i386/x86: Attach CPUs to machine
Message-ID: <20220118021524.GA22453@yangzhon-Virtual>
References: <20220116235331.103977-1-f4bug@amsat.org>
 <20220116235331.103977-2-f4bug@amsat.org>
 <YeVzvkcTLIJEvgLi@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YeVzvkcTLIJEvgLi@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.24; envelope-from=yang.zhong@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, yang.zhong@intel.com,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 17, 2022 at 01:48:46PM +0000, Daniel P. Berrangé wrote:
> On Mon, Jan 17, 2022 at 12:53:30AM +0100, Philippe Mathieu-Daudé via wrote:
> > Avoid having CPUs objects dangling as unattached QOM ones,
> > directly attach them to the machine.
> 
> Lets be more explicit here
> 
> [quote]
>   Previously CPUs were exposed in the QOM tree at a path
> 
>     /machine/unattached/device[nn]
> 
>   where the 'nn' of the first CPU is usually zero, but can
>   vary depending on what devices were already created.
> 
>   With this change the CPUs are now at
> 
>     /machine/cpu[nn]
> 
>   where the 'nn' of the first CPU is always zero
> [/quote]
> 
> to  /machine/unattached/device[0->$SMP-COUNT]
> 
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > ---
> >  hw/i386/x86.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> > index b84840a1bb9..50bf249c700 100644
> > --- a/hw/i386/x86.c
> > +++ b/hw/i386/x86.c
> > @@ -108,6 +108,7 @@ void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
> >  {
> >      Object *cpu = object_new(MACHINE(x86ms)->cpu_type);
> >  
> > +    object_property_add_child(OBJECT(x86ms), "cpu[*]", OBJECT(cpu));
> >      if (!object_property_set_uint(cpu, "apic-id", apic_id, errp)) {
> >          goto out;
> >      }
> > -- 
> > 2.34.1
> > 
> > 


  Thanks Philippe, if we change /machine/unattached/device[nn] to /machine/cpu[nn],
  the related changes should also be done in the Libvirt side, which still check
  /machine/unattached/device[0] to get unvailable-features. thanks!

  Yang

> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


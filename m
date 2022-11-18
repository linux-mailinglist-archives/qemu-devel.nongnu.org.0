Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B797462F0E5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:19:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxVv-0000IS-S8; Fri, 18 Nov 2022 04:18:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ovxVt-0000Ez-4u
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:18:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ovxVr-0005pi-GZ
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:18:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668763098;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=txVeWzE/3kafSIVGzPl1thxVKzW30XbYYB8gzXj8LiY=;
 b=YCYczBspKeF0Yp2bvYqQmWK78WaOEaCFFh3qhdtVAIPtP6x0wY+30yCbVp1+WsS0PW5gA1
 5GGQ+hzSJlqldBA2Jf0RyDCv6oTCrIBLRc24jVS88bWVDFMH+fqGT5KUdzXPXVLIeJ7F6J
 KuD/YeoMiDvPiBddbo6hSF+4n51QnTc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-7kMahzE3OLOSs6rbAhFcOA-1; Fri, 18 Nov 2022 04:18:14 -0500
X-MC-Unique: 7kMahzE3OLOSs6rbAhFcOA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45BF82932489;
 Fri, 18 Nov 2022 09:18:14 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 024A5140EBF3;
 Fri, 18 Nov 2022 09:18:12 +0000 (UTC)
Date: Fri, 18 Nov 2022 09:18:08 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v2] pc: q35: Bump max_cpus to 1024
Message-ID: <Y3dN0GDIbkvSAfxz@redhat.com>
References: <166876173513.24238.8968021290016401421.stgit@tumbleweed.Wayrath>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <166876173513.24238.8968021290016401421.stgit@tumbleweed.Wayrath>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Nov 18, 2022 at 09:55:35AM +0100, Dario Faggioli wrote:
> Keep the old limit of 288 for machine versions 7.2 and earlier.
> 
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> ---
> Changes from v1:
> - fix actually keeping the old max value for the 7.2 machine type,
>   which was the original goal, but was done wrongly
> 
> ---
> This is related to:
> 
> https://lore.kernel.org/qemu-devel/c705d0d8d6ed1a520b1ff92cb2f83fef19522d30.camel@suse.com/
> 
> With this applied to QEMU, I've been able to start a VM with as high as
> 980 vCPUs (even if I was on an host with 384 pCPUs, so everything was
> super slow!). After that, I started to see messages like this:
> 
> "SMBIOS 2.1 table length 66822 exceeds 65535"

I'm suprised you got as high as 980 vCPUs. In testing real world
configs in RHEL, we hit problems in the early 700 vCPU level, as
such large vCPU counts are also going to have very large RAM sizes
and likely NUMA topology too, which IIUC expand SMBIOS usage.

> Basing on the discussion happening in that thread, I'm going straight
> to 1024, as it seems to me that it's going to be working well soon
> (especially considering that this is meant for next release, not for
> 7.2)
>
> Thanks and Regards
> ---
>  hw/i386/pc_q35.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index a496bd6e74..54804337e9 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -367,7 +367,7 @@ static void pc_q35_machine_options(MachineClass *m)
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
> -    m->max_cpus = 288;
> +    m->max_cpus = 1024;
>  }
>  
>  static void pc_q35_7_2_machine_options(MachineClass *m)
> @@ -375,6 +375,7 @@ static void pc_q35_7_2_machine_options(MachineClass *m)
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_q35_machine_options(m);
>      m->alias = "q35";
> +    m->max_cpus = 288;
>      pcmc->default_cpu_version = 1;
>  }
>  
> 
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



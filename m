Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F1A4D5151
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 19:41:37 +0100 (CET)
Received: from localhost ([::1]:41384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSNjF-0000mC-2P
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 13:41:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nSNdf-0004bj-So
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 13:35:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nSNdb-0007BI-Ew
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 13:35:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646937345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NoE7q/KEY6knvo8uqePPt7G12URvAvq8pwodlM6wCVc=;
 b=PObBRv6+jVTqJs8xhROJYmraaI5eg/2IAzS5WLnJ8AtXlRbFMwuSKjHVpbOc873XBGxdt6
 qGuHfinL/4Pea0kIa0PhIApvwanNflj6MjJvAV04GKtmokzBVgAmN7JTZeX60YNNwSeKaI
 5VRpIcEDn5Q8f5XcXeOgUlFZ9fSn4aM=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-vFuHGmncOV2x9I1Sci80sw-1; Thu, 10 Mar 2022 13:35:44 -0500
X-MC-Unique: vFuHGmncOV2x9I1Sci80sw-1
Received: by mail-il1-f198.google.com with SMTP id
 m17-20020a923f11000000b002c10e8f4c44so3810830ila.1
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 10:35:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=NoE7q/KEY6knvo8uqePPt7G12URvAvq8pwodlM6wCVc=;
 b=kL5IlaD04gq4yKszqWrIedO4RQqYQCRbMpdHmr3+LKxeDlHZWyLMMZmGJfeXq0oSHw
 tPdtJVMk/ezxsVOX8olTEiHEeBOE1uJ0TSoIWllIzjRTa94rwX63wUOgMBtH6Tx+w44b
 pnRlQCrNXYfaYLba/rIGzbnft+I1i3PsLMp5/tu3UIvG4MHCat1QuKOJLVK+HF+Nxnj6
 6yq+ulH8NvPA5dfO1AqUim4whJv/rsmJ5SxNyFyzWFO0Mv7GpFJgWJK1qBgZpsUUwx9A
 ufkZalsdyjSYRVr2DfBk6BSKrnE9Cerkp6vHEmHVlL0qkJ3fKqg8h8QVGOTZ2hanLYN6
 GzIw==
X-Gm-Message-State: AOAM533nQjqIok42JJmKzKzaXbdumYBeHUSOVHRKc97mzTL1jYTKMGOd
 O82v5KgJAZVo/iRe6ZO9Ncx0gQwQlVnt8kvRXVmo0sU6cAb5lcTkCKYRwYCHl60VJ6SIOj5YKJ2
 Sdc8zv3/kD/TbleQ=
X-Received: by 2002:a5d:83d7:0:b0:641:6b78:30de with SMTP id
 u23-20020a5d83d7000000b006416b7830demr4853677ior.204.1646937343909; 
 Thu, 10 Mar 2022 10:35:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjxCrorODDpci/CIA8UQ0asqLbuV0e4UKHBcOz0+aX2aNkDf0JqhRuYFkCSy+Lqjh0pWHE3A==
X-Received: by 2002:a5d:83d7:0:b0:641:6b78:30de with SMTP id
 u23-20020a5d83d7000000b006416b7830demr4853648ior.204.1646937343493; 
 Thu, 10 Mar 2022 10:35:43 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 b25-20020a5d8059000000b00644ddaad77asm2964168ior.29.2022.03.10.10.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 10:35:43 -0800 (PST)
Date: Thu, 10 Mar 2022 11:35:41 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V7 19/29] vfio-pci: cpr part 1 (fd and dma)
Message-ID: <20220310113541.47edeb9b.alex.williamson@redhat.com>
In-Reply-To: <a8de61de-37b9-b88a-ac8c-a94d51a0dc92@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-20-git-send-email-steven.sistare@oracle.com>
 <20220307151610.0d8b2269.alex.williamson@redhat.com>
 <a8de61de-37b9-b88a-ac8c-a94d51a0dc92@oracle.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Mar 2022 10:00:29 -0500
Steven Sistare <steven.sistare@oracle.com> wrote:

> On 3/7/2022 5:16 PM, Alex Williamson wrote:
> > On Wed, 22 Dec 2021 11:05:24 -0800
> > Steve Sistare <steven.sistare@oracle.com> wrote:
> >> @@ -1878,6 +1908,18 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
> >>  {
> >>      int iommu_type, ret;
> >>  
> >> +    /*
> >> +     * If container is reused, just set its type and skip the ioctls, as the
> >> +     * container and group are already configured in the kernel.
> >> +     * VFIO_TYPE1v2_IOMMU is the only type that supports reuse/cpr.
> >> +     * If you ever add new types or spapr cpr support, kind reader, please
> >> +     * also implement VFIO_GET_IOMMU.
> >> +     */  
> > 
> > VFIO_CHECK_EXTENSION should be able to tell us this, right?  Maybe the
> > problem is that vfio_iommu_type1_check_extension() should actually base
> > some of the details on the instantiated vfio_iommu, ex.
> > 
> > 	switch (arg) {
> > 	case VFIO_TYPE1_IOMMU:
> > 		return (iommu && iommu->v2) ? 0 : 1;
> > 	case VFIO_UNMAP_ALL:
> > 	case VFIO_UPDATE_VADDR:
> > 	case VFIO_TYPE1v2_IOMMU:
> > 		return (iommu && !iommu->v2) ? 0 : 1;
> > 	case VFIO_TYPE1_NESTING_IOMMU:
> > 		return (iommu && !iommu->nesting) ? 0 : 1;
> > 	...
> > 
> > We can't support v1 if we've already set a v2 container and vice versa.
> > There are probably some corner cases and compatibility to puzzle
> > through, but I wouldn't think we need a new ioctl to check this.  
> 
> That change makes sense, and may be worth while on its own merits, but does not
> solve the problem, which is that qemu will not be able to infer iommu_type in
> the future if new types are added.  Given:
>   * a new kernel supporting shiny new TYPE1v3
>   * old qemu starts and selects TYPE1v2 in vfio_get_iommu_type because it has no
>     knowledge of v3
>   * live update to qemu which supports v3, which will be listed first in vfio_get_iommu_type.
> 
> Then the new qemu has no way to infer iommu_type.  If it has code that makes 
> decisions based on iommu_type (eg, VFIO_SPAPR_TCE_v2_IOMMU in vfio_container_region_add,
> or vfio_ram_block_discard_disable, or ...), then new qemu cannot function correctly.
> 
> For that, VFIO_GET_IOMMU would be the cleanest solution, to be added the same time our
> hypothetical future developer adds TYPE1v3.  The current inability to ask the kernel
> "what are you" about a container feels like a bug to me.

Hmm, I don't think the kernel has an innate responsibility to remind
the user of a configuration that they've already made.  But I also
don't follow your TYPE1v3 example.  If we added such a type, I imagine
the switch would change to:

	switch (arg)
	case VFIO_TYPE1_IOMMU:
		return (iommu && (iommu->v2 || iommu->v3) ? 0 : 1;
	case VFIO_UNMAP_ALL:
	case VFIO_UPDATE_VADDR:
		return (iommu && !(iommu-v2 || iommu->v3) ? 0 : 1;
	case VFIO_TYPE1v2_IOMMU:
		return (iommu && !iommu-v2) ? 0 : 1;
	case VFIO_TYPE1v3_IOMMU:
		return (iommu && !iommu->v3) ? 0 : 1;
	...

How would that not allow exactly the scenario described, ie. new QEMU
can see that old QEMU left it a v2 IOMMU.

...
> >> +
> >> +bool vfio_is_cpr_capable(VFIOContainer *container, Error **errp)
> >> +{
> >> +    if (!ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UPDATE_VADDR) ||
> >> +        !ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UNMAP_ALL)) {
> >> +        error_setg(errp, "VFIO container does not support VFIO_UPDATE_VADDR "
> >> +                         "or VFIO_UNMAP_ALL");
> >> +        return false;
> >> +    } else {
> >> +        return true;
> >> +    }
> >> +}  
> > 
> > We could have minimally used this where we assumed a TYPE1v2 container.  
> 
> Are you referring to vfio_init_container (discussed above)?
> Are you suggesting that, if reused is true, we validate those extensions are
> present, before setting iommu_type = VFIO_TYPE1v2_IOMMU?

Yeah, though maybe it's not sufficiently precise to be worthwhile given
the current kernel behavior.

> >> +
> >> +/*
> >> + * Verify that all containers support CPR, and unmap all dma vaddr's.
> >> + */
> >> +int vfio_cpr_save(Error **errp)
> >> +{
> >> +    ERRP_GUARD();
> >> +    VFIOAddressSpace *space;
> >> +    VFIOContainer *container;
> >> +
> >> +    QLIST_FOREACH(space, &vfio_address_spaces, list) {
> >> +        QLIST_FOREACH(container, &space->containers, next) {
> >> +            if (!vfio_is_cpr_capable(container, errp)) {
> >> +                return -1;
> >> +            }
> >> +            if (vfio_dma_unmap_vaddr_all(container, errp)) {
> >> +                return -1;
> >> +            }
> >> +        }
> >> +    }  
> > 
> > Seems like we ought to validate all containers support CPR before we
> > start blasting vaddrs.  It looks like qmp_cpr_exec() simply returns if
> > this fails with no attempt to unwind!  Yikes!  Wouldn't we need to
> > replay the listeners to remap the vaddrs in case of an error?  
> 
> Already done.  I refactored that code into a separate patch to tease out some
> of the complexity:
>   vfio-pci: recover from unmap-all-vaddr failure

Sorry, didn't get to that one til after I'd sent comments here.

...
> >> diff --git a/include/migration/cpr.h b/include/migration/cpr.h
> >> index a4da24e..a4007cf 100644
> >> --- a/include/migration/cpr.h
> >> +++ b/include/migration/cpr.h
> >> @@ -25,4 +25,7 @@ int cpr_state_save(Error **errp);
> >>  int cpr_state_load(Error **errp);
> >>  void cpr_state_print(void);
> >>  
> >> +int cpr_vfio_save(Error **errp);
> >> +int cpr_vfio_load(Error **errp);
> >> +
> >>  #endif
> >> diff --git a/migration/cpr.c b/migration/cpr.c
> >> index 37eca66..cee82cf 100644
> >> --- a/migration/cpr.c
> >> +++ b/migration/cpr.c
> >> @@ -7,6 +7,7 @@
> >>  
> >>  #include "qemu/osdep.h"
> >>  #include "exec/memory.h"
> >> +#include "hw/vfio/vfio-common.h"
> >>  #include "io/channel-buffer.h"
> >>  #include "io/channel-file.h"
> >>  #include "migration.h"
> >> @@ -101,7 +102,9 @@ void qmp_cpr_exec(strList *args, Error **errp)
> >>          error_setg(errp, "cpr-exec requires cpr-save with restart mode");
> >>          return;
> >>      }
> >> -
> >> +    if (cpr_vfio_save(errp)) {
> >> +        return;
> >> +    }  
> > 
> > Why is vfio so unique that it needs separate handlers versus other
> > devices?  Thanks,  
> 
> In earlier patches these functions fiddled with more objects, but at this point
> they are simple enough to convert to pre_save and post_load vmstate handlers for
> the container and group objects.  However, we would still need to call special 
> functons for vfio from qmp_cpr_exec:
> 
>   * validate all containers support CPR before we start blasting vaddrs
>     However, I could validate all, in every call to pre_save for each container.
>     That would be less efficient, but fits the vmstate model.

Would it be a better option to mirror the migration blocker support, ie.
any device that doesn't support cpr registers a blocker and generic
code only needs to keep track of whether any blockers are registered.

>   * restore all vaddr's if qemu_save_device_state fails.
>     However, I could recover for all containers inside pre_save when one container fails.
>     Feels strange touching all objects in a function for one, but there is no real
>     downside.

I'm not as familiar as I should be with migration callbacks, thanks to
mostly not supporting it for vfio devices, but it seems strange to me
that there's no existing callback or notifier per device to propagate
save failure.  Do we not at least get some sort of resume callback in
that case?

As an alternative, maybe each container could register a vm change
handler that would trigger reloading vaddrs if we move to a running
state and a flag on the container indicates vaddrs were invalidated?
Thanks,

Alex



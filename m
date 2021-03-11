Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B46E336F12
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:43:59 +0100 (CET)
Received: from localhost ([::1]:38178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHrJ-00065o-IT
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:43:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKHoe-0003zz-SC
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:41:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKHoa-0005dn-Ax
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:41:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615455666;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Y5SoJT8iDhNIm/NRHvrr1gM4tOupNO9rJYa4LwpFZKM=;
 b=g5Ob3tjrAKlih0MKwpeIruMTgjB1XP5Li5N6z+45A6i1mN1Sw9daCLvRfi39zDBWMI8WMc
 FyDvL9L4iNwAkHAbIE0bE4ySrmRgxD3utO7V1UeCIhQSnvArnsV9//2HX64DsmchEHsja2
 OysCXfydRNJi7clceXbVHcf7Jo4qBAQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-dyd1bK2wMGWi4jAtHoC1rg-1; Thu, 11 Mar 2021 04:40:54 -0500
X-MC-Unique: dyd1bK2wMGWi4jAtHoC1rg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E04283DD25;
 Thu, 11 Mar 2021 09:40:52 +0000 (UTC)
Received: from redhat.com (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2355D69321;
 Thu, 11 Mar 2021 09:40:44 +0000 (UTC)
Date: Thu, 11 Mar 2021 09:40:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH v2 1/1] docs/devel: Add VFIO device migration documentation
Message-ID: <YEnlmqNuvIxAB9mc@redhat.com>
References: <20210310192009.53848-1-targupta@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210310192009.53848-1-targupta@nvidia.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kevin.tian@intel.com, cjia@nvidia.com, quintela@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org,
 Kirti Wankhede <kwankhede@nvidia.com>, dgilbert@redhat.com,
 lushenming@huawei.com, alex.williamson@redhat.com, dnigam@nvidia.com,
 yan.y.zhao@intel.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 12:50:09AM +0530, Tarun Gupta wrote:
> Document interfaces used for VFIO device migration. Added flow of state changes
> during live migration with VFIO device. Tested by building docs with the new
> vfio-migration.rst file.
> 
> v2:
> - Included the new vfio-migration.rst file in index.rst
> - Updated dirty page tracking section, also added details about
>   'pre-copy-dirty-page-tracking' opt-out option.
> - Incorporated comments around wording of doc.
> 
> Signed-off-by: Tarun Gupta <targupta@nvidia.com>
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> ---
>  MAINTAINERS                   |   1 +
>  docs/devel/index.rst          |   1 +
>  docs/devel/vfio-migration.rst | 135 ++++++++++++++++++++++++++++++++++
>  3 files changed, 137 insertions(+)
>  create mode 100644 docs/devel/vfio-migration.rst


> +Postcopy
> +========
> +
> +Postcopy migration is not supported for VFIO devices.

What is the problem here and is there any plan for how to address it ?

Postcopy is essentially the only migration mechanism that can reliably
complete, so it really should be considered the default approach to
migration for all mgmt apps wanting to do migration, except in special
cases.   IOW, if we want VFIO migration to be viable, we need postcopy
support.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



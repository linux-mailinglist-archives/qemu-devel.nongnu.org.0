Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5641340589
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 13:31:32 +0100 (CET)
Received: from localhost ([::1]:53180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMroJ-0005Vd-KC
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 08:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lMrlo-0004Ei-Pc
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 08:28:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lMrlm-0001en-V8
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 08:28:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616070533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BwUzCzt6ozOQyrquizJaaztrHWH8uy/zLKE5hpPHy7Y=;
 b=L9Un4DBUveOjrV7bIjFjXRTqnPFQFDU5IoF3Ml5wwDo2w6FU3lLx2ed5GfP8lkHWfGHYLk
 +KE1GCFCU36hs0QnhoFTAoaUiReoMBwmlOoHyw4Ad/P6HH09KQyZl8DDNdPhyxJuxl3GCT
 ZIM1CbSnadsw7EAmpThdPOelQjVxS8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-U02AsBj_OkKcVcC7Do4tUw-1; Thu, 18 Mar 2021 08:28:50 -0400
X-MC-Unique: U02AsBj_OkKcVcC7Do4tUw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4CF883DD21;
 Thu, 18 Mar 2021 12:28:48 +0000 (UTC)
Received: from gondolin (ovpn-115-53.ams2.redhat.com [10.36.115.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39E695D6A8;
 Thu, 18 Mar 2021 12:28:43 +0000 (UTC)
Date: Thu, 18 Mar 2021 13:28:40 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>
Subject: Re: [PATCH v2 1/1] docs/devel: Add VFIO device migration documentation
Message-ID: <20210318132840.22c8a6ef.cohuck@redhat.com>
In-Reply-To: <c01589ee-d007-77da-83d1-fb6096f6f144@nvidia.com>
References: <20210310192009.53848-1-targupta@nvidia.com>
 <20210315182258.586dbf23.cohuck@redhat.com>
 <c01589ee-d007-77da-83d1-fb6096f6f144@nvidia.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: kevin.tian@intel.com, cjia@nvidia.com, quintela@redhat.com,
 qemu-devel@nongnu.org, Kirti Wankhede <kwankhede@nvidia.com>,
 dgilbert@redhat.com, yan.y.zhao@intel.com, lushenming@huawei.com,
 alex.williamson@redhat.com, dnigam@nvidia.com, berrange@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Mar 2021 21:48:38 +0530
"Tarun Gupta (SW-GPU)" <targupta@nvidia.com> wrote:

> On 3/15/2021 10:52 PM, Cornelia Huck wrote:
> > 
> > On Thu, 11 Mar 2021 00:50:09 +0530
> > Tarun Gupta <targupta@nvidia.com> wrote:
> >   
> >> Document interfaces used for VFIO device migration. Added flow of state changes
> >> during live migration with VFIO device. Tested by building docs with the new
> >> vfio-migration.rst file.
> >>
> >> v2:
> >> - Included the new vfio-migration.rst file in index.rst
> >> - Updated dirty page tracking section, also added details about
> >>    'pre-copy-dirty-page-tracking' opt-out option.
> >> - Incorporated comments around wording of doc.
> >>
> >> Signed-off-by: Tarun Gupta <targupta@nvidia.com>
> >> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> >> ---
> >>   MAINTAINERS                   |   1 +
> >>   docs/devel/index.rst          |   1 +
> >>   docs/devel/vfio-migration.rst | 135 ++++++++++++++++++++++++++++++++++
> >>   3 files changed, 137 insertions(+)
> >>   create mode 100644 docs/devel/vfio-migration.rst
> >>  
> > 
> > (...)
> >   
> >> diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
> >> new file mode 100644
> >> index 0000000000..6196fb132c
> >> --- /dev/null
> >> +++ b/docs/devel/vfio-migration.rst
> >> @@ -0,0 +1,135 @@
> >> +=====================
> >> +VFIO device Migration
> >> +=====================  
> > 
> > Maybe add an introductory sentence or two describing the general
> > approach? I.e. we have a general framework, and specific support for
> > devices needs to be hooked up.  
> 
> Ummm, the below paragraph does describe the approach we're using for the 
> migration framework involving pre-copy and stop-and-copy phase.
> Can you help elaborate more on the general approach you'd like to have?

The document dives right in with how vfio devices are using an
iterative approach etc. A quick overview of the general setup (before
you are getting to the different phases) might be helpful, i.e. who
does what. Not sure what we expect a reader of this document to know
already.

> 
> >   
> >> +
> >> +VFIO devices use an iterative approach for migration because certain VFIO
> >> +devices (e.g. GPU) have large amount of data to be transfered. The iterative
> >> +pre-copy phase of migration allows for the guest to continue whilst the VFIO
> >> +device state is transferred to the destination, this helps to reduce the total
> >> +downtime of the VM. VFIO devices can choose to skip the pre-copy phase of
> >> +migration by returning pending_bytes as zero during the pre-copy phase.  
> > 
> > What about something like:
> > 
> > "Migration of VFIO devices consists of two phases: the optional
> > pre-copy phase, and the stop-and-copy phase. The pre-copy phase is
> > iterative and allows to accommodate VFIO devices that have a large
> > amount of data that needs to be transferred. The iterative pre-copy
> > phase..."
> >   
> 
> Thanks, this looks better. I'll update it in next version incorporating 
> the other comments too below.



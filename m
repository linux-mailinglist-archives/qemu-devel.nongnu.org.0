Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231B558A832
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:39:12 +0200 (CEST)
Received: from localhost ([::1]:37316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJsrO-0002pC-UW
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJsdo-00088J-KY
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:25:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJsdl-00066h-9W
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:25:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659687904;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=IYogsoNxZVzUKFX/TnSFhS5/WD2o+9j5hOiKkHnboZw=;
 b=DCRo/wmS4g3/ZuEhF/Y/fgq6jC/jzlCV0bjlNnkNTa6/QOO46/kN3Q0Q5F8uypjgIWS335
 DfoTf9mMEaly1Ai2YfsMLUIY/a67K64xGIy7tQZj809jFuUC4doKMSETdumykQcKXIiwoL
 i91+cq5f4654SJD8nRPaa+rTWC6YxTc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-jsf3lRrcNGi4HoS76at2kQ-1; Fri, 05 Aug 2022 04:25:02 -0400
X-MC-Unique: jsf3lRrcNGi4HoS76at2kQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 483C92812C34;
 Fri,  5 Aug 2022 08:25:01 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DBD32166B26;
 Fri,  5 Aug 2022 08:24:58 +0000 (UTC)
Date: Fri, 5 Aug 2022 09:24:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: "Zhang, Chen" <chen.zhang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@gmail.com" <stefanha@gmail.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH 0/1] Update vfio-user module to the latest
Message-ID: <YuzT2MA9Q4mAr4eQ@redhat.com>
References: <cover.1659403195.git.jag.raman@oracle.com>
 <MWHPR11MB00312737931679069FAAE7AB9B9D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <e8eab8e6-e6a5-af95-223f-e0ca91b4d833@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e8eab8e6-e6a5-af95-223f-e0ca91b4d833@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 05, 2022 at 09:21:07AM +0200, Thomas Huth wrote:
> On 02/08/2022 12.00, Zhang, Chen wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: Qemu-devel <qemu-devel-
> > > bounces+chen.zhang=intel.com@nongnu.org> On Behalf Of Jagannathan
> > > Raman
> > > Sent: Tuesday, August 2, 2022 9:24 AM
> > > To: qemu-devel@nongnu.org
> > > Cc: stefanha@gmail.com; berrange@redhat.com
> > > Subject: [PATCH 0/1] Update vfio-user module to the latest
> > > 
> > > Hi,
> > > 
> > > This patch updates the libvfio-user submodule to the latest.
> > 
> > Just a rough idea, why not depends on linux distribution for the libvfio-user.so?
> > It looks no libvfio-user packet in distribution's repo.
> > 
> > Hi Thomas/Daniel:
> > 
> > For the RFC QEMU user space eBPF support,
> > https://lore.kernel.org/all/20220617073630.535914-6-chen.zhang@intel.com/T/
> > Maybe introduce the libubpf.so as a subproject like libvfio-user.so is more appropriate?
> 
> Fair comment. I never noticed them before, but why do we have those
> submodules in the subprojects/ folder (libvduse, libvfio-user and
> libvhost-user)? ... I don't think it's the job of QEMU to ship libraries
> that a user might want to use for a certain feature, so could we please
> remove those submodules again? If someone wants to use this, they can
> compile the libraries on their own or help their favorite distribution to
> ship them as packages.

FWIW, I don't really agree with shipping libvfio-user.so as a submodule
either, but the consensus was that we have to do it because there's no
stable ABI committed to by libvfio-user maintainers yet.  My counterpoint
is that as long as QEMU ships libvfio-user as a submodule, there's no
incentive to create a stable ABI, leaving a chicken & egg scenario.

IOW personally I'd rather libvfio-user.so was put into the distros right
now, and have the pain ABI incompatible releases act as motivation for
the creation of a stable ABI.

A second factor is that as long as it is a submodule, there is little
pressure for the distros to actually package the library, which leaves
us in a place where someone will always object to removing the submodule
from QEMU because it doesn't exist in distro X.

So again my preference is to not add any library as a submodule. Lets
the distros handle dependancies like they always have.

If we do add something as a submodule for some reason, I'd like us to
say upfront that this is for a fixed time period (ie maximum of 3
releases aka 1 year) only after which we'll remove it no matter what.

We are where we are with libvfio-user.so, and I don't think that is
something to be used as justification for adding more libraries as
submodules. Rather we should set a timeframe to remove libvfio-user
submodule to put distros on notice.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



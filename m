Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997D236C109
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 10:35:26 +0200 (CEST)
Received: from localhost ([::1]:37638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbJBl-0000Es-OB
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 04:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lbJB1-0008HP-4S
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:34:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lbJAz-0005cb-FB
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:34:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619512476;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ws2ZrSJnUHcQL16Hz6Q7+8MBLuU3TvPAviQbgg/Ta88=;
 b=et2St3seglgvK6DjGt/C+NzrAUs9E35Vtk0H5TgA0ZNSdO3DAiCl7OvUcgOdDqrzGhhX9a
 qKa6gI94L//kk8V5tzbgrVxFm0VR4jkY3ZsqxuKuwAasvRpiWvGtQmP04jPA7d+EdT8ZHv
 WU0vRf5zXHFMio3sBuOiyCS2qYurbwg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-gCxWMpk2Ptu5GY4n0fi2xw-1; Tue, 27 Apr 2021 04:34:29 -0400
X-MC-Unique: gCxWMpk2Ptu5GY4n0fi2xw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E08A8501F8;
 Tue, 27 Apr 2021 08:34:27 +0000 (UTC)
Received: from redhat.com (ovpn-113-105.ams2.redhat.com [10.36.113.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E821B60CC9;
 Tue, 27 Apr 2021 08:34:21 +0000 (UTC)
Date: Tue, 27 Apr 2021 09:34:18 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Like Xu <like.xu@linux.intel.com>
Subject: Re: [PATCH v2] hw/i386: Expand the range of CPU topologies between
 smp and maxcpus
Message-ID: <YIfMisdsjKKGE055@redhat.com>
References: <2021042610084739495617@kingsoft.com> <YIbAYqpWBG5k8yp5@redhat.com>
 <378da49d-2d66-0d47-90cb-441a4e6f8ac7@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <378da49d-2d66-0d47-90cb-441a4e6f8ac7@linux.intel.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: ehabkost <ehabkost@redhat.com>, mst <mst@redhat.com>,
 "richard.henderson" <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "caodongli@kingsoft.com" <caodongli@kingsoft.com>,
 pbonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 27, 2021 at 10:13:01AM +0800, Like Xu wrote:
> On 2021/4/26 21:30, Daniel P. Berrangé wrote:
> > On Mon, Apr 26, 2021 at 10:08:52AM +0800, caodongli@kingsoft.com wrote:
> > > Change the criteria for the initial CPU topology and maxcpus, user can
> > > have more settings
> > 
> > Can you provide a better explanation of why this is needed. What
> > valid usage scenario is blocked by the current check ?
> > 
> > AFAICT, it partially reverts an intentional change done in several
> > years ago in :
> > 
> > 
> >    commit bc1fb850a31468ac4976f3895f01a6d981e06d0a
> >    Author: Igor Mammedov <imammedo@redhat.com>
> >    Date:   Thu Sep 13 13:06:01 2018 +0200
> > 
> >      vl.c deprecate incorrect CPUs topology
> >      -smp [cpus],sockets/cores/threads[,maxcpus] should describe topology
> >      so that total number of logical CPUs [sockets * cores * threads]
> >      would be equal to [maxcpus], however historically we didn't have
> >      such check in QEMU and it is possible to start VM with an invalid
> >      topology.
> >      Deprecate invalid options combination so we can make sure that
> >      the topology VM started with is always correct in the future.
> >      Users with an invalid sockets/cores/threads/maxcpus values should
> >      fix their CLI to make sure that
> >         [sockets * cores * threads] == [maxcpus]
> > 
> > 
> 
> Another helpful commit would be:
> 
> commit c4332cd1dcf2964c23893ab4c0bf8d774e42a3cf
> Author: Igor Mammedov <imammedo@redhat.com>
> Date:   Fri Sep 11 09:32:02 2020 -0400
> 
>     smp: drop support for deprecated (invalid topologies)
> 
>     it's was deprecated since 3.1
> 
>     Support for invalid topologies is removed, the user must ensure
>     that topologies described with -smp include all possible cpus,
>     i.e. (sockets * cores * threads) == maxcpus or QEMU will
>     exit with error.
> 
> 
> So is the following statement correct:
> 
> When we explicitly set the topology, we must ensure that the combination
> (sockets/dies/cores/threads/maxcpus) is always valid. If we need hot plug
> testing, we can only use something like "-smp 1,maxcpus = 4" since 3.1.

Yes, you must set maxcpus if you want ability to hotplug further
CPUs later.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



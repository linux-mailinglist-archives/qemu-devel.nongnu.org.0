Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDB74196F5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 17:00:27 +0200 (CEST)
Received: from localhost ([::1]:41724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUs7G-0004oq-4b
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 11:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mUs4x-0003HK-1B
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:58:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mUs4t-0000dm-Fo
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632754678;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V4DAvGkivDPFEcOxMgPH04F9DDnvcerDbRibi1qoUZs=;
 b=WbCdl+McZ1JUmaWXobo3m+Us5CsZls5r+uxSeT6RKkdPgwIRj0JeZLu441lnPrr28idD9o
 GksS1FDpWqRA6H3j74rP7V1W6sOfdyFN0nzpKxac5mhM327oJAEVWl9I2bZcqapJ8OGd4O
 +KjhDTBfD0dVFqpj0CKIGOHT4QhnVL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-KB95MBaJOie9gfJ-C-barw-1; Mon, 27 Sep 2021 10:57:52 -0400
X-MC-Unique: KB95MBaJOie9gfJ-C-barw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D637A100C661;
 Mon, 27 Sep 2021 14:57:51 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8D8360C7F;
 Mon, 27 Sep 2021 14:57:50 +0000 (UTC)
Date: Mon, 27 Sep 2021 15:57:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: gitlab-ci: amd64-opensuse-leap-container job failing
Message-ID: <YVHb7E0u+gYTjwWW@redhat.com>
References: <657cbef7-11ac-196c-01e2-aeb9744fe446@amsat.org>
 <YVGCStPffR/gss2f@redhat.com> <YVHLVT6xS6YjUxFN@redhat.com>
 <89b3ce1b-5eea-a3e2-8361-493a8a96d6a2@amsat.org>
MIME-Version: 1.0
In-Reply-To: <89b3ce1b-5eea-a3e2-8361-493a8a96d6a2@amsat.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, "Cho, Yu-Chen" <acho@suse.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 27, 2021 at 04:35:04PM +0200, Philippe Mathieu-Daudé wrote:
> On 9/27/21 15:47, Daniel P. Berrangé wrote:
> > On Mon, Sep 27, 2021 at 09:35:22AM +0100, Daniel P. Berrangé wrote:
> >> On Sun, Sep 26, 2021 at 07:23:56PM +0200, Philippe Mathieu-Daudé wrote:
> >>> Hi,
> >>>
> >>> FYI the OpenSUSE job is failing since few days, i.e.:
> >>> https://gitlab.com/qemu-project/qemu/-/jobs/1622345026
> >>>
> >>>   Retrieving repository 'Main Repository' metadata
> >>> [..........................................................error]
> >>>   Repository 'Main Repository' is invalid.
> >>>
> >>> [repo-oss|http://download.opensuse.org/distribution/leap/15.2/repo/oss/]
> >>> Valid metadata not found at specified URL
> >>>   History:
> >>>    - Download (curl) error for
> >>> 'http://download.opensuse.org/distribution/leap/15.2/repo/oss/repodata/repomd.xml':
> >>>   Error code: Curl error 56
> >>>   Error message: Recv failure: Connection reset by peer
> >>>    - Can't provide /repodata/repomd.xml
> >>>   Please check if the URIs defined for this repository are pointing to a
> >>> valid repository.
> >>>   Warning: Skipping repository 'Main Repository' because of the above error.
> >>>
> >>> I tried to run 'zypper ref' with:
> >>
> >> It isn't confined to only SuSE. In libvirt we've had similar problems
> >> with several other jobs, though are suse jobs are the worst affected.
> >>
> >> GitLab have finally acknowledged it is an general infra issue affecting
> >> many things:
> >>
> >>    https://status.gitlab.com/
> >>    https://gitlab.com/gitlab-com/gl-infra/production/-/issues/5590
> > 
> > Setting GitLab CI env var works around the problem temporarily:
> > 
> >  FF_NETWORK_PER_BUILD=true
> 
> Do you know if we need to recreate the pipeline?
> (It didn't work on already failing one, I'm going to test
> a freshly created one now).

You shoudln't need to re-create the pipeline, just retry the job.

If setting the variable in the web UI, make sure "Protect variable"
is *not* set. Only the "master" branch is protected by default
so other branches won't get protected variables set in their jobs.


> 
> > You can set it for all repos under a group eg
> > 
> >   https://gitlab.com/groups/qemu-project/-/settings/ci_cd
> > 
> > or per repo eg
> > 
> >   https://gitlab.com/berrange/libvirt/-/settings/ci_cd
> > 
> > 
> > Regards,
> > Daniel
> > 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



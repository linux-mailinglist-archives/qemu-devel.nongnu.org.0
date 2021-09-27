Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3544195EA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:05:56 +0200 (CEST)
Received: from localhost ([::1]:49516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUrGV-0007Zl-EQ
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mUqyS-0003UI-6j
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:47:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mUqyP-00052M-20
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632750431;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JliY7w+ultiJwV93JM8EXSBt/vfgwUqyXgl5vyxBIiE=;
 b=i2TVHbNE5pJlDtTq8vnivIq7XX1p2+umDNrEvP9fL9fSOFAzp7WFBgaKMxem2D+6NjqNHw
 yM1MW+37LIjTAxt88IbJzlg58FDKv0X3qjJq6IzgfZsHny7I3Hxe6tfrGvLjj/2XyJK/aC
 DdldwS7HjfIQefQFmAbzM+I1VpXe748=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-YyG_AvFFN5C73-8drtx1ew-1; Mon, 27 Sep 2021 09:47:06 -0400
X-MC-Unique: YyG_AvFFN5C73-8drtx1ew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 687F01023F4D;
 Mon, 27 Sep 2021 13:47:05 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7112660871;
 Mon, 27 Sep 2021 13:47:04 +0000 (UTC)
Date: Mon, 27 Sep 2021 14:47:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>, "Cho, Yu-Chen" <acho@suse.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: gitlab-ci: amd64-opensuse-leap-container job failing
Message-ID: <YVHLVT6xS6YjUxFN@redhat.com>
References: <657cbef7-11ac-196c-01e2-aeb9744fe446@amsat.org>
 <YVGCStPffR/gss2f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YVGCStPffR/gss2f@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 27, 2021 at 09:35:22AM +0100, Daniel P. Berrangé wrote:
> On Sun, Sep 26, 2021 at 07:23:56PM +0200, Philippe Mathieu-Daudé wrote:
> > Hi,
> > 
> > FYI the OpenSUSE job is failing since few days, i.e.:
> > https://gitlab.com/qemu-project/qemu/-/jobs/1622345026
> > 
> >   Retrieving repository 'Main Repository' metadata
> > [..........................................................error]
> >   Repository 'Main Repository' is invalid.
> > 
> > [repo-oss|http://download.opensuse.org/distribution/leap/15.2/repo/oss/]
> > Valid metadata not found at specified URL
> >   History:
> >    - Download (curl) error for
> > 'http://download.opensuse.org/distribution/leap/15.2/repo/oss/repodata/repomd.xml':
> >   Error code: Curl error 56
> >   Error message: Recv failure: Connection reset by peer
> >    - Can't provide /repodata/repomd.xml
> >   Please check if the URIs defined for this repository are pointing to a
> > valid repository.
> >   Warning: Skipping repository 'Main Repository' because of the above error.
> > 
> > I tried to run 'zypper ref' with:
> 
> It isn't confined to only SuSE. In libvirt we've had similar problems
> with several other jobs, though are suse jobs are the worst affected.
> 
> GitLab have finally acknowledged it is an general infra issue affecting
> many things:
> 
>    https://status.gitlab.com/
>    https://gitlab.com/gitlab-com/gl-infra/production/-/issues/5590

Setting GitLab CI env var works around the problem temporarily:

 FF_NETWORK_PER_BUILD=true

You can set it for all repos under a group eg

  https://gitlab.com/groups/qemu-project/-/settings/ci_cd

or per repo eg

  https://gitlab.com/berrange/libvirt/-/settings/ci_cd


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



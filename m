Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B871041CACE
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 18:59:17 +0200 (CEST)
Received: from localhost ([::1]:56026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVcvM-0001lt-Hp
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 12:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVctV-0000mA-Ds
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 12:57:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVctR-0001IG-Ts
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 12:57:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632934636;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QSBXPD+Z7GoUHysVTPvracrTg1c/wChlXamM1Pp7zLs=;
 b=W0LFvZPnAj06K92YRWIklhnQTPblLdbrs0nmDb1GqsAdOdFYpZXUdjEgN5f0RXej8SFRDz
 Wij6EVHl3sC0luKZczn0iyAjORKrd99HRb8HBPDRUyHxCwxEPQ2LG9Q/62LKgFhxbnElV9
 Kv3zDYOQZknbPsSjmgm0zgFoQrX0Kew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-2ILe-DELMwebbOOONoR99g-1; Wed, 29 Sep 2021 12:57:09 -0400
X-MC-Unique: 2ILe-DELMwebbOOONoR99g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A224C1023F56;
 Wed, 29 Sep 2021 16:57:08 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E44F1980E;
 Wed, 29 Sep 2021 16:57:07 +0000 (UTC)
Date: Wed, 29 Sep 2021 17:57:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: gitlab-ci: amd64-opensuse-leap-container job failing
Message-ID: <YVSa4HBLv0D5iWFG@redhat.com>
References: <657cbef7-11ac-196c-01e2-aeb9744fe446@amsat.org>
 <YVGCStPffR/gss2f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YVGCStPffR/gss2f@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

As it turned out, it wasn't gitlab's fault at all. Google cloud had
some networking problems, and these were resolved a short while ago.

So gitlab CI jobs sould be back to normal, and the FF_NETWORK_PER_BUILD
env variable workaround should no longer be needed either.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



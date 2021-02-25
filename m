Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4913324D25
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 10:48:17 +0100 (CET)
Received: from localhost ([::1]:36076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDFo-0005cG-Sw
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 04:48:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lFDEZ-0004gY-FW
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:46:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lFDEU-0008CN-58
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614246413;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qxoI/BjCPHOrpbwFkNWJcwNJaAJ8zAbJDLnMYBM+RpE=;
 b=Ees7Z8KsovAJK8PZEwCY/vnbvu7VXVgV1gBs4EjjX6lsr32Mx++vhGK6qVTXsnrGVDgn45
 dBLVcUwT0CjYaBVET6kW91QOdr+GapIaI0+bb4r8OhGqmYxnxFZ4HjAf6UTo+LXJEpQjAO
 wmzVNW8zPr+4L0t4JLIzmhbh+lBu8U4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-IF__tY6SNICYSUwgixAolA-1; Thu, 25 Feb 2021 04:46:41 -0500
X-MC-Unique: IF__tY6SNICYSUwgixAolA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3CE28030D5;
 Thu, 25 Feb 2021 09:46:39 +0000 (UTC)
Received: from redhat.com (ovpn-115-111.ams2.redhat.com [10.36.115.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82BB25D9DC;
 Thu, 25 Feb 2021 09:46:31 +0000 (UTC)
Date: Thu, 25 Feb 2021 09:46:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: Re: [PATCH v2 1/2] tests/acceptance: replace unstable
 apt.armbian.com URLs for orangepi-pc, cubieboard
Message-ID: <YDdx9N0Wtv8F47Ka@redhat.com>
References: <20210223225327.26700-1-nieklinnenbank@gmail.com>
 <20210223225327.26700-2-nieklinnenbank@gmail.com>
 <5556626c-0b4f-0de3-9cb8-d174cd210b5c@amsat.org>
 <20210224191341.GC1074102@amachine.somewhere>
 <CAPan3WqXre=Rau4-jOSE2u=GGRO8hSKzuuWFSN4xP3wbpvQ-Dg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPan3WqXre=Rau4-jOSE2u=GGRO8hSKzuuWFSN4xP3wbpvQ-Dg@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pavel.Dovgaluk@ispras.ru, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 24, 2021 at 09:02:51PM +0100, Niek Linnenbank wrote:
> Hi Philippe, Cleber,
> 
> On Wed, Feb 24, 2021 at 8:14 PM Cleber Rosa <crosa@redhat.com> wrote:
> 
> > On Wed, Feb 24, 2021 at 10:12:10AM +0100, Philippe Mathieu-Daudé wrote:
> > > Hi Niek,
> > >
> > > On 2/23/21 11:53 PM, Niek Linnenbank wrote:
> > > > Currently the automated acceptance tests for the Orange Pi PC and
> > cubieboard
> > > > machines are disabled by default. The tests for both machines require
> > artifacts
> > > > that are stored on the apt.armbian.com domain. Unfortunately, some of
> > these artifacts
> > > > have been removed from apt.armbian.com and it is uncertain whether
> > more will be removed.
> > > >
> > > > This commit moves the artifacts previously stored on apt.armbian.com
> > to github
> > > > and retrieves them using the path: '/<machine>/<artifact>'.
> > > >
> > > > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> > > > Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> > > > Reviewed-by: Cleber Rosa <crosa@redhat.com>
> > >
> > > > Tested-by: Cleber Rosa <crosa@redhat.com>
> > >
> > > Did Cleber test this new version?
> > >
> >
> 
> You're right, it was the previous version (v1) that Cleber tested using my
> own machine URL's.
> 
> I was actually not sure whether I should or should not have added the
> Tested-by/Reviewed-by tags in such scenario.
> The content had to be changed due to the outcome of our discussion but also
> I thought I don't want to silently drop
> the tags since Cleber invested his time into it too.
> 
> What should I do here, next time?
> 
> 
> 
> >
> > Nope, and I'm having issues with those URLs.  For instance:
> >
> >    $ curl -L
> > https://github.com/nieklinnenbank/QemuArtifacts/raw/master/cubieboard/linux-image-dev-sunxi_5.75_armhf.deb
> >    version https://git-lfs.github.com/spec/v1
> >    oid
> > sha256:a4b765c851de76592f55023b1ff4104f7fd29bf90937e6054e0a64fdda56380b
> >    size 20331524
> >
> > Looks like it has to do with GitHub's behavior wrt quota.
> >
> 
> Indeed. Just this morning I received an e-mail from github with the
> following text:
> 
> "[GitHub] Git LFS disabled for nieklinnenbank
> 
> Git LFS has been disabled on your personal account nieklinnenbank because
> you’ve exceeded your data plan by at least 150%.
> Please purchase additional data packs to cover your bandwidth and storage
> usage:
> 
>   https://github.com/account/billing/data/upgrade
> 
> Current usage as of 24 Feb 2021 09:49AM UTC:
> 
>   Bandwidth: 1.55 GB / 1 GB (155%)
>   Storage: 0.48 GB / 1 GB (48%)"
> 
> I wasn't aware of it but it appears that Github has these quota's for the
> Large File Storage (LFS). I uploaded the files in the git LFS
> because single files are also limited to 100MiB each on the regular Git
> repositories.
> 
> With those strict limits, in my opinion Github isn't really a solution
> since the bandwidth limit will be reached very quickly. At least for the
> LFS part that is. I don't know yet if there is any limit for regular access.
> 
> My current ideas:

>   - we can try to just update the URLs to armbian that are working now
> (with the risk of breaking again in the near future). Ive also found this
> link, which may be more stable:
>      https://archive.armbian.com/orangepipc/archive/

Just do this, as it is the simplest option that gets things working. We
have already spent far too long talking about the problem instead of
just fixing the URLs.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



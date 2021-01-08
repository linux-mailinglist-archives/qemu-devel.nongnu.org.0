Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4E92EF4BB
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:22:40 +0100 (CET)
Received: from localhost ([::1]:39620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxtb5-0006gz-UG
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:22:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kxta6-0006Fm-9f
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:21:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kxta3-0005gn-Rw
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:21:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610119293;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KP2F1EvVT1De/Y6/csljrwIF7HnDmVX5AX4RmAw4n68=;
 b=a/DVUSdBM6ZYbeHGiBSFtAa361nC6n+1qnFmwLllLAm7rbXDc9nztleH++/e7t5EFWXcSF
 npuB1kd4HFAboCCtXGmetM40Zjiz9tpocShKMSgn76yf09OHh6dHluvW4Foi6ako3qfuAN
 sOM3u2Lwy1p8Mb22omhEksVOGvVjCuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-1BBKStE8NSuT4IuXuTWd_A-1; Fri, 08 Jan 2021 10:21:27 -0500
X-MC-Unique: 1BBKStE8NSuT4IuXuTWd_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FCA59CC34;
 Fri,  8 Jan 2021 15:21:26 +0000 (UTC)
Received: from redhat.com (ovpn-114-227.ams2.redhat.com [10.36.114.227])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E98260CDF;
 Fri,  8 Jan 2021 15:21:24 +0000 (UTC)
Date: Fri, 8 Jan 2021 15:21:21 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] shippable.yml: Remove jobs duplicated on Gitlab-CI
Message-ID: <20210108152121.GK1082385@redhat.com>
References: <20210108145103.269353-1-f4bug@amsat.org>
 <28635389-fbe2-89eb-5ec6-5fdc1da98c6a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <28635389-fbe2-89eb-5ec6-5fdc1da98c6a@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 08, 2021 at 04:14:30PM +0100, Paolo Bonzini wrote:
> On 08/01/21 15:51, Philippe Mathieu-Daudé wrote:
> > The following jobs are duplicated on Gitlab-CI since commit
> > 6bcb5fc0f7a ("gitlab-ci: Add cross-compiling build tests"):
> > 
> > - IMAGE=debian-armel-cross
> > 
> >    TARGET_LIST=arm-softmmu               -> cross-armel-system
> >    TARGET_LIST=arm-linux-user            -> cross-armel-user
> >    TARGET_LIST=armeb-linux-user          -> cross-armel-user
> > 
> > - IMAGE=debian-armhf-cross
> > 
> >    TARGET_LIST=arm-softmmu               -> cross-armhf-system
> >    TARGET_LIST=arm-linux-user            -> cross-armhf-user
> >    TARGET_LIST=armeb-linux-user          -> cross-armhf-user
> > 
> > - IMAGE=debian-arm64-cross
> > 
> >    TARGET_LIST=aarch64-softmmu           -> cross-arm64-system
> >    TARGET_LIST=aarch64-linux-user        -> cross-arm64-user
> > 
> > - IMAGE=debian-s390x-cross
> > 
> >    TARGET_LIST=s390x-softmmu             -> cross-s390x-system
> >    TARGET_LIST=s390x-linux-user          -> cross-s390x-user
> > 
> > - IMAGE=debian-mips-cross
> > 
> >    TARGET_LIST=mipsel-linux-user         -> cross-mips-user
> > 
> > - IMAGE=debian-mips64el-cross
> > 
> >    TARGET_LIST=mips64el-softmmu          -> cross-mips64el-system
> >    TARGET_LIST=mips64el-linux-user       -> cross-mips64el-user
> > 
> > - IMAGE=debian-ppc64el-cross
> > 
> >    TARGET_LIST=ppc64-softmmu             -> cross-ppc64el-system
> >    TARGET_LIST=ppc64-linux-user          -> cross-ppc64el-user
> >    TARGET_LIST=ppc64abi32-linux-user     -> cross-ppc64el-user
> > 
> > Remove them from Shippable CI.
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > ---
> >   .shippable.yml | 14 +-------------
> >   1 file changed, 1 insertion(+), 13 deletions(-)
> > 
> > diff --git a/.shippable.yml b/.shippable.yml
> > index 14350e6de8a..97bfa2a0f38 100644
> > --- a/.shippable.yml
> > +++ b/.shippable.yml
> > @@ -7,20 +7,8 @@ env:
> >     matrix:
> >       - IMAGE=debian-amd64
> >         TARGET_LIST=x86_64-softmmu,x86_64-linux-user
> > -    - IMAGE=debian-armel-cross
> > -      TARGET_LIST=arm-softmmu,arm-linux-user,armeb-linux-user
> > -    - IMAGE=debian-armhf-cross
> > -      TARGET_LIST=arm-softmmu,arm-linux-user,armeb-linux-user
> > -    - IMAGE=debian-arm64-cross
> > -      TARGET_LIST=aarch64-softmmu,aarch64-linux-user
> > -    - IMAGE=debian-s390x-cross
> > -      TARGET_LIST=s390x-softmmu,s390x-linux-user
> >       - IMAGE=debian-mips-cross
> > -      TARGET_LIST=mips-softmmu,mipsel-linux-user
> > -    - IMAGE=debian-mips64el-cross
> > -      TARGET_LIST=mips64el-softmmu,mips64el-linux-user
> > -    - IMAGE=debian-ppc64el-cross
> > -      TARGET_LIST=ppc64-softmmu,ppc64-linux-user,ppc64abi32-linux-user
> > +      TARGET_LIST=mips-softmmu
> 
> The debian-mips-cross/mips-softmmu pair (and also mipsel-softmmu) is
> currently excluded by Gitlab's cross-mips-system, is there a reason for
> that?  If we add it there, we can just remove shippable altogether.

Some softmmu targets were disable to keep the build time under control.

We could enable a different subset of targets for each cross host arch,
so that overall we get representative coverage of the full set.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



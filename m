Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F50B3F0074
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 11:30:40 +0200 (CEST)
Received: from localhost ([::1]:54228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGHuB-0000HD-Fz
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 05:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mGHsy-0007xm-JF
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 05:29:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mGHsu-0003pC-Eu
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 05:29:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629278958;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ld7mx8oAFHiYzesY5U0tVdzuhgsa0IU1Cjz/hNVWXo=;
 b=ap/8CCxDGy9d9s9hRxnHgQo2+yFuXdJg1+vK3Qtd9X+fIrcOPKbwtxBJ+WlVkdBNYdPk8g
 lnOF2bpDNaaD87uZoaWauu/pXudAKr1B3nl2Jr4HT+BTMmYXqEHZk3nqoBEDqajxRRbL6U
 6Oa2VrkEVV+3MMp5j6BiXQGX4Ng0Ths=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-sZNI_D4KMT2g0ybCDyYQgA-1; Wed, 18 Aug 2021 05:29:13 -0400
X-MC-Unique: sZNI_D4KMT2g0ybCDyYQgA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29AD118C89CC;
 Wed, 18 Aug 2021 09:29:12 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 881D86F97F;
 Wed, 18 Aug 2021 09:29:03 +0000 (UTC)
Date: Wed, 18 Aug 2021 10:29:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 1/2] gitlab: exclude sparc-softmmu and riscv32-softmmu
 from cross builds
Message-ID: <YRzS3F766na8QeJm@redhat.com>
References: <20210810140653.3969823-1-berrange@redhat.com>
 <20210810140653.3969823-2-berrange@redhat.com>
 <11174538-e2fb-cd99-de92-3153fa56d017@ilande.co.uk>
MIME-Version: 1.0
In-Reply-To: <11174538-e2fb-cd99-de92-3153fa56d017@ilande.co.uk>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 18, 2021 at 10:15:47AM +0100, Mark Cave-Ayland wrote:
> On 10/08/2021 15:06, Daniel P. Berrangé wrote:
> 
> > We need to cut down compile time by excluding more targets. Both these
> > targets still have their 64-bit variant enabled, so the loss of coverage
> > is mitigated to some degree.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   .gitlab-ci.d/crossbuild-template.yml | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
> > index 7d3ad00a1e..cfb576b54c 100644
> > --- a/.gitlab-ci.d/crossbuild-template.yml
> > +++ b/.gitlab-ci.d/crossbuild-template.yml
> > @@ -9,7 +9,8 @@
> >         ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
> >           --disable-user --target-list-exclude="arm-softmmu cris-softmmu
> >             i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
> > -          mips64-softmmu ppc-softmmu sh4-softmmu xtensa-softmmu"
> > +          mips64-softmmu ppc-softmmu riscv32-softmmu sh4-softmmu
> > +          sparc-softmmu xtensa-softmmu"
> >       - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
> >       - if grep -q "EXESUF=.exe" config-host.mak;
> >         then make installer;
> 
> I'd prefer to keep sparc-softmmu if possible, simply because my everyday
> platform is Linux and so having a cross-build for Windows will catch things
> that I may miss on a day-to-day basis. Is sparc-softmmu currently enabled as
> part of the native MINGW64 build?

Note the builds still include  'sparc64-softmmu', so we're only loosing
cover in places where it diverges fromthe 64-bit build, but this will
sstil get coverage in native builds.

> If I go to my Gitlab QEMU fork Settings -> CI/CD -> Variables there is an
> option to set variables that can be used in job scripts. Perhaps this could
> be used so that I can configure my personal QEMU fork to always run
> sparc-softmmu builds when preparing PRs even if they aren't enabled for
> everyone by default? At least this would then allow me to spot any breakage
> before sending a final PR to Peter.

Separately from this I'm doing some work to make things more configurable

  https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg02102.html

but not on this level of granularity.

Rather than globally excluding from all cross builds, I think we ought to
split it up more equitably acrss the different builds in some way.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



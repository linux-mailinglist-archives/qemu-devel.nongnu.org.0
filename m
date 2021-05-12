Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5CF37C747
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:02:06 +0200 (CEST)
Received: from localhost ([::1]:56288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrJE-00013P-PR
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgrD5-0003JF-Qa
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:55:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgrD3-0006CO-S7
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:55:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620834941;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jGsA5QiUsAhJmnKTnJ6IsGJVTsvhcooOP/3EyCxgaao=;
 b=I83A4pkp9EbV7GVvpX2+YqzspraJnw3hk7VJn8aS+eiZFJL60ugPPR3MiiPPe2i3SU0VDV
 3LKVikTnR00PxARTnWvMLGcIKwHU8jEJ6Os/hTrlOl0Kc42VaVQJdRA4aaNprH3giYNyZa
 lNz7TivY8jQHX9cMWY8rl+T1adfUY1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-2K96L7gbO5G00499l1ngJA-1; Wed, 12 May 2021 11:55:36 -0400
X-MC-Unique: 2K96L7gbO5G00499l1ngJA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F404F188E3CC;
 Wed, 12 May 2021 15:55:34 +0000 (UTC)
Received: from redhat.com (ovpn-114-167.ams2.redhat.com [10.36.114.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE25B60657;
 Wed, 12 May 2021 15:55:23 +0000 (UTC)
Date: Wed, 12 May 2021 16:55:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] travis-ci: Use clang-10 for the [s390x] Clang
 (disable-tcg) job
Message-ID: <YJv6aJZm2GHM4Gae@redhat.com>
References: <20210512152231.3423265-1-philmd@redhat.com>
 <32b21c1c-0d55-d92a-390e-f7d6059d03a9@redhat.com>
 <d9eadf82-3fa6-8a52-7822-8da9a9114459@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d9eadf82-3fa6-8a52-7822-8da9a9114459@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 12, 2021 at 05:44:10PM +0200, Thomas Huth wrote:
> On 12/05/2021 17.26, Philippe Mathieu-Daudé wrote:
> > On 5/12/21 5:22 PM, Philippe Mathieu-Daudé wrote:
> > > On Ubuntu Bionic 18.04 LTS clang binary points to the 6.0 version:
> > > 
> > >    $ clang --version
> > >    clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)
> > > 
> > > However we can install clang-10 from the bionic-updates stream [*]
> > > and use it, to silent the following warnings:
> > > 
> > >       CC      pc-bios/s390-ccw/main.o
> > >    clang: warning: optimization flag '-fno-delete-null-pointer-checks' is not supported [-Wignored-optimization-argument]
> > >    clang: warning: argument unused during compilation: '-msoft-float' [-Wunused-command-line-argument]
> > >    /home/travis/build/qemu/qemu/pc-bios/s390-ccw/main.c:284:5: warning: no previous prototype for function 'main' [-Wmissing-prototypes]
> > >    int main(void)
> > >        ^
> > >    1 warning generated.
> > >    clang: warning: optimization flag '-fno-delete-null-pointer-checks' is not supported [-Wignored-optimization-argument]
> > > 
> > > [*] https://packages.ubuntu.com/bionic-updates/clang-10
> > > 
> > > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > > ---
> > > However this doesn't resolve:
> > > 
> > >      /home/travis/build/philmd/qemu/pc-bios/s390-ccw/jump2ipl.c:67:18: error: invalid operand for instruction
> > >          asm volatile("lghi 1,1\n\t"
> > >                       ^
> > >      <inline asm>:1:7: note: instantiated into assembly here
> > >              lghi 1,1
> > >                   ^
> > >      /home/travis/build/philmd/qemu/pc-bios/s390-ccw/jump2ipl.c:67:29: error: invalid operand for instruction
> > >          asm volatile("lghi 1,1\n\t"
> > >                                  ^
> > >      <inline asm>:2:7: note: instantiated into assembly here
> > >              diag 1,1,0x308
> > >                   ^
> > >      2 errors generated.
> > >      Makefile:20: recipe for target 'jump2ipl.o' failed
> > >      make[1]: *** [jump2ipl.o] Error 1
> > > 
> > > (see https://travis-ci.org/github/philmd/qemu/jobs/770920106#L1803,
> > > https://travis-ci.org/github/philmd/qemu/jobs/770920522#L1818 for
> > > more errors).
> > > ---
> > >   .travis.yml | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/.travis.yml b/.travis.yml
> > > index 4609240b5aa..9c0deea9a06 100644
> > > --- a/.travis.yml
> > > +++ b/.travis.yml
> > > @@ -278,6 +278,7 @@ jobs:
> > >         compiler: clang
> > >         addons:
> > >           apt_packages:
> > > +          - clang-10
> > >             - libaio-dev
> > >             - libattr1-dev
> > >             - libbrlapi-dev
> > > @@ -303,7 +304,7 @@ jobs:
> > >         env:
> > >           - TEST_CMD="make check-unit"
> > >           - CONFIG="--disable-containers --disable-tcg --enable-kvm
> > > -                  --disable-tools --host-cc=clang --cxx=clang++"
> > > +                  --disable-tools --host-cc=clang-10 --cc=clang-10 --cxx=clang++-10"
> > 
> > I forgot to mention we were missing the --cc= flag, so s390-ccw
> > was built with an inconsistent $CC. I might respin this part
> > separately.
> 
> I think the configure script uses the same compiler as --host-cc for --cc if
> it is not specified. So depending on whether Daniel sets the minimum version
> to 6.3 or 6.0, we either can use this patch or we don't need it at all.

I'm going to set min to 6.0.0, because I expect most users on ubuntu
will install the default "clang" and not realize there are extra
clang-NNN versions


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



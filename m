Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2B86CD90F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 14:05:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phTpQ-0004sK-7y; Wed, 29 Mar 2023 07:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phTpN-0004rb-Tb
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 07:18:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phTpM-0002xJ-55
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 07:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680088731;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2D3yUMrzEo5CF5ljZxJzjLqlcmyb2sjO34yILVB8PMk=;
 b=AkysFKCE+30PyIWxmT2LOYAlQARR/QPO2ZR+PVCjYxrOCUx8zIYca9lOU8SD4NZCwaiLPa
 yxawB5/+aZLFuianpQe+vR1A2XD1ga/p1fwqFYl9OS6EeGZcpC8o3U1+lmjhD0VUqv0AxW
 e78uSYblCARcLCX7fhU1Lcs6gcH3KMQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-eZDLR7hyNa2mPyPj7CjSYQ-1; Wed, 29 Mar 2023 07:18:47 -0400
X-MC-Unique: eZDLR7hyNa2mPyPj7CjSYQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CF0B280BF61;
 Wed, 29 Mar 2023 11:18:47 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E97C492C3E;
 Wed, 29 Mar 2023 11:18:44 +0000 (UTC)
Date: Wed, 29 Mar 2023 12:18:41 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 7/8] iotests: register each I/O test separately with
 meson
Message-ID: <ZCQekQ0/zaRsL2S/@redhat.com>
References: <20230303160727.3977246-1-berrange@redhat.com>
 <20230303160727.3977246-8-berrange@redhat.com>
 <2dc0e2fe-bb41-f81a-893f-022d17c98a48@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2dc0e2fe-bb41-f81a-893f-022d17c98a48@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 29, 2023 at 12:47:51PM +0200, Thomas Huth wrote:
> On 03/03/2023 17.07, Daniel P. Berrangé wrote:
> > Currently meson registers a single test that invokes an entire group of
> > I/O tests, hiding the test granularity from meson. There are various
> > downsides of doing this
> > 
> >   * You cannot ask 'meson test' to invoke a single I/O test
> >   * The meson test timeout can't be applied to the individual
> >     tests
> >   * Meson only gets a pass/fail for the overall I/O test group
> >     not individual tests
> >   * If a CI job gets killed by the GitLab timeout, we don't
> >     get visibility into how far through the I/O tests
> >     execution got.
> > 
> > This switches meson to perform test discovery by invoking 'check' in
> > dry-run mode. It then registers one meson test case for each I/O
> > test. Parallel execution remains disabled since the I/O tests do not
> > use self contained execution environments and thus conflict with
> > each other.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   tests/qemu-iotests/meson.build | 35 ++++++++++++++++++++++++++++------
> >   1 file changed, 29 insertions(+), 6 deletions(-)
> > 
> > diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
> > index 323a4acb6a..a162f683ef 100644
> > --- a/tests/qemu-iotests/meson.build
> > +++ b/tests/qemu-iotests/meson.build
> > @@ -32,16 +32,39 @@ foreach k, v : emulators
> >     endif
> >   endforeach
> > +qemu_iotests_check_cmd = files('check')
> > +
> >   foreach format, speed: qemu_iotests_formats
> >     if speed == 'quick'
> >       suites = 'block'
> >     else
> >       suites = ['block-' + speed, speed]
> >     endif
> > -  test('qemu-iotests ' + format, sh, args: [files('../check-block.sh'), format],
> > -       depends: qemu_iotests_binaries, env: qemu_iotests_env,
> > -       protocol: 'tap',
> > -       suite: suites,
> > -       timeout: 0,
> > -       is_parallel: false)
> > +
> > +  args = ['-tap', '-' + format]
> > +  if speed == 'quick'
> > +      args += ['-g', 'auto']
> > +  endif
> > +
> > +  rc = run_command(
> > +      [qemu_iotests_check_cmd] + args + ['-n'],
> > +      check: true,
> > +  )
> > +
> > +  foreach item: rc.stdout().strip().split()
> > +      args = ['-tap', '-' + format, item,
> > +              '--source-dir', meson.current_source_dir(),
> > +              '--build-dir', meson.current_build_dir()]
> > +      # Some individual tests take as long as 45 seconds
> > +      # Bump the timeout to 3 minutes for some headroom
> > +      # on slow machines to minimize spurious failures
> > +      test('io-' + format + '-' + item,
> > +           qemu_iotests_check_cmd,
> > +           args: args,
> > +           depends: qemu_iotests_binaries,
> > +           env: qemu_iotests_env,
> > +           protocol: 'tap',
> > +           timeout: 180,
> > +           suite: suites)
> > +  endforeach
> >   endforeach
> 
> Seems like this somehow broke compilation on NetBSD:
> 
> https://gitlab.com/thuth/qemu/-/jobs/4021584713#L2980

I ran it locally and got the meson-log.txt file which reports

  env: python3: No such file or directory

and indeed there is no python3 binary present in our netbsd
VM.

our tests/vm/netbsd script works around this by passing an
explicit --python=python3.7 arg to configure, but the way
we invoke the 'check' script means it is just using the
"#!/usr/bin/env python3"  logic instead.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



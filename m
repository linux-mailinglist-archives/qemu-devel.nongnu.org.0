Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8CB6A9518
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:22:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2Xw-0004y5-Tl; Fri, 03 Mar 2023 05:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY2Xu-0004u9-JB
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:21:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY2Xs-0002Q0-Os
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:21:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677838908;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dnt562fSbfD0zYKwTahjnRVx0PWMBLUXouFr31aMb14=;
 b=SZnh5tQW5b9h8ZgCDFTFbu3c6xvwehNkROST74cMdy+vPS+EjRTqFsPVYLReIc5Sr8e3ue
 n9hrA6GqVFTT3NDB7bGrLy79II0yNH99r35SWMeVKBGKERCE9Zu6mOKhowMa/41KPSsOPj
 mN/ujFSIX1sggGb4JaGmlZO4rV8a5mM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-eLdtJYUXNLa598auExh9kA-1; Fri, 03 Mar 2023 05:21:46 -0500
X-MC-Unique: eLdtJYUXNLa598auExh9kA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 963B138149B8;
 Fri,  3 Mar 2023 10:21:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83AFA2166B26;
 Fri,  3 Mar 2023 10:21:45 +0000 (UTC)
Date: Fri, 3 Mar 2023 10:21:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 5/5] iotests: register each I/O test separately with meson
Message-ID: <ZAHKNTc/Kn9gflPL@redhat.com>
References: <20230302184606.418541-1-berrange@redhat.com>
 <20230302184606.418541-6-berrange@redhat.com>
 <538abc5a-5873-4384-e6b0-8a04824daa4a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <538abc5a-5873-4384-e6b0-8a04824daa4a@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

On Fri, Mar 03, 2023 at 10:34:11AM +0100, Thomas Huth wrote:
> On 02/03/2023 19.46, Daniel P. Berrangé wrote:
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
> >   tests/qemu-iotests/meson.build | 33 +++++++++++++++++++++++++++------
> >   1 file changed, 27 insertions(+), 6 deletions(-)
> > 
> > diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
> > index 323a4acb6a..48c82085af 100644
> > --- a/tests/qemu-iotests/meson.build
> > +++ b/tests/qemu-iotests/meson.build
> > @@ -32,16 +32,37 @@ foreach k, v : emulators
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
> > +      message('Adding test qemu-iotests-' + format + '-' + item)
> 
> This message spoils the output during "configure" quite a bit, please remove
> that line.

Yes, that wasn't supposed to be left it, it was me debugging :-)

> 
> Apart from that, patch looks fine to me!
> 
>  Thomas
> 
> 
> > +      args = ['-tap', '-' + format, item,
> > +              '--source-dir', meson.current_source_dir(),
> > +              '--build-dir', meson.current_build_dir()]
> > +      test('qemu-iotests-' + format + '-' + item,
> > +           qemu_iotests_check_cmd,
> > +           args: args,
> > +           is_parallel: false,
> > +           depends: qemu_iotests_binaries,
> > +           env: qemu_iotests_env,
> > +           protocol: 'tap',
> > +           suite: suites)
> > +  endforeach
> >   endforeach
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



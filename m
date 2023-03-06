Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6256AC213
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:01:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBOZ-0007E8-4B; Mon, 06 Mar 2023 09:00:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pZBNu-00073u-Hx
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:00:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pZBNs-0006Ky-H6
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:00:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678111211;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QJkuxo13BDRUGDQXxdbEswwsEPrSqMEebN1kCwVfmSc=;
 b=Rux7oY87QPccXim6mAuspGK1qqv6E//NsZxComvbUPIdkA3o0GXF9oMUP8xCsjJF8OXtnT
 ZeFl42jYl+QSZ6TPJNr/R8/wQ01H6ysM2AUsiS/S/8w4Di1cjQkDgAs8BnS+SK6zY5mOa8
 8V192I7r+RbgEveGBlO9UeJ7rI+Zdso=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-cl-nf6A3OXe7ls4LxIsi2A-1; Mon, 06 Mar 2023 09:00:10 -0500
X-MC-Unique: cl-nf6A3OXe7ls4LxIsi2A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35B3118A6468;
 Mon,  6 Mar 2023 14:00:09 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24A202166B26;
 Mon,  6 Mar 2023 14:00:08 +0000 (UTC)
Date: Mon, 6 Mar 2023 14:00:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, quintela@redhat.com,
 qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
Message-ID: <ZAXx5VerHrVQbSwU@redhat.com>
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
 <ZADeLNaltLAZ9BU8@redhat.com> <87edq6i4jf.fsf@secure.mitica>
 <CAFEAcA8aKkFse_nfoKSPA--QdQnB1xVZyMQoQWfqpf4yyxtzDA@mail.gmail.com>
 <188bd1ff-4ea2-6d92-2b6e-6f19af3df232@redhat.com>
 <CAFEAcA-U568vrLKHegfKQWu1RfUCRjdOKZQMoFXSde1yk4V3Wg@mail.gmail.com>
 <53ca67e4-fb2f-17ac-2087-9faa7aba5187@redhat.com>
 <ZAXuRp4p7heAbFtF@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZAXuRp4p7heAbFtF@work-vm>
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

On Mon, Mar 06, 2023 at 01:44:38PM +0000, Dr. David Alan Gilbert wrote:
> * Thomas Huth (thuth@redhat.com) wrote:
> > On 03/03/2023 13.05, Peter Maydell wrote:
> > > On Fri, 3 Mar 2023 at 11:29, Thomas Huth <thuth@redhat.com> wrote:
> > > > 
> > > > On 03/03/2023 12.18, Peter Maydell wrote:
> > > > > On Fri, 3 Mar 2023 at 09:10, Juan Quintela <quintela@redhat.com> wrote:
> > > > > > 
> > > > > > Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > > > > On Thu, Mar 02, 2023 at 05:22:11PM +0000, Peter Maydell wrote:
> > > > > > > > migration-test has been flaky for a long time, both in CI and
> > > > > > > > otherwise:
> > > > > > > > 
> > > > > > > > https://gitlab.com/qemu-project/qemu/-/jobs/3806090216
> > > > > > > > (a FreeBSD job)
> > > > > > > >     32/648 ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migration_status: assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT) ERROR
> > > > > > > > 
> > > > > > > > on a local macos x86 box:
> > > > > 
> > > > > 
> > > > > 
> > > > > > What is really weird with this failure is that:
> > > > > > - it only happens on non-x86
> > > > > 
> > > > > No, I have seen it on x86 macos, and x86 OpenBSD
> > > > > 
> > > > > > - on code that is not arch dependent
> > > > > > - on cancel, what we really do there is close fd's for the multifd
> > > > > >     channel threads to get out of the recv, i.e. again, nothing that
> > > > > >     should be arch dependent.
> > > > > 
> > > > > I'm pretty sure that it tends to happen when the machine that's
> > > > > running the test is heavily loaded. You probably have a race condition.
> > > > 
> > > > I think I can second that. IIRC I've seen it a couple of times on my x86
> > > > laptop when running "make check -j$(nproc) SPEED=slow" here.
> > > 
> > > And another on-x86 failure case, just now, on the FreeBSD x86 CI job:
> > > https://gitlab.com/qemu-project/qemu/-/jobs/3870165180
> > 
> > And FWIW, I just saw this while doing "make vm-build-netbsd J=4":
> > 
> > ▶  31/645 ERROR:../src/tests/qtest/migration-test.c:1841:test_migrate_auto_converge: 'got_stop' should be FALSE ERROR
> 
> That one is kind of interesting; this is an auto converge test - so it
> tries to setup migration so it won't finish, to check that the auto
> converge kicks in.  Except in this case the migration *did* finish
> without the autoconverge (significantly) kicking in.
> 
> So I guess any of:
>   a) The CPU thread never got much CPU time so not much dirtying
> happened.
>   b) The bandwidth calculations might be bad enough/course enough
> that it's passing the (very low) bandwidth limit due to bad
> approximation at bandwidth needed.
>   c) The autoconverge jump happens fast enough for that loop
> to hit the got_stop in the loop time of that loop.
> 
> I guess we could:
>   i) Reduce the usleep in test_migrate_auto_converge
>     (So it is more likely to correctly drop out of that loop
>     as soon as autoconverge kicks in)

The CPU time spent by the dirtying guest CPUs should dominate
here, so we can afford to reduce that timeout down a bit to
be more responsive.

>   ii) Reduce inc_pct so that autoconverge kicks in slower
>   iii) Reduce max-bandwidth in migrate_ensure_non_converge
>      even further.

migrate_ensure_non_converge is trying to guarantee non-convergance,
but obviously we're only achieving a probibalistic chance of
non-converage. To get the probably closer to 100% we should make
it massively smaller, say 100kbs instead of 30mbs.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



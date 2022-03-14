Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D154D7EC0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 10:37:03 +0100 (CET)
Received: from localhost ([::1]:58258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTh8Q-0003GL-JO
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 05:37:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nTh37-0007KC-4P
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 05:31:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nTh32-0007y2-TZ
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 05:31:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647250287;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e4/1iVDiMJVNC/loMRnTBK/B1nFPsCdRtiApcNQ6cdk=;
 b=f1M7SQaaGkWmKfAPvzwty+w3yfOlxtM49EeJKuv4EaqFCbBQtnHKV2GGKj2gcXbs1xf2F3
 bZfx0n1yTnjckS/+gfIrJLpXhkmKd1aZRk4xgd3+9kFhoPcKtsrO/GyKc7HxjqvK3AaSSq
 6Pfhq45iImWt7d5g2YQkJLZbUeYpsQg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-UBVZ8og7Oka44dvYoatgdg-1; Mon, 14 Mar 2022 05:31:24 -0400
X-MC-Unique: UBVZ8og7Oka44dvYoatgdg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64DF885A5A8;
 Mon, 14 Mar 2022 09:31:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5A324047D29;
 Mon, 14 Mar 2022 09:31:20 +0000 (UTC)
Date: Mon, 14 Mar 2022 09:31:18 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: MAINTAINERS: macOS host support (was: MAINTAINERS: take edk2)
Message-ID: <Yi8LZvWYUiu/EvtW@redhat.com>
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <1799774.TS5kVz7OSp@silver> <YisV10u6lbemEtHA@redhat.com>
 <1978631.qOGrPXpdaL@silver>
MIME-Version: 1.0
In-Reply-To: <1978631.qOGrPXpdaL@silver>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 12, 2022 at 02:51:21PM +0100, Christian Schoenebeck wrote:
> On Freitag, 11. März 2022 10:26:47 CET Daniel P. Berrangé wrote:
> > On Fri, Mar 11, 2022 at 10:13:24AM +0100, Christian Schoenebeck wrote:
> > > On Donnerstag, 10. März 2022 12:40:06 CET Philippe Mathieu-Daudé wrote:
> > > > +Stefan for overall project resources.
> > > > 
> > > > On 10/3/22 12:07, Daniel P. Berrangé wrote:
> > > > > On Thu, Mar 10, 2022 at 12:00:35PM +0100, Christian Schoenebeck wrote:
> > > > >> On Mittwoch, 9. März 2022 12:44:16 CET Daniel P. Berrangé wrote:
> > > > >>> On Wed, Mar 09, 2022 at 11:40:42AM +0100, Christian Schoenebeck 
> wrote:
> > > > >>>> On Mittwoch, 9. März 2022 11:05:02 CET Philippe Mathieu-Daudé 
> wrote:
> > > > >>>>> Not sure what you have in mind. I'm totally new to the
> > > > >>>>> macOS/Darwin
> > > > >>>>> world, and have no choice but to use it as primary workstation and
> > > > >>>>> for CI builds, so I can help with overall testing / maintenance.
> > > > >>>>> 
> > > > >>>>> Peter, since you take some macOS patches, would you like to
> > > > >>>>> maintain
> > > > >>>>> this officially? Since I doubt you want to take yet another
> > > > >>>>> responsibility, what about having a co-maintained section,
> > > > >>>>> including
> > > > >>>>> technical expertise from Akihiko / Joelle / Christian? (Cc'ed)
> > > > >>>>> 
> > > > >>>>> Regards,
> > > > >>>> 
> > > > >>>> Also CCing Cameron on this, just in case someone at Apple could
> > > > >>>> spend
> > > > >>>> some
> > > > >>>> slices on QEMU macOS patches in general as well.
> > > > >>>> 
> > > > >>>> As for my part: I try to help out more on the macOS front. As
> > > > >>>> there's
> > > > >>>> now
> > > > >>>> macOS host support for 9p I have to start QEMU testing on macOS
> > > > >>>> locally
> > > > >>>> anyway. Too bad that macOS CI tests on Github are no longer
> > > > >>>> available
> > > > >>>> BTW.
> > > > >>> 
> > > > >>> Note QEMU gets macOS CI coverage in GitLab. We use a clever trick by
> > > > >>> which we use 'cirrus-run' from the GitLab job to trigger a build in
> > > > >>> Cirrus CI's macOS builders, and pull the results back when its done.
> > > > >>> 
> > > > >>> Any contributor can get this working on their QEMU fork too, if they
> > > > >>> configure the needed Cirrus CI API token. See the docs in
> > > > >>> 
> > > > >>>     .gitlab-ci.d/cirrus/README.rst
> > > > >>> 
> > > > >>> This is enough for build + automated tests.
> > > > >> 
> > > > >> Does this mean that people no longer have to pull their credit card
> > > > >> just
> > > > >> for running CI tests on Gitlab?
> > > > > 
> > > > > Not really. The CC validation is something GitLab have had to force
> > > > > onto all new accounts due to cryptominer abuse of their free shared
> > > > > CI runners :-( If you have VMs somewhere you could theoretically
> > > > > spin up your own CI runners instead of using the shared runners and
> > > > > that could avoid the CC validation need.
> > > > 
> > > > Not that trivial, first you need to figure out the list of dependencies
> > > > GitLab images come with, then you realize you need 50GiB+ of available
> > > > storage a single pipeline (due to all the Docker images pulled / built)
> > > > and you also need a decent internet link otherwise various jobs timeout
> > > > randomly, then you have to wait 20h+ with a quad-core CPU / 16GiB RAM,
> > > 
> > > Considering that CI jobs currently take about 1 hour on Gitlab, which
> > > processor generation are you referring to that would take 20 hours?
> > 
> > You're not taking into account parallelism. The GitLab pipeline takes
> > 1 hour wallclock time, which is not the same as 1 hour CPU time. We
> > probably have 20+ jobs running in parallel on gitlab, as they get
> > farmed out to many machines. If you have only a single machine at your
> > disposal, then you'll have much less prallelism, so overall time can
> > be much longer.
> > 
> > > > and eventually you realize you lost 3 days of your life to not register
> > > > your CC which you'll be forced to give anyway.
> > > 
> > > It's an obstacle. And that keeps people away. Plus the trend seems to be
> > > that free CI services disappear one by one, so I am not so sure that
> > > giving your credit card once solves this issue for good.
> > 
> > The CC requirement there is primarily to act as an identity check
> > on accounts, so they have some mechanism to discourage and/or trace
> > abusive users. You can use it to purchase extra CI time, but they've
> > stated multiple times their intention to continue to grant free CI
> > time to open source projects and their contributors. They are actively
> > discussing their plans with a number of open source project contributors
> > including myself on behalf of QEMU, to better understand our needs. I
> > outlined my current understanding of their intentions here:
> > 
> >  https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg03962.html
> 
> Please send an announcement (in subject) and/or CC maintainers if there are 
> any news on this topic. This discussion went completely unseen on my end.
> 
> > > > Long term maintainers don't realize that because they had the luxury to
> > > > open their GitLab account soon enough and are now privileged.
> > > 
> > > Would it be possible to deploy all CI jobs via Cirrus-CI?
> > 
> > Not unless you want to wait 10 hours for the pipeline to finish. Cirrus
> > CI only lets you run 2 jobs at a time. It also doesn't have any integrated
> > container registry which we rely on for creatnig our build env.
> 
> For the vast majority of contributors that would be absolutely fine. What 
> matters is running tests for the various architectures. Average response time 
> on submitted patches is much longer than 10 hours. Still better than not
> running CI tests at all.

I don't think that's absolutely fine at all, nor a common view amongst
maintainers/contributors. People already complain that the 1 hour time
of our GitLab CI is too long for them to wait. Having a CI run take 10
hours would be horrendous. Run a CI pipeline on monday, it fails, on
tuesday fix the bug, run another CI pipeline, and got get the results
on wednesday. Your work is split over 3 days, instead of 2 hours today
with GitLab as it stands. That's assuming you got the fix right first
time too. A CI pipeline that takes 10 hours, is a pipeline that people
will not bother running most of the time.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



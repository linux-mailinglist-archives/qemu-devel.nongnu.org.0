Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6A94D5E7A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 10:33:42 +0100 (CET)
Received: from localhost ([::1]:33414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSbeW-0002SU-Ne
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 04:33:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSbYQ-0000tl-ED
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 04:27:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSbYM-0006uu-GZ
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 04:27:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646990836;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZNuPnok3QXvRKHaHEmq1NGHa9J49kK2Obdeq1vrGnwE=;
 b=Vqn2YO2idl0qpz1IV3mBF+ZjrQcOqRBTXesXs8Wbaf+Xu4DMOTB1sRtA+dJvznvlyM+fIR
 d0iRVyNRkIfqpMd1E9H7k2vMgoy2qeMxPxd+XnUe5h2BnajuisP0xODq/6GcWnWQ9wlZss
 8IW3RbkTnKQfr5LdZKRjhyBE5hSPj2I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-6e3YZSNhObWr8AWtZtPsWQ-1; Fri, 11 Mar 2022 04:26:57 -0500
X-MC-Unique: 6e3YZSNhObWr8AWtZtPsWQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45217FC81;
 Fri, 11 Mar 2022 09:26:55 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7124753F2;
 Fri, 11 Mar 2022 09:26:50 +0000 (UTC)
Date: Fri, 11 Mar 2022 09:26:47 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: MAINTAINERS: macOS host support (was: MAINTAINERS: take edk2)
Message-ID: <YisV10u6lbemEtHA@redhat.com>
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <YincBMmKYK+GzPnN@redhat.com>
 <b3438511-abad-b9bd-5343-7e6dacabda3c@gmail.com>
 <1799774.TS5kVz7OSp@silver>
MIME-Version: 1.0
In-Reply-To: <1799774.TS5kVz7OSp@silver>
User-Agent: Mutt/2.1.5 (2021-12-30)
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
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Joelle van Dyne <j@getutm.app>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 11, 2022 at 10:13:24AM +0100, Christian Schoenebeck wrote:
> On Donnerstag, 10. März 2022 12:40:06 CET Philippe Mathieu-Daudé wrote:
> > +Stefan for overall project resources.
> > 
> > On 10/3/22 12:07, Daniel P. Berrangé wrote:
> > > On Thu, Mar 10, 2022 at 12:00:35PM +0100, Christian Schoenebeck wrote:
> > >> On Mittwoch, 9. März 2022 12:44:16 CET Daniel P. Berrangé wrote:
> > >>> On Wed, Mar 09, 2022 at 11:40:42AM +0100, Christian Schoenebeck wrote:
> > >>>> On Mittwoch, 9. März 2022 11:05:02 CET Philippe Mathieu-Daudé wrote:
> > >>>>> Not sure what you have in mind. I'm totally new to the macOS/Darwin
> > >>>>> world, and have no choice but to use it as primary workstation and
> > >>>>> for CI builds, so I can help with overall testing / maintenance.
> > >>>>> 
> > >>>>> Peter, since you take some macOS patches, would you like to maintain
> > >>>>> this officially? Since I doubt you want to take yet another
> > >>>>> responsibility, what about having a co-maintained section, including
> > >>>>> technical expertise from Akihiko / Joelle / Christian? (Cc'ed)
> > >>>>> 
> > >>>>> Regards,
> > >>>> 
> > >>>> Also CCing Cameron on this, just in case someone at Apple could spend
> > >>>> some
> > >>>> slices on QEMU macOS patches in general as well.
> > >>>> 
> > >>>> As for my part: I try to help out more on the macOS front. As there's
> > >>>> now
> > >>>> macOS host support for 9p I have to start QEMU testing on macOS locally
> > >>>> anyway. Too bad that macOS CI tests on Github are no longer available
> > >>>> BTW.
> > >>> 
> > >>> Note QEMU gets macOS CI coverage in GitLab. We use a clever trick by
> > >>> which we use 'cirrus-run' from the GitLab job to trigger a build in
> > >>> Cirrus CI's macOS builders, and pull the results back when its done.
> > >>> 
> > >>> Any contributor can get this working on their QEMU fork too, if they
> > >>> configure the needed Cirrus CI API token. See the docs in
> > >>> 
> > >>>     .gitlab-ci.d/cirrus/README.rst
> > >>> 
> > >>> This is enough for build + automated tests.
> > >> 
> > >> Does this mean that people no longer have to pull their credit card just
> > >> for running CI tests on Gitlab?
> > > 
> > > Not really. The CC validation is something GitLab have had to force
> > > onto all new accounts due to cryptominer abuse of their free shared
> > > CI runners :-( If you have VMs somewhere you could theoretically
> > > spin up your own CI runners instead of using the shared runners and
> > > that could avoid the CC validation need.
> > 
> > Not that trivial, first you need to figure out the list of dependencies
> > GitLab images come with, then you realize you need 50GiB+ of available
> > storage a single pipeline (due to all the Docker images pulled / built)
> > and you also need a decent internet link otherwise various jobs timeout
> > randomly, then you have to wait 20h+ with a quad-core CPU / 16GiB RAM,
> 
> Considering that CI jobs currently take about 1 hour on Gitlab, which 
> processor generation are you referring to that would take 20 hours?

You're not taking into account parallelism. The GitLab pipeline takes
1 hour wallclock time, which is not the same as 1 hour CPU time. We
probably have 20+ jobs running in parallel on gitlab, as they get
farmed out to many machines. If you have only a single machine at your
disposal, then you'll have much less prallelism, so overall time can
be much longer.

> > and eventually you realize you lost 3 days of your life to not register
> > your CC which you'll be forced to give anyway.
> 
> It's an obstacle. And that keeps people away. Plus the trend seems to be that 
> free CI services disappear one by one, so I am not so sure that giving your 
> credit card once solves this issue for good.

The CC requirement there is primarily to act as an identity check
on accounts, so they have some mechanism to discourage and/or trace
abusive users. You can use it to purchase extra CI time, but they've
stated multiple times their intention to continue to grant free CI
time to open source projects and their contributors. They are actively
discussing their plans with a number of open source project contributors
including myself on behalf of QEMU, to better understand our needs. I
outlined my current understanding of their intentions here:

 https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg03962.html

> > Long term maintainers don't realize that because they had the luxury to
> > open their GitLab account soon enough and are now privileged.
> 
> Would it be possible to deploy all CI jobs via Cirrus-CI?

Not unless you want to wait 10 hours for the pipeline to finish. Cirrus
CI only lets you run 2 jobs at a time. It also doesn't have any integrated
container registry which we rely on for creatnig our build env.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



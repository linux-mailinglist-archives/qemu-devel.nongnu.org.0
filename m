Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63172DAA95
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 11:05:10 +0100 (CET)
Received: from localhost ([::1]:35880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp7Cf-0004pt-AR
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 05:05:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kp79T-0002TB-Dy
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:01:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kp79N-0005va-S8
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:01:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608026505;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AvmLaIkuiV2Ee2bbdThTned8IFOdFRiuqxXLW6OgX/I=;
 b=VLti9OzS3z6AXr+kh8lBYAxLHiw6U3ig9LIj/K/ZysHHE2ZtgoRTSC8js4btkAuZGm1L+J
 OSLmHSVhQYVvxQHZID9NYJ6gaZuawkT6NDwH0bT4n+TBMe4D+qABKFlSXEEjcJJ29iv38V
 yqmqY9NEV2i1MAfvBe7YZW56/nmId0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-ZQYuXGfAOgi6JPiLZq4eTQ-1; Tue, 15 Dec 2020 05:01:42 -0500
X-MC-Unique: ZQYuXGfAOgi6JPiLZq4eTQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7370800D55;
 Tue, 15 Dec 2020 10:01:40 +0000 (UTC)
Received: from redhat.com (ovpn-113-23.ams2.redhat.com [10.36.113.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 905135D6A1;
 Tue, 15 Dec 2020 10:01:31 +0000 (UTC)
Date: Tue, 15 Dec 2020 10:01:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 1/2] gitlab-ci: Step in to maintain the
 fedora-i386-cross runner
Message-ID: <20201215100128.GF121272@redhat.com>
References: <20201211171703.537546-1-philmd@redhat.com>
 <20201211171703.537546-2-philmd@redhat.com>
 <fe1213a5-a706-adaf-25a7-8323f42239da@redhat.com>
 <bc8b270a-ef99-8eeb-d1fd-61ab7507b78d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bc8b270a-ef99-8eeb-d1fd-61ab7507b78d@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, virt-ci-maint-team@redhat.com,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 06:52:31PM +0100, Philippe Mathieu-Daudé wrote:
> On 12/14/20 1:35 PM, Thomas Huth wrote:
> > On 11/12/2020 18.17, Philippe Mathieu-Daudé wrote:
> >> As I am interested in using the runner based on the fedora-i386-cross
> >> docker image, add a smoke test job to be sure this image is usable,
> >> and set the JOB_MAINTAINER_NAME/JOB_MAINTAINER_EMAIL variables so
> >> other developers can contact me in case there is a problem with the
> >> public runner based on this image.
> >>
> >> We will eventually send a patch to make script/checkpatch.pl parse
> >> the Gitlab YAML jobs to understand the JOB_MAINTAINER_NAME and
> >> JOB_MAINTAINER_EMAIL variables.
> >>
> >> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >> ---
> >>  .gitlab-ci.d/crossbuilds.yml | 15 +++++++++++++++
> >>  1 file changed, 15 insertions(+)
> >>
> >> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> >> index bd6473a75a7..864cad7cec5 100644
> >> --- a/.gitlab-ci.d/crossbuilds.yml
> >> +++ b/.gitlab-ci.d/crossbuilds.yml
> >> @@ -39,6 +39,13 @@
> >>        ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-system
> >>      - make -j$(expr $(nproc) + 1) all check-build
> >>  
> >> +.cross_sanity_check_job:
> >> +  stage: build
> >> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> >> +  timeout: 3m
> >> +  script:
> >> +    - /bin/true
> > 
> > I guess it makes more sense if I respin my patch here instead:
> > 
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg762919.html
> > 
> > ?
> 
> I think these are different. The idea of testing /bin/true is to be
> able to make the distinction between a broken runner and a broken
> test.

I don't see any point in this job.  /bin/true will always succeeed
if we've successfully created the container image if the container
build job.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



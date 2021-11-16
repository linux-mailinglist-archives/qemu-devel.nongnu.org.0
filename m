Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47C4453819
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:51:56 +0100 (CET)
Received: from localhost ([::1]:37964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1ga-0000DQ-2l
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:51:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mn1em-0007qb-7m
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:50:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mn1ek-00081U-0n
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:50:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637081401;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ScVLJkCBHdtt8EFGN0kPHNkDowtr9KFXZOOwD+drj0I=;
 b=CCOlcxBQjp+S57TwKAMKZJTQDZ8W4sIyQXZOcVCkvmVlozjzEMRNj4cL0jiOaRl9nIEcek
 sLlg23YUVw82UTPv+rmT0C5r0PzW7Rn1ngyaIO20RBHXEVT+sKRSh1xN7qvwuS1P6Sav2k
 Of8cr1xG1M5YcpDNWgrvEWAg2b6qXr0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-Hr--iy3DPXCzqrj-Aefj_w-1; Tue, 16 Nov 2021 11:49:53 -0500
X-MC-Unique: Hr--iy3DPXCzqrj-Aefj_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B00331922960;
 Tue, 16 Nov 2021 16:49:52 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8A451981F;
 Tue, 16 Nov 2021 16:49:36 +0000 (UTC)
Date: Tue, 16 Nov 2021 16:49:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci/cirrus: Increase timeout to 80 minutes
Message-ID: <YZPhHt4JFcz41YFJ@redhat.com>
References: <20211116163309.246602-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211116163309.246602-1-thuth@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 05:33:09PM +0100, Thomas Huth wrote:
> The jobs on Cirrus-CI sometimes get delayed quite a bit, waiting to
> be scheduled, so while the build test itself finishes within 60 minutes,
> the total run time of the jobs can be longer due to this waiting time.
> Thus let's increase the timeout on the gitlab side a little bit, so
> that these jobs are not marked as failing just because of the delay.

On a successful pipeline I see

 freebsd-11  - 28 minutes
 freebsd-12  - 57 minutes
 macos       - 30 minutes

We know cirrus allows 2 concurrent jobs, so from that I infer
that the freebsd-12 job was queued for ~30 minutes waiting for
either the freebsd-11 or macos job to finish, and then it
ran in 30 minutes, giving the ~60 minute total.

That's too close to the 60 minute gitlab default job timeout
for comfort - it can easily slip over 60 minutes by just a
small amount.

80 minutes will certainly help in the case where we
randomly take a little longer than 30 minutes to build,
and have 1 of the 3 jobs queued.

When we're running jobs on both master + staging, we can
have 2 jobs running and 4 more queued - 2 of those queued
might just finish in time, but 2 will definitely fail.
My patch will cut these extra jobs on master, so in common
case we only ever get 1 queued, which should work well in
combo with your patch here. That should be good enough
for the qemu-project namespace, unless someone is triggering
pipelines for stable branch staging at the same time as
the master branch staging.

If we do want to worry about more than 2 queued jobs
again for that reason, we might consider putting
it upto 100 minutes. That would give us enough slack to
have 4 queued jobs behind two running jobs and have
them all succeed

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/cirrus.yml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
> index e7b25e7427..22d42585e4 100644
> --- a/.gitlab-ci.d/cirrus.yml
> +++ b/.gitlab-ci.d/cirrus.yml
> @@ -14,6 +14,7 @@
>    stage: build
>    image: registry.gitlab.com/libvirt/libvirt-ci/cirrus-run:master
>    needs: []
> +  timeout: 80m
>    allow_failure: true
>    script:
>      - source .gitlab-ci.d/cirrus/$NAME.vars

Whether 80 or 100 minute, consider it

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



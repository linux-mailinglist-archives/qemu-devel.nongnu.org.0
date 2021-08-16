Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321F13ED6D5
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 15:27:27 +0200 (CEST)
Received: from localhost ([::1]:49562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFceD-0000Zh-Vw
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 09:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mFcb6-0006QL-7e
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 09:24:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mFcb3-0002uz-VF
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 09:24:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629120249;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tsLbvZN9VUnH1tfOMNir260cxi+gOVMKSLI9xD9INIs=;
 b=K+9FnXw8HcLyS2F00gI1Kgd+Wtv3hR+0mHsEauhUFzz+ohzVwngy+vpsZC0NINf9SS5BYb
 usY4kkhZ/ggckzASn94u38TjuiKVd5t8cy2Qadm4M+QofrUj5pJ4on/eZL6YzAQNkehVvt
 mEtt22ESaceVYEeoDFE35jAS5aeJhY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-Ya3C8jptOiitXO73U5XzqQ-1; Mon, 16 Aug 2021 09:24:00 -0400
X-MC-Unique: Ya3C8jptOiitXO73U5XzqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73F381083E80;
 Mon, 16 Aug 2021 13:23:59 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F1E15C23A;
 Mon, 16 Aug 2021 13:23:50 +0000 (UTC)
Date: Mon, 16 Aug 2021 14:23:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 2/2] gitlab: don't run CI jobs by default on push to user
 forks
Message-ID: <YRpm495McORAAycn@redhat.com>
References: <20210812180403.4129067-1-berrange@redhat.com>
 <20210812180403.4129067-3-berrange@redhat.com>
 <87y291u0st.fsf@redhat.com> <YRpGFnvZznlU9RKQ@redhat.com>
 <87v945txvn.fsf@redhat.com> <YRpTqmv/yXU0cK5H@redhat.com>
 <87sfz9ttlo.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87sfz9ttlo.fsf@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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

On Mon, Aug 16, 2021 at 03:19:31PM +0200, Cornelia Huck wrote:
> On Mon, Aug 16 2021, Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > On Mon, Aug 16, 2021 at 01:47:08PM +0200, Cornelia Huck wrote:
> >> On Mon, Aug 16 2021, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >> 
> >> > When I'm working on changing gitlab CI rules, then I burn loads of
> >> > minutes which is especially troubling - limited CI minutes will make
> >> > it very hard for me to debug future CI rule changes :-(
> >> 
> >> I hope that will not make gitlab CI a complete non-starter -- if you
> >> cannot easily debug a test case that is failing, it's mostly
> >> useless. We've seen too many cases where a failure could not be
> >> reproduced when the test case was running locally.
> >
> > One of the best things about GitLab compared to what we had with
> > Travis is that the build environment is 100% container based (until
> > Cleber's custom runners arrived).  This meant that when something
> > does fail in GitLab, you can pull the container image down from
> > the gitlab registry and run the build locally. You still have
> > differences due to hardware or CPUs resources, but its a hell of
> > alot easier to reproduce than before. This is good enough for most
> > contributors in general, but not for the CI maintainers, who need
> > to debug especially the CI system as it exists on GitLab.
> 
> Correct me if I'm wrong, but I remember that some of the more
> aggravating failures in particular could not be reproduced outside of
> the gitlab environment, even while using the same image.

There will always be some like that for sure. Some problems are very
sensitive to timing issues that are affected by load or CPUs parallism,
etc.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



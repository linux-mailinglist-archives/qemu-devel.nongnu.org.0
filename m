Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D01440C257
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 11:05:07 +0200 (CEST)
Received: from localhost ([::1]:38798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQQqo-0007v5-6W
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 05:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQQmF-0005ff-Pc
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 05:00:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQQmC-0001Mk-AB
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 05:00:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631696418;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qBnPXf/CZCgRX2iFMLEO1yKgSrUKjsNmKZ24ZdCiNsg=;
 b=PMjkyxJ4F6WuI1yZIaila0X821ruuznR+VIxv1cuKQh7eZquhZrRMQzv/33+7S8KZnmWRG
 QVjH8oZqMHnpiCZRgWQxUNQqHLSNzn1phBRxeEHzC+AJ6lj62/D+E6MTFNTesu6yQ6IJr7
 jUBlcFGbv+rE3G9T549khb+lzHlI7is=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-TVF9ebA4PhGOUt72ufbPKg-1; Wed, 15 Sep 2021 05:00:07 -0400
X-MC-Unique: TVF9ebA4PhGOUt72ufbPKg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F09741B18BC7;
 Wed, 15 Sep 2021 09:00:05 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E5D7188E4;
 Wed, 15 Sep 2021 08:59:56 +0000 (UTC)
Date: Wed, 15 Sep 2021 09:59:54 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Willian Rampazzo <willianr@redhat.com>
Subject: Re: [RFC 1/1] docs/deve/ci-plan: define a high-level plan for the
 QEMU GitLab CI
Message-ID: <YUG2CnZalmiTMAGb@redhat.com>
References: <20210914184830.84454-1-willianr@redhat.com>
 <20210914184830.84454-2-willianr@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210914184830.84454-2-willianr@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 14, 2021 at 03:48:30PM -0300, Willian Rampazzo wrote:
> This adds a high-level plan for the QEMU GitLab CI based on use cases.
> The idea is to have a base for evolving the QEMU CI. It sets high-level
> characteristics for the QEMU CI use cases, which helps guide its
> development.
> 
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>  docs/devel/ci-plan.rst | 77 ++++++++++++++++++++++++++++++++++++++++++
>  docs/devel/ci.rst      |  1 +
>  2 files changed, 78 insertions(+)
>  create mode 100644 docs/devel/ci-plan.rst
> 
> diff --git a/docs/devel/ci-plan.rst b/docs/devel/ci-plan.rst
> new file mode 100644
> index 0000000000..5e95b6bcea
> --- /dev/null
> +++ b/docs/devel/ci-plan.rst
> @@ -0,0 +1,77 @@
> +The GitLab CI structure
> +=======================
> +
> +This section describes the current state of the QEMU GitLab CI and the
> +high-level plan for its future.
> +
> +Current state
> +-------------
> +
> +The mainstream QEMU project considers the GitLab CI its primary CI system.
> +Currently, it runs 120+ jobs, where ~36 are container build jobs, 69 are QEMU
> +build jobs, ~22 are test jobs, 1  is a web page deploy job, and 1 is an
> +external job covering Travis jobs execution.
> +
> +In the current state, every push a user does to its fork runs most of the jobs
> +compared to the jobs running on the main repository. The exceptions are the
> +acceptance tests jobs, which run automatically on the main repository only.
> +Running most of the jobs in the user's fork or the main repository is not
> +viable. The job number tends to increase, becoming impractical to run all of
> +them on every single push.
> +
> +Future of QEMU GitLab CI
> +------------------------
> +
> +Following is a proposal to establish a high-level plan and set the
> +characteristics for the QEMU GitLab CI. The idea is to organize the CI by use
> +cases, avoid wasting resources and CI minutes, anticipating the time GitLab
> +starts to enforce minutes limits soon.
> +
> +Use cases
> +^^^^^^^^^
> +
> +Below is a list of the most common use cases for the QEMU GitLab CI.
> +
> +Gating
> +""""""
> +
> +The gating set of jobs runs on the maintainer's pull requests when the project
> +leader pushes them to the staging branch of the project. The gating CI pipeline
> +has the following characteristics:
> +
> + * Jobs tagged as gating run as part of the gating CI pipeline;
> + * The gating CI pipeline consists of stable jobs;
> + * The execution duration of the gating CI pipeline should, as much as possible,
> +   have an upper bound limit of 2 hours.
> +
> +Developers
> +""""""""""
> +
> +A developer working on a new feature or fixing an issue may want to run/propose
> +a specific set of tests. Those tests may, eventually, benefit other developers.
> +A developer CI pipeline has the following characteristics:
> +
> + * It is easy to run current tests available in the project;
> + * It is easy to add new tests or remove unneeded tests;
> + * It is flexible enough to allow changes in the current jobs.
> +
> +Maintainers
> +"""""""""""
> +
> +When accepting developers' patches, a maintainer may want to run a specific
> +test set. A maintainer CI pipeline has the following characteristics:
> +
> + * It consists of tests that are valuable for the subsystem;
> + * It is easy to run a set of specific tests available in the project;
> + * It is easy to add new tests or remove unneeded tests.


Neither of these describe why I use CI as a developer and/or subsys 
maintainer.

My desire with using CI is to (as close as possible) be able to 
execute the exact same  set of tests that will be run by gating CI
on pull requests.

My goal is to minimize (ideally eliminate) the risk that a patch 
series or pull request gets rejected with a need to re-spin due 
to CI failures. Each such rejection causes a round trip delaying 
merge, and this wastes my time & the maintainer/gate keepers' time. 
It is also hard to debug failures if I can't replicate the gating 
CI myself.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



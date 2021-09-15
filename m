Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B9540C6CD
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 15:55:51 +0200 (CEST)
Received: from localhost ([::1]:40630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQVOA-0005cC-TV
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 09:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mQVL3-0002Ob-Sa
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 09:52:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mQVKz-00051Z-0L
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 09:52:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631713951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E35ifzs9Agw0/3h8lusz5Ktyp/hcY9yb56znZ4upjms=;
 b=INGxIyVqvyPEKx4olK8w9ETDNlswRx7DvsLxtlThI8etRJimymiUhS7t03uzM8XBhdC/kc
 FpdvEuQ2I9GCcegZ9UpWlpd/sJsZWKHzhVByozQ616a9zc7lo5HqNn2PRhHiOUjlSjS9uV
 pb0l0KhMOXRsTUF07Nov5wiNZM5vB5o=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-SYE2qwz_OIm9deC1SlYDPQ-1; Wed, 15 Sep 2021 09:52:24 -0400
X-MC-Unique: SYE2qwz_OIm9deC1SlYDPQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 z8-20020a17090acb0800b001996f635e3bso1788704pjt.6
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 06:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E35ifzs9Agw0/3h8lusz5Ktyp/hcY9yb56znZ4upjms=;
 b=CWjFiNMf4mDcSh/0GcZOs6FHnyxx33Ykx1X/6gdMRwXtU2iWm0H4dVAlnhG35AsWF/
 1v/h/yy2fqRj2AEj0fKt2qrBxPzV9I4vZ0HG0tHwGifxzwjmfHtZgaezAsO6MmgOZvcT
 la/JWGlkPaeuXenJqxKTlr1ajw0IO3Jwgyp0irCVW/HITOL4pVkvE6kwiK/K7CFHYp1b
 DFE5y3yOYYdzwORky41rN40lYocS6U4nExNIaDA+ciwBD7AdIMYFXbc19NSqu4t9lEMS
 I8x56nQZ2zCjLvMcbCiasqBvplFK+4SHNGFPpVEZ2ys/d6vwsGgTFMYWtavrjAsyAx+D
 sORA==
X-Gm-Message-State: AOAM532w0xH7BQHxc0eovhFlwX12XfLI903gefAfkhxllDhM9fO/yOeh
 gl5VTn9KYVJzGg6xTfsFsMluPmjTqS8o17JVMIkz9FzjmD2WqULVzgrpu0+dNpCWLcb3Z6QuH8g
 JSxfP8XPQlyh8WCn2WUw/j0ZKishmmSQ=
X-Received: by 2002:a63:9d4c:: with SMTP id i73mr20299331pgd.216.1631713943755; 
 Wed, 15 Sep 2021 06:52:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztaZ9OrlxMjohYK7EgVlucWF3f/AP8sQ9hhNBLNaOUj5y57piLjL5TymR9iC5geByKTLl/SfFYJyPo4rJ14Jo=
X-Received: by 2002:a63:9d4c:: with SMTP id i73mr20299304pgd.216.1631713943345; 
 Wed, 15 Sep 2021 06:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210914184830.84454-1-willianr@redhat.com>
 <20210914184830.84454-2-willianr@redhat.com>
 <YUG2CnZalmiTMAGb@redhat.com>
In-Reply-To: <YUG2CnZalmiTMAGb@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 15 Sep 2021 10:51:56 -0300
Message-ID: <CAKJDGDb-4kTDFHX9J-kf13E2AXnhMz4EDNZGODSFTrTfrCUbBA@mail.gmail.com>
Subject: Re: [RFC 1/1] docs/deve/ci-plan: define a high-level plan for the
 QEMU GitLab CI
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 6:00 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Tue, Sep 14, 2021 at 03:48:30PM -0300, Willian Rampazzo wrote:
> > This adds a high-level plan for the QEMU GitLab CI based on use cases.
> > The idea is to have a base for evolving the QEMU CI. It sets high-level
> > characteristics for the QEMU CI use cases, which helps guide its
> > development.
> >
> > Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> > ---
> >  docs/devel/ci-plan.rst | 77 ++++++++++++++++++++++++++++++++++++++++++
> >  docs/devel/ci.rst      |  1 +
> >  2 files changed, 78 insertions(+)
> >  create mode 100644 docs/devel/ci-plan.rst
> >
> > diff --git a/docs/devel/ci-plan.rst b/docs/devel/ci-plan.rst
> > new file mode 100644
> > index 0000000000..5e95b6bcea
> > --- /dev/null
> > +++ b/docs/devel/ci-plan.rst
> > @@ -0,0 +1,77 @@
> > +The GitLab CI structure
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +This section describes the current state of the QEMU GitLab CI and the
> > +high-level plan for its future.
> > +
> > +Current state
> > +-------------
> > +
> > +The mainstream QEMU project considers the GitLab CI its primary CI sys=
tem.
> > +Currently, it runs 120+ jobs, where ~36 are container build jobs, 69 a=
re QEMU
> > +build jobs, ~22 are test jobs, 1  is a web page deploy job, and 1 is a=
n
> > +external job covering Travis jobs execution.
> > +
> > +In the current state, every push a user does to its fork runs most of =
the jobs
> > +compared to the jobs running on the main repository. The exceptions ar=
e the
> > +acceptance tests jobs, which run automatically on the main repository =
only.
> > +Running most of the jobs in the user's fork or the main repository is =
not
> > +viable. The job number tends to increase, becoming impractical to run =
all of
> > +them on every single push.
> > +
> > +Future of QEMU GitLab CI
> > +------------------------
> > +
> > +Following is a proposal to establish a high-level plan and set the
> > +characteristics for the QEMU GitLab CI. The idea is to organize the CI=
 by use
> > +cases, avoid wasting resources and CI minutes, anticipating the time G=
itLab
> > +starts to enforce minutes limits soon.
> > +
> > +Use cases
> > +^^^^^^^^^
> > +
> > +Below is a list of the most common use cases for the QEMU GitLab CI.
> > +
> > +Gating
> > +""""""
> > +
> > +The gating set of jobs runs on the maintainer's pull requests when the=
 project
> > +leader pushes them to the staging branch of the project. The gating CI=
 pipeline
> > +has the following characteristics:
> > +
> > + * Jobs tagged as gating run as part of the gating CI pipeline;
> > + * The gating CI pipeline consists of stable jobs;
> > + * The execution duration of the gating CI pipeline should, as much as=
 possible,
> > +   have an upper bound limit of 2 hours.
> > +
> > +Developers
> > +""""""""""
> > +
> > +A developer working on a new feature or fixing an issue may want to ru=
n/propose
> > +a specific set of tests. Those tests may, eventually, benefit other de=
velopers.
> > +A developer CI pipeline has the following characteristics:
> > +
> > + * It is easy to run current tests available in the project;
> > + * It is easy to add new tests or remove unneeded tests;
> > + * It is flexible enough to allow changes in the current jobs.
> > +
> > +Maintainers
> > +"""""""""""
> > +
> > +When accepting developers' patches, a maintainer may want to run a spe=
cific
> > +test set. A maintainer CI pipeline has the following characteristics:
> > +
> > + * It consists of tests that are valuable for the subsystem;
> > + * It is easy to run a set of specific tests available in the project;
> > + * It is easy to add new tests or remove unneeded tests.
>
>
> Neither of these describe why I use CI as a developer and/or subsys
> maintainer.
>
> My desire with using CI is to (as close as possible) be able to
> execute the exact same  set of tests that will be run by gating CI
> on pull requests.

I totally understand your desire and I think it is valid.

What I'm trying with this proposal is the same strategy we used when
we started planning for the gating CI. The decision was to start
small. Today the CI grew and we don=C2=B4t have a so called gating CI yet,
but a bunch of jobs that runs on staging branch, some needing
reevaluation whether they should run on staging or not.

My proposal is to organize the CI, so it runs a gating set of jobs and
is flexible enough for developers and maintainers. Just like when we
started planning for the CI, this is another step I think we need to
take now. Unfortunately, at this time, flexibility does not mean
running all the gating jobs mainly because of hardware limitations.
Still, I don't think we can continue without organizing what we have
today.

>
> My goal is to minimize (ideally eliminate) the risk that a patch
> series or pull request gets rejected with a need to re-spin due
> to CI failures. Each such rejection causes a round trip delaying
> merge, and this wastes my time & the maintainer/gate keepers' time.
> It is also hard to debug failures if I can't replicate the gating
> CI myself.

Again, I totally agree with you. That would be the perfect scenario.

The barrier I see to have it working the way you described is the
hardware access. The staging branch runs on two different custom
runners. We have two possible solutions to accomplish the scenario you
described: remove the custom runners from the staging branch and let
the jobs run on the GitLab CI shared runners, which everyone with
access to GitLab can use, or allow developers to access the custom
runners.

Today, I don=C2=B4t think any of those options are feasible or bring value
to the project. That is one of the reasons I'm not covering it now in
the future plan. As I mentioned before, let's take another small step
and organize a gating CI with some ground rules. When we reach it, the
future future step can be to implement merge requests, think about
reproducibility, and so on.

>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>



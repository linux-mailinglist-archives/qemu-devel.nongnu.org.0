Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A033ED316
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 13:33:52 +0200 (CEST)
Received: from localhost ([::1]:56950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFasJ-0003Pa-DL
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 07:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mFaq7-0002KO-OZ
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:31:35 -0400
Received: from relay68.bu.edu ([128.197.228.73]:40276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mFaq5-0002cu-H7
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:31:34 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 17GBUxTN005578
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 16 Aug 2021 07:31:02 -0400
Date: Mon, 16 Aug 2021 07:30:59 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PULL 00/11] Optional gitlab-CI and doc fixes for -rc4
Message-ID: <20210816113059.h2srf2tmvylzhhjp@mozz.bu.edu>
References: <20210814060956.12852-1-thuth@redhat.com>
 <CAFEAcA9ur-HX4r30QgEAL73VEgA+=XXpWW6v9arKcM=ijEsHvA@mail.gmail.com>
 <20210816102246.z4ybsgpmrn4isdoj@mozz.bu.edu>
 <YRpHxjyz8+Su4ziA@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YRpHxjyz8+Su4ziA@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.998,
 HK_RANDOM_FROM=0.256, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210816 1211, Daniel P. Berrangé wrote:
> On Mon, Aug 16, 2021 at 06:22:46AM -0400, Alexander Bulekov wrote:
> > On 210816 1001, Peter Maydell wrote:
> > > On Sat, 14 Aug 2021 at 07:10, Thomas Huth <thuth@redhat.com> wrote:
> > > >
> > > >  Hi Peter,
> > > >
> > > > in case we're going to have an -rc4, here's a pull request that contains
> > > > the fixes for getting the gitlab-CI green again. I also added some doc
> > > > updates since they should be completely riskless. But if we won't have an
> > > > rc4 due to other reasons, this pull request here certainly also does not
> > > > justify another RC, so please ignore this PR in that case.
> > > >
> > > > The following changes since commit 703e8cd6189cf699c8d5c094bc68b5f3afa6ad71:
> > > >
> > > >   Update version for v6.1.0-rc3 release (2021-08-10 19:08:09 +0100)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >   https://gitlab.com/thuth/qemu.git tags/pull-request-2021-08-11
> > > >
> > > > for you to fetch changes up to 36b508993c4dcc6b3ef4b5c00e293ee9560926ee:
> > > >
> > > >   docs/about/removed-features: Document removed machines from older QEMU versions (2021-08-11 15:39:09 +0200)
> > > >
> > > > CI run can be seen here:
> > > >
> > > >  https://gitlab.com/thuth/qemu/-/pipelines/351602605
> > > >
> > > > ----------------------------------------------------------------
> > > > * Fixes for the gitlab-CI (fix the hanging  build-oss-fuzz pipeline)
> > > > * Add documentation about features that have been removed in older versions
> > > >
> > > 
> > > 
> > > Applied, thanks.
> > > 
> > > Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
> > > for any user-visible changes.
> > 
> > https://gitlab.com/qemu-project/qemu/-/jobs/1505950978
> > Looks like build-oss-fuzz is still timing out, even without the issue
> > in the vhost-usr-blk test. At this point the job should essentially just
> > build + test qemu-system-i386 with some extra time spent on linking
> > the fuzzer and briefly running through all the fuzzer configs. Maybe the
> > only way to make this work is to split the job into a build + test
> > stage?
> 
> At this point I think we should just disable the job in gitlab entirely.
> We've spent too long debugging this, while leaving CI red for everyone.
> 
> Whomever is interested in this can then work to find a way to make it
> reliable and request it be re-enabled once confident that it will work.
> 

On my mirror the job succeeded in 41 minutes... I guess you have to get
lucky with scheduling/ambient load.
https://gitlab.com/a1xndr/qemu/-/jobs/1506197531

If all we want is to check that oss-fuzz builds work while keeping green
CI, the only thing that needs to be done is to remove the "make check
check-qtest-i386 check-unit" from the job.

The problem is that QEMU has a ton of nice tests, and by simply building
with --enable-sanitizers, these tests become even more useful because we
can catch all sorts of memory-corruptions. In fact, some of the
regression tests require --enable-sanitizers to catch issues.  When I
looked at this originally, build-oss-fuzz was the only job that was
running with any sanitizers. Now, it looks like at least
ubuntu-18.04-s390x-clang and ubuntu-20.04-aarch64-clang also build with
ASAN. Is there some other i386 build (gcc or clang) where we could add
--enable-sanitizers?

-Alex


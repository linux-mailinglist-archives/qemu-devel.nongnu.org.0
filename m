Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BD43ED39F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 14:04:37 +0200 (CEST)
Received: from localhost ([::1]:34832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFbM4-0003RW-QA
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 08:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mFbIk-0001DM-Es
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 08:01:10 -0400
Received: from relay68.bu.edu ([128.197.228.73]:42140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mFbIf-0001Qw-B4
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 08:01:09 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 17GC0ZLa003923
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 16 Aug 2021 08:00:38 -0400
Date: Mon, 16 Aug 2021 08:00:35 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PULL 00/11] Optional gitlab-CI and doc fixes for -rc4
Message-ID: <20210816120035.osxwtkzukwogyvup@mozz.bu.edu>
References: <20210814060956.12852-1-thuth@redhat.com>
 <CAFEAcA9ur-HX4r30QgEAL73VEgA+=XXpWW6v9arKcM=ijEsHvA@mail.gmail.com>
 <20210816102246.z4ybsgpmrn4isdoj@mozz.bu.edu>
 <YRpHxjyz8+Su4ziA@redhat.com>
 <20210816113059.h2srf2tmvylzhhjp@mozz.bu.edu>
 <0d9764a2-a2f1-e33d-8183-a150d738f783@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d9764a2-a2f1-e33d-8183-a150d738f783@redhat.com>
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
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210816 1340, Philippe Mathieu-Daudé wrote:
> On 8/16/21 1:30 PM, Alexander Bulekov wrote:
> > On 210816 1211, Daniel P. Berrangé wrote:
> >> On Mon, Aug 16, 2021 at 06:22:46AM -0400, Alexander Bulekov wrote:
> 
> >>> https://gitlab.com/qemu-project/qemu/-/jobs/1505950978
> >>> Looks like build-oss-fuzz is still timing out, even without the issue
> >>> in the vhost-usr-blk test. At this point the job should essentially just
> >>> build + test qemu-system-i386 with some extra time spent on linking
> >>> the fuzzer and briefly running through all the fuzzer configs. Maybe the
> >>> only way to make this work is to split the job into a build + test
> >>> stage?
> >>
> >> At this point I think we should just disable the job in gitlab entirely.
> >> We've spent too long debugging this, while leaving CI red for everyone.
> >>
> >> Whomever is interested in this can then work to find a way to make it
> >> reliable and request it be re-enabled once confident that it will work.
> >>
> > 
> > On my mirror the job succeeded in 41 minutes... I guess you have to get
> > lucky with scheduling/ambient load.
> > https://gitlab.com/a1xndr/qemu/-/jobs/1506197531
> 
> TBH I stopped looking at this job console out because it fails too often
> in my pipelines :(
> 

Of course if the job times out 50% of the time, nobody will want to look
at it. And as a result, issues like the one with the vhost-user-blk
test are unnoticed. My hope was that removing the redundant build would
take care of timeouts. Maybe if we find that this new sporadic
timeout issue is also due to some test-failure, the job will again be
useful for someone.
-Alex


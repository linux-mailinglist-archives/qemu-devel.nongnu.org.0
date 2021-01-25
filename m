Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF70302B71
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 20:21:29 +0100 (CET)
Received: from localhost ([::1]:36002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l47QW-0001yA-6f
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 14:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l47GN-0005v7-3c
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 14:11:00 -0500
Received: from relay68.bu.edu ([128.197.228.73]:55595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l47GL-00083g-5d
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 14:10:58 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 10PJ9t4J020222
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 25 Jan 2021 14:09:58 -0500
Date: Mon, 25 Jan 2021 14:09:55 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/7] 2021-01-20 fuzzing patches
Message-ID: <20210125190955.crxoyqbezzvdwois@mozz.bu.edu>
References: <20210120174456.275312-1-alxndr@bu.edu>
 <CAFEAcA8QNMiFe5p=-agvvnfFY_teMR3s-8AfT3OEa6GCK-Y=kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8QNMiFe5p=-agvvnfFY_teMR3s-8AfT3OEa6GCK-Y=kg@mail.gmail.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210122 1506, Peter Maydell wrote:
> On Wed, 20 Jan 2021 at 17:45, Alexander Bulekov <alxndr@bu.edu> wrote:
> >
> > Hi Peter,
> >
> > The following changes since commit 48202c712412c803ddb56365c7bca322aa4e7506:
> >
> >   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210119-1' into staging (2021-01-19 15:47:23 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/a1xndr/qemu.git tags/pull-request-2021-01-20
> >
> > for you to fetch changes up to fae446ae7b6f746377186b3e19fd3f732a8b4325:
> >
> >   fuzz: add virtio-9p configurations for fuzzing (2021-01-20 12:30:26 -0500)
> 
> Hi; some of these commits seem to be missing Reviewed-by: tags;
> for instance "ignore address_space_map is_write flag" got a
> Reviewed-by from Darren Kenny, and that tag is visible in the
> (second) copy of the email for the pullreq that you sent to the
> list, but it isn't in the commit that's at the tag you name above,
> and it's the commits in the git repo that end up in master, not
> the patch emails sent to the list.
> 
> Also, are you in a position to get your GPG key signed by
> anybody else? I appreciate that that's pretty tricky right
> now given Covid, but if you have the opportunity at some point
> that would be useful.
> 

Hi Peter,
Thank you for these pointers. I resent a PR with fixed tags. I should
also now have a few signatures on my key. I realized that Paolo asked me
to send the PR to him, so I fixed that in my RESEND.
Thanks again
-Alex

> thanks
> -- PMM


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3122461CC5
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 18:33:04 +0100 (CET)
Received: from localhost ([::1]:49150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrkWV-0006Uv-Pw
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 12:33:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1mrkTM-0004WK-E4
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:29:48 -0500
Received: from mga01.intel.com ([192.55.52.88]:13834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1mrkTJ-0003S8-Hd
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:29:47 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="259954283"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="259954283"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 09:16:34 -0800
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="600267741"
Received: from dsshah-mobl2.amr.corp.intel.com (HELO intel.com)
 ([10.252.141.244])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 09:16:33 -0800
Date: Mon, 29 Nov 2021 09:16:31 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: Follow-up on the CXL discussion at OFTC
Message-ID: <20211129171631.ytixckw2gz3rya25@intel.com>
References: <OF255704A1.78FEF164-ON0025878E.00821084-0025878F.00015560@ibm.com>
 <20211117165719.pqig62t5z2grgjvv@intel.com>
 <20211117173201.00002513@Huawei.com>
 <OF164E5BA6.E927FE73-ON00258791.0078E206-88258791.007ABBAD@ibm.com>
 <BY5PR12MB4179A47F68A9A15E5888D074E89B9@BY5PR12MB4179.namprd12.prod.outlook.com>
 <20211119014822.j247ayrsdve4yxyu@intel.com>
 <BY5PR12MB4179AA1B062AEA75098E15D8E89C9@BY5PR12MB4179.namprd12.prod.outlook.com>
 <20211119032541.gr6berwu2ve4tkax@intel.com>
 <8735njf6f7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8735njf6f7.fsf@linaro.org>
Received-SPF: pass client-ip=192.55.52.88; envelope-from=ben.widawsky@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Saransh Gupta1 <saransh@ibm.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Shreyas Shah <shreyas.shah@elastics.cloud>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-11-26 12:08:08, Alex Bennée wrote:
> 
> Ben Widawsky <ben.widawsky@intel.com> writes:
> 
> > On 21-11-19 02:29:51, Shreyas Shah wrote:
> >> Hi Ben
> >> 
> >> Are you planning to add the CXL2.0 switch inside QEMU or already added in one of the version? 
> >>  
> >
> > From me, there are no plans for QEMU anything until/unless upstream thinks it
> > will merge the existing patches, or provide feedback as to what it would take to
> > get them merged. If upstream doesn't see a point in these patches, then I really
> > don't see much value in continuing to further them. Once hardware comes out, the
> > value proposition is certainly less.
> 
> I take it:
> 
>   Subject: [RFC PATCH v3 00/31] CXL 2.0 Support
>   Date: Mon,  1 Feb 2021 16:59:17 -0800
>   Message-Id: <20210202005948.241655-1-ben.widawsky@intel.com>
> 
> is the current state of the support? I saw there was a fair amount of
> discussion on the thread so assumed there would be a v4 forthcoming at
> some point.

Hi Alex,

There is a v4, however, we never really had a solid plan for the primary issue
which was around handling CXL memory expander devices properly (both from an
interleaving standpoint as well as having a device which hosts multiple memory
capacities, persistent and volatile). I didn't feel it was worth sending a v4
unless someone could say
1. we will merge what's there and fix later, or
2. you must have a more perfect emulation in place, or
3. we want to see usages for a real guest

I had hoped we could merge what was there mostly as is and fix it up as we go.
It's useful in the state it is now, and as time goes on, we find more usecases
for it in a VMM, and not just driver development.

> 
> Adding new subsystems to QEMU does seem to be a pain point for new
> contributors. Patches tend to fall through the cracks of existing
> maintainers who spend most of their time looking at stuff that directly
> touches their files. There is also a reluctance to merge large chunks of
> functionality without an identified maintainer (and maybe reviewers) who
> can be the contact point for new patches. So in short you need:
> 
>  - Maintainer Reviewed-by/Acked-by on patches that touch other sub-systems

This is the challenging one. I have Cc'd the relevant maintainers (hw/pci and
hw/mem are the two) in the past, but I think there interest is lacking (and
reasonably so, it is an entirely different subsystem).

>  - Reviewed-by tags on the new sub-system patches from anyone who understands CXL

I have/had those from Jonathan.

>  - Some* in-tree testing (so it doesn't quietly bitrot)

We had this, but it's stale now. We can bring this back up.

>  - A patch adding the sub-system to MAINTAINERS with identified people

That was there too. Since the original posting, I'd be happy to sign Jonathan up
to this if he's willing.

> 
> * Some means at least ensuring qtest can instantiate the device and not
>   fall over. Obviously more testing is better but it can always be
>   expanded on in later series.

This was in the patch series. It could use more testing for sure, but I had
basic functional testing in place via qtest.

> 
> Is that the feedback you were looking for?

You validated my assumptions as to what's needed, but your first bullet is the
one I can't seem to pin down.

Thanks.
Ben


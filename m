Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3704577B2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 21:24:30 +0100 (CET)
Received: from localhost ([::1]:35370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moAQv-0006xW-O1
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 15:24:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1moAOO-0005Ur-IJ
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 15:21:52 -0500
Received: from mga17.intel.com ([192.55.52.151]:54279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1moAOK-0004ce-8q
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 15:21:51 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10173"; a="215200140"
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="215200140"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 12:21:46 -0800
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="508043949"
Received: from jfaistl-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.252.139.58])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 12:21:45 -0800
Date: Fri, 19 Nov 2021 12:21:44 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: Follow-up on the CXL discussion at OFTC
Message-ID: <20211119202144.inylk6pbeozqmq3p@intel.com>
References: <OF255704A1.78FEF164-ON0025878E.00821084-0025878F.00015560@ibm.com>
 <20211117165719.pqig62t5z2grgjvv@intel.com>
 <20211117173201.00002513@Huawei.com>
 <OF164E5BA6.E927FE73-ON00258791.0078E206-88258791.007ABBAD@ibm.com>
 <20211119015207.62fhk5mjmvaj5nz4@intel.com>
 <20211119185343.000020c0@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119185343.000020c0@Huawei.com>
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=ben.widawsky@intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: linux-cxl@vger.kernel.org, Saransh Gupta1 <saransh@ibm.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-11-19 18:53:43, Jonathan Cameron wrote:
> On Thu, 18 Nov 2021 17:52:07 -0800
> Ben Widawsky <ben.widawsky@intel.com> wrote:
> 
> > On 21-11-18 15:20:34, Saransh Gupta1 wrote:
> > > Hi Ben and Jonathan,
> > > 
> > > Thanks for your replies. I'm looking forward to the patches.
> > > 
> > > For QEMU, I see hotplug support as an item on the list and would like to 
> > > start working on it. It would be great if you can provide some pointers 
> > > about how I should go about it.  
> > 
> > It's been a while, so I can't recall what's actually missing. I think it should
> > mostly behave like a normal PCIe endpoint.
> > 
> > > Also, which version of kernel and QEMU (maybe Jonathan's upcoming version) 
> > > would be a good starting point for it?  
> > 
> > If he rebased and claims it works I have no reason to doubt it :-). I have a
> > small fix on my v4 branch if you want to use the latest port patches.
> 
> Thanks. I'd missed that one. Now pushed down into the original patch.
> 
> It occurred to me that technically I only know my rebase works on Arm64...
> Fingers crossed for x86.
> 
> Anyhow, I'll run more tests on it next week (possibly even including x86),
> 
> Available at: 
> https://github.com/hisilicon/qemu/tree/cxl-hacks
> 
> For arm64 the description at
> https://people.kernel.org/jic23/ will almost work with this. 
> There is a bug however that I need to track down which currently means you
> need to set the pxb uid to the same as the bus number.   Shouldn't take
> long to fix but it's Friday evening...
> (add uid=0x80 to the options for pxb-cxl)
> 
> I dropped the CMA patch from Avery from this tree as need to improve
> the way it's getting hold of some parts of libSPDM and move to the current
> version of that library (rather than the old openSPDM)
> 
> Ben, if you don't mind me trying to push this forwards, I'll do a bit
> of cleanup and reordering then make use of the QEMU folks we have / know and
> try and start getting your hard work upstream.

I don't mind at all.

> 
> Whilst I've not poked the various interfaces yet, this is working with
> a kernel tree that is current cxl/next + Ira's DOE series and Ben's region series
> + (for fun) my SPDM series.  That tree's a franken monster so I'm not planning
> to share it unless anyone has particular need of it.  Hopefully the various
> parts will move forwards this cycle anyway so I can stop having to spend
> as much time on rebases!
> 
> Jonathan 
> 
> > 
> > > 
> > > Thanks,
> > > Saransh
> > > 
> > > 
> > > 
> > > From:   "Jonathan Cameron" <Jonathan.Cameron@Huawei.com>
> > > To:     "Ben Widawsky" <ben.widawsky@intel.com>
> > > Cc:     "Saransh Gupta1" <saransh@ibm.com>, <linux-cxl@vger.kernel.org>, 
> > > <qemu-devel@nongnu.org>
> > > Date:   11/17/2021 09:32 AM
> > > Subject:        [EXTERNAL] Re: Follow-up on the CXL discussion at OFTC
> > > 
> > > 
> > > 
> > > On Wed, 17 Nov 2021 08:57:19 -0800
> > > Ben Widawsky <ben.widawsky@intel.com> wrote:
> > >   
> > > > Hi Saransh. Please add the list for these kind of questions. I've   
> > > converted your  
> > > > HTML mail, but going forward, the list will eat it, so please use text   
> > > only.  
> > > > 
> > > > On 21-11-16 00:14:33, Saransh Gupta1 wrote:  
> > > > >    Hi Ben,
> > > > > 
> > > > >    This is Saransh from IBM. Sorry to have (unintentionally) dropped   
> > > out  
> > > > >    of the conversion on OFTC, I'm new to IRC.
> > > > >    Just wanted to follow-up on the discussion there. We discussed   
> > > about  
> > > > >    helping with linux patches reviews. On that front, I have   
> > > identified  
> > > > >    some colleague(s) who can help me with this. Let me know if/how you
> > > > >    want to proceed with that.   
> > > > 
> > > > Currently the ball is in my court to re-roll the RFC v2 patches [1]   
> > > based on  
> > > > feedback from Dan. I've implemented all/most of it, but I'm still   
> > > debugging some  
> > > > issues with the result.
> > > >   
> > > > > 
> > > > >    Maybe not urgently, but my team would also like to get an   
> > > understanding  
> > > > >    of the missing pieces in QEMU. Initially our focus is on type3   
> > > memory  
> > > > >    access and hotplug support. Most of the work that my team does is
> > > > >    open-source, so contributing to the QEMU effort is another possible
> > > > >    line of collaboration.   
> > > > 
> > > > If you haven't seen it already, check out my LPC talk [2]. The QEMU   
> > > patches  
> > > > could use a lot of love. Mostly, I have little/no motivation until   
> > > upstream  
> > > > shows an interest because I don't have time currently to make sure I   
> > > don't break  
> > > > vs. upstream. If you want more details here, I can provide them, and I   
> > > will Cc  
> > > > the qemu-devel mailing list; the end of the LPC talk [2] does have a   
> > > list.
> > > Hi Ben, Saransh
> > > 
> > > I have a forward port of the series + DOE etc to near current QEMU that is 
> > > lightly tested,
> > > and can look to push that out publicly later this week.
> > > 
> > > I'd also like to push QEMU support forwards and to start getting this 
> > > upstream in QEMU
> > > + fill in some of the missing parts.
> > > 
> > > Was aiming to make progress on this a few weeks ago, but as ever other 
> > > stuff
> > > got in the way.
> > > 
> > > +CC qemu-devel in case anyone else also looking at this.
> > > 
> > > Jonathan
> > > 
> > > 
> > >   
> > > >   
> > > > > 
> > > > >    Thanks for your help and guidance!
> > > > > 
> > > > >    Best,
> > > > >    Saransh Gupta
> > > > >    Research Staff Member, IBM Research   
> > > > 
> > > > [1]:   
> > > https://lore.kernel.org/linux-cxl/20211022183709.1199701-1-ben.widawsky@intel.com/T/#t 
> > >   
> > > > [2]:   
> > > https://www.youtube.com/watch?v=g89SLjt5Bd4&list=PLVsQ_xZBEyN3wA8Ej4BUjudXFbXuxhnfc&index=49 
> > > 
> > > 
> > > 
> > > 
> > > 
> > >   
> 


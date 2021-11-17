Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B010454C07
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:34:06 +0100 (CET)
Received: from localhost ([::1]:34982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOov-00044d-F0
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:34:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1mnOn6-0002Yw-Q2
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:32:13 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1mnOn2-00008N-Oz
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:32:11 -0500
Received: from fraeml712-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4HvVNV1r9Xz67KQL;
 Thu, 18 Nov 2021 01:31:54 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml712-chm.china.huawei.com (10.206.15.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 17 Nov 2021 18:32:04 +0100
Received: from localhost (10.52.126.160) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 17 Nov
 2021 17:32:04 +0000
Date: Wed, 17 Nov 2021 17:32:01 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: Follow-up on the CXL discussion at OFTC
Message-ID: <20211117173201.00002513@Huawei.com>
In-Reply-To: <20211117165719.pqig62t5z2grgjvv@intel.com>
References: <OF255704A1.78FEF164-ON0025878E.00821084-0025878F.00015560@ibm.com>
 <20211117165719.pqig62t5z2grgjvv@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.126.160]
X-ClientProxiedBy: lhreml719-chm.china.huawei.com (10.201.108.70) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: linux-cxl@vger.kernel.org, Saransh Gupta1 <saransh@ibm.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Nov 2021 08:57:19 -0800
Ben Widawsky <ben.widawsky@intel.com> wrote:

> Hi Saransh. Please add the list for these kind of questions. I've converted your
> HTML mail, but going forward, the list will eat it, so please use text only.
> 
> On 21-11-16 00:14:33, Saransh Gupta1 wrote:
> >    Hi Ben,
> > 
> >    This is Saransh from IBM. Sorry to have (unintentionally) dropped out
> >    of the conversion on OFTC, I'm new to IRC.
> >    Just wanted to follow-up on the discussion there. We discussed about
> >    helping with linux patches reviews. On that front, I have identified
> >    some colleague(s) who can help me with this. Let me know if/how you
> >    want to proceed with that.  
> 
> Currently the ball is in my court to re-roll the RFC v2 patches [1] based on
> feedback from Dan. I've implemented all/most of it, but I'm still debugging some
> issues with the result.
> 
> > 
> >    Maybe not urgently, but my team would also like to get an understanding
> >    of the missing pieces in QEMU. Initially our focus is on type3 memory
> >    access and hotplug support. Most of the work that my team does is
> >    open-source, so contributing to the QEMU effort is another possible
> >    line of collaboration.  
> 
> If you haven't seen it already, check out my LPC talk [2]. The QEMU patches
> could use a lot of love. Mostly, I have little/no motivation until upstream
> shows an interest because I don't have time currently to make sure I don't break
> vs. upstream. If you want more details here, I can provide them, and I will Cc
> the qemu-devel mailing list; the end of the LPC talk [2] does have a list.
Hi Ben, Saransh

I have a forward port of the series + DOE etc to near current QEMU that is lightly tested,
and can look to push that out publicly later this week.

I'd also like to push QEMU support forwards and to start getting this upstream in QEMU
+ fill in some of the missing parts.

Was aiming to make progress on this a few weeks ago, but as ever other stuff
got in the way.

+CC qemu-devel in case anyone else also looking at this.

Jonathan



> 
> > 
> >    Thanks for your help and guidance!
> > 
> >    Best,
> >    Saransh Gupta
> >    Research Staff Member, IBM Research  
> 
> [1]: https://lore.kernel.org/linux-cxl/20211022183709.1199701-1-ben.widawsky@intel.com/T/#t
> [2]: https://www.youtube.com/watch?v=g89SLjt5Bd4&list=PLVsQ_xZBEyN3wA8Ej4BUjudXFbXuxhnfc&index=49



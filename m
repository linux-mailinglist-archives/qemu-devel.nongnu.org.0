Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742F659745C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:43:07 +0200 (CEST)
Received: from localhost ([::1]:35630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOM8I-0001Nf-JP
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oOM0V-0000Dv-6o; Wed, 17 Aug 2022 12:35:05 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oOM0S-0008TS-71; Wed, 17 Aug 2022 12:35:02 -0400
Received: from fraeml741-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4M7Cgf4sGSz67Lkw;
 Thu, 18 Aug 2022 00:11:26 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml741-chm.china.huawei.com (10.206.15.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 17 Aug 2022 18:16:20 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 17 Aug
 2022 17:16:20 +0100
Date: Wed, 17 Aug 2022 17:16:19 +0100
To: Dan Williams <dan.j.williams@intel.com>
CC: Bobo WL <lmw.bobo@gmail.com>, <linux-cxl@vger.kernel.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: Re: [BUG] cxl can not create region
Message-ID: <20220817171619.000021ca@huawei.com>
In-Reply-To: <62f5a2ffe8be0_3ce68294a4@dwillia2-xfh.jf.intel.com.notmuch>
References: <CAGr_yG0UrfJAMWta3EkR1F0JZ4j--sig74p6vKL3K6TZDx9YGA@mail.gmail.com>
 <62f132aee401b_1b3c294c@dwillia2-xfh.jf.intel.com.notmuch>
 <CAGr_yG389Bm_NL8CLgo_ZkGd4staocNENbtb-ULVA5vh_ywmcw@mail.gmail.com>
 <62f27a8e9acb6_1f18b294e2@dwillia2-xfh.jf.intel.com.notmuch>
 <62f5a2ffe8be0_3ce68294a4@dwillia2-xfh.jf.intel.com.notmuch>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Thu, 11 Aug 2022 17:46:55 -0700
Dan Williams <dan.j.williams@intel.com> wrote:

> Dan Williams wrote:
> > Bobo WL wrote:  
> > > Hi Dan,
> > > 
> > > Thanks for your reply!
> > > 
> > > On Mon, Aug 8, 2022 at 11:58 PM Dan Williams <dan.j.williams@intel.com> wrote:  
> > > >
> > > > What is the output of:
> > > >
> > > >     cxl list -MDTu -d decoder0.0
> > > >
> > > > ...? It might be the case that mem1 cannot be mapped by decoder0.0, or
> > > > at least not in the specified order, or that validation check is broken.  
> > > 
> > > Command "cxl list -MDTu -d decoder0.0" output:  
> > 
> > Thanks for this, I think I know the problem, but will try some
> > experiments with cxl_test first.  
> 
> Hmm, so my cxl_test experiment unfortunately passed so I'm not
> reproducing the failure mode. This is the result of creating x4 region
> with devices directly attached to a single host-bridge:
> 
> # cxl create-region -d decoder3.5 -w 4 -m -g 256 mem{12,10,9,11} -s $((1<<30))
> {
>   "region":"region8",
>   "resource":"0xf1f0000000",
>   "size":"1024.00 MiB (1073.74 MB)",
>   "interleave_ways":4,
>   "interleave_granularity":256,
>   "decode_state":"commit",
>   "mappings":[
>     {
>       "position":3,
>       "memdev":"mem11",
>       "decoder":"decoder21.0"
>     },
>     {
>       "position":2,
>       "memdev":"mem9",
>       "decoder":"decoder19.0"
>     },
>     {
>       "position":1,
>       "memdev":"mem10",
>       "decoder":"decoder20.0"
>     },
>     {
>       "position":0,
>       "memdev":"mem12",
>       "decoder":"decoder22.0"
>     }
>   ]
> }
> cxl region: cmd_create_region: created 1 region
> 
> > Did the commit_store() crash stop reproducing with latest cxl/preview
> > branch?  
> 
> I missed the answer to this question.
> 
> All of these changes are now in Linus' tree perhaps give that a try and
> post the debug log again?

Hi Dan,

I've moved onto looking at this one.
1 HB, 2RP (to make it configure the HDM decoder in the QEMU HB, I'll tidy that up
at some stage), 1 switch, 4 downstream switch ports each with a type 3

I'm not getting a crash, but can't successfully setup a region.
Upon adding the final target
It's failing in check_last_peer() as pos < distance.
Seems distance is 4 which makes me think it's using the wrong level of the heirarchy for
some reason or that distance check is wrong.
Wasn't a good idea to just skip that step though as it goes boom - though
stack trace is not useful.

Jonathan








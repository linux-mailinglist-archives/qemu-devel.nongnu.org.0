Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 954665FA1E7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 18:25:36 +0200 (CEST)
Received: from localhost ([::1]:35546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohvat-000466-PH
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 12:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ohvWf-0007IG-UZ; Mon, 10 Oct 2022 12:21:11 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ohvWb-00083m-Da; Mon, 10 Oct 2022 12:21:09 -0400
Received: from fraeml701-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MmPJz5BkNz67qjY;
 Tue, 11 Oct 2022 00:20:19 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml701-chm.china.huawei.com (10.206.15.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.31; Mon, 10 Oct 2022 18:20:58 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 10 Oct
 2022 17:20:58 +0100
Date: Mon, 10 Oct 2022 17:20:57 +0100
To: Jonathan Cameron via <qemu-devel@nongnu.org>
CC: Dan Williams <dan.j.williams@intel.com>, Bobo WL <lmw.bobo@gmail.com>,
 <linux-cxl@vger.kernel.org>, <qemu-arm@nongnu.org>
Subject: Re: [BUG] cxl can not create region
Message-ID: <20221010172057.00001559@huawei.com>
In-Reply-To: <20220819094655.000005ed@huawei.com>
References: <CAGr_yG0UrfJAMWta3EkR1F0JZ4j--sig74p6vKL3K6TZDx9YGA@mail.gmail.com>
 <62f132aee401b_1b3c294c@dwillia2-xfh.jf.intel.com.notmuch>
 <CAGr_yG389Bm_NL8CLgo_ZkGd4staocNENbtb-ULVA5vh_ywmcw@mail.gmail.com>
 <62f27a8e9acb6_1f18b294e2@dwillia2-xfh.jf.intel.com.notmuch>
 <62f5a2ffe8be0_3ce68294a4@dwillia2-xfh.jf.intel.com.notmuch>
 <20220817171619.000021ca@huawei.com>
 <20220818173740.00007f02@huawei.com>
 <20220819094655.000005ed@huawei.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Fri, 19 Aug 2022 09:46:55 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Thu, 18 Aug 2022 17:37:40 +0100
> Jonathan Cameron via <qemu-devel@nongnu.org> wrote:
> 
> > On Wed, 17 Aug 2022 17:16:19 +0100
> > Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
> >   
> > > On Thu, 11 Aug 2022 17:46:55 -0700
> > > Dan Williams <dan.j.williams@intel.com> wrote:
> > >     
> > > > Dan Williams wrote:      
> > > > > Bobo WL wrote:        
> > > > > > Hi Dan,
> > > > > > 
> > > > > > Thanks for your reply!
> > > > > > 
> > > > > > On Mon, Aug 8, 2022 at 11:58 PM Dan Williams <dan.j.williams@intel.com> wrote:        
> > > > > > >
> > > > > > > What is the output of:
> > > > > > >
> > > > > > >     cxl list -MDTu -d decoder0.0
> > > > > > >
> > > > > > > ...? It might be the case that mem1 cannot be mapped by decoder0.0, or
> > > > > > > at least not in the specified order, or that validation check is broken.        
> > > > > > 
> > > > > > Command "cxl list -MDTu -d decoder0.0" output:        
> > > > > 
> > > > > Thanks for this, I think I know the problem, but will try some
> > > > > experiments with cxl_test first.        
> > > > 
> > > > Hmm, so my cxl_test experiment unfortunately passed so I'm not
> > > > reproducing the failure mode. This is the result of creating x4 region
> > > > with devices directly attached to a single host-bridge:
> > > > 
> > > > # cxl create-region -d decoder3.5 -w 4 -m -g 256 mem{12,10,9,11} -s $((1<<30))
> > > > {
> > > >   "region":"region8",
> > > >   "resource":"0xf1f0000000",
> > > >   "size":"1024.00 MiB (1073.74 MB)",
> > > >   "interleave_ways":4,
> > > >   "interleave_granularity":256,
> > > >   "decode_state":"commit",
> > > >   "mappings":[
> > > >     {
> > > >       "position":3,
> > > >       "memdev":"mem11",
> > > >       "decoder":"decoder21.0"
> > > >     },
> > > >     {
> > > >       "position":2,
> > > >       "memdev":"mem9",
> > > >       "decoder":"decoder19.0"
> > > >     },
> > > >     {
> > > >       "position":1,
> > > >       "memdev":"mem10",
> > > >       "decoder":"decoder20.0"
> > > >     },
> > > >     {
> > > >       "position":0,
> > > >       "memdev":"mem12",
> > > >       "decoder":"decoder22.0"
> > > >     }
> > > >   ]
> > > > }
> > > > cxl region: cmd_create_region: created 1 region
> > > >       
> > > > > Did the commit_store() crash stop reproducing with latest cxl/preview
> > > > > branch?        
> > > > 
> > > > I missed the answer to this question.
> > > > 
> > > > All of these changes are now in Linus' tree perhaps give that a try and
> > > > post the debug log again?      
> > > 
> > > Hi Dan,
> > > 
> > > I've moved onto looking at this one.
> > > 1 HB, 2RP (to make it configure the HDM decoder in the QEMU HB, I'll tidy that up
> > > at some stage), 1 switch, 4 downstream switch ports each with a type 3
> > > 
> > > I'm not getting a crash, but can't successfully setup a region.
> > > Upon adding the final target
> > > It's failing in check_last_peer() as pos < distance.
> > > Seems distance is 4 which makes me think it's using the wrong level of the heirarchy for
> > > some reason or that distance check is wrong.
> > > Wasn't a good idea to just skip that step though as it goes boom - though
> > > stack trace is not useful.    
> > 
> > Turns out really weird corruption happens if you accidentally back two type3 devices
> > with the same memory device. Who would have thought it :)
> > 
> > That aside ignoring the check_last_peer() failure seems to make everything work for this
> > topology.  I'm not seeing the crash, so my guess is we fixed it somewhere along the way.
> > 
> > Now for the fun one.  I've replicated the crash if we have
> > 
> > 1HB 1*RP 1SW, 4SW-DSP, 4Type3
> > 
> > Now, I'd expect to see it not 'work' because the QEMU HDM decoder won't be programmed
> > but the null pointer dereference isn't related to that.
> > 
> > The bug is straight forward.  Not all decoders have commit callbacks... Will send out
> > a possible fix shortly.
> >   
> For completeness I'm carrying this hack because I haven't gotten my head
> around the right fix for check_last_peer() failing on this test topology.
> 
> diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
> index c49d9a5f1091..275e143bd748 100644
> --- a/drivers/cxl/core/region.c
> +++ b/drivers/cxl/core/region.c
> @@ -978,7 +978,7 @@ static int cxl_port_setup_targets(struct cxl_port *port,
>                                 rc = check_last_peer(cxled, ep, cxl_rr,
>                                                      distance);
>                                 if (rc)
> -                                       return rc;
> +                                       //      return rc;
>                                 goto out_target_set;
>                         }
>                 goto add_target;

I'm still carrying this hack and still haven't worked out the right fix.

Suggestions welcome!  If not I'll hopefully get some time on this
towards the end of the week.

Jonathan


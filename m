Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4E96CC001
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 14:59:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph8v9-0006ad-4p; Tue, 28 Mar 2023 08:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ph8uz-0006Y0-3N
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:59:17 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ph8uw-00010t-78
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:59:16 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Pm8ps1Bzfz6J7R3
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 20:57:25 +0800 (CST)
Received: from localhost (10.48.153.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 28 Mar
 2023 13:58:59 +0100
Date: Tue, 28 Mar 2023 13:58:58 +0100
To: Maverickk 78 <maverickk1778@gmail.com>
CC: Jonathan Cameron via <qemu-devel@nongnu.org>
Subject: Re: Cxl devel!
Message-ID: <20230328135858.00006392@Huawei.com>
In-Reply-To: <CALfBBTsN4fCW7fR+xMvoiMvaq=a2rTshCifYA6NVrUE-+GBwQg@mail.gmail.com>
References: <CALfBBTsN4fCW7fR+xMvoiMvaq=a2rTshCifYA6NVrUE-+GBwQg@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.153.76]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 24 Mar 2023 04:32:52 +0530
Maverickk 78 <maverickk1778@gmail.com> wrote:

> Hello Jonathan
> 
> Raghu here, I'm going over your cxl patches for past few days, it's very
> impressive.
> 
> I want to get involved and contribute in your endeavor, may be bits &
> pieces to start.
> 
> If you're specific trivial task(cvl/pcie/fm) about cxl, please let me know.
> 
> Regards
> Raghu
> 

Hi Raghu,

Great that you are interested in getting involved.

As to suggestions for what to do, it's depends on what interests you.
I'll list some broad categories and hopefully we can focus in on stuff.

Following is brainstorming on the spot, so I've probably forgotten lots
of things.   There is an out of date todo at:
https://gitlab.com/jic23/qemu/-/wikis/TODO%20list

Smallish tasks.
1) Increase fidelity of emulation.  In many places we take short cuts in
   the interests of supporting 'enough' to be able to test kernel code against..
   A classic example of this is we don't perform any of the checks we should be
   on HDM decoders.  Tightening those restrictions up would be great. Typically that
   involves tweaking the kernel code to try and do 'wrong' things.
   There are some other examples of this on gitlab.com/jic23/qemu around locking of
   registers. This is rarely as high priority as 'new features' but we will want to
   tidy up all these loose corners eventually.
2) Missing features.  An example of this is the security related stuff that went into
   the kernel recently.  Whilst that is fairly easy to check using the cxl mocking
   driver in the kernel, I'd also like to see a QEMU implementation.
   Some of the big features don't interact as they should.  For instance we don't report
   poison list overflow via the event log yet.  It would be great to get this all working
   rather than requiring injection of poison and the event as currently needed (not all
   upstream yet).
3) Cleanup some of the existing emulation that we haven't upstreamed yet.
   - CPMU. Main challenge with this is finding balance between insane commandlines
     and flexibility.  Right now the code on gitlab.com/jic23/qemu (cxl-<latest data>)
     provides a fairly random set of counters that were handy for testing corners
     of the driver that's at v3 on the kernel mailing lists.
   - Review and testing of the stuff that is on my tree (all been on list I think) but
     not yet at the top. Fixing up problems with that in advance will save us time
     when proposing them for upstream.
   - SPDM / CMA.  Right now this relies on a connection to SPDM-emu.  I'd like to explore
     if we can use libspdm as a library instead.  Last time I checked this looked non
     trivial but the dmtf tools team are keen to help.


Bigger stuff - note that people are already looking at some of these but they
may be interested in some help.
1) An example type 2 device.  We'd probably have to invent something along the
   lines of a simple copy offload engine.  The intent being to prove out that
   the kernel code works.  Dan has some stuff on the git.kernel.org tree to support
   type 2 device.
2) Tests.  So far we test the bios table generation and that we can start qemu with
   different topologies. I'd love to see a test that actually brings up a region and
   tests some reading and writing + ideally looks at result in memory devices to check
   everything worked.
3) Dynamic Capacity Devices - some stuff on going related to this, but there is a lot
   to do.  Main focus today is on MHDs.   Perhaps look at the very earl code posted
   for switch CCIs.  We have a lot of work to do in kernel for this stuff as well.
4) MCTP CCI.  I posted a PoC for this a long time back.  It works but we'd need to figure
   out how to wire it up sensibly.

Jonathan



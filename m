Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 545EF30A794
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 13:27:46 +0100 (CET)
Received: from localhost ([::1]:59028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6YIz-0002eZ-Eg
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 07:27:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l6YIF-00029Q-1K
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:26:59 -0500
Received: from 5.mo52.mail-out.ovh.net ([188.165.45.220]:57683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l6YIB-00022u-VL
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:26:58 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.59])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 10D8A23A6D9;
 Mon,  1 Feb 2021 13:26:52 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 1 Feb 2021
 13:26:51 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0046154d781-c7dc-408a-902d-d8272d509268,
 A925A526D972EDC30A5527F39256541BB2C63354) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 1 Feb 2021 13:26:49 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: 9pfs developers docs
Message-ID: <20210201132649.6db25cec@bahia.lan>
In-Reply-To: <3962897.vStEPALNoS@silver>
References: <3475760.T70ipHyFzN@silver> <20210201102426.3a3623c7@bahia.lan>
 <3962897.vStEPALNoS@silver>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 942d7e59-41c9-471d-a441-7920c84e3b6f
X-Ovh-Tracer-Id: 17549120376832760288
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfeekgdegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeeugfeukeelheeuueffvddvgfefudefjeeiveejfefhgeekueejuedtgedtteegnecuffhomhgrihhnpehqvghmuhdrohhrghdpmhhtvghsthdvmhgrkhgvrdhphienucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepthhhuhhthhesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=188.165.45.220; envelope-from=groug@kaod.org;
 helo=5.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 01 Feb 2021 12:30:52 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Montag, 1. Februar 2021 10:24:26 CET Greg Kurz wrote:
> > On Sun, 31 Jan 2021 19:23:52 +0100
> > 
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > Hi,
> > 
> > Hi Christian,
> > 
> > > I started setting up some developer documentation for 9pfs:
> > > 	https://wiki.qemu.org/Documentation/9p
> > > 
> > > Still quite a bunch that should be added (e.g. there should be a section
> > > about threads and coroutines), but at least it's a start ...
> > 
> > I agree that a bunch of other things should be documented, but that's
> > definitely a great start. Thanks for doing this !
> > 
> > Just one remark on the topology diagram:
> > 
> > https://wiki.qemu.org/File:9pfs_topology.png
> > 
> > It gives the impression that the 9p transport and server can
> > handle multiple guests, which they certainly don't : each
> > 9p server lives in exactly one device which is exposed to
> > exactly one guest.
> 
> Right, I haven't considered that the diagram might be interpreted that way. My 
> primary intention was to show the 3 main components of 9pfs from design 
> perspective and secondary showing that multiple guests can share storage.
> 
> So what would be better: a) duplicating the server side in the diagram (then 
> the image might become a bit large in height), b) dropping the multiple 
> guests, c) making the issue with server instances clear in the text?

I'd rather go for b)

> 
> If there are other things that you might think should be outlined by 
> additional diagram(s) let me know, then I can add that in one rush.
> 
> --
> 
> BTW I'm no longer able to run the 'local' 9p tests, --slow doesn't work for 
> me. If you don't have an idea what I might be missing, then I have to look why 
> the CLI parameter is not interpreted.
> 

Is it that '-m slow' doesn't work when running 'qos-test' or
that 'make check-qtest SPEEP=slow' doesn't run the slow tests ?

The latter was discussed on IRC last year but I don't know if
anyone has tried to investigate this yet.

Nov 24 11:36:53 <groug>	th_huth, Hi. FYI it seems that the meson conversion kinda broke 'make check SPEED=slow'. Test programs aren't passed '-m slow'
Nov 24 11:51:42 <f4bug>	th_huth: do you know who uses/tests SPEED=slow?
Nov 24 11:52:03 <f4bug>	th_huth: I thought this was a block-related feature
Nov 24 11:52:44 <groug>	f4bug, it is supposedly used by gitlab CI
Nov 24 11:52:59 <groug>	.gitlab-ci.yml:    MAKE_CHECK_ARGS: check-qtest SPEED=slow
Nov 24 12:50:53 <th_huth>	groug, I'm also running make check SPEED=slow manually sometimes ... I guess that got lost in the conversion to ninja ... bonzini, did you ever try?
Nov 24 12:51:03 <bonzini>	no it shouldn't
Nov 24 12:51:21 <th_huth>	let me check...
Nov 24 12:51:40 <bonzini>	ah, the tests are chosen correctly but -m slow is lost
Nov 24 12:52:02 <groug>	yes that's what I see
Nov 24 12:54:04 <groug>	bonzini, missing bits in scripts/mtest2make.py ?
Nov 24 12:54:28 <bonzini>	groug: sort of, but assuming that all executables support -m slow wouldn't work

Cc'ing Thomas and Paolo for additional details.

> Best regards,
> Christian Schoenebeck
> 
> 



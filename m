Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C64225FA7B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 14:28:39 +0200 (CEST)
Received: from localhost ([::1]:51836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFGGE-0004Qv-4r
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 08:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kFGF6-0003dA-O7
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 08:27:28 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:46447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kFGF4-00010a-5a
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 08:27:28 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.189])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B67C1584CD5A;
 Mon,  7 Sep 2020 14:27:20 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 7 Sep 2020
 14:27:20 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0010295eab7-bc45-4a3a-ad0a-489c564ff677,
 FB6B05930862AC66219C483F6F551C079519CC1C) smtp.auth=groug@kaod.org
Date: Mon, 7 Sep 2020 14:27:19 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] 9pfs: disable msize warning for synth driver
Message-ID: <20200907142719.35a4f079@bahia.lan>
In-Reply-To: <1773061.9aR6DczYlW@silver>
References: <E1kEyDy-0006nN-5A@lizzy.crudebyte.com>
 <20200907115758.70366924@bahia.lan> <1773061.9aR6DczYlW@silver>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 2daec7ea-80a5-451d-acdc-e1f931857972
X-Ovh-Tracer-Id: 2821505168702871962
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudehtddgheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 08:27:21
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 07 Sep 2020 13:55:52 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Montag, 7. September 2020 11:57:58 CEST Greg Kurz wrote:
> > On Sun, 6 Sep 2020 18:50:32 +0200
> > 
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > Previous patch introduced a performance warning being logged on host
> > > side if client connected with an 'msize' <= 8192. Disable this
> > > performance warning for the synth driver to prevent that warning from
> > > being printed whenever the 9pfs (qtest) test cases are running.
> > > 
> > > Introduce a new export flag V9FS_NO_PERF_WARN for that purpose, which
> > > might also be used to disable such warnings from the CLI in future.
> > > 
> > > We could have also prevented the warning by simply raising P9_MAX_SIZE
> > > in virtio-9p-test.c to any value larger than 8192, however in the
> > > context of test cases it makes sense running for edge cases, which
> > > includes the lowest 'msize' value supported by the server which is
> > > 4096, hence we want to preserve an msize of 4096 for the test client.
> > > 
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > 
> > Heh, yes I guess it makes sense :)
> > 
> > I guess you could maybe queue this patch before the other one.
> > 
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> 
> Thanks!
> 
> BTW, have you ever tried dealing with patchwork client's 'state' feature for 
> already transmited patches on the list (new, rejected, etc.)?
> 

Nope, never used patchwork's state at all and I've no idea on how it
works... but I can ask to my former IBM colleagues at Ozlabs.

> Not that there were many 9p patches for actually needing that; just curious if 
> that's an LKML only feature.
> 
> Best regards,
> Christian Schoenebeck
> 
> 



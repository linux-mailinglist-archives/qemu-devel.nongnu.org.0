Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82E85414F6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:27:27 +0200 (CEST)
Received: from localhost ([::1]:37040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyfnS-0005DS-Q2
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1nycU3-0005yB-OY
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 12:55:12 -0400
Received: from mail.bwidawsk.net ([107.170.211.233]:53914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1nycU1-0004O9-RO
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 12:55:11 -0400
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id 3580F12328E; Tue,  7 Jun 2022 09:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bwidawsk.net;
 s=zangief; t=1654620908;
 bh=eiDbfThOHCxyHENIDjtw1uqOJTLTKa8NgedrdNXk4QE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=rLVeTN3jhVE4z8xi4DFNgx34OK4fg2SerNB0X/p1STjOSA9xNIA7/5Af58ks+KnO0
 85Zbzjzj07JQbr9rfF/3oRdssa6k5hszGLMWaX9N2IVuJUB8zJUg/00lB54HfYeJ1k
 c4P3+3TF1FnFpGsnG3f3G4ziWyuZ0AKHakL0S6DM=
X-Spam-ASN: 
Received: from mail.bwidawsk.net (c-73-25-157-11.hsd1.or.comcast.net
 [73.25.157.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id 978AF12281D;
 Tue,  7 Jun 2022 09:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bwidawsk.net;
 s=zangief; t=1654620903;
 bh=eiDbfThOHCxyHENIDjtw1uqOJTLTKa8NgedrdNXk4QE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=buHhF6TG0BNJsX+rXsgUwwPfpBdepohW/rb1NsO/DFdYt66FgIctprX38t5hMaGHu
 oAqlnnff7N2HlSZ2/c1YCGfER3yfyizyKgCNRiljNVRtbKUnKnV+Cl/vdi5qQY956L
 yBNBWGjcqlJ3GY36QltrZKsO6wQULtOAS7hpfp8Q=
Date: Tue, 7 Jun 2022 09:55:01 -0700
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] MAINTAINERS: change Ben Widawsky's email address
Message-ID: <20220607165501.nfftyyyrr7fmylxi@mail.bwidawsk.net>
References: <20220607162628.372400-1-ben@bwidawsk.net>
 <20220607175035.00006c64@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607175035.00006c64@Huawei.com>
Received-SPF: pass client-ip=107.170.211.233; envelope-from=ben@bwidawsk.net;
 helo=mail.bwidawsk.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 07 Jun 2022 16:22:49 -0400
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
Reply-to:  Ben Widawsky <ben@bwidawsk.net>
From:  Ben Widawsky via <qemu-devel@nongnu.org>

On 22-06-07 17:50:35, Jonathan Cameron wrote:
> On Tue, 7 Jun 2022 09:26:28 -0700
> Ben Widawsky <ben@bwidawsk.net> wrote:
> 
> > ben@widawsky@intel.com will stop working on 2022-06-20, change it to my
> > personal email address.
> > 
> > Update .mailmap to handle previously authored commits.
> > 
> > Signed-off-by: Ben Widawsky <ben@bwidawsk.net>
> 
> With below question addressed,
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> Probably cc Michael Tsirkin as well given he picked up the
> patch that introduced this maintainers entry recently.

Okay. Luckily I had a typo in the commit message anyway, so it needed a respin.

> 
> Thanks,
> 
> Jonathan
> 
> 
> > ---
> >  .mailmap    | 1 +
> >  MAINTAINERS | 2 +-
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/.mailmap b/.mailmap
> > index 8c326709cfab..0dec7b156999 100644
> > --- a/.mailmap
> > +++ b/.mailmap
> > @@ -54,6 +54,7 @@ Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <arikalo@wavecomp.com>
> >  Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <aleksandar.rikalo@rt-rk.com>
> >  Alexander Graf <agraf@csgraf.de> <agraf@suse.de>
> >  Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
> > +Ben Widawsky <ben.widawsky@intel.com> <ben@bwidawsk.net>
> 
> Is this backwards as you will (I think) want scripts to output ben@bwidawsk.net 
> as your canonical email address going forwards?

I guess? I simply read the comment to determine order. I should have gone with
what I knew rather than tried to figure out what was meant.

"# Next, replace old addresses by a more recent one."

> 
> >  Christian Borntraeger <borntraeger@linux.ibm.com> <borntraeger@de.ibm.com>
> >  Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
> >  Frederic Konrad <konrad.frederic@yahoo.fr> <fred.konrad@greensocs.com>
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5580a36b68e1..89da5755116b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2574,7 +2574,7 @@ F: qapi/transaction.json
> >  T: git https://repo.or.cz/qemu/armbru.git block-next
> >  
> >  Compute Express Link
> > -M: Ben Widawsky <ben.widawsky@intel.com>
> > +M: Ben Widawsky <ben@bwidawsk.net>
> >  M: Jonathan Cameron <jonathan.cameron@huawei.com>
> >  S: Supported
> >  F: hw/cxl/
> > 
> > base-commit: 9b1f58854959c5a9bdb347e3e04c252ab7fc9ef5
> 


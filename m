Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E8AAEE29
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 17:09:55 +0200 (CEST)
Received: from localhost ([::1]:41212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7hmE-00076x-HQ
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 11:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56627)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1i7ha5-0002d5-0Z
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 10:57:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1i7ha3-00039d-Ue
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 10:57:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:29312)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1i7ha1-000364-SA; Tue, 10 Sep 2019 10:57:17 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 12581109EFC0;
 Tue, 10 Sep 2019 14:57:17 +0000 (UTC)
Received: from dhcp-4-67.tlv.redhat.com (dhcp-4-67.tlv.redhat.com [10.35.4.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB2CA60925;
 Tue, 10 Sep 2019 14:57:14 +0000 (UTC)
Message-ID: <5316dd60d3490e2cf6f1550a2b45532ce1be9049.camel@redhat.com>
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>, Max
 Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 17:57:13 +0300
In-Reply-To: <363ba60f-3efd-b7fc-27ab-b3a864073686@redhat.com>
References: <20190825071541.10389-1-mlevitsk@redhat.com>
 <20190825071541.10389-3-mlevitsk@redhat.com>
 <0618bc5b-6c0b-d154-dc7c-77398a7eb031@redhat.com>
 <798ede8632285382a9d54dc9e3a75be046387b7d.camel@redhat.com>
 <58a0f856b958bcb90df6d5f778c8ca0eaefaf8f9.camel@redhat.com>
 <58a83617-9ffd-b775-976b-ccfbc87d65c1@redhat.com>
 <3967d83b-2637-8020-a3b6-f1fa995ad34f@redhat.com>
 <ad6938d5-0584-55bd-1eb3-1f04bafde126@redhat.com>
 <363ba60f-3efd-b7fc-27ab-b3a864073686@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Tue, 10 Sep 2019 14:57:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/2] block/nvme: add support for discard
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, John Ferlan <jferlan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2019-09-10 at 16:49 +0200, Paolo Bonzini wrote:
> On 09/09/19 19:03, John Snow wrote:
> > 
> > 
> > On 9/9/19 5:25 AM, Max Reitz wrote:
> > > On 05.09.19 19:27, John Snow wrote:
> > > 
> > > [...]
> > > 
> > > > You also probably require review (or at least an ACK) from Keith Busch
> > > > who maintains this file.
> > > 
> > > Keith actually maintains the NVMe guest device; technically, Fam is the
> > > NVMe block driver maintainer.
> > 
> > W h o o p s. Thanks for correcting me.
> > 
> > Well, if it's Fam -- he seems a little busier lately -- it's probably
> > not so crucial to gate on his approval. I thought it'd be nice to at
> > least get an ACK from someone who has used this module before, because I
> > haven't -- I was just giving some style review to help push it along.
> > 
> > (On that note, if you felt like my style review was wrong or isn't worth
> > doing -- it is always perfectly fair to just say so, along with some
> > reason as to why you won't -- that way patches won't rot on the list
> > when people may have gotten the impression that a V2 is warranted.)
Absolutely not, your review was fine! I just was/is a bit lazy to send next version of the patches
before I get some kind of indication if anything else is needed for this to be merged,
since the module doesn't have currently an active maintainer.


> 
> Looks good to me with the changes you pointed out (especially res30;
> leaving out the unused macros is not so important).

All right, I'll send an updated version of those two patches soon.

Best regards,
	Maxim Levitsky




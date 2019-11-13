Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66390FAA1A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Nov 2019 07:18:01 +0100 (CET)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUlya-0002zZ-Fv
	for lists+qemu-devel@lfdr.de; Wed, 13 Nov 2019 01:18:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53837)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1iUlxj-0002Ut-HZ
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 01:17:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1iUlxi-0006Rq-Me
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 01:17:07 -0500
Received: from charlie.dont.surf ([128.199.63.193]:55438)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1iUlxe-0006Og-Kp; Wed, 13 Nov 2019 01:17:03 -0500
Received: from apples.localdomain (212.27.19.17.bredband.3.dk [212.27.19.17])
 by charlie.dont.surf (Postfix) with ESMTPSA id D1015BF448;
 Wed, 13 Nov 2019 06:16:59 +0000 (UTC)
Date: Wed, 13 Nov 2019 07:16:55 +0100
From: Klaus Birkelund <its@irrelevant.dk>
To: Beata Michalska <beata.michalska@linaro.org>
Subject: Re: [PATCH v2 04/20] nvme: populate the mandatory subnqn and ver
 fields
Message-ID: <20191113061655.GA455152@apples.localdomain>
References: <20191015103900.313928-1-its@irrelevant.dk>
 <20191015103900.313928-5-its@irrelevant.dk>
 <CADSWDzvPd0=Qp4dtCz9X_DObKMUYe47e8wpYA5EHyQD-kxNJhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADSWDzvPd0=Qp4dtCz9X_DObKMUYe47e8wpYA5EHyQD-kxNJhg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.199.63.193
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <keith.busch@intel.com>, Paul Durrant <Paul.Durrant@citrix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 12, 2019 at 03:04:45PM +0000, Beata Michalska wrote:
> Hi Klaus
> 
> On Tue, 15 Oct 2019 at 11:42, Klaus Jensen <its@irrelevant.dk> wrote:
> > +    n->bar.vs = 0x00010201;
> 
> Very minor:
> 
> The version number is being set twice in the patch series already.
> And it is being set in two places.
> It might be worth to make a #define out of it so that only one
> needs to be changed.
> 

I think you are right. I'll do that.


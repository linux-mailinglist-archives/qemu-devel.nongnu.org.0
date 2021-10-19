Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22AA433C3D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:31:14 +0200 (CEST)
Received: from localhost ([::1]:44142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcs1A-00065J-Ix
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mcrBT-0000Lx-TX; Tue, 19 Oct 2021 11:37:48 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:48453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mcrBO-0000bP-DB; Tue, 19 Oct 2021 11:37:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=gpkAmEcLpg6OTbde7uUXtqhL1R0QUS6CHYcvxYF8omE=; b=dbOLawJnMKo+VMHbSQiqzlbCtq
 UfOlRNLSo+H+e2G49hs+9ClVSKw8VIm6ckCJ7ZTZRy5pePWS8AvC4ekd8MMqX57p9xQqymDjogmwg
 MhGisqZsaBYaHpw4XCmFXR4wp5ZqmG+H+RM10zWyKcsyveuG4FBwBfVQXTUxTgF1XtiO/jH0zbmxR
 Ihz2TpQq9oSPBd7rrvMt8/eRl/bHeKTxpayISiOR27h7JKn7gN3EDfVLZKW4uGG0hxM714K7TKHxU
 p+CAHNFAfvG7nGogHOKSXtu2QwD0BJmtADJmOSSPAjwXf9XUAB0ffauAwVtgvKu+S2TSWNFQZqvak
 p0S1NxBSqmLIW0LBsZEy3lE5feeCpRkijoZ/Cw3Qz5+AW6kMVRd1w3dc1iuAIM/W+R+msXIx8tqN5
 efk8Jl+ihTz5N2SVSQWtowS/HUKLAqvrd68NUr4XLl4CYcQpbnOoEU05NxBacD/7GtigWfrAaHYr1
 ZDUMld9eq5jOGCpQN0ZFRZEp3z3QlkGpkTaP9SEtt//Yk9W0Xy3ruKODGXC20PsbM4ewCylPFg8g7
 omGbAEd9G9P11bS66WvnCzv/bstpQlAtlfbAgu3x/FZerGJ4ERvYyacVMo5u+M+ybtKnt4cDCOAfm
 4nHNHh+Weu6UckCkBjSUKGnnFgZ2erli8ltNI5sQ8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 qemu-stable@nongnu.org
Subject: Re: [PATCH 00/64] Patch Round-up for stable 6.0.1,
 freeze on 2021-10-26
Date: Tue, 19 Oct 2021 17:37:35 +0200
Message-ID: <2216309.cYrKvcM3eP@silver>
In-Reply-To: <20211019172638.103cbde6@bahia.huguette>
References: <20211019140944.152419-1-michael.roth@amd.com>
 <2448414.exmQesOQCs@silver> <20211019172638.103cbde6@bahia.huguette>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 19. Oktober 2021 17:26:38 CEST Greg Kurz wrote:
> On Tue, 19 Oct 2021 16:52:37 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Dienstag, 19. Oktober 2021 16:08:40 CEST Michael Roth wrote:
> > > Hi everyone,
> > > 
> > > The following new patches are queued for QEMU stable v6.0.1:
> > >   https://gitlab.com/qemu-project/qemu/-/commits/stable-6.0-staging/
> > > 
> > > Patch freeze is 2021-10-26, and the release is planned for 2021-10-28:
> > >   https://wiki.qemu.org/Planning/6.0
> > > 
> > > Please respond here or CC qemu-stable@nongnu.org on any additional
> > > patches
> > > you think should (or shouldn't) be included in the release.
> > > 
> > > Thanks!
> > 
> > Hi Micheal,
> > 
> > I think the following 9p fix is yet missing:
> > 
> > f83df00900816476cca41bb536e4d532b297d76e 9pfs: fix crash in v9fs_walk()
> 
> No, this commit fixes 8d6cb100731c ("9pfs: reduce latency of Twalk")
> which was merged in QEMU 6.1. This is a good candidate for the upcoming
> QEMU 6.1.1 though :-)

Aah, right! Yeah, sorry for the noise! :)

Best regards,
Christian Schoenebeck




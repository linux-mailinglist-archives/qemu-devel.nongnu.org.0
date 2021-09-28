Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE54241AF16
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 14:31:11 +0200 (CEST)
Received: from localhost ([::1]:43322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCGM-00087t-No
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 08:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mVCBR-00045y-W4
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:26:06 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:35147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mVCBN-0008PW-6p
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:26:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=SfPFKkNX/gnnQxGsGfQFGvHbUwD76CvGKbUixdodBj4=; b=lakJxj2ckN+6xzzi0itLafSWMn
 2nYipDEEvk5UnZFMBmPJgb9yKgK1MnZY6gubtF5ZD/lhPQKX/Qvomc+BHt/L4eoYwZqvAoZRZeyLw
 G5ZdK1VB4WESH/eeQGj0i0EeW3yWo7m692AU/D5pCr+1ieNoZb4pLi6IcMwCi3xXQUzmN1h3ER3lz
 r8k0f00nbdbRhsG/doUe7J/9D4mOxZlBgYsr+romdCwQp2UBuY6xE6SdKbAtX+1DdFdFiUT0AXrDJ
 qdVQ/xuRY2iAfvms4Za6C2gCzb/4QtTLNWH470WhAKKwxBWZRJd0Li/UaAEEyGXdu8DWUrZKl3rRD
 ZPprtwQMP6OrNgc250ioqhUXX8cBEulUIU6fDvgWlq9L7sLsweveQdI1j6FQq0wIg2uIc7IZp9MFl
 +mzxt7udOecMJwRA+RTkgqL/YSf/57xZ5MZZ/3ksfwdUwnljUwgD9CVas2vuhigPjmhfkVYEPGQR5
 XY+cIIPaLKUMsONRfpUI8/0cMYTJ5J/dm0+pJeMJ3WbY9oiDTPZJVHOnyu/YbrIFV7oGivJDeUtJg
 GBg8s5WRN+NQgGXRMUVlcpEh1MirYUE+0w8QV2rXpaVzV5s0Y5HEBbLpwe8zyHd861k12Hv95CZg+
 taF0w942+fjQrQFqT43ig2RQDDO6UJWJ7Mp34X+KE=;
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 0/5] introduce QArray
Date: Tue, 28 Sep 2021 14:25:57 +0200
Message-ID: <1811981.VuayHpH01O@silver>
In-Reply-To: <20210927125940.3ef12485@bahia.huguette>
References: <cover.1629982046.git.qemu_oss@crudebyte.com>
 <2431106.PTX978RE0L@silver> <20210927125940.3ef12485@bahia.huguette>
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
Reply-to:  Christian Schoenebeck <qemu_oss@crudebyte.com>
From:  Christian Schoenebeck via <qemu-devel@nongnu.org>

On Montag, 27. September 2021 12:59:40 CEST Greg Kurz wrote:
> On Mon, 27 Sep 2021 12:35:16 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Dienstag, 31. August 2021 14:25:04 CEST Christian Schoenebeck wrote:
> > > On Dienstag, 31. August 2021 13:58:02 CEST Greg Kurz wrote:
> > > > On Thu, 26 Aug 2021 14:47:26 +0200
> > > > 
> > > > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > > > Patches 1 and 2 introduce include/qemu/qarray.h which implements a
> > > > > deep
> > > > > auto free mechanism for arrays. See commit log of patch 1 for a
> > > > > detailed
> > > > > explanation and motivation for introducing QArray.
> > > > > 
> > > > > Patches 3..5 are provided (e.g. as example) for 9p being the first
> > > > > user
> > > > > of
> > > > > this new QArray API. These particular patches 3..5 are rebased on my
> > > > > current 9p queue:
> > > > > https://github.com/cschoenebeck/qemu/commits/9p.next
> > > > 
> > > > > which are basically just the following two queued patches:
> > > > This looks nice indeed but I have the impression the same could be
> > > > achieved using glib's g_autoptr framework with less code being added
> > > > to QEMU (at the cost of being less generic maybe).
> > > 
> > > I haven't seen a way doing this with glib, except of GArray which has
> > > some
> > > disadvantages. But who knows, maybe I was missing something.
> > 
> > Ping
> > 
> > Let's do this?
> 
> Hi Christian,
> 
> Sorry I don't have enough bandwidth to review or to look for an alternate
> way... :-\ So I suggest you just go forward with this series. Hopefully
> you can get some reviews from Markus and/or Richard.

Ok, then I wait for few more days, and if there are no repsonses, nor vetos 
then I'll queue these patches anyway.

Best regards,
Christian Schoenebeck




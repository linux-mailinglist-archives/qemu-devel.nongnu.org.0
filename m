Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298783EA498
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 14:26:35 +0200 (CEST)
Received: from localhost ([::1]:41486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE9n8-0001OT-1b
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 08:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mE9lg-0000X1-BT
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 08:25:04 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:38639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mE9ld-0007Jd-Ti
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 08:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=mLnvglQg6hoJupXj2S+AGDLHzOr3Rin88F9cQ5FK/+M=; b=Ul8La6V+951icswwOMRZMPRiwX
 WXREFxSsbGTVddKGcUyegiqGXI/WF4n9JY1gwTOjKN5CEKsCsmo0lDuvL86l9oaYXB10xzkx4mc2j
 G51A4hDjTr2fxPjqbKviel8XiMAwTDgOXq54PURX/FyctsPRObAOAkZoJtgp5i89+5Sxi/U3GUFRH
 GFxQ9xxqLnKxX0vnhxVItVkj8tlEHQK3rm2Wxmeh6kATPyWiSDI0ODUPUCZLSsItVKycNF3XG/b88
 yrtdOkvviRB4WhaA7hoUxs4KDbr7KcAxyrOpb8G/oO45TKoEiiChN7inr9XSf0wWAy1+YqekCJK0O
 /KhtxxswyEA2z8ReeZlQ3cdBvqFtbT6aisMYoXOHH9/uS71rtoF6g8GjriO1ig6GTXNrjxWK1etYf
 3O9yVSukNBMWw1s+E9YiBpdzUxWZGaQRDMtEfd9yCrKBgbUwWZGcyKTg6zpji/AQS76QOM/Y8jA3V
 7zT4TQ5Lrb77yimfSgOThb79W31b4JfE81Io2HIx9t63+uJa66eR4D51sfb/fwxQhQaxSqjDYJSYG
 mZO3tE1/vUaaUgEXX/t0KvaXhxv378/M/hJ2dRmBpr7PQCE/G6NeX1ZkcN4ZxfPnGstrq/X+Lwj7U
 qyA1ZRrMY3vvSrj1iN5FPI2361JfFKuucuyqK+n6Q=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, clamky@hotmail.com
Subject: Re: [PATCH 3/7] MAINTAINERS: update audio entry.
Date: Thu, 12 Aug 2021 14:24:57 +0200
Message-ID: <77562211.GzqkouU55n@silver>
In-Reply-To: <20210812084210.kbzoneze3izsrboa@sirius.home.kraxel.org>
References: <20210810083450.2377374-1-kraxel@redhat.com>
 <VE1P192MB0733ED7BB482A45E5768464CDEF89@VE1P192MB0733.EURP192.PROD.OUTLOOK.COM>
 <20210812084210.kbzoneze3izsrboa@sirius.home.kraxel.org>
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

On Donnerstag, 12. August 2021 10:42:10 CEST Gerd Hoffmann wrote:
>   Hi,
> 
> > > On Tue, Aug 10, 2021 at 03:17:43PM +0300, clamky@hotmail.com wrote:
> > >> Gerd Hoffmann <kraxel@redhat.com> writes:
> > >> 
> > >> Hell Gerd.
> > >> 
> > >> > New maintainer wanted. Downgrade status to "Odd Fixes" for now.
> > >> 
> > >> I can try to retake it.
> 
> Given your track record is zero contributions to qemu in recent years
> I suggest you start getting involved in the development process as
> reviewer.  Just send a patch adding a "R: Name <email>" line for
> yourself to the MAINTAINERS file (best based on my pending pull
> request to avoid conflicts).  scripts/get_maintainer.pl will Cc: you
> on any audio-related patches then.
> 
> I'd recommend to open an gitlab.com account (unless you already have
> one of course) so you can help triage bugs + issues.  You can also
> easily run qemu CI then (just push a branch to a qemu repo fork).
> 
> HTH & take care,
>   Gerd

I will add myself as reviewer for audio to help out a bit at least. I won't be 
able to take over maintainership at this point though.

I wait for your PR to be merged by Peter before sending my MAINTAINERS patch.

Best regards,
Christian Schoenebeck




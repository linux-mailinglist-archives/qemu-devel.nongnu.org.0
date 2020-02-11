Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FD2158FEC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 14:28:10 +0100 (CET)
Received: from localhost ([::1]:49604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1VaC-0003uh-Rx
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 08:28:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39496)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1j1VZN-0003LD-QO
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 08:27:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <qemu_oss@crudebyte.com>) id 1j1VZM-0006g2-Gv
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 08:27:17 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:50217)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <qemu_oss@crudebyte.com>)
 id 1j1VZM-0006eZ-0q
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 08:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=SvMFBPyVA2sWHdOVkBpLA7RMtSjtuLyUX6xG3t4Q13k=; b=o7Sq4Or3j/GfKru+IXWuwTzbJf
 vgGgR7fvKYQE2YugRYtBkDElgjbJwOS7iZwLJ+0Xc6njQ5X0sSYf2zfn4qEq5TYR8YIzMIU5FAUkd
 89xp2AcG2ALtyjKh4b23wWHaQpasUpS7sxeZxZ2A2R/WSo1McmyfHIyb0/jaKboW67vcgdyUmq5xJ
 syPkNkJqLHit8Ia+LNRdHlKv96RAZ2oqfsllGc7nMhM6BY+b50Vn4Y9s9Urhq5ZWB8baCuNji0hhj
 337o+bvzH9SddGd53VaHu4qUKaiXqkkWpg4vbjZMZ7MXBGdIrE2bLwVvpP5rcsE3642sWHX38uhxk
 hsIcrxDqrRb3y554LklJ1QPc3KaXyWer3ctImdzGtb9CCI55DJTV3SXh+vjq4DT4dCVyeucElu6Gq
 pRu8/Glfbc8u2JNca3+wdaP1KKaU9ATu7B9S2plSRKn6QjXsevfL5aEfgq+aiuTWdFvm4GALWnqCi
 cNNcQqBh6xYxGjx3QrDkx6vZz7WeCIIwNOs87c7kig3hFEAk/uHBrNehxNFY9DRNRYeOxqMp6mXKj
 9UAye8Zl8h4NJLpzT9hZvIn5qxg9HLhM6Zgo6N1U+sPp5QVbhU++aqXnnfOtb+6goVFJLcAxqk0yl
 kxMOjlyF5TMuxtVG3TnPJw5MwlC4Cj2OWjLiPxBg0=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/6] 9p patches 2020-02-08
Date: Tue, 11 Feb 2020 14:27:13 +0100
Message-ID: <13290652.vqYYtG2mAD@silver>
In-Reply-To: <20200211094201.33b35260@bahia.lan>
References: <20200208104506.2727882-1-groug@kaod.org>
 <1679063.kJpWnTDlLf@silver> <20200211094201.33b35260@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.189.157.229
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

On Dienstag, 11. Februar 2020 09:42:01 CET Greg Kurz wrote:
> On Tue, 11 Feb 2020 09:15:41 +0100
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Montag, 10. Februar 2020 18:08:38 CET Peter Maydell wrote:
> > > On Sat, 8 Feb 2020 at 10:45, Greg Kurz <groug@kaod.org> wrote:
> > > > The following changes since commit
> > 
> > 42ccca1bd9456568f996d5646b2001faac96944b:
> > > >   Merge remote-tracking branch
> > > >   'remotes/berrange/tags/misc-fixes-pull-request' into staging
> > > >   (2020-02-07 15:01:23 +0000)>
> > > > 
> > > > are available in the Git repository at:
> > > >   https://github.com/gkurz/qemu.git tags/9p-next-2020-02-08
> > > > 
> > > > for you to fetch changes up to 
2822602cbe2be98229b882101dfdb9d3a738c611:
> > > >   MAINTAINERS: 9pfs: Add myself as reviewer (2020-02-08 09:29:04
> > > >   +0100)
> > > > 
> > > > ----------------------------------------------------------------
> > > > 9p patches:
> > > > - some more protocol sanity checks
> > > > - qtest for readdir
> > > > - Christian Schoenebeck now official reviewer
> > > > 
> > > > ----------------------------------------------------------------
> > > 
> > > Applied, thanks.
> > > 
> > > Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
> > > for any user-visible changes.
> > > 
> > > -- PMM
> > 
> > I.e. msize >= 4096 now being required. AFAICS I cannot update the wiki
> > myself.
> I've updated the wiki.

Thanks Greg!

BTW, I think "negociate" is the 18th century variant of "negotiate". :)

Best regards,
Christian Schoenebeck




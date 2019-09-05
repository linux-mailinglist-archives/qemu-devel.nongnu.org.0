Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7CDAA315
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Sep 2019 14:26:36 +0200 (CEST)
Received: from localhost ([::1]:45504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5qqR-0001PD-GI
	for lists+qemu-devel@lfdr.de; Thu, 05 Sep 2019 08:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34650)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1i5qpD-0000Re-Tq
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 08:25:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <qemu_oss@crudebyte.com>) id 1i5qpC-0005F5-NJ
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 08:25:19 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:32973)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <qemu_oss@crudebyte.com>)
 id 1i5qpC-0005EQ-3l
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 08:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=ScZoPI7ibm+sboctwBR13+JtoeuaxMZkCTlZEzAHFiw=; b=lNR3Ti69mNGjAhts2rsw6I4E0W
 xOwilliv8RYWJTV7Rc6HR5MtjNL84Ptw8lESIJq1XdkYmrjNV6NsGuF1IEQtxjro8QU1WGwIyoNQ6
 y7S5Vta9DWDKE7EnCX18O7ChX7RRNN6V1gSt6EwGUZUGvMd4TpsxalewkE5NHnMaALRJ+BE3Rw0Xh
 gSzjSjOhf3OuX8MzhrN5472j2Wjbi29FDDXXoIidcExVP8Ah2qAo8q8UnYgF23crw2vguNifzRBxL
 YSajJRKNvxFPx2G0I+kwInGio5Ckihw6TqM9hSZ6XPTNZZ3ELe1nrQSqlRzB9+btALemqyz/tgwYm
 Qklkqjsjms7IXyeugazqHSdvy+psOkqXPSHWtmEgyVnEvy75tLR++q6jToJzeUGGoI4U5A+SOdhcH
 RQcZuVsZuW3KHPRKMzpfzHUaD8VQsEUTvF/3GMbGVObM+P5B8odNDKs2TgDeetM8hj6Qjvayj6BiA
 xPTSDGae9cpcwY5aQIP97oGFa1H3WTN87/HSh9eaalAi6kuML4DeNLld9S4OazIwrEkxaUuRRVV8F
 AVx6ahuWlqv4Ol3kk+XlvqSoJu1Lo4ZePO7vA2NmUkFMm2fOaN/8zMx9gfsxBp7jBoBS+nhirrrf1
 eIPRINFIjNo3RXW6C81DsEm6LdF2RfA5fxjGvOTbI=;
To: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Thu, 05 Sep 2019 14:25:13 +0200
Message-ID: <1897173.eDCz7oYxVq@silver>
In-Reply-To: <4642438.ai5u8AxThJ@silver>
References: <cover.1566503584.git.qemu_oss@crudebyte.com>
 <46fe6c73-961f-d72a-77de-88491b6f223c@redhat.com> <4642438.ai5u8AxThJ@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.189.157.229
Subject: Re: [Qemu-devel] [PATCH v6 0/4] 9p: Fix file ID collisions
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
From: Christian Schoenebeck via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: stefanha@gmail.com, berrange@redhat.com, Greg Kurz <groug@kaod.org>,
 antonios.motakis@huawei.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 4. September 2019 15:02:30 CEST Christian Schoenebeck wrote:
> > > Well, mailman is handling this correctly. It replaces the "From:" field
> > > with a placeholder and instead adds my actual email address as
> > > "Reply-To:" field. That's the common way to handle this on mailing
> > > lists,
> > > as also mentioned here:
> > > https://en.wikipedia.org/wiki/DMARC#From:_rewriting
> > > 
> > > So IMO patchew should automatically use the value of "Reply-To:" in that
> > > case as author of patches instead.
> > > 
> > > Reducing security cannot be the solution.
> > 
> > No, there's no need to reduce security.  Just change your local git
> > configuration to produce a 'From:' line in the commit body..
> 
> Got it. :)
> 
> > >> How are you sending patches ? With git send-email ? If so, maybe you
> > >> can
> > >> pass something like --from='"Christian Schoenebeck"
> > >> <qemu_oss@crudebyte.com>'. Since this is a different string, git will
> > >> assume you're sending someone else's patch : it will automatically add
> > >> an
> > >> extra From: made out of the commit Author as recorded in the git tree.
> > 
> > I think it is probably as simple as a 'git config' command to tell git
> > to always put a 'From:' in the body of self-authored patches when using
> > git format-patch; however, as I don't suffer from munged emails, I
> > haven't actually tested what that setting would be.

Well, I tried that Eric. The expected solution would be enabling this git 
setting:

git config [--global] format.from true
https://git-scm.com/docs/git-config#Documentation/git-config.txt-formatfrom

But as you can already read from the manual, the overall behaviour of git 
regarding a separate "From:" line in the email body was intended solely for 
the use case sender != author. So in practice (at least in my git version) git 
always makes a raw string comparison between sender (name and email) string 
and author string and only adds the separate From: line to the body if they 
differ.

Hence also "git format-patch --from=" only works here if you use a different 
author string (name and email) there, otherwise on a perfect string match it 
is simply ignored and you end up with only one "From:" in the email header.

So eventually I added one extra character in my name for now and removed it 
manually in the dumped emails subsequently (see today's
"[PATCH v7 0/3] 9p: Fix file ID collisions").

Besides that direct string comparison restriction; git also seems to have a 
bug here. Because even if you have sender != author, then git falsely uses 
author as sender of the cover letter, whereas the emails of the individual 
patches are encoded correctly.

Best regards,
Christian Schoenebeck




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E891FA5D96
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Sep 2019 23:35:37 +0200 (CEST)
Received: from localhost ([::1]:40210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i4tz6-0004JH-P2
	for lists+qemu-devel@lfdr.de; Mon, 02 Sep 2019 17:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37078)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1i4tpP-00014l-QZ
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 17:25:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <qemu_oss@crudebyte.com>) id 1i4tpN-0001jL-MS
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 17:25:35 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:52283)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <qemu_oss@crudebyte.com>)
 id 1i4tpN-0001fz-As
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 17:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C1vQFTE47z/tL5iJLtpo/naFHfnUi1fyTdlWVddhaoo=; b=KzVnOskKmcR2DqFDpl4NK0ed4m
 XcZVk7TKWwt1h9M/oamU08bBfSU/aR/kilm9TXUDTGs+7twbKYRkDFde9EAPnaHinvbqrNKPvh/vu
 qkA59suqar2ShklI/u08AmcPvsu31N9cnL0NznCbQCo14GDHLKFOEk94dEyKPZL81Q8uTvGeu2vgZ
 PKQcWyhNLZE+CJP2bVwYeSB1bsRW1XqH6323vVjpxWPLJWU/Ti2IIUS6gWeberQZwjf7UJ7zetaZ9
 eOGr8F2nzSSVo71sn3HssURP82FwUpLL6vRJm5HxFh5lxjcrG3jV0TJ3rYEMnwYCh14pt+B9MKJyR
 8rXHtj6RM3UHqabeZTXOxz8kjq3+sH6i7ayMNkPXBBgfyW/3u5qOWPzkZchqprZJ+5waqTgkaE+WQ
 9YnZUF3NsSIQfkyR/aAHZKiOtv9k3eHDHIqKOsKaTzGea4vZj5RFv+b3Sb+749EUv050GwrhHCaZg
 23gvSqCE9eT99pKeywXGsIKjTa6kMYrAZaNq0G0u+pvx7zcU4AVy2iGhSuOUqMnnLk8ps9SOVJoK0
 D2e2TH6KJ+gRtWatYQiUiA4rnslMOqlX5XWC7F+3lInmf4aIesj2lGRwnJuYHL611qAt4j5q95D9B
 iudo1pnWStT1YYTvNaJh2KwDnvHw2IOY/YM7+HlHY=;
To: qemu-devel@nongnu.org
Date: Mon, 02 Sep 2019 23:25:29 +0200
Message-ID: <1811575.MgG7zZa6in@silver>
In-Reply-To: <20190902134934.6b013f1a@bahia.lan>
References: <cover.1566503584.git.qemu_oss@crudebyte.com>
 <1985382.8LBUmpxoXr@silver> <20190902134934.6b013f1a@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.189.157.229
Subject: Re: [Qemu-devel] [PATCH v6 2/4] 9p: Added virtfs option
 'multidevs=remap|forbid|warn'
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
Cc: Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Antonios Motakis <antonios.motakis@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 2. September 2019 13:49:34 CEST Greg Kurz wrote:
> On Sun, 01 Sep 2019 20:56:16 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Freitag, 30. August 2019 14:22:38 CEST Greg Kurz wrote:
> > > Some more comments below.
> > 
> > [snip]
> > 
> > > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > > > index 8cc65c2c67..c96ea51116 100644
> > > > --- a/hw/9pfs/9p.c
> > > > +++ b/hw/9pfs/9p.c
> > > > @@ -25,6 +25,7 @@
> > > > 
> > > >  #include "trace.h"
> > > >  #include "migration/blocker.h"
> > > >  #include "sysemu/qtest.h"
> > 
> > [snip]
> > 
> > > > @@ -3672,8 +3807,13 @@ int v9fs_device_realize_common(V9fsState *s,
> > > > const
> > > > V9fsTransport *t,>
> > > > 
> > > >          goto out;
> > > >      
> > > >      }
> > > > 
> > > > +    s->root_ino = stat.st_ino;
> > > 
> > > This isn't used anywhere. It looks like a leftover of the readdir fix
> > > in v5.
> > 
> > Yes, both correct. I intentionally left it though, since I found it a
> > natural complement always capturing the root inode along to the root
> > device.
> Fair enough. The local backend opens an fd to the root directory, to be used
> by any access to the 9p share. I think root_dev/root_ino should be obtained
> with fstat() on this fd, to be sure they are consistent. Maybe add an extra
> struct stat * argument to the init function ? I'd rather see this done as a
> preparatory "backend to cache 9p root device/inode during init" patch.

Convinced. I'll drop root_ino from this patch set for now.




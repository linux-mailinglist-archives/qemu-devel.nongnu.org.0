Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC9B37BAA7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:34:58 +0200 (CEST)
Received: from localhost ([::1]:38902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmCf-0006Ut-UY
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lgm46-0003Ah-O0
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:26:06 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:48207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lgm41-0006eF-O5
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:26:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=i2ziuhqzdVt80/0yoYqtPD75A59hTkjq+sw3Nb17/d0=; b=tDNybia5P8TBcKb/VcDho7qBNi
 leB6AqGpNLVQGtP/c8FzKvWmfNwypvbxk/DyxKUM61YI1fOm6HvuXlN2InKUZxqfY8LNXwhKjnLbu
 JjYjeVGWAp9Y9L3bXDXQlTvZA2WIhQ9gBaGqnWSJtwty5CHmfbTqv7tQzIN8Z+92JSDSGuxiPA6Te
 vjYRkd8J/nQipKRTmu9Ciem5E7E5R5+lPnFwlETrL+4ydeqHeoQkuRyvzMF5XavH3D+r0OqMMro+3
 Ebnrke6gGbRgN4Qn8GSUwXl1NMWFRzQLaUca3azduDYPWmj9lRZQu2CW9/o0PDTdDUBsp6zSazLGr
 uUWaQx8CIo0jF5W25JlW8HnhKHu86fKwI/6JeVHtgnhlRi5UbueC0+NyHAewAs79a0b9vUjLccbmA
 SZnAdnumJT7J9coM3+l92r5ciSvgzhXGGtPgmI1tvKePKP+OAa/FfbkI3rkSg073+3CYdGO8D4bKl
 t4gzF1IYyDg8eICowWs4F5YUYM/inUcx5YzgBUIEBAJBisj9VMmYP/bMxjEPk0xHqw1mici18zhE7
 lPf2/RpX+Qi52qNmYV5Bl/EL7edTjjYe7AodeeHnk3n0jDNfmCc3wEPr6oG9WEwIK6/E/JOgtlaxw
 BUUpt71xUu7+oeMCjtlUXf/+Pvy+LreR58kpDqUh8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Connor Kuehl <ckuehl@redhat.com>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] 9pfs: add link to 9p developer docs
Date: Wed, 12 May 2021 12:25:56 +0200
Message-ID: <1839394.9N4xr98ZK1@silver>
In-Reply-To: <2208e250-4587-5902-f5c9-4786f8bd41e8@redhat.com>
References: <E1leeDf-0008GZ-9q@lizzy.crudebyte.com>
 <2208e250-4587-5902-f5c9-4786f8bd41e8@redhat.com>
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

On Dienstag, 11. Mai 2021 21:57:53 CEST Connor Kuehl wrote:
> On 5/6/21 8:12 AM, Christian Schoenebeck wrote:
> > To lower the entry level for new developers, add a link to the
> > 9p developer docs (i.e. qemu wiki) at the beginning of 9p source
> > files, that is to: https://wiki.qemu.org/Documentation/9p
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> > 
> >  hw/9pfs/9p-local.c             | 5 +++++
> >  hw/9pfs/9p-posix-acl.c         | 5 +++++
> >  hw/9pfs/9p-proxy.c             | 5 +++++
> >  hw/9pfs/9p-synth.c             | 5 +++++
> >  hw/9pfs/9p-util.c              | 5 +++++
> >  hw/9pfs/9p-xattr-user.c        | 5 +++++
> >  hw/9pfs/9p-xattr.c             | 5 +++++
> >  hw/9pfs/9p.c                   | 5 +++++
> >  hw/9pfs/codir.c                | 5 +++++
> >  hw/9pfs/cofile.c               | 5 +++++
> >  hw/9pfs/cofs.c                 | 5 +++++
> >  hw/9pfs/coth.c                 | 5 +++++
> >  hw/9pfs/coxattr.c              | 5 +++++
> >  hw/9pfs/virtio-9p-device.c     | 5 +++++
> >  hw/9pfs/xen-9p-backend.c       | 5 +++++
> >  tests/qtest/libqos/virtio-9p.c | 5 +++++
> >  tests/qtest/virtio-9p-test.c   | 5 +++++
> 
> Would it be helpful to also add this link to the virtio-9p stanza in
> MAINTAINERS? Something like:
> 
> W: https://wiki.qemu.org/Documentation/9p
> 
> Connor

Right, makes sense to me. I think I can just handle that as a separate patch 
subsequently, not worth a threaded V2 IMO.

@Greg: a humble PING from the silent 9p front.

Best regards,
Christian Schoenebeck




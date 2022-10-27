Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A6B60FD4A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 18:40:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo5t3-00075D-Mi; Thu, 27 Oct 2022 12:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oo5t1-0006aK-ER
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 12:37:43 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oo5sz-0000xq-RF
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 12:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=LCI+ZmQfy66B4+Zj0bTcdBAfekOGj2wa5HiCJYm1L2A=; b=rGqo7IzPTc54Q0dvWl6xa0WeEW
 XnoR9okY+NEDvve0erTtzUCC+BgTWbmWqn9WeMjCvjdyhtfmTl8Hai214JVd4XW1mbGKDejS2rg4/
 14rMFuCm10kHFyR3AhfwGRe+vAgye/f1eXi7ityRhMLY2uzfJ6B9dz6jJdc2DW8oToEmlaDAqc7ey
 Lnjekx7N7vXFrOjprbMTWLZJBqVD3dB4IcpX+27dr1OqOTpYl2xMiJ2QVEtT6BPq5sYIXVv1CnNLp
 iUx3vOrXC7P7uWrmM8zUjnpkzr8ypoa5rZ4HLo6YaH+OEg+602qpYDIVHZfD0Zs46fk8UWED9JaD4
 KvesbXOp8Z4Xm3uRXQ4Fu3CbCj7S1gLDqGyiIfPonJpd7XOt+SeMWEdqCUW74nRMchsBZyYhxzx12
 yuj5OpcxhWjFUmKsWNVimT3rCgojtXQG+iQupi+ApTRYRQI96Pjk6hjsUcxIQySUrXGZM5ea9rN2E
 mQefZPUFS5swJQ2zEUoEURD3c/I5UUyAScbyT20U2MM8U68mRUfS12XzUQ65TM7Fa+3GEwcUpaLv1
 K/yjNALQLd4CocXFPFeV8TzU488TkdosxwPKkND0g7mSX+6SGPpQbU3BkTym1jSETazVIBwAKCe8J
 hkASdCOWE0suKdXdv+MmROExhqPoKLjZrA5/iVN/g=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>,
 Linus Heckemann <git@sphalerite.org>, Bin Meng <bin.meng@windriver.com>
Subject: Re: [PULL 00/23] 9p queue 2022-10-24
Date: Thu, 27 Oct 2022 18:37:06 +0200
Message-ID: <3438372.x9l1EUDYgq@silver>
In-Reply-To: <4ad773a9-2173-3667-47f8-2713efffa053@redhat.com>
References: <cover.1666608862.git.qemu_oss@crudebyte.com>
 <4ad773a9-2173-3667-47f8-2713efffa053@redhat.com>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thursday, October 27, 2022 5:53:47 PM CEST Thomas Huth wrote:
> On 24/10/2022 12.54, Christian Schoenebeck wrote:
> > The following changes since commit 0529245488865038344d64fff7ee05864d3d17f6:
> > 
> >    Merge tag 'pull-target-arm-20221020' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-10-20 14:36:12 -0400)
> > 
> > are available in the Git repository at:
> > 
> >    https://github.com/cschoenebeck/qemu.git tags/pull-9p-20221024
> > 
> > for you to fetch changes up to 3ce77865bf813f313cf79c00fd951bfc95a50165:
> > 
> >    tests/9p: remove unnecessary g_strdup() calls (2022-10-24 12:24:32 +0200)
> > 
> > ----------------------------------------------------------------
> > 9pfs: performance, Windows host prep, tests restructure
> > 
> > * Highlight of this PR is Linus Heckemann's GHashTable patch which
> >    brings massive general performance improvements of 9p server
> >    somewhere between factor 6 .. 12.
> > 
> > * Bin Meng's g_mkdir patch is a preparatory patch for upcoming
> >    Windows host support of 9p server.
> > 
> > * The rest of the patches in this PR are 9p test code restructuring
> >    and refactoring changes to improve readability and to ease
> >    maintenance of 9p test code on the long-term.
> 
>   Hi Christian,
> 
> I think this PR broke the FreeBSD CI jobs:
> 
>   https://gitlab.com/qemu-project/qemu/-/jobs/3219611457#L3116
> 
>   https://gitlab.com/qemu-project/qemu/-/jobs/3219611460#L3372
> 
> Could you please have a look?
> 
>   Thanks!
>    Thomas

I try, but will certainly take some days, especially as I currently don't have
a BSD installation at hand to try the changes.

Right now I don't see something obvious. I would expect statfs being defined
in <sys/types.h> on BSD which is already included via "qemu/osdep.h" from
virtio-9p-client.c.

Best regards,
Christian Schoenebeck




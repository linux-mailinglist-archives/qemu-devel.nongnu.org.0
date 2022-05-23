Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BF6531572
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 20:14:41 +0200 (CEST)
Received: from localhost ([::1]:38818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntCZk-0007tP-Nl
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 14:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ntCN0-00083s-Bu
 for qemu-devel@nongnu.org; Mon, 23 May 2022 14:01:37 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:39215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ntCMP-0004Bs-Fq
 for qemu-devel@nongnu.org; Mon, 23 May 2022 14:00:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=kdOaPNqdKiUqGPqTepXude0v1LHBppL38xhTNFAbyUE=; b=JFgRBwGvqStc/xVkxZN1fSAgNI
 eoeei7L1fZ2sul7FXSHr1xAG5XHoKLc3P9YsQeH4W3SZhO0xWCXJJOiXyyTGCf3z5cowiATentBeT
 ndpFHvaIAP4qcSLaZkRigQWE++Wtc/C8eeT2fsVxJhOvjo3FmLSR0Tqxa4G3wiqJra0T9kmtwJPhc
 OVXC8q1IGfcerbwhca97OkTFuK7igLWk6048kz8aKrbjn+zSir21oG/aUxa85ZBdgpspT9nzUlFQc
 of+YJ+muE3Kc2v8OZClQotwRyVp6Mw4Ub4D0pmOWzj1TTh2iwLSUctqH1MJwIE7KnVkHOY8jI+PeI
 UzGWzXO7Tune+mjnH0oxIRuOLqr5y93m2iB6KPrNyLzneTJelcJRl4D4HqGK8az4isVKT4vg47tbq
 7zKwrZl6gi5zDkCr4lsx0rOEDgRrXFspjFDKRScxA8A06lR3G1pdjaTHMm0oB//byzf0A+oWkptnO
 MVePdl1LLPVNcPMiQmfUh99FYyXoiuAfh8EDMvm949esGEGCWFRM194LlPYx61A7Xuai+MOu7Uc1s
 Y2Rr94yywbsz5ugOX85CeUvUE/ZBOToXlAPjFJfD2ajRCqSUtOTofTv/JYvRcSxVIhrGSUCG+Ysr1
 hsDCvgiT3HHzNQpIXMO9ytusaKgOYCRzFwgQrTXME=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Eric Van Hensbergen <ericvh@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>, 
 netdev@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Dominique Martinet <asmadeus@codewreck.org>
Subject: Re: [RFC PATCH] 9p: case-insensitive host filesystems
Date: Mon, 23 May 2022 19:59:55 +0200
Message-ID: <6485122.aT25ngTQys@silver>
In-Reply-To: <YmMItCb97KqegQw5@codewreck.org>
References: <1757498.AyhHxzoH2B@silver> <YmMItCb97KqegQw5@codewreck.org>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 22. April 2022 21:57:40 CEST Dominique Martinet wrote:
> Christian Schoenebeck wrote on Fri, Apr 22, 2022 at 08:02:46PM +0200:
> > So maybe it's better to handle case-insensitivity entirely on client side?
> > I've read that some generic "case fold" code has landed in the Linux
> > kernel
> > recently that might do the trick?
> 
> I haven't tried, but settings S_CASEFOLD on every inodes i_flags might do
> what you want client-side.
> That's easy enough to test and could be a mount option

I just made a quick test using:

diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
index 08f48b70a741..5d8e77daed53 100644
--- a/fs/9p/vfs_inode.c
+++ b/fs/9p/vfs_inode.c
@@ -257,6 +257,7 @@ int v9fs_init_inode(struct v9fs_session_info *v9ses,
        inode->i_atime = inode->i_mtime = inode->i_ctime = 
current_time(inode);
        inode->i_mapping->a_ops = &v9fs_addr_operations;
        inode->i_private = NULL;
+       inode->i_flags |= S_CASEFOLD;
 
        switch (mode & S_IFMT) {
        case S_IFIFO:

Unfortunately that did not help much. I still get EEXIST error e.g. when 
trying 'ln -s foo FOO'.

I am not sure though whether there would be more code places to touch or 
whether that's even the expected behaviour with S_CASEFOLD for some reason.

> Even with that it's possible to do a direct open without readdir first
> if one knows the path and I that would only be case-insensitive if the
> backing server is case insensitive though, so just setting the option
> and expecting it to work all the time might be a little bit
> optimistic... I believe guess that should be an optimization at best.
> 
> Ideally the server should tell the client they are casefolded somehow,
> but 9p doesn't have any capability/mount time negotiation besides msize
> so that's difficult with the current protocol.




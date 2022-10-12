Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37B25FC374
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 12:06:59 +0200 (CEST)
Received: from localhost ([::1]:50614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiYde-0000pm-2P
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 06:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oiYXf-0005nM-AG
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 06:00:49 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:39039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oiYXc-0000Xr-GZ
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 06:00:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=IMd4dHR7XZlHP9QE1ceULDZ0rY60hzc70cHMXS3tOD4=; b=jZlpmggMjqZqop6rorcJF2vTHn
 A4W4VqwoG0EEzhxI0P10zUDzs0NHn8KVV3ZMQ6BMiD+87Ja28L0QuNwI5BAg0EGmJrTcwkcJK959f
 AB/kZNP38LQOkShflqZrdxnLRTGX/vezj+bygAXLVHRqWtFTlHWt7stx69cRngsDut+26g5FMTZaV
 MGhyJ63ppxnGsDdlMOuulUnXu16vdxD2FBvuMLd0r7SqXuGRrWWGRJUA22eaOw6qrFVvwSoupOtyi
 DjVPAaMWm2dynHDYhSAUgrZEPl9XxC/uOtajvxdOZXaLSn7gwQWvWnP1gmlYrke408a6pMCLNErRw
 0nCTQ1idiaDqrYK1hWfYz4vmZ/wIhgKSr5GQ8/SsZhIVlNfGuM7gp5azdWhUo/xMn3iLERdkpKIEa
 vrqeEafB+pku9irrb5pDCsyXwBrrAfpRSI7A27x8dUaBnKLkC/tSkJByd7c6+KHHiC3Z3BX2io9ce
 jm9paaw9dDM4kllcd2J2NzC2Pj0jJnyPtBZOQxwYzb2DiictdEYt9eTqP5dlxHmsuzK5MPyzWa7Ff
 AmisPwWP1sicFwEwz309aCAbXoL0iCb6Q853pRfvDTkkpIIV/1pb8gqUNzxtEUCoCyq7jb4uO3FLm
 1REQVGmiuo8SoRNtGPAyWPMoQX5arqEEK3Lk9ns+g=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 00/20] tests/9p: introduce declarative function calls
Date: Wed, 12 Oct 2022 12:00:40 +0200
Message-ID: <2170356.SogY61Bk0U@silver>
In-Reply-To: <cover.1664917004.git.qemu_oss@crudebyte.com>
References: <cover.1664917004.git.qemu_oss@crudebyte.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 4. Oktober 2022 22:56:44 CEST Christian Schoenebeck wrote:
> This series converts relevant 9p (test) client functions to use named
> function arguments. For instance
> 
>     do_walk_expect_error(v9p, "non-existent", ENOENT);
> 
> becomes
> 
>     twalk({
>         .client = v9p, .path = "non-existent", .expectErr = ENOENT
>     });
> 
> The intention is to make the actual 9p test code more readable, and easier
> to maintain on the long-term.
> 
> Not only makes it clear what a literal passed to a function is supposed to
> do, it also makes the order and selection of arguments very liberal, and
> allows to merge multiple, similar functions into one single function.
> 
> This is basically just refactoring, it does not change behaviour.

Too massive for review?

If so, then I'll probably just go ahead and prepare a PR early next week with 
this queued as well. It's just test code refactoring, so I am quite painless 
about these changes.

Best regards,
Christian Schoenebeck

> 
> PREREQUISITES
> =============
> 
> This series requires the following additional patch to work correctly:
> 
> https://lore.kernel.org/all/E1odrya-0004Fv-97@lizzy.crudebyte.com/
> https://github.com/cschoenebeck/qemu/commit/23d01367fc7a4f27be323ed6d195c527
> bec9ede1
> 
> Christian Schoenebeck (20):
>   tests/9p: merge *walk*() functions
>   tests/9p: simplify callers of twalk()
>   tests/9p: merge v9fs_tversion() and do_version()
>   tests/9p: merge v9fs_tattach(), do_attach(), do_attach_rqid()
>   tests/9p: simplify callers of tattach()
>   tests/9p: convert v9fs_tgetattr() to declarative arguments
>   tests/9p: simplify callers of tgetattr()
>   tests/9p: convert v9fs_treaddir() to declarative arguments
>   tests/9p: simplify callers of treaddir()
>   tests/9p: convert v9fs_tlopen() to declarative arguments
>   tests/9p: simplify callers of tlopen()
>   tests/9p: convert v9fs_twrite() to declarative arguments
>   tests/9p: simplify callers of twrite()
>   tests/9p: convert v9fs_tflush() to declarative arguments
>   tests/9p: merge v9fs_tmkdir() and do_mkdir()
>   tests/9p: merge v9fs_tlcreate() and do_lcreate()
>   tests/9p: merge v9fs_tsymlink() and do_symlink()
>   tests/9p: merge v9fs_tlink() and do_hardlink()
>   tests/9p: merge v9fs_tunlinkat() and do_unlinkat()
>   tests/9p: remove unnecessary g_strdup() calls
> 
>  tests/qtest/libqos/virtio-9p-client.c | 569 +++++++++++++++++++++-----
>  tests/qtest/libqos/virtio-9p-client.h | 408 ++++++++++++++++--
>  tests/qtest/virtio-9p-test.c          | 529 ++++++++----------------
>  3 files changed, 1031 insertions(+), 475 deletions(-)





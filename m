Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5513963963D
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Nov 2022 14:49:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyvWu-0007rn-Dr; Sat, 26 Nov 2022 08:47:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oyvWs-0007rM-Du
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 08:47:38 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oyvWq-00013q-7t
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 08:47:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=H9AIGBtZb7F4NzRPSesMx9cCQg5vJ716DPJP1BfiiQ8=; b=N2s7yC7kshvTm6YP6ht6oGct70
 2RGKGvI1twg42woDFk8HSwMNeXBtwC8vygKHre6RmA7i2FOFSBw1ynJ6rZ1EQQqHlLhgT/9DdvbqQ
 xqIZKIxkaeGkdLjfvRrjD7gzEyWaYFEl9pzVHseO9fQSGocAY+fc0pm2TbgDH1Gp2OR0BlLd9/S20
 PpfcGqeRfI8jKjizEiBoOw1YsB5NdonnylnKFpcEFEEVKL2l3z2YiGoQp4M5LsaLng2bzsAq18lGc
 UKAWGKS6JPvA2GzAx1wZNYrMDC27H0DWxrmON1d/LsiTKofPvWrKrYUE+MiX4dC2deTfjZUxLEgNF
 nayueQEB8J/0ry2zJT56rxE09vUBJSoXomK9QG5H1l0felb4pFcOC4U5PM6fxuegGux9EAyUwO7Fa
 uX0/6Vn+egcZMO5TbG0zKjKgqVsApQYnIygHNyVK14G9b1BlYk1CtdNtrUzGYQmwG5AaRGari9nmZ
 t6jYosft0Cgl17noBkAzjkvp4QwKPTDQE/6Yc5Mp1miCFfZa6Mo0SWWqJNSsQNkXS9U6KUnAD99p+
 NTln9CxVy40cRv1lQ9hXIpdXHLScKyBGYem/rOodVU5bnEqEWWtfgPf3CJ0BVhNDHXXPg/1fZrmeF
 UAc+X4X1q0vlOuoKlDIyVP7+SUqXdidYL/inEPwhg=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] 9pfs: Fix some return statements in the synth backend
Date: Sat, 26 Nov 2022 14:47:28 +0100
Message-ID: <3230646.Re4ecU78SW@silver>
In-Reply-To: <166930551818.827792.10663674346122681963.stgit@bahia>
References: <166930551818.827792.10663674346122681963.stgit@bahia>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thursday, November 24, 2022 4:58:38 PM CET Greg Kurz wrote:
> The qemu_v9fs_synth_mkdir() and qemu_v9fs_synth_add_file() functions
> currently return a positive errno value on failure. This causes
> checkpatch.pl to spit several errors like the one below:
> 
> ERROR: return of an errno should typically be -ve (return -EAGAIN)
> #79: FILE: hw/9pfs/9p-synth.c:79:
> +        return EAGAIN;
> 
> Simply change the sign. This has no consequence since callers
> assert() the returned value to be equal to 0.
> 
> While here also get rid of the uneeded ret variables as suggested
> by return_directly.cocci.
> 
> Reported-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/9pfs/9p-synth.c |   22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

I would have expected more locations like that.

Thanks!

Best regards,
Christian Schoenebeck




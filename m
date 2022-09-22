Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A595E6979
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:18:43 +0200 (CEST)
Received: from localhost ([::1]:51510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obPqT-0006x4-7Z
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1obOGe-00022Q-Eo
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:37:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1obOGa-00018T-V8
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:37:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663861052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ITKm2bQwYtn3Eacqn/yPvepVgtjVsnnfD/bbbRmj20M=;
 b=WUne2QCFIse08PRR/nExvFCpguuI29vgVooWvRewcRC4UeOj1epdJcaGC6CJ9BJjtNU7Yt
 3sD7DmBYu11OhTRUuaxHEH/sOA7+PoLt9x5hlLJuDxyZDFd8GZjTDRAP+8ebRwWnydEKZA
 Sh29MnqQ5ZPiM68vNcpWDjl7tgNuLRc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-optX-UEaMhaWk8ZZjlj9LQ-1; Thu, 22 Sep 2022 11:37:29 -0400
X-MC-Unique: optX-UEaMhaWk8ZZjlj9LQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D08B185A792;
 Thu, 22 Sep 2022 15:37:28 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33F6F47505E;
 Thu, 22 Sep 2022 15:37:23 +0000 (UTC)
Date: Thu, 22 Sep 2022 17:37:21 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH] block/qcow2-bitmap: Add missing cast to silent GCC error
Message-ID: <YyyBMe72wjTK3l0x@redhat.com>
References: <20220919182755.51967-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220919182755.51967-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Am 19.09.2022 um 20:27 hat Philippe Mathieu-Daudé geschrieben:
> Commit d1258dd0c8 ("qcow2: autoloading dirty bitmaps") added the
> set_readonly_helper() GFunc handler, correctly casting the gpointer
> user_data in both the g_slist_foreach() caller and the handler.
> Few commits later (commit 1b6b0562db), the handler is reused in
> qcow2_reopen_bitmaps_rw() but missing the gpointer cast, resulting
> in the following error when using Homebrew GCC 12.2.0:
> 
>   [2/658] Compiling C object libblock.fa.p/block_qcow2-bitmap.c.o
>   ../../block/qcow2-bitmap.c: In function 'qcow2_reopen_bitmaps_rw':
>   ../../block/qcow2-bitmap.c:1211:60: error: incompatible type for argument 3 of 'g_slist_foreach'
>    1211 |     g_slist_foreach(ro_dirty_bitmaps, set_readonly_helper, false);
>         |                                                            ^~~~~
>         |                                                            |
>         |                                                            _Bool
>   In file included from /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib/gmain.h:26,
>                    from /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib/giochannel.h:33,
>                    from /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib.h:54,
>                    from /Users/philmd/source/qemu/include/glib-compat.h:32,
>                    from /Users/philmd/source/qemu/include/qemu/osdep.h:144,
>                    from ../../block/qcow2-bitmap.c:28:
>   /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib/gslist.h:127:61: note: expected 'gpointer' {aka 'void *'} but argument is of type '_Bool'
>     127 |                                           gpointer          user_data);
>         |                                           ~~~~~~~~~~~~~~~~~~^~~~~~~~~
>   At top level:
>   FAILED: libblock.fa.p/block_qcow2-bitmap.c.o
> 
> Fix by adding the missing gpointer cast.
> 
> Fixes: 1b6b0562db ("qcow2: support .bdrv_reopen_bitmaps_rw")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks, applied to the block branch. And in case qemu-trivial picks it
up anyway:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480375BF1FA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:30:58 +0200 (CEST)
Received: from localhost ([::1]:54862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oandh-0002e1-Ev
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KZsR=ZX=zx2c4.com=Jason@kernel.org>)
 id 1oakGZ-0007NV-VM
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 16:54:51 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:38912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KZsR=ZX=zx2c4.com=Jason@kernel.org>)
 id 1oakGW-0006qe-Tw
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 16:54:51 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B7A19B82CE2;
 Tue, 20 Sep 2022 20:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F092DC433D6;
 Tue, 20 Sep 2022 20:54:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="KJ16/knb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663707280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HaCexwctgcdOqbjdHtHVH+buepZimqZcmXBHNKwQnww=;
 b=KJ16/knbY9AOwxMJt8c+Aih1wsJp9xtClvB4cU5lj7uOPZC/uBX2nAyXVY6hqNAqIKl7EF
 /yG709Ym3U6hvyKN2uGrwlaS4LyMNczLZvqIgnshxVIjw25ff2xqSuEInCyi3ZFbB2C6zQ
 dDfNW+ESHsy3XSdzI+yCxhOY4L+0W6I=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 715647ec
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 20 Sep 2022 20:54:40 +0000 (UTC)
Date: Tue, 20 Sep 2022 22:54:38 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Paolo Bonzini <pbonzini@redhat.com>, stefanha@redhat.com
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] qboot: update to latest submodule
Message-ID: <Yyooji0KGTpZxzL1@zx2c4.com>
References: <20220919134126.75656-1-pbonzini@redhat.com>
 <CAHmME9rkethn5PHDkB8CupEBOYWFnzfA9c_YkmB_YMt64ci3pQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHmME9rkethn5PHDkB8CupEBOYWFnzfA9c_YkmB_YMt64ci3pQ@mail.gmail.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=KZsR=ZX=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Mon, Sep 19, 2022 at 04:35:54PM +0200, Jason A. Donenfeld wrote:
> FYI, that commit made it to:
> 
> https://github.com/bonzini/qboot
> 
> But wasn't pushed to:
> 
> https://github.com/qemu/qboot
> https://gitlab.com/qemu-project/qboot
> https://git.qemu.org/?p=qboot.git;a=summary
> 
> I have no idea what's canonical, except that the submodule in the qemu
> checkout seems to point to the gitlab instance.
> 

With my prior email being ignored, this played out exactly as I
predicted it would:

Fetching submodule roms/qboot
fatal: remote error: upload-pack: not our ref 8ca302e86d685fa05b16e2b208888243da319941
Errors during submodule fetch:
        roms/qboot

Can somebody push https://github.com/bonzini/qboot to
https://gitlab.com/qemu-project/qboot please? It will only take a
second.

Thanks,
Jason


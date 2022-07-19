Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEE5579C3B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 14:37:34 +0200 (CEST)
Received: from localhost ([::1]:46270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDmTl-00083w-45
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 08:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org>)
 id 1oDmRh-0005za-LQ
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:35:25 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:36192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org>)
 id 1oDmRf-0005iW-Ew
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:35:25 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EB9F1B81A7F;
 Tue, 19 Jul 2022 12:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD63C341CA;
 Tue, 19 Jul 2022 12:35:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="MLLT0Zum"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658234118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WvlTsWoMecPUH0tIGy6f9DYCJdZDkuQB79ZQ9M6f+Y8=;
 b=MLLT0Zum8GLMTU6lfE4TrOkp89N6JfMzwzUS/M7VSOsOrDdkjR+XF0klk4o/z2ng9bLxF4
 aMzCdGIrzUqPNEAknQY8nqrbhydKQK3Mx4R2Xrjf1wVqA4r42RUGOxIoUk+5NnqsJZAOBC
 9uezmGJd3O30moVPA7Ge0dtGxHR9b9Y=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c06e68f4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 19 Jul 2022 12:35:18 +0000 (UTC)
Date: Tue, 19 Jul 2022 14:35:16 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 0/3] Misc patches for QEMU 7.1 freeze
Message-ID: <YtalBPp+QKS0wKWs@zx2c4.com>
References: <20220719093439.528810-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220719093439.528810-1-pbonzini@redhat.com>
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Paolo,

On Tue, Jul 19, 2022 at 11:34:36AM +0200, Paolo Bonzini wrote:
> The following changes since commit 0ebf76aae58324b8f7bf6af798696687f5f4c2a9:
> 
>   Merge tag 'nvme-next-pull-request' of git://git.infradead.org/qemu-nvme into staging (2022-07-15 15:38:13 +0100)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to 3746b8ca3e8bc216d03df5813080eeb06bdafabb:
> 
>   util: Fix broken build on Haiku (2022-07-19 11:32:21 +0200)
> 
> ----------------------------------------------------------------
> * Boolean statistics for KVM
> * Fix build on Haiku
> 
> ----------------------------------------------------------------
> Paolo Bonzini (2):
>       monitor: add support for boolean statistics
>       kvm: add support for boolean statistics
> 
> Thomas Huth (1):
>       util: Fix broken build on Haiku
> 
>  accel/kvm/kvm-all.c       | 10 +++++++++-
>  linux-headers/linux/kvm.h |  1 +
>  monitor/hmp-cmds.c        |  2 ++
>  qapi/stats.json           |  4 +++-
>  util/cutils.c             |  4 ++++
>  util/oslib-posix.c        |  4 ----
>  6 files changed, 19 insertions(+), 6 deletions(-)

Considering the subject line, I'm quite distressed that the i386
setup_data rng seed patch did not make it in. I just resent it to the
mailing list [1] in case you missed it before. Do you think you could
queue this up ASAP?

Thanks,
Jason

[1] https://lore.kernel.org/all/20220719115300.104095-1-Jason@zx2c4.com/


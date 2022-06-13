Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAF4549989
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 19:07:55 +0200 (CEST)
Received: from localhost ([::1]:36350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0nXe-0007F0-1L
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 13:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o0nUG-0004yc-B2
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 13:04:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o0nUD-0005Yf-K0
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 13:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655139861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1c2GNtpDGZjycff50g05vRyEgATydMBM3407fmclcDg=;
 b=VQMratCCMtm5fSbXcXF2MfxmdxCEmBFW0YMTHtUDoi73sUyZ69dtwZJtjwoz+WUcgcr7Jk
 JZvz9dlOjkFidaqLtKW+E7D99DrF49f0udAAeOWmV12DpXvHjXEgymfSdx+waA8ir0F+tF
 IrbndaTRK4e/pxbJ0BkyYSTajkZvU5Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-q9pI7XXVPPmDTzGVq_rxxA-1; Mon, 13 Jun 2022 13:04:18 -0400
X-MC-Unique: q9pI7XXVPPmDTzGVq_rxxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E12785A580;
 Mon, 13 Jun 2022 17:04:17 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDC2A1121319;
 Mon, 13 Jun 2022 17:04:16 +0000 (UTC)
Date: Mon, 13 Jun 2022 19:04:15 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, xieyongji@bytedance.com
Subject: Re: [PULL 00/18] Block layer patches
Message-ID: <YqduD9+GzwNLggWK@redhat.com>
References: <20220609172149.293877-1-kwolf@redhat.com>
 <a8b15969-fafa-e088-d778-278891c3970e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8b15969-fafa-e088-d778-278891c3970e@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Am 09.06.2022 um 22:18 hat Richard Henderson geschrieben:
> On 6/9/22 10:21, Kevin Wolf wrote:
> > The following changes since commit 028f2361d0c2d28d6f918fe618f389228ac22b60:
> > 
> >    Merge tag 'pull-target-arm-20220609' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-06-09 06:47:03 -0700)
> > 
> > are available in the Git repository at:
> > 
> >    git://repo.or.cz/qemu/kevin.git tags/for-upstream
> > 
> > for you to fetch changes up to 7f9a8b3342ff00d3398fdc08264948762d748edb:
> > 
> >    nbd: Drop dead code spotted by Coverity (2022-06-09 18:07:17 +0200)
> > 
> > ----------------------------------------------------------------
> > Block layer patches
> > 
> > - Add vduse-blk export
> > - Dirty bitmaps: Fix and improve bitmap merge
> > - gluster: correctly set max_pdiscard
> > - rbd: report a better error when namespace does not exist
> > - aio_wait_kick: add missing memory barrier
> > - Code cleanups
> 
> Several sets of compile failures:

Hi Yongji,

the vduse-blk code fails to compile with clang as shown below. As you
already sent another series to fix up other bugs introduced in the
series, maybe it would be better if you can send a new version with all
of the necessary fixes squashed in instead of me trying to make minimal
fixes to get it to compile with clang.

Kevin

> https://gitlab.com/qemu-project/qemu/-/jobs/2571008901
> 
> ../subprojects/libvduse/libvduse.c:578:20: error: unused function
> 'vring_used_flags_set_bit' [-Werror,-Wunused-function]
> static inline void vring_used_flags_set_bit(VduseVirtq *vq, int mask)
>                    ^
> ../subprojects/libvduse/libvduse.c:587:20: error: unused function
> 'vring_used_flags_unset_bit' [-Werror,-Wunused-function]
> static inline void vring_used_flags_unset_bit(VduseVirtq *vq, int mask)
>                    ^
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/2571008908
> 
> ../meson.build:1652:2: ERROR: Tried to use 'add_global_arguments' after a
> build target has been declared.
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/2571008833
> 
> ../subprojects/libvduse/libvduse.c:325:20: error: cast to pointer from
> integer of different size [-Werror=int-to-pointer-cast]
>   325 |             munmap((void *)dev->regions[i].mmap_addr,
>       |                    ^
> ../subprojects/libvduse/libvduse.c: In function 'vduse_dev_create':
> ../subprojects/libvduse/libvduse.c:1318:54: error: format '%lu' expects
> argument of type 'long unsigned int', but argument 3 has type 'uint64_t'
> {aka 'long long unsigned int'} [-Werror=format=]
>  1318 |         fprintf(stderr, "Failed to set api version %lu: %s\n",
>       |                                                    ~~^
>       |                                                      |
>       |                                                      long unsigned int
>       |                                                    %llu
>  1319 |                 version, strerror(errno));
>       |                 ~~~~~~~
>       |                 |
>       |                 uint64_t {aka long long unsigned int}
> 
> 
> r~
> 



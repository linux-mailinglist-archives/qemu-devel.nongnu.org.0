Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8211E5F59CF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 20:23:36 +0200 (CEST)
Received: from localhost ([::1]:35900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og93P-0003sQ-3L
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 14:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1og8sP-0004bs-M6
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 14:12:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1og8sL-0005Of-Bm
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 14:12:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664993528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i6JgbeNdlvw7N6ii+aYuSrqJ2NkKb/afXgNFe92/D9U=;
 b=SaZWrUPuuTrChSSHw2BTmSl1XVyHxaPYbSCz0eRniI0tx+qhglkw2kDVsCLOyDm6SvIMGW
 737NhzkJbKH473xf4evN0VFEgx8q6ceHKPT1qrgIkZA8SWJOSU2pXx4+DNNiq555Y0stoT
 mCJ5yeSwlQkK2wo2lT3Wm2yvUonVNpk=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-27-Lw_vNj2ePYWvtlsZJD7Y4w-1; Wed, 05 Oct 2022 14:12:05 -0400
X-MC-Unique: Lw_vNj2ePYWvtlsZJD7Y4w-1
Received: by mail-io1-f70.google.com with SMTP id
 j20-20020a6b3114000000b006a3211a0ff0so11333368ioa.7
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 11:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=i6JgbeNdlvw7N6ii+aYuSrqJ2NkKb/afXgNFe92/D9U=;
 b=4HQbI+ATCBRSVl3wzkyctmImi40Vstg389n2SyXya+LqCVmr249qnXqQVjFnzcyhRU
 qOplj45PuxFCTmCEi1OtMesg5Aipl7Z9nroxFCUuuAoC1mB97yFVlCD+nS3aIuuVcW9o
 PfyNUGJv+G1hyVxLsICUCVdJ4fdR9Kg3bgvIy+KP2YGjAlpoC48u8xuEBFe6zXkuThuW
 S6Av+s17bwD7a6lOxBbHE6Iqj5MUYAMgTywWwMNTZeHgeIwh+xuvkAvKtqT0L9jWbX6K
 +qQQ16AloZ5XOv5pajxRY67EWhPaiO4bJM347hshkDgFQV6clb31ZBp7hr0vkGkxqiOp
 cjnA==
X-Gm-Message-State: ACrzQf30fKOHHjSI83DFmWoHpqpo8cG3+VXWIolMnqM6qHMDbRwhYjZz
 adWycDKJL0Kjef8dXR6hcKx3Lyi1GgNw1hlBFMxFj2dVRIgig1JrgfWuu5Ib8OO7ML1bM1FfCcX
 UxiaqpMwFUuAybLB47hhWmOGMJPWvq6U=
X-Received: by 2002:a02:cabb:0:b0:363:5b16:c871 with SMTP id
 e27-20020a02cabb000000b003635b16c871mr457813jap.6.1664993524602; 
 Wed, 05 Oct 2022 11:12:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6R3S6VuTM2iXgpMNcYiclUNF2/Tw23Vq9BlrGgo2cLZ0si4YWsq4oJciogfE6ejFCQ9vk5L4T+NrOmhUOGdQQ=
X-Received: by 2002:a02:cabb:0:b0:363:5b16:c871 with SMTP id
 e27-20020a02cabb000000b003635b16c871mr457806jap.6.1664993524456; Wed, 05 Oct
 2022 11:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220922084924.201610-1-pbonzini@redhat.com>
 <20220922084924.201610-3-pbonzini@redhat.com>
 <CAELaAXwqcWz4uh0OroLOm7F1Jx7Z9MvQCh_+QjxEgKPf11Xp7g@mail.gmail.com>
 <CABgObfa-p-LNqRgG8PPago3-V+ygz3m8jjmq8Ub8egUD6O5LvA@mail.gmail.com>
In-Reply-To: <CABgObfa-p-LNqRgG8PPago3-V+ygz3m8jjmq8Ub8egUD6O5LvA@mail.gmail.com>
From: Alberto Campinho Faria <afaria@redhat.com>
Date: Wed, 5 Oct 2022 19:11:28 +0100
Message-ID: <CAELaAXwzbL99CuTEU6NpOkuGyJRiN_x_8PHoOXzWHDnfFQuN_A@mail.gmail.com>
Subject: Re: [PATCH 02/26] block: add missing coroutine_fn annotations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, Sep 24, 2022 at 2:42 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Because at the time I wrote the patch, blk_pwrite_zeroes() was a
> coroutine_fn. :)
>
> It is called from bdrv_co_create_opts_simple which is coroutine_fn and
> performs I/O, so it should be a coroutine_fn. I have a few more patches
> to not go through the generated_co_wrappers, but I was curious to see
> if we could automate those changes through your tool.

The static analyzer [1] should find all such cases, e.g.:

    ./static-analyzer.py -c no_coroutine_fn build block

coroutine_fn and generated_co_wrapper must be adjusted for this to
work on master:

    #define coroutine_fn __attribute__((__annotate__("coroutine_fn")))
    #define generated_co_wrapper
__attribute__((__annotate__("no_coroutine_fn")))

[1] https://gitlab.com/albertofaria/qemu/-/tree/static-analysis



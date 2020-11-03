Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8602A4A90
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 17:01:27 +0100 (CET)
Received: from localhost ([::1]:47530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZykQ-0004Ko-9s
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 11:01:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZyij-00032Y-PP
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 10:59:41 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZyih-0002J3-UW
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 10:59:41 -0500
Received: by mail-ej1-x635.google.com with SMTP id gn41so7578062ejc.4
 for <qemu-devel@nongnu.org>; Tue, 03 Nov 2020 07:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=90PcIvnK3QaxkyGFVcQl/vw8IMnm+CzLWTPAREKXP4g=;
 b=FNBm+VPDogYJ48z/nCIpeVH2x1HJEUCLCKVMdYbdzIOgTam5TXAlvSjdft5FbUSzP8
 Psxccr1rbW/ZPZ83Z6QOwbYj9DDwLhNloVPIYfnaflFmw32zw0qmK1FTiaqSwi4VM8TH
 ZMtEOg8Qu9gaK8XOxpILmYGcmq/vPL8RjC3FAVVjd4PqLpCOi22XvXi5liNsHoIaj/c5
 wP/BHmASaw4dkAa7l6Khkk2imiXVwyhpsg2lJZV9Nvw2iucmuylO4Hahfbuah0rpRCsv
 S/oVtBkIJSgkQUbeaVUW3wr2htewedev+ItL0SvNVZ6sZy6RHsbJXIDIGabxZvu1hbyS
 x9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=90PcIvnK3QaxkyGFVcQl/vw8IMnm+CzLWTPAREKXP4g=;
 b=fMvBcUeemu6Gj/2YrhwnSLfaHqj1eS/LjcM/bvrXFzf9u+pO22foGCqmV9AEcGC7aY
 zo3mHUj9iklXaSV5q46kUDsFhBi/Y7fyuzZehahjiVb0rm4GFGnqJQVwpFOzp/omA68X
 Tc0bpPt86MsJ66McA4ZsdRcsQRbYz93SSrs5cq4pxAIYuPSzI6h7N3Aogds+bMFr4ZUA
 fh2qfWTTLeRokLf3qOS3ZoFUqi3ao2g9jNdg6mYnHJyZ2rCCU0yy5zkIKMa41BL5EGwk
 EjUbLSnCibRnvU+BdzlzBpdm+FnMz7B++F9oxaX3+oPul2gUpouAGAIqoNnJwMJdt+22
 9pCw==
X-Gm-Message-State: AOAM531uoKHOWGn/szwCh2iY36292Jm+owu3uleGhIUULngOvf4yDLHB
 xPeLkbZBDo4Xa6YCzyOWuxG+njy1L4v+U1t0ta3Mbw==
X-Google-Smtp-Source: ABdhPJzOy4R1OmfT2ikDJwe514YtWzNJGlLzloQRY8XSOF3uUlAfeYcL97TGY0wDkD2uqtAaJ0ExtSmzS+7qJSSzlhE=
X-Received: by 2002:a17:906:6949:: with SMTP id
 c9mr8571298ejs.482.1604419178151; 
 Tue, 03 Nov 2020 07:59:38 -0800 (PST)
MIME-Version: 1.0
References: <20201103142306.71782-1-mst@redhat.com>
In-Reply-To: <20201103142306.71782-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Nov 2020 15:59:26 +0000
Message-ID: <CAFEAcA_xrTeHybdCro0CNar1dsMtfGG2ucHtF=j_QsU2g-JZxw@mail.gmail.com>
Subject: Re: [PULL 00/38] pc,pci,vhost,virtio: fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Nov 2020 at 14:34, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit c7a7a877b716cf14848f1fd5c754d293e2f8d852:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20201102' into staging (2020-11-03 10:38:05 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to cf0bdd0a703911f80fc645dec97f17c4415af267:
>
>   vhost-user-blk-test: fix races by using fd passing (2020-11-03 09:19:12 -0500)
>
> ----------------------------------------------------------------
> pc,pci,vhost,virtio: fixes
>
> Lots of fixes all over the place.
> virtio-mem and virtio-iommu patches are kind of fixes but
> it seems better to just make them behave sanely than
> try to educate users about the limitations ...
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> ----------------------------------------------------------------

Fails to compile on 32-bit host:

../../hw/vfio/common.c: In function 'vfio_listener_region_del':
../../hw/vfio/common.c:953:20: error: invalid operands to binary ==
(have 'Int128 {aka struct Int128}' and 'Int128 {aka struct Int128}')
         if (llsize == int128_2_64()) {
                    ^~ ~~~~~~~~~~~~~

This needs to use int128_eq() to do the comparison.

thanks
-- PMM


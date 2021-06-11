Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542173A41A6
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 14:03:46 +0200 (CEST)
Received: from localhost ([::1]:37452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrft3-0002KK-6S
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 08:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrfs2-0001W7-GN
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 08:02:42 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrfs0-0001zO-2S
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 08:02:42 -0400
Received: by mail-ej1-x634.google.com with SMTP id a11so4210244ejf.3
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 05:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=couaFDgQS928iGDp/e8vCcQk6YNEKNWznqvUaymwNBE=;
 b=DdG4D8dK//e50km3/8TP2QjmSAwkfuHg/pLu0EVb2gQ2oao+RaiVXg/4eXeukfO3RD
 fjq45NZtV379eklQJWY7mjQ9Q8qRF+EvtIURVhorYhbAj9MJ3RUk9cmk9zAlmHmrfmzk
 a402lAVu28URbS+CvaIm293mAezIwBBHoac7CZiL32qAkct+NJr10KGVSyoOwi+MRfO6
 uvP4NehrTEw+Xp8P1xmPnM1ZTKO2NI/QiJGnaoIiiJ5jiZc2Iv3YXJqSexI4mfcf5xg2
 pLAcREu6IYY8AkbygU74e0Po4J2g7oWQLe8CF3ttuGmVKlu8rXTLJPH7EnlSFPSq5xe+
 0KZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=couaFDgQS928iGDp/e8vCcQk6YNEKNWznqvUaymwNBE=;
 b=Qf2hOdE2rP6lzJxBRkJyfSB2XquaW9upodUQ60I0ppVOvIhufkD0EhFlHbU20QG6KR
 kOjXeTEUg9PEsIJbAbDqIADy2hjUpPRObUgA5lj8JGDMSXku7N8VJEzduB6ZWYLpB2x6
 e25OsrOMpL9wx7tYkbteaRBu+t7I2Brr1FWajJRKCRnBWe/3ymX7ACZO7f7cmEGJ/NMt
 6wT8nAGSTkwABmp39ZeuysP7fuJagtQtCTxl750NI42vbvdN5uRFT7IkXAYyIr1FuABw
 Xn4Mqaqj3HWLjc6buoJquB5r0QvEl0PBh06XE53YKagH2sms7Y/XNmB3oRleHl7QBP4m
 LXMw==
X-Gm-Message-State: AOAM530oXLj5P5+SDS0y4dB8a0djPQjBTPlKku67/MB0/vNw1AJJCFmS
 f9ZBMx/JHfDviHlfxzB7kx8WHG/0bVCuIbosk/KCrw==
X-Google-Smtp-Source: ABdhPJzusjt8Wr5PpFHz47TSJwko5vx0PR52Zf8b/gMGfS52zcO4/HQV4efWaErp+454g86mL69x9fuiZOIWt6awUxs=
X-Received: by 2002:a17:907:9047:: with SMTP id
 az7mr3277366ejc.4.1623412958499; 
 Fri, 11 Jun 2021 05:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210611060024.46763-1-jasowang@redhat.com>
In-Reply-To: <20210611060024.46763-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Jun 2021 13:02:04 +0100
Message-ID: <CAFEAcA-wD0CKbO60XFhhnTrTnNt+cHPYhJHc0O-db2_E_h4ZPg@mail.gmail.com>
Subject: Re: [PULL 00/12] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Fri, 11 Jun 2021 at 07:00, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit 7fe7fae8b48e3f9c647fd685e5155ebc8e6fb84d:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-migration-20210609a' into staging (2021-06-09 16:40:21 +0100)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 5a2d9929ac1f01a1e8ef2a3f56f69e6069863dad:
>
>   Fixed calculation error of pkt->header_size in fill_pkt_tcp_info() (2021-06-11 10:30:13 +0800)
>
> ----------------------------------------------------------------
>
> ----------------------------------------------------------------
> Jason Wang (4):
>       vhost-vdpa: skip ram device from the IOTLB mapping
>       vhost-vdpa: map virtqueue notification area if possible
>       vhost-vdpa: don't initialize backend_features
>       vhost-vdpa: remove the unused vhost_vdpa_get_acked_features()
>
> Paolo Bonzini (1):
>       netdev: add more commands to preconfig mode
>
> Rao, Lei (7):
>       Remove some duplicate trace code.
>       Fix the qemu crash when guest shutdown during checkpoint
>       Optimize the function of filter_send
>       Remove migrate_set_block_enabled in checkpoint
>       Add a function named packet_new_nocopy for COLO.
>       Add the function of colo_compare_cleanup
>       Fixed calculation error of pkt->header_size in fill_pkt_tcp_info()


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM


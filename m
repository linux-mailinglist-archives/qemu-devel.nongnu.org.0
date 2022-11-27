Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1EC639C37
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Nov 2022 19:07:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozM3d-0003Tv-GI; Sun, 27 Nov 2022 13:07:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozM3b-0003TK-AQ
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 13:07:11 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozM3V-0007De-4U
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 13:07:06 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id c140so10764461ybf.11
 for <qemu-devel@nongnu.org>; Sun, 27 Nov 2022 10:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xSD4Am91WG7QgQOJC2eL7xaE7kReufLsAScEwnhv3t4=;
 b=Aj/SlnTwA8fvXHl7hQ6iwDOyzwZiFBTP0KR118XlULTMCI9PwvYmK4z9qpdAAB/1QH
 LRWDFEB9rt1HLENoozVOk8lp6TpwHsc92Sn5WRm2onF1BPUN/1jCpWkL5uuO+m9FGwNQ
 Ft33Nigb55WpZX9upXPrqYZMx34IceTbqxivSo6132AykoBKhyFx5TFUV6pTU5xMUcnq
 O0m0zb0s0bfsWzrnfCP2Dy0SiaNxTN6Q564zI6TYvx5wz8PHkVgAd+JuH9iFWzKguBCR
 uDGIKbKLgs4C2r5+E5etnPkdlrhHiVZf3/e1fbqK9vhw8NtcPKjjJgV9cHY6exTg+A9V
 ZMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xSD4Am91WG7QgQOJC2eL7xaE7kReufLsAScEwnhv3t4=;
 b=VDtbrPi+WKm6Pou+MC9LmIKp9/xcZVN302mxGvT8KDC84OzBabjgnkM09B7QpKaXfM
 t3oVTtSTyEMToi5Rku5MnQWN9CMSVefMbnGy50UbSwpc9dX2/wr2hl2v8/l90+xONchW
 2AgO3G5gNZ8BQ+aPAI4sn3eBW7jbrqBX2y6fOhhK+jSOzart+TH9kmoapjt1k0hFyKUo
 0empuHLESSFbzI0qy4xir+v0WZBxhApjnpl9qX5HXdyD4FI4AkfihM5z5QHtV1Ufs6ax
 4RCckMQ5fDH37zfGdnoHCcklXJ0DB9mSjNMhEM7rlPg6pUKZd7VHXKrjuAk2n50ktYrn
 DTwQ==
X-Gm-Message-State: ANoB5pl56sB8g4bvSdnFP17hCHM9cUeNaEpvw279O3o0tPOhUQ8U8iRK
 vISFPELYoV8I86cJe7uXQMHDT72vXfeQi6NkZ30=
X-Google-Smtp-Source: AA0mqf6akiFmzC9y1Kob5aBZY0cBcSFJhXpR7ydNrbdGLrXo56tTq9FlKXUYcQDAMY1d2g6bzDMumBNnQNWpQvMuCbI=
X-Received: by 2002:a25:918a:0:b0:6ca:ecb9:970a with SMTP id
 w10-20020a25918a000000b006caecb9970amr26629705ybl.209.1669572423938; Sun, 27
 Nov 2022 10:07:03 -0800 (PST)
MIME-Version: 1.0
References: <20221126152507.283271-1-sw@weilnetz.de>
 <20221126152507.283271-4-sw@weilnetz.de>
In-Reply-To: <20221126152507.283271-4-sw@weilnetz.de>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 27 Nov 2022 13:06:52 -0500
Message-ID: <CAJSP0QUkX9n673f+9LYhKFK+35qEhhLOTLq2BeAQMv8bCLrVyw@mail.gmail.com>
Subject: Re: [PATCH v3 for-7.2 3/6] libvhost-user: Fix two more format strings
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Sat, 26 Nov 2022 at 10:25, Stefan Weil <sw@weilnetz.de> wrote:
>
> This fix is required for 32 bit hosts. The bug was detected by CI
> for arm-linux, but is also relevant for i386-linux.
>
> Reported-by: Stefan Hajnoczi <stefanha@gmail.com>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

>
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> index d67953a1c3..80f9952e71 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -651,7 +651,8 @@ generate_faults(VuDev *dev) {
>
>          if (ioctl(dev->postcopy_ufd, UFFDIO_REGISTER, &reg_struct)) {
>              vu_panic(dev, "%s: Failed to userfault region %d "
> -                          "@%" PRIx64 " + size:%zx offset: %zx: (ufd=%d)%s\n",
> +                          "@%" PRIx64 " + size:%" PRIx64 " offset: %" PRIx64
> +                          ": (ufd=%d)%s\n",
>                       __func__, i,
>                       dev_region->mmap_addr,
>                       dev_region->size, dev_region->mmap_offset,
> --
> 2.35.1
>


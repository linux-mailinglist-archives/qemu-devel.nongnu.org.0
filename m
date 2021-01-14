Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2722F6AEC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:28:45 +0100 (CET)
Received: from localhost ([::1]:34938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08IW-0002kX-8e
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1l08AR-0004sG-HL
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:20:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1l08AN-000291-QZ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:20:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610652018;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=bAEhcO882/4ubi118mKje4JscOkXKHD9qSyaA68ErFE=;
 b=INIg1HXlY98c/MeHLzwgwxfoCz7svB8E/7UFWXhqSjlmCMaJx7gsFFh8MH9lq8I06K6ocp
 kYyRHrVtPWHTVgSkIeiv+wcm76jnZl4HfP0VnUhfb1pIQI85Lw9giaK4qeSFGaMKNXgXEj
 mf4BoiEekRlMAJ2eT86ttgkR85Up52s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-NTEa8YTFMP-jk_nFYy-y9Q-1; Thu, 14 Jan 2021 14:19:10 -0500
X-MC-Unique: NTEa8YTFMP-jk_nFYy-y9Q-1
Received: by mail-wr1-f69.google.com with SMTP id j5so3031293wro.12
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 11:19:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=bAEhcO882/4ubi118mKje4JscOkXKHD9qSyaA68ErFE=;
 b=XwsckQFO/DxHi2eybEPOyB/0IXM6r8H5uRem7CbhW5b/a78DELuhJz6Q1UgvGeN0rZ
 NYQP2K/UwAFnxkVdKW+SUBBrerJ9wnvzkr0rzcQCCcmnvb94y2z79tdMevEWhwiYYAD1
 jdg8hXG/Ax8yGdAoWzQpa+AGweCphA9Zn8V6+OY7LfFYfY0lmsqWcWZrtCjcpMJ9flJr
 8wpNhcLI4iJPGQ19s37XxooYzqcmYtuAnKtPTHwOhUDk54Z0NdH9atBIHFxRmltWkWU6
 mLM4uszxnvXvGelfKB2pgU13P3HsKmplwqrtJIOaabKo6KOWYUdz9Jw+xxqZ+ugbRa6J
 MQLw==
X-Gm-Message-State: AOAM533AS96JGz3SvlYdmTIxIec636GhLss35zdaj/YbyOkzzUlqFum+
 t5Ea8ZqiLmyQ9FxrvGQO33elPgVZ72WpU4BwsjWb3Px+tRNIgpMvT7FFhW4i9mBqh+Mfv6gyw87
 ewvp3IHaB4coR2Z+/zkOiLybMXZExoPE=
X-Received: by 2002:adf:f6c9:: with SMTP id y9mr9557398wrp.121.1610651949592; 
 Thu, 14 Jan 2021 11:19:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZxIUxFPDyBYRy+2lnd59/HDXCgtqlpodW5TfIOlA48L5CBWXtHAvglq+v5d+fGDI4BOufg0FmoniDkD0V1Ls=
X-Received: by 2002:adf:f6c9:: with SMTP id y9mr9557386wrp.121.1610651949421; 
 Thu, 14 Jan 2021 11:19:09 -0800 (PST)
MIME-Version: 1.0
References: <20201227164236.10143-1-pl@kamp.de>
 <20201227164236.10143-4-pl@kamp.de>
In-Reply-To: <20201227164236.10143-4-pl@kamp.de>
From: Jason Dillaman <jdillama@redhat.com>
Date: Thu, 14 Jan 2021 14:18:51 -0500
Message-ID: <CA+aFP1DnYJjbt99Je841E_ZZi-7nKY89FF1apHF=y4bZ7fuEUw@mail.gmail.com>
Subject: Re: [PATCH 3/7] block/rbd: use stored image_size in qemu_rbd_getlength
To: Peter Lieven <pl@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jdillama@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jdillama@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: dillaman@redhat.com
Cc: Kevin Wolf <kwolf@redhat.com>, Christian Theune <ct@flyingcircus.io>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Dec 27, 2020 at 11:42 AM Peter Lieven <pl@kamp.de> wrote:
>
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
>  block/rbd.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index bc8cf8af9b..a2da70e37f 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -956,15 +956,7 @@ static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
>  static int64_t qemu_rbd_getlength(BlockDriverState *bs)
>  {
>      BDRVRBDState *s = bs->opaque;
> -    rbd_image_info_t info;
> -    int r;
> -
> -    r = rbd_stat(s->image, &info, sizeof(info));
> -    if (r < 0) {
> -        return r;
> -    }
> -
> -    return info.size;
> +    return s->image_size;
>  }
>
>  static int coroutine_fn qemu_rbd_co_truncate(BlockDriverState *bs,
> --
> 2.17.1

An RBD image can technically change size dynamically while in-use. The
original code would provide the most up-to-date length but this
version will always return the size of the image when it was opened.


--
Jason



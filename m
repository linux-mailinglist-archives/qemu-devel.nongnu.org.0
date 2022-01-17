Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E746949102A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 19:19:56 +0100 (CET)
Received: from localhost ([::1]:42798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Wbj-00075i-Bs
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 13:19:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1n9WY6-0003gI-DC
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 13:16:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1n9WXv-0001PL-OD
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 13:16:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642443359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aS5fCwwlRdsCJVX7P/9nYoSsTUo0fso9L0b5kbv6pu4=;
 b=MimURvEgn9dBPmgb+39Pf+r41UanjK1SvCfTyKkRiEm/ARXbSnAvKb4t1o0pZXRPx2k2Az
 XLPtqvJwyDhy/OXnboqq3dh0L1q1tEfnX1UvXCIIqt7tTxcGkaxrIvU6V5+aZOaMQluTGU
 TFotg7tNyCpolL+PXjGVKgyx7qo68y0=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-FAu04leRNCKvnZaeSJq19Q-1; Mon, 17 Jan 2022 13:15:56 -0500
X-MC-Unique: FAu04leRNCKvnZaeSJq19Q-1
Received: by mail-lf1-f72.google.com with SMTP id
 x23-20020ac25dd7000000b0042ffb81aaffso6297464lfq.5
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 10:15:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aS5fCwwlRdsCJVX7P/9nYoSsTUo0fso9L0b5kbv6pu4=;
 b=1kX5tiOpikJeqwWXUfmjCIeIa8IPd7HCDcitLIpSM83tOn/IA+IC6yADZ5XiYYd8qG
 hezEyxmq91ZKDz64JoWO4qw89Y4nvHYg+M/2fbIXqTpN7v9YIcZuSFiQjpcpybpcGMMG
 LaD6RBcmYjDkgJO+bLQwK6eF1yOEVA2Yp6LA/gYFm9vSalWiSPoZbK/JTxF4MuKozP0r
 mTcZ6axMVAJKScUTYQFGqQF2cVvnszW18lUahjDquQIrGMGZmgb6g75AOR/0GSzLP0Oi
 0hQml+hJZtmLxhr7HHVCSy/lYYli6JybTrG06+etnxlV4ao7q7MX/Si8dSvUrwDDRaJL
 S7Ww==
X-Gm-Message-State: AOAM5319SLpzJMLK4orrg0qj7J9I4EGoj1m8H1kRJ0SLNqaJ21mTfStA
 TEwYrPd2yDPE/80fFd/rHM2vTfct/Zw1lMKolst53fqCdfyae17BOae7TzlkGMXi1QpbvNfTrTU
 yDL2N8zjv12lFYP+0V7dJEOHv2KQZ3MA=
X-Received: by 2002:a05:6512:3da1:: with SMTP id
 k33mr16623779lfv.212.1642443355398; 
 Mon, 17 Jan 2022 10:15:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpTHFVbwMrLLRR8xYZ8XxLMnFECOpaeol90gXeuoZdkN3rCTvEyFTyBhNGDNunpJo/7yCJI0AZmjcnkPG9+c8=
X-Received: by 2002:a05:6512:3da1:: with SMTP id
 k33mr16623754lfv.212.1642443354993; 
 Mon, 17 Jan 2022 10:15:54 -0800 (PST)
MIME-Version: 1.0
References: <20220117162649.193501-1-hreitz@redhat.com>
 <20220117162649.193501-2-hreitz@redhat.com>
In-Reply-To: <20220117162649.193501-2-hreitz@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Mon, 17 Jan 2022 20:15:39 +0200
Message-ID: <CAMRbyyugX6mvQzt=Mb11assL1FoMwWvGEXYFZLJjZHi7H+07zQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] block/io: Update BSC only if want_zero is true
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 17, 2022 at 6:26 PM Hanna Reitz <hreitz@redhat.com> wrote:
>
> We update the block-status cache whenever we get new information from a
> bdrv_co_block_status() call to the block driver.  However, if we have
> passed want_zero=false to that call, it may flag areas containing zeroes
> as data, and so we would update the block-status cache with wrong
> information.
>
> Therefore, we should not update the cache with want_zero=false.
>
> Reported-by: Nir Soffer <nsoffer@redhat.com>
> Fixes: 0bc329fbb009f8601cec23bf2bc48ead0c5a5fa2
>        ("block: block-status cache for data regions")
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  block/io.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/block/io.c b/block/io.c
> index bb0a254def..4e4cb556c5 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -2497,8 +2497,12 @@ static int coroutine_fn bdrv_co_block_status(BlockDriverState *bs,
>               * non-protocol nodes, and then it is never used.  However, filling
>               * the cache requires an RCU update, so double check here to avoid
>               * such an update if possible.
> +             *
> +             * Check want_zero, because we only want to update the cache when we
> +             * have accurate information about what is zero and what is data.
>               */
> -            if (ret == (BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID) &&
> +            if (want_zero &&
> +                ret == (BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID) &&
>                  QLIST_EMPTY(&bs->children))
>              {
>                  /*
> --
> 2.33.1
>

ovirt-imageio tests pass with this change.
Thanks for the quick fix!

Reviewed-by: Nir Soffer <nsoffer@redhat.com>



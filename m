Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE20561FB6
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 17:52:34 +0200 (CEST)
Received: from localhost ([::1]:33522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6wT3-0001AA-IH
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 11:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1o6wQF-0007Pm-7J
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 11:49:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1o6wQB-0004N3-KU
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 11:49:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656604172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2yK+Jhs4tO5sBXiYUFDvd5dhQbCr1Mt36k4c5FyPQ20=;
 b=Z6OwxOoDTPQId529UGoc697gP//LBfg65MHCzkbBTBtuN/WHTv1k91NzAiql8uWwI2BTiX
 B4Bg3f+/Alj1ZxAQhsX8Hpg8aNbBkh/AxpIem0dVGFnNVDueqRdYGnaOutWI7oRUZYzcy9
 co2bR01L5e27rFslXRnWk+lZVZNa6Lg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-0NRby8GbO3qlcfNH42e_tA-1; Thu, 30 Jun 2022 11:49:31 -0400
X-MC-Unique: 0NRby8GbO3qlcfNH42e_tA-1
Received: by mail-qk1-f198.google.com with SMTP id
 o70-20020a37a549000000b006af05e7eca3so18699578qke.10
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 08:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2yK+Jhs4tO5sBXiYUFDvd5dhQbCr1Mt36k4c5FyPQ20=;
 b=GoOmOtt9aKP2CkuA7T0UHsyuunAMeaev6kFqSU4ka8R2B9WRQbOzo+osrknLizpSLp
 R3rgmw1052GfvyOaFygpSuxoF23qG3CFyr2rtVrh87eOQ5M9aI7xAWatabbwo2/+IF/r
 vwRgXMjz9jTYKbdS9odhq+Gr9uWmW0QwkwCdQMsCJSNiCHbpgmDjI2HsOmV1OIQne2OF
 +0qIZeuMrl1R1oQIqMDNgmlfdZbsCor20lwFk0VZMuFxQZriiTJwQWDa7FesI0Xg0YLd
 woH2q3jxCHnxKIRsrSBOPe6GyVVkzUnsvMELiF4De8AHzkFBReOt1AeXouK2D658Bar8
 m/Fg==
X-Gm-Message-State: AJIora+6z2modxDRbffEp9HkZ1UlfYh33S2ykVCU07FlHNhG1iNyl41N
 sJriqnqCNMTYzKwdaExVXKZWJbpMvftSjZmKk5l8v7NiBdDgd0WjPXJWEjcla+cWfZ+wc+NKEh3
 MCx53eT2WJN98HNE=
X-Received: by 2002:ac8:5c47:0:b0:31d:347d:d621 with SMTP id
 j7-20020ac85c47000000b0031d347dd621mr883083qtj.524.1656604171134; 
 Thu, 30 Jun 2022 08:49:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tHMr9D+xTju0vGqnH7ZCP6Yqnjnis6X+xnGA0JV0pCn0jKgLNqsLey5OspWZpOYKgUY+E9Nw==
X-Received: by 2002:ac8:5c47:0:b0:31d:347d:d621 with SMTP id
 j7-20020ac85c47000000b0031d347dd621mr883052qtj.524.1656604170836; 
 Thu, 30 Jun 2022 08:49:30 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-149.retail.telecomitalia.it.
 [87.11.6.149]) by smtp.gmail.com with ESMTPSA id
 g16-20020ae9e110000000b006aefa015c05sm14795294qkm.25.2022.06.30.08.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 08:49:30 -0700 (PDT)
Date: Thu, 30 Jun 2022 17:49:21 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Aarushi Mehta <mehta.aaru20@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Filipe Manana <fdmanana@kernel.org>
Subject: Re: [PATCH v2] io_uring: fix short read slow path
Message-ID: <20220630154921.ekl45dzer6x4mkvi@sgarzare-redhat>
References: <20220629044957.1998430-1-dominique.martinet@atmark-techno.com>
 <20220630010137.2518851-1-dominique.martinet@atmark-techno.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220630010137.2518851-1-dominique.martinet@atmark-techno.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jun 30, 2022 at 10:01:37AM +0900, Dominique Martinet wrote:
>sqeq.off here is the offset to read within the disk image, so obviously
>not 'nread' (the amount we just read), but as the author meant to write
>its current value incremented by the amount we just read.
>
>Normally recent versions of linux will not issue short reads,
>but it can happen so we should fix this.
>
>This lead to weird image corruptions when short read happened
>
>Fixes: 6663a0a33764 ("block/io_uring: implements interfaces for io_uring")
>Link: https://lkml.kernel.org/r/YrrFGO4A1jS0GI0G@atmark-techno.com
>Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>

Thanks for fixing this issue!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>---
>v1 -> v2: also updated total_read to use += as suggested by Kevin,
>thank you!
>
>I've tested this quickly by making short reads "recursives", e.g. added
>the following to luring_resubmit_short_read() after setting 'remaining':
>    if (remaining > 4096) remaining -= 4096;
>
>so when we ask for more we issue an extra short reads, making sure we go
>through the two short reads path.
>(Unfortunately I wasn't quite sure what to fiddle with to issue short
>reads in the first place, I tried cutting one of the iovs short in
>luring_do_submit() but I must not have been doing it properly as I ended
>up with 0 return values which are handled by filling in with 0 (reads
>after eof) and that didn't work well)

Do you remember the kernel version where you first saw these problems?

Thanks,
Stefano



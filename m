Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A26126524
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 15:47:41 +0100 (CET)
Received: from localhost ([::1]:43004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihx5X-0007xd-PV
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 09:47:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53506)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nsoffer@redhat.com>) id 1ihx1K-0003OR-8a
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 09:43:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nsoffer@redhat.com>) id 1ihx1I-0001EB-Tv
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 09:43:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35318
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <nsoffer@redhat.com>) id 1ihx1I-00019q-Of
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 09:43:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576766596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=erkSz+YjOcxD9hoxkh75y2eS8R+7oFeg6AqjUVlzhVo=;
 b=ceMyhTXqRq2mtyM3q+Tl6iq9dBnS/f5riJuK7iIL3NP/Liwc20T58loUyZMKhVnmMz8CnU
 b7LZ7nXPmkDwFVQEII5mvds2tSB3a9OD7YQkTM4wBV2MQNeBGGPPAt7/rA3xNPyfW3vw91
 bLG8kQlQVivROkn9KTj2xlsfUIO8Z18=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-9GJJfrWbOfWiDBq__ZCRXw-1; Thu, 19 Dec 2019 09:43:14 -0500
Received: by mail-ot1-f71.google.com with SMTP id r19so2790489otd.23
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 06:43:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gvjOYuUdJPHyDyFzNO/gSvPxIqiLMb+5q2r6eyRFJK8=;
 b=gKLQ1oB3d480QHpE4YAP0hUe8EZld+YcdGqrlRkfAP4K5pW6SqU7UEfZvLZtBRPXYf
 tOXCWnBOA+cm0JG1IfKkjoYTEvPuMrEEYzlNHEGSEUQX9So/GmrmPcGUWORfEsNnJFyi
 JjGYRbnw4fQ4cUVtfOR9x5VVXB50cV1gNeM21vJuNt2h8xZwR9ADsYlqPowiS2/m7hgk
 zV9hUL8sDGQbSJmOAxhHj0JUWQeFaBfvK8Kf6yIrZBP33RUPNElSZBQfkp6u/3h6bMRu
 SixufJs2WIrlKvKTenNCcP7m98om9jciXVnz3g9qi0Ru9B8/WJbCX3GCEp3EbquGPsl3
 gI2Q==
X-Gm-Message-State: APjAAAX+asvZIIuFDCDQ55h9E476DQQ8OiPzXZUtIV4jUKfViBy4Xpqc
 Vc3n8NXNseQDch7AwUG3JJmZjiJROIxbc5q5i4Hks14VuhuyHLwQPOsXXRQDy772qK2Wo+HITDO
 nd0uMYIBo2JkUIkTds9K5W4qNubMvZ4M=
X-Received: by 2002:a9d:75da:: with SMTP id c26mr9221976otl.40.1576766593713; 
 Thu, 19 Dec 2019 06:43:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqwAuULuqCae3aPoUX7SDaDeEP2jSRlSmiHWNpBPkq+AMVJM6tImnEhPWqxgv80QB7EI+M6wwThqcooX4Bqm+ZY=
X-Received: by 2002:a9d:75da:: with SMTP id c26mr9221954otl.40.1576766593412; 
 Thu, 19 Dec 2019 06:43:13 -0800 (PST)
MIME-Version: 1.0
References: <20191219143415.28490-1-vsementsov@virtuozzo.com>
In-Reply-To: <20191219143415.28490-1-vsementsov@virtuozzo.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Thu, 19 Dec 2019 16:42:57 +0200
Message-ID: <CAMRbyyt8Y8DFV5=72+GvHrAWbdUO5Mys5JGn7D8es+w2SVcRMA@mail.gmail.com>
Subject: Re: [PATCH] qapi/block: fix nbd-server-add spec
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-MC-Unique: 9GJJfrWbOfWiDBq__ZCRXw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 19, 2019 at 4:34 PM Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> "NAME" here may be interpreted like it should match @name, which is
> export name. But it was never mentioned in such way. Make it obvious,
> that actual "<dirty-bitmap-export-name>" (see docs/interop/nbd.txt)
> will match @bitmap parameter.

But this is wrong, dirty-bitmap-export-name does not mean the actual bitmap
name but the name exposed to the NBD client, which can be anything.

> Fixes: 5fcbeb06812685a2
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>
> Hi all.
>
> This patch follows discussion on Nir's patch
>  [PATCH] block: nbd: Fix dirty bitmap context name
>  ( https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg04309.html )
>
> Let's just fix qapi spec now.

But qapi documents a better behavior for users. We should fix the code inst=
ead
to mach the docs.

With this we still have the issue of leaking internal bitmap name to
users who do not
control the name, and do not care about it.

>  qapi/block.json | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/block.json b/qapi/block.json
> index 145c268bb6..8042ef78f0 100644
> --- a/qapi/block.json
> +++ b/qapi/block.json
> @@ -255,7 +255,8 @@
>
>  # @bitmap: Also export the dirty bitmap reachable from @device, so the
>  #          NBD client can use NBD_OPT_SET_META_CONTEXT with
> -#          "qemu:dirty-bitmap:NAME" to inspect the bitmap. (since 4.0)
> +#          "qemu:dirty-bitmap:BITMAP" to inspect the bitmap (BITMAP here
> +#          matches @bitmap parameter). (since 4.0)
>  #
>  # Returns: error if the server is not running, or export with the same n=
ame
>  #          already exists.
> --
> 2.21.0
>



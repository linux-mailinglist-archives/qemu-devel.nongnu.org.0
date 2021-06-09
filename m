Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF793A1FF3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 00:21:56 +0200 (CEST)
Received: from localhost ([::1]:58136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr6aA-00057B-3Y
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 18:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lr6Z5-0004Ed-0h
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 18:20:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lr6Z0-0006kC-QW
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 18:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623277239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I7uXi8JuyJ+WsXZUHz0bAUCF/8ksrhPQmYWQBnzlARI=;
 b=J36p34dSjaH859kScN0o66kG3Wdt+Bics3xM8ax9dKydTAzx6XXAi6nrG7cY90+Et0IGNp
 bxL00MhHwb/oYLTdWSrSihujztwJrUnXXwRL6JIZ6xfXmAjmDHzJ+SNX3zA3PVf5OTQwiV
 2d6dBwtH4FwGrmPuky9PW48uOntTNWg=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-joJyQWWZNoWAYJEnQqzwTQ-1; Wed, 09 Jun 2021 18:20:30 -0400
X-MC-Unique: joJyQWWZNoWAYJEnQqzwTQ-1
Received: by mail-oo1-f71.google.com with SMTP id
 b9-20020a4a87890000b0290248cb841124so14252518ooi.4
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 15:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I7uXi8JuyJ+WsXZUHz0bAUCF/8ksrhPQmYWQBnzlARI=;
 b=l8szexXDHI3Fpxn2Yj88oCrcwHobI54LIpcEhyMRnoxxyvA8jAZ8vblASva+SW6f3t
 TWVB5ovyniKXQGJBji88du6ML9Ajb9CNa3cbqf5tCZa2HPsqPQOSe1hjzQRuXOU5rcHI
 9EvNT8idUJ0fWSbYS+VxZRlS5PspK0KEV0tewUcadc0G51RoJp9RGWrJsT/nDY6Ba66J
 6Ygzv/NI5MplOf+G4E6HBN0IAQruWdM58ehPO4O5jrY4l2sLkqRfMhcs7vKQHlI5+iRM
 2qePdQjXFqtnd63L1V/nA2JHrPpZiJ9VohVAehnuqCToEHt3nWVwTwQ+Z2Q2/GRT914B
 AM7A==
X-Gm-Message-State: AOAM531f5XLAWs8IONHScGQC+ZNSZ+6xzKNHYyXgKEFislfQhsPT8TPk
 jH96sj9q5hIW4T28genbmGnGsT0oV9p/beRTZmxSEFHyQwW/XAiM849JX4dg356Dp5D9iqgBm1M
 PwmWXczHULaTCXL1sAiXDAkwb9K61tCE=
X-Received: by 2002:a05:6830:3089:: with SMTP id
 f9mr1395767ots.276.1623277229343; 
 Wed, 09 Jun 2021 15:20:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAZnTrFgk3y2pu8Kpp/qyeKwAggbH9bLtGqiWPKkTa/Lj3sxh67cvVhXkcrk1cVqPLw3vgmrNJGtvCmbQbyQs=
X-Received: by 2002:a05:6830:3089:: with SMTP id
 f9mr1395756ots.276.1623277229128; 
 Wed, 09 Jun 2021 15:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210609180118.1003774-1-eblake@redhat.com>
 <20210609213154.1012848-1-eblake@redhat.com>
In-Reply-To: <20210609213154.1012848-1-eblake@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Thu, 10 Jun 2021 01:20:13 +0300
Message-ID: <CAMRbyysYRyALDan9D0L-FphGqQLUOkKrKp0eg0iP8ThHnSatgw@mail.gmail.com>
Subject: Re: [RFC libnbd PATCH] info: Add support for new qemu:joint-allocation
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block <qemu-block@nongnu.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 QEMU Developers <qemu-devel@nongnu.org>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 12:32 AM Eric Blake <eblake@redhat.com> wrote:
>
> Qemu is adding qemu:joint-allocation as a single context combining the
> two bits of base:allocation and a compression of qemu:allocation-depth
> into two bits [1].  Decoding the bits makes it easier for humans to
> see the result of that context.
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg02446.html
> ---
>
> Obviously, this libnbd patch should only go in if the qemu RFC is
> accepted favorably.  With this patch applied, the example listed in my
> qemu patch 2/2 commit message [2] becomes
>
> $ ~/libnbd/run nbdinfo --map=qemu:joint-allocation nbd://localhost
>          0       65536    3  hole,zero,unallocated
>      65536       65536    4  allocated,local
>     131072       65536    7  hole,zero,local
>     196608       65536    3  hole,zero,unallocated
>
> [2] https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg02448.html
>
> For what it's worth, you can also play with the qemu+libnbd patches at:
> https://repo.or.cz/qemu/ericb.git/ master
> https://repo.or.cz/libnbd/ericb.git/ master
>
> (I sometimes rewind those branches, but they'll be stable for at least
> a few days after this email)
>
>  info/map.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/info/map.c b/info/map.c
> index ae6d4fe..21e8657 100644
> --- a/info/map.c
> +++ b/info/map.c
> @@ -226,6 +226,27 @@ extent_description (const char *metacontext, uint32_t type)
>        return ret;
>      }
>    }
> +  else if (strcmp (metacontext, "qemu:joint-allocation") == 0) {
> +    /* Combo of base:allocation and stripped-down qemu:allocation-depth */
> +    const char *base, *depth;
> +    switch (type & 3) {
> +    case 0: base = "allocated"; break;
> +    case 1: base = "hole"; break;
> +    case 2: base = "zero"; break;
> +    case 3: base = "hole,zero"; break;
> +    }
> +    switch (type & 0xc) {
> +    case 0: depth = "unallocated"; break;

Is this possible? qemu reports BDRV_BLOCK_DATA but not BDRV_BLOCK_ALLOCATED?

Anyway this seems like a valid way to present qemu response.

> +    case 4: depth = "local"; break;
> +    case 8: depth = "backing"; break;
> +    case 12: depth = "<unexpected depth>"; break;

This should not be possible based on the qemu patch, but printing this
seems like a good solution, and can help to debug such an issue.

Thinking about client code trying to copy extents based on the flags,
the client should abort the operation since qemu response is invalid.

> +    }
> +    if (asprintf (&ret, "%s,%s", base, depth) == -1) {
> +      perror ("asprintf");
> +      exit (EXIT_FAILURE);
> +    }
> +    return ret;
> +  }
>
>    return NULL;   /* Don't know - description field will be omitted. */
>  }
> --
> 2.31.1
>



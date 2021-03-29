Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B49D34D42B
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 17:42:34 +0200 (CEST)
Received: from localhost ([::1]:41650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQu2D-0002oz-IU
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 11:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lQu0L-00021K-K7
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:40:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lQu03-0005oN-8S
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617032414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7DZ1q2OCSzknA0FHL2Rr9UMhXqu/FUzqN36ywkA1x/8=;
 b=Q3X45j9rK4o0l9HiypUqfDPfEmNNQxL3ZM0gsYVSjhePRE/OkxPevtd82f+u1h1lrR6gwp
 i1nOKXQL8R3QQuzoSL3Uhw+8/VK2SnqfRE1ad+DezkH9uBuiouj0CCfXqKt2BGw7btwuza
 +XOdOjnJpEjucrYV5FEthZ9nRBEtpa4=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-VZScTVKGNfm758Ye5w1kJQ-1; Mon, 29 Mar 2021 11:40:11 -0400
X-MC-Unique: VZScTVKGNfm758Ye5w1kJQ-1
Received: by mail-ua1-f71.google.com with SMTP id r12so3861739uao.12
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 08:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7DZ1q2OCSzknA0FHL2Rr9UMhXqu/FUzqN36ywkA1x/8=;
 b=M71iDHhxjSLKcpvVrL0WYt+pA4sy5xb8wg8NguRcXF5Dth13SLG70f6kV5bwRXkXxj
 i1PvBvgq62TxddVpD/MkXaE8T1LN3MPxxQKF7pRzRfp7PrIH+k81dKJq/PkfmceOlh/m
 U5vBa1n+5kPA3ou2yOzobMR6asz3ilOHWHBoadwqttyRyuCnWT8xgtGsUZ7P0DPJ/vNw
 I3R2JYpqhiLWwxnATS8wXFgvEL4CVnYksuNWx2yWXf750UtNEOu2K9xun+oWBFR2+dme
 a7M9gC6OdNIZHmXD9XzTS3L1QQ4QLDMThTsLyTE5xCDKA2Uzv5Ndi8m2q/uMzcheDOIu
 F3Hg==
X-Gm-Message-State: AOAM533Njmz9A4WmniVd6b+gD6wXVhsOqg4OpS9uFceS5pQ5y0fSyJAW
 eZciGWJGVhziK0pEqawgLbBXlMQGoWQ1zOJnS9kokpCGUezRRZcvBqCus1CGd0Jy0U8FAMq2Auj
 FUMSq9+mf+rjntW6LgR8VjQg3cjZoF54=
X-Received: by 2002:a67:ed86:: with SMTP id d6mr14256044vsp.50.1617032411455; 
 Mon, 29 Mar 2021 08:40:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9cXc1UNXNqZGu3GoRc2klkX3KmgiR1Jjb+G80bIfVmYdlW3Lac5f0SlaUH772KIuxERJwLNvGLl8Z4iC7jDo=
X-Received: by 2002:a67:ed86:: with SMTP id d6mr14256028vsp.50.1617032411276; 
 Mon, 29 Mar 2021 08:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210329132632.68901-1-mreitz@redhat.com>
 <20210329132632.68901-4-mreitz@redhat.com>
In-Reply-To: <20210329132632.68901-4-mreitz@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 29 Mar 2021 12:39:45 -0300
Message-ID: <CAKJDGDY_xqos+nCL7cCvXD+iXqd4ZtZ5jBLdsizuNufYT12NCA@mail.gmail.com>
Subject: Re: [PATCH 3/4] migrate-bitmaps-test: Fix pylint warnings
To: Max Reitz <mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 29, 2021 at 10:28 AM Max Reitz <mreitz@redhat.com> wrote:
>
> There are a couple of things pylint takes issue with:
> - The "time" import is unused
> - The import order (iotests should come last)
> - get_bitmap_hash() doesn't use @self and so should be a function
> - Semicolons at the end of some lines
> - Parentheses after "if"
> - Some lines are too long (80 characters instead of 79)
> - inject_test_case()'s @name parameter shadows a top-level @name
>   variable
> - "lambda self: mc(self)" is equivalent to just "mc"
> - Always put two empty lines after a function
> - f'exec: cat > /dev/null' does not need to be an f-string
>
> Fix them.
>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/tests/migrate-bitmaps-test | 38 ++++++++++---------
>  1 file changed, 20 insertions(+), 18 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>



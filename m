Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B263F512F6B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 11:29:43 +0200 (CEST)
Received: from localhost ([::1]:45974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk0T0-0003G3-Cl
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 05:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0QR-0002Up-7x
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:27:03 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:35371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0QP-00058d-Gx
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:27:02 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2f7c57ee6feso46178067b3.2
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 02:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M7pyirAlfLpBd8K7GIh76DwxUgUVrNZyNC7mYGF35zU=;
 b=yqGFR9liL/bWhiVh1+wtzqa9aH0sUq+5lqpXTk2bMRA+/RIr/QSb1p+kcCDnMxWpM2
 GZMkZmFsPIWTOnd+BKjOZ73IN6UIB2euBLQy2rmjGGlHF7Rtt8iT5OZ7ppIPjerfhXjG
 gzalzAil2Fy+s3BEd434ytMwjlrKjKL4/0Axaav7pF+sFP5p8qhjiN7C9lvpzy8MZzma
 fT6cQJl739ebj4bn4gdVTTEfRzzjv4V9tvBhFZMXKSbJ3ut9vFOLKfza2SeZQMXIzGw1
 cvepSuO2KiW9bdGlCTWZNazUbI6v7EHmyXWSCEQ4SxOs9CLbHSZzhAGgqQDU3Oad3kZH
 qYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M7pyirAlfLpBd8K7GIh76DwxUgUVrNZyNC7mYGF35zU=;
 b=5DgcREMo2JYG91t+ywGg9uAeK/Eo4bKFEjEJbxSPKzSxLzhr3CA3Gl0PL71REhJAHS
 PdbhdDnRDzDvJBbYY2GJT/UyUbrZ9mtt+nOIw+yrm1MroKN3fkOEYe0GAT9l4YKsZmsd
 S8NJyO5wHVTi65pbvpl+6UPldECss+LrlQS6N2nnDaiGGWvyENEhl55sCxXTwYzL1OrF
 wO0r6emyRrhV/55EJkO+Y4v2x44Q8l96kQ9oWGOyYH3WPurA8kFODmBff0fP+M2bcKTV
 Yu0TpdRP99giJBoiItpIYB9x9G16tlhwYNqze5vdD7QcRiazdh6wmRtHnG3jCZrIFk3D
 n1JA==
X-Gm-Message-State: AOAM533W1kp2f1ZWPZt3acTwtuGKJRDK6B2G9wXJolK4PmQ3zs8TJ/HA
 Cj1831vK7zrg0bZOZSMUnyb4f+aR6KDJQToJAd9b+A==
X-Google-Smtp-Source: ABdhPJwop4KxvMHQJp9dLBoBVHBwbFZRm5YL9y+2zuj23kS0MLdtoMoHsiH8agZXa+C9s1l3TGHQ/GHOeOEELit60oQ=
X-Received: by 2002:a0d:db4a:0:b0:2f8:3968:e808 with SMTP id
 d71-20020a0ddb4a000000b002f83968e808mr9103306ywe.455.1651138020161; Thu, 28
 Apr 2022 02:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220426160422.2353158-1-peter.maydell@linaro.org>
 <20220426160422.2353158-4-peter.maydell@linaro.org>
 <4cd9121f-6c9f-f461-836f-a4b1ba8fedcd@redhat.com>
In-Reply-To: <4cd9121f-6c9f-f461-836f-a4b1ba8fedcd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:26:49 +0100
Message-ID: <CAFEAcA9jzRuJJAXUckjD4L+LB6-UXBO2WDET2Y2YYQBBr62MLw@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/arm/smmuv3: Advertise support for SMMUv3.2-BBML2
To: eric.auger@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Apr 2022 at 09:37, Eric Auger <eric.auger@redhat.com> wrote:
> On 4/26/22 18:04, Peter Maydell wrote:
> >  TLB invalidation correctly removes all TLB entries matching
> > the specified address or address range (unless the guest specifies the
> > leaf level explicitly, in which case it gets what it asked for). So we
> "
>
> unless the guest specifies the
> leaf level explicitly, in which case it gets what it asked for
>
> "
> This is the less obvious part as the spec says:
>
> "A TLB invalidation operation removes all matching TLB entries even if
> overlapping entries exist for a given
> address."
>
> I failed to find further precisions about the range invalidation & BBML.

If the invalidate says "level 2" then a TLB entry that wasn't
put in at level 2 doesn't match the TLB invalidate request and so
isn't removed (whether it overlaps a matching one at the same
address or not). This is defined as part of the behaviour of TLB
invalidates which specify a TTL, eg on page 142.

An implementation which did something like "find the first entry
that matches the address, then notice that it doesn't match
the specified TTL, so ignore it and do nothing" wouldn't be
correct. But "invalidate all the entries which match for
both address and TTL and ignore the ones which don't match
on TTL" is fine.

> If you are confident about this, it looks good to me.
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks.

-- PMM


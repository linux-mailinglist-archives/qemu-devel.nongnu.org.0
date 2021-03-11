Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE9C337F31
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 21:44:03 +0100 (CET)
Received: from localhost ([::1]:41498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKSA5-0002CN-U4
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 15:44:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKS7V-0001cG-Bj
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 15:41:21 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKS7T-00089L-Pl
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 15:41:21 -0500
Received: by mail-ej1-x636.google.com with SMTP id ci14so48871844ejc.7
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 12:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jUwj5Vmg/dhfiKKhyOsM/yF2PJa5f9uHNZiV8t0LS1k=;
 b=v+qs95IsX8dnexiQyuShBhnVXEJ6SCatUiIPMTmfCcSa5ymUwexwBdNW1TnoEzZl7C
 2IX9IZ/oZ0Ri32jmfd13r06DMTlzm3DNLwJ60bF6blu1ir+YdyNmi/y7Q+/hZFjZb67/
 KhnT8Fp1FMmeqAxx8OMwCt88kpd5Jgzay5tfNHvwShmMAXVbLY8W8bFuadhlP1hdORHC
 1JmzzzxbTCJVGKZ+xoP/NpcqliOCs5705pFub7H1HvDlvl2IMLak/YLjTrNa9sROD7wu
 Z1p/kcSocs17qgYqPmJEIcXdsSZ5ouO5WT6iwVqlElhq9aStd8RPQwYYU7ghEUNVnrX/
 c6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jUwj5Vmg/dhfiKKhyOsM/yF2PJa5f9uHNZiV8t0LS1k=;
 b=ES9nsFIJdvQnj/xIxMWjzrEvuEEVosF7JwRKFTM9cIJ7Uz72sKcg9T6h1pyEjvTsQh
 S6xJYZmpXymFkdpK9stH/QIoYxTCBNUWJkasqrQpShapUKM8rnDgj5CIw3Sy4RkGlhaK
 wch2HxzpmueF3i8XMW1q2krOIEjYp7fqXcjyBmF2qMl6muI9uXUigZrHBC1uH0gsxUY9
 cGcxA4XCBtg2ThCSjz+a/mQxO1gd0blQBLPi4AqJ3g010UxBkPgRkS5XBoWsxY+F7Er3
 wPBpBwki6B9zAKp/04Bh/N1Eg+iCk/98LgwB/Sv7Ui64DaBJUrlvJslVBI4AfLdjsS0Q
 6TPQ==
X-Gm-Message-State: AOAM531POEon/rcYahGznT/qWuMkO8NHh9aihJdQcGmfHcvIY8h4w2Fy
 YWhmndit0j3D7oUKiQLTngvWKU51gXwkbRPs1mWm3w==
X-Google-Smtp-Source: ABdhPJxNE9eINTUrsBfQC9Uog/xWw3umaFWSwglsMMVfE3GVwf6UidH8VgKYwKEWKBRuN9NYfUPhXLRujkTQap85iaA=
X-Received: by 2002:a17:906:b14d:: with SMTP id
 bt13mr4838497ejb.407.1615495278218; 
 Thu, 11 Mar 2021 12:41:18 -0800 (PST)
MIME-Version: 1.0
References: <20210309155202.1312571-1-eblake@redhat.com>
 <CAFEAcA9dSR_yvsxERtFcC1BApWMH0vqqcn1d89bgW1S_9xmYPQ@mail.gmail.com>
 <35c04e37-eb1d-e2dc-db3c-5e77d4181071@redhat.com>
In-Reply-To: <35c04e37-eb1d-e2dc-db3c-5e77d4181071@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 20:40:59 +0000
Message-ID: <CAFEAcA9QZ5KTZFyqoJz1TwDk2t1NwuixQ8k9zggWJ6X0Pm-eSg@mail.gmail.com>
Subject: Re: [PULL 00/17] NBD patches through 2021-03-09
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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

On Thu, 11 Mar 2021 at 19:21, Eric Blake <eblake@redhat.com> wrote:
>
> On 3/11/21 1:02 PM, Peter Maydell wrote:
> > ERROR:../tests/test-cutils.c:2290:test_qemu_strtosz_metric: assertion
> > failed (res == 12345000): (12344999 == 12345000)
>
> Sounds like a floating point rounding error: the string was 12.345M, but
> 0.345 is not an exactly-representable double (the closest 32-bit IEEE
> 754 float is 0.3449999988079071044921875, while nextafter() gives
> 0.34500002861).  Multiplying that value by 1000000.0 can then round down
> in some situations instead of producing the desired 345000.0.  The
> rounding is less obvious with 64-bit doubles.  I'm not sure why
> cross-i386-user seems to be prone to the rounding errors while other
> builds are not.

My guess would be x87 FPU vs SSE...

-- PMM


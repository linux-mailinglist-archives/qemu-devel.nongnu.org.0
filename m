Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC63968DEE5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 18:29:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPRld-0004zu-T6; Tue, 07 Feb 2023 12:28:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPRlc-0004xf-A5
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:28:28 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPRla-00020t-Qc
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:28:27 -0500
Received: by mail-pg1-x52d.google.com with SMTP id s8so8814107pgg.11
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 09:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2ZtRdsJbFhRdR6PYP7zyPxckiXnuzCSJ//sUqTkpj1c=;
 b=E69OfDDS0PSvujuck31/RQS38SiM9xQAitCAmmN6rKOmJp+DBju/3OlA/RJZIppSEa
 OZvWc/Eh0+Zu/66URUfAV9VdO62ZtoLS4ssA2/sBjhzXkkpgV0yPcBiOvBuyoSLwydHX
 aNitU1QyQMiwYM5bbmni8BfElgoDtRFJAIDXRmovCcYOYQ2QcFGKnFdQsHYKXuboP06i
 EyWHVzlbacyVzbOew5vwX0M7MIhO92S1fYKF5VpvExoXSXG+UrMME5NCGyPrJiJivX+v
 ky1Wpsl/FAWUjJcmTGI4PPmAI5EkZvBW/mwf39evqNh6uTUalfkV52edQ25EKk/2mR3z
 WXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2ZtRdsJbFhRdR6PYP7zyPxckiXnuzCSJ//sUqTkpj1c=;
 b=zT6diiVBBtM5G8p2D0TRUXtiSywxSooPC+mepWjK1fZMGUAAerlVGvEDdMO+EIOxYI
 ubNiAR6fJN/lavxpXwdlYj8HmKgJ7/SRpx68+E85kmozjuPisEFjgRN1Lk+pWAglQgZ6
 EuSms1FpaMo7TRJGfKUrImTM40xRUQb8ME1AsegdEjJl3AB1n4afq/yoVsRwGv59Io/W
 L0Audm0IHBBqvvOPd/Y30Dj0ufkDuRX8Mm3pHU1rajsIrQUx+dH9tMXW37eGiSd5AOdd
 GxCRNJsL7WgX8FbMUB8qX1gTkKmT5yDAK5y9hwII4KStYDYvNZUBjB7jrQyiTbKlJLXM
 ycpQ==
X-Gm-Message-State: AO0yUKVyftGKR7UI+EEakjW2Cr9mXgrq+W6P83tBEXjzGrQ64kq6YrfO
 mgV9lRimg/KA+X4pXrZ4rFRFr3aZ64u1VwU1wqiAEQ==
X-Google-Smtp-Source: AK7set8+v7uB6cDVWKT8gKnKESz48KotJWrdPWR3cm1fJMWX76r9CGtxQ9P4QiurZAZfCUTSPQiYgKLEK63xt89yb9w=
X-Received: by 2002:aa7:956c:0:b0:5a7:f2a6:5e1 with SMTP id
 x12-20020aa7956c000000b005a7f2a605e1mr456891pfq.23.1675790905165; Tue, 07 Feb
 2023 09:28:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675193329.git.balaton@eik.bme.hu>
 <12159564d95e6cdfc78611234f4c478184be425c.1675193329.git.balaton@eik.bme.hu>
In-Reply-To: <12159564d95e6cdfc78611234f4c478184be425c.1675193329.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 17:28:13 +0000
Message-ID: <CAFEAcA_+6S_ny-PKq9xzhzcEb_NZE2JgFVA+LaYnQdchgOO3Hg@mail.gmail.com>
Subject: Re: [PATCH 1/6] usb/ohci: Code style fix comments
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Howard Spoelstra <hsp.cat7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 31 Jan 2023 at 19:39, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/usb/hcd-ohci.c | 99 +++++++++++++++++++++++------------------------
>  1 file changed, 49 insertions(+), 50 deletions(-)
>

> -/* Bitfields for the first word of an Endpoint Desciptor.  */
> +/* Bitfields for the first word of an Endpoint Desciptor. */

We should fix the typos here in all these: it's Descriptor.
But that's a separate patch,  I guess.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


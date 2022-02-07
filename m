Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89004AC9E3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 20:51:35 +0100 (CET)
Received: from localhost ([::1]:38590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHA2w-0002k0-Dh
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 14:51:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH9k6-0007Yu-0t
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 14:32:08 -0500
Received: from [2a00:1450:4864:20::42d] (port=34559
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH9k4-0002JC-Fy
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 14:32:05 -0500
Received: by mail-wr1-x42d.google.com with SMTP id f17so26732720wrx.1
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 11:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xxyGRiQoVQ6pw+K+cRd9KLsv7U4UYJ25cQP9R4OC6H4=;
 b=EeHgy4SWRzteRSp0pjGo3hCj1+uPWijwFW3p+joQqb+yqZtJgKuMMdT6VNo9kU/xwI
 g1kVl9jaH7K+ZUPjfA1LiQxjv37jpUI5pWMUIeAwsMLylilAQ3h8y+vKsZNjSLV7ksxv
 HpK+p/X0aEFo207f3jtYVSpVl7y2i/mf/Ydwle8hiR5Vgu+SAE2S5K4l7bNbgrQ7ThFB
 eTAlIDBgBVWr2R9wwcc3AIU2OXs7XCbG/il6KHegTACulybTkn+IPxL/5xh6eqy1w5Z0
 clnIGUNo01cR3sMncgay+pVHx2iJDnWA0aOIzVDe8Bc/rMMgihadWZjgmmyguAa5Bd6H
 DLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xxyGRiQoVQ6pw+K+cRd9KLsv7U4UYJ25cQP9R4OC6H4=;
 b=51ehu0RjFrO8xO5Y09wvMKpToFdzHIZ0Y5Ml2H8mwJIf+REMD7DvAbBrvykcJlJx0R
 v0RuJqhdbubF/Ml7auZ4JVHYEngCMXphBH2IZv2NrdLwKTAiwznvRGZKtbx2/mnnA5Fw
 jQ57kU83OzXWz0ao5aY6sytanCybNoKqR6bq3rYqayf1siBxIMRDfFKK0xIH1yDQWcgi
 5XR1jC0BnAQ97CGN5POGfowrYtvOVgUFkFp0wmQRowOeIy3LCHCcJ9iYvYVkHpQZnUC0
 zDm7/gEaNYWsMYSgMCxSzDFVHxZ/S8mb4gSQn2n2+c7I9KFLaKRO6cSEZbvs6V42+b8G
 xr1w==
X-Gm-Message-State: AOAM530oQUIXrGG1QKU6+9nAWicPuGvHBkRWnEeRJV2dMEnGw0wt7PXR
 jgjO1cj7zQDO6p3N+FosIdk0QTRx9/ZV7tE2wC/aEQ==
X-Google-Smtp-Source: ABdhPJxyjT5fNYCZrHcAmrMLzAXgXWCXg1DsS4zn2i5BKCCQQMneGbETZ78+aIx194XRK+5S65Xz91mAwu2vqhbd80Q=
X-Received: by 2002:a05:6000:15c7:: with SMTP id
 y7mr766957wry.319.1644262323136; 
 Mon, 07 Feb 2022 11:32:03 -0800 (PST)
MIME-Version: 1.0
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-7-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220127205405.23499-7-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 19:31:52 +0000
Message-ID: <CAFEAcA-Aj51R2kbeotPL-EErPpsQG42ZiEVAzHsD5QMvZehAMw@mail.gmail.com>
Subject: Re: [PATCH 06/11] mos6522: use device_class_set_parent_reset() to
 propagate reset to parent
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent@vivier.eu, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 at 21:04, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Switch from using a legacy approach to the more formal approach for propagating
> device reset to the parent.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/misc/mac_via.c    | 7 +++++--
>  hw/misc/macio/cuda.c | 3 ++-
>  hw/misc/macio/pmu.c  | 3 ++-
>  hw/misc/mos6522.c    | 1 -
>  4 files changed, 9 insertions(+), 5 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


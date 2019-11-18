Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C9E10064F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 14:19:12 +0100 (CET)
Received: from localhost ([::1]:33874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWgvv-0001Ry-DQ
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 08:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37425)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWgt2-0000aW-TA
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 08:16:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWgt1-0004JO-Ce
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 08:16:12 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:35405)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWgt1-0004Ip-0Z
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 08:16:11 -0500
Received: by mail-oi1-x244.google.com with SMTP id n16so15258506oig.2
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 05:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ChOCQ4zGwyEC/hrUOEEvZeOnk/6NyJ1uvVa4tn1HZEg=;
 b=kOPKiVj51N5cP+qJMx7U9pBQl8bANFoIdgjaXlwTmhoKQFno95N/duVMCdH8TI3bIJ
 OZqrK8Vf651VZGqjGKNcM94syAuZ9M4qgsU9qZvkHCWwPJVweZuIkdhIDqP1ZcmzmDZ6
 KGo0hkqYPCc3l6roDbcfOZa2d/pu1AOXsnjUdT3gg6LZUyMfKuLhthviYS4M0B8lPygB
 fqpm3CZapLAkWGPdEX5F2nGkcQ0cb82qgKjLH0ri5l1TmjuO4Q5CPioIfHJJGPfnwPMo
 fZEIqqnwbjwzDuFLAH+3UpZA+gVWAwrp7Fy5aWQ++leY5JRGSoJok263whoT8u+bKu4H
 asaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ChOCQ4zGwyEC/hrUOEEvZeOnk/6NyJ1uvVa4tn1HZEg=;
 b=j/xoOco7Ues9Er0rrVegSLuvRMePNCLwVqti1GPUToytKfI4hxKNURBPYXl4VIg42T
 8pQVtHy1l/IXrPpFdQgzMjN1qyfiLGrVTDzWyfDnSz0AYkoOkbes5i846Gs+KGrQ0Zv2
 fb9k+EScaQZCFcwfglr0WIxItGZtzK/26AgZXhUQATNnv4XSUaB8LHnVyHxQh1jYmvqU
 nzeXpkbgMLD8yMLiv3GnxX/B/Of6/NCtnq6kJRcQCyhXN9xMArFbJSiLtE//IizsUuda
 WTmiBr/zYtsBuIf9Dzs/84MTtlAiW7hvlXvlJLlw6NTkD2XDAs8Xc5ldzWjJZRyOmGxf
 0HYQ==
X-Gm-Message-State: APjAAAWzRI4X7ZeAN/VzksLVb8nOWGrU0IL03B3mxmMqrLti+jJ+PQSi
 rbHJzzLMK1h1sI0ATYKdp8DZM3wk9Obm2qS8RpGBZA==
X-Google-Smtp-Source: APXvYqzpgbURI1Xr8xK6+T5LXUbmHhfQjgO1WZqaOVtfv0LRAF34JoR/W4mS4piyZIiR5Y6y0aKZTchrEOxzSvBAgII=
X-Received: by 2002:aca:a9d4:: with SMTP id
 s203mr19529633oie.146.1574082969930; 
 Mon, 18 Nov 2019 05:16:09 -0800 (PST)
MIME-Version: 1.0
References: <20191118091414.19440-1-richard.henderson@linaro.org>
 <20191118093059.4dxafav6e66p6ovq@kamzik.brq.redhat.com>
In-Reply-To: <20191118093059.4dxafav6e66p6ovq@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 13:15:58 +0000
Message-ID: <CAFEAcA-0tiBwTGGbzSb+h=jfP9qu=WRiN8At_n=monRA969mSQ@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm: Merge arm_cpu_vq_map_next_smaller into
 sole caller
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Nov 2019 at 09:31, Andrew Jones <drjones@redhat.com> wrote:
>
> On Mon, Nov 18, 2019 at 10:14:14AM +0100, Richard Henderson wrote:
> > Coverity reports, in sve_zcr_get_valid_len,
> >
> > "Subtract operation overflows on operands
> > arm_cpu_vq_map_next_smaller(cpu, start_vq + 1U) and 1U"
> >
> > First, the aarch32 stub version of arm_cpu_vq_map_next_smaller,
> > returning 0, does exactly what Coverity reports.  Remove it.
> >
> > Second, the aarch64 version of arm_cpu_vq_map_next_smaller has
> > a set of asserts, but they don't cover the case in question.
> > Further, there is a fair amount of extra arithmetic needed to
> > convert from the 0-based zcr register, to the 1-base vq form,
> > to the 0-based bitmap, and back again.  This can be simplified
> > by leaving the value in the 0-based form.
> >
> > Finally, use test_bit to simplify the common case, where the
> > length in the zcr registers is in fact a supported length.
> >
> > Reported-by: Coverity (CID 1407217)
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >
> > v2: Merge arm_cpu_vq_map_next_smaller into sve_zcr_get_valid_len,
> >     as suggested by Andrew Jones.
> >
> > v3: Use test_bit to make the code even more obvious; the
> >     current_length + 1 thing to let us find current_length in the
> >     bitmap seemed unnecessarily clever.  (For real this time).

> Reviewed-by: Andrew Jones <drjones@redhat.com>



Applied to target-arm.next, thanks.

-- PMM


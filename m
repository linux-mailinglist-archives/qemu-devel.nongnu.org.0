Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F14620B016
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 12:57:13 +0200 (CEST)
Received: from localhost ([::1]:52572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jom2i-00036s-BK
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 06:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jom1z-0002ew-OA
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 06:56:27 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jom1y-00051K-34
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 06:56:27 -0400
Received: by mail-ot1-x341.google.com with SMTP id q21so664225otc.7
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 03:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GcN+xma/RH65dKjl4Y/G1oiEhVnv0kx5nhRgddP9QJQ=;
 b=Nhny+Q4wDkvTi/J7YYeGp6Wb+YYBxV5F/+sRGoXbK2Aqp/zChlG8XiUaoRhQIIWW7f
 PMIIGbpNZSTukFlKTA1HF140J9aux/XNk5BGY9J7XJjXtciq8DtMKHT4zGlvD/SufHkN
 jImMua1n6tyN5cC1tN3aQZwbEwfJVQcISaUsdI+0p4Crt97zlPAvkrUdkVeShnbHgJNp
 UqAYnV7Tam+CGipnCCsKg5beskyaAGBgNijBfjpYYPjKfdElZXZ5L20SMJapfapUXWwx
 9Jr5sUNtixhnaFbwmCPNJmifE1ZUHy1FmcG10QSyMXoDtv07nBYf4kGlEw251PXAncsL
 tYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GcN+xma/RH65dKjl4Y/G1oiEhVnv0kx5nhRgddP9QJQ=;
 b=nZcCTAznkAZyto4gVr4OIW3v4HUpyM2poxw1kib7WlbfC3mLFh32VzeAZu1RNva5P3
 8KMIfc54ieZN7QseUEkOQ95wQ0tZV4pTjd+Qw7d11mxSy391l1VQ8dc3vmlragP+N3MQ
 TS9m7l2q2J5INdPWFk/Qp4pVbxJMBCzkX9gYuPqUyP25+86glqci8nCvX37yaqpmsJ5Q
 1h0036ydC4gioCxw3QUj4ydTChgreOSYeH836a6oKIpTyqyHOBrWq5ewOgKhc+9mIprP
 LsjU7L3mwRSGSOK+oNrVrjFhP3rmLgM1qIGbRDK8GBP/Ko9D0MEmSvvJaBCC1wtt3SPq
 qcfg==
X-Gm-Message-State: AOAM533PkCEJIuY7lwXaV57TRzDJVpDdxL+qRu7XMzQ1k16D/jIq1HAg
 2OpzuNYrwNdXea1xuFms60bVHVdCvAyu4pbfvhWW+g==
X-Google-Smtp-Source: ABdhPJz5wR2yx8DJZsNJMObqXzgRwQqOInXmVQkRp+sB1SUSyhCi6h2HeYZM4VDpea1qJornUHFYvN4L0Jw99OTBi5Q=
X-Received: by 2002:a4a:ba17:: with SMTP id b23mr451498oop.69.1593168984925;
 Fri, 26 Jun 2020 03:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqyDzenX2BiR7CnvZc-J91wWCX8ra==T_=WCe3xq3-n2hQ@mail.gmail.com>
In-Reply-To: <CA+XhMqyDzenX2BiR7CnvZc-J91wWCX8ra==T_=WCe3xq3-n2hQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2020 11:56:14 +0100
Message-ID: <CAFEAcA8H9E+us8u_0KLeqFN0Ygq9kBonjOXAxXXyT1+bw9pWQg@mail.gmail.com>
Subject: Re: [PATCH 1/5] haiku build fix
To: David CARLIER <devnexen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Jun 2020 at 11:08, David CARLIER <devnexen@gmail.com> wrote:
>
> From 4d0933384d2bfcd0fc8c4c06eed2d07f3f1b7f8b Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Fri, 26 Jun 2020 10:35:40 +0000
> Subject: [PATCH 1/5] Haiku build fix enabling BSD symbols.
>
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  configure | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


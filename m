Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB005BEDF9
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 21:43:59 +0200 (CEST)
Received: from localhost ([::1]:48484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaj9y-0002lb-EZ
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 15:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaf1H-0005xU-Vm
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:18:45 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:34578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaf1F-0006kk-Pt
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:18:43 -0400
Received: by mail-ej1-x635.google.com with SMTP id y3so7044622ejc.1
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 08:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=sfXm8JPqyolFGBsbKPlGJveB/0mVA6tcrYHTaZ5B/Qk=;
 b=Vq1i8uS52Iujs7UyxVyvomxBmKfHoAPu2tCYiW0L6YkzpZjxj0uzF2VgiS6ze/5AqA
 a22gUyKTsWDSXsod5yhWQoq8h4o5FUM5tDWBLSJMNNHs8wMlfb41NoIk8HtQ7iOFMrcc
 0dGKsl7YUHx0GJvj0hyr68q+Cseu07CirO/NyoQ0zjZZYvrIA1h4cgp36hJ2abM6k2Hy
 0qJDU53ZE3rScJZ9l4bMAiB8GMumarbLjtqLstMYFHRFMLZd27o6/ZiLg9mK0dOsnIBa
 BNKQLEaipAmpJYgZQocyejULN1+blgtAmn/311Svn30127jMFHt+gsf8sptf0YmkPTJQ
 7v0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=sfXm8JPqyolFGBsbKPlGJveB/0mVA6tcrYHTaZ5B/Qk=;
 b=EwazyF2wrpXhupt1DEbJz+fNoVOQPtVhgJuR45/LKH347/9jmXLZ9IUfZ8QZrtZSKC
 rvZImxsscvbjOuoFa0uc+VAtciZzIAZtUVBYov5lFefqjP4pl0gRlBwDHw7A8fw90Opf
 /yMQKYbu2CYpyRRd1yAJN8WeVfQb8aBjcrnXqSHfJJ9DkfR+YAUhS9ydY7w8QYTAsZE2
 THelwFObbGPo9EIVlqpN8u7QUpcAL1Qe/AvbubOffUcArgo9bbnt7vkveAtMfi0oo+s9
 NbTxx2esW4KVnF8qtzr5juvpa1psIKSuhMEHRlm2497FZ0yHHMMQ0R8AU6frbFxrrG3K
 HwSA==
X-Gm-Message-State: ACrzQf18Yi3E0YpkKdpPeT98TnZpajPfRpApYZ2Oi+ypwKlcPv3QrAzx
 QbzzmoagXhaAF/oBZ28GZiMHoTDQQ6tIroim55/OzA==
X-Google-Smtp-Source: AMsMyM7oP4bVI1p1n2Y7jTaixeHJYDFW07V+cmejbapOoWtDVyr485TtK7tzkQ6dkRjIPVn8sbY+y3ONPc2ZIxq3hL4=
X-Received: by 2002:a17:906:db05:b0:741:5730:270e with SMTP id
 xj5-20020a170906db0500b007415730270emr16682900ejb.609.1663687119564; Tue, 20
 Sep 2022 08:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-21-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 16:18:27 +0100
Message-ID: <CAFEAcA-z1XY0uKmz_R-+exRwkNH4UWCTENpJkEJJC_Otvw4Umw@mail.gmail.com>
Subject: Re: [PATCH v2 20/66] target/arm: Add is_secure parameter to
 get_phys_addr_pmsav5
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 22 Aug 2022 at 17:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from get_phys_addr_pmsav5.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


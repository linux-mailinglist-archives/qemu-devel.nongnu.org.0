Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E231518A18
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 18:35:45 +0200 (CEST)
Received: from localhost ([::1]:34540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlvV2-0006Fj-5g
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 12:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvHw-0005h3-2b
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:22:13 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:42610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvHt-0007CH-L4
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:22:10 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id w17so31928886ybh.9
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 09:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qYXrcINYswJrgKxG1tDqrZ2+wZKBZpXSo3N+qSzKHhE=;
 b=xsvnmHEgCokyjJq6O3apqJ2iFjb/MVlgoPzD9TPMnuyRooH8JYxDYBmFLShjrU5uO9
 cl/eoDuRHffeMOwSvTtGjpoAFt5M1YSm/PIRmEp+KcqMqQo1vlZJ0dMOb3ZF00cYNW4B
 06TfSjLj9UVSG6Rr62lFM/eswshHk9Y4zjh1kpWDsPbSO0spCoK88jkZrFCNUdw+LyNF
 NfW5Idkr8kfn2IIZFC4Y6LOU0OZCEuAy4xbDON+SPYWOVSQOEXJDjQ+PEZz6fvNqKQXW
 N4Vdn3VcBXPFZOynj2UjUU3Uld3zizoVgeII/HX6idSW9DvqQcQMWbmtapP5+YQ2obhs
 neJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qYXrcINYswJrgKxG1tDqrZ2+wZKBZpXSo3N+qSzKHhE=;
 b=DHTciWCDMUNw+mdGT7qR3zF96Xr7zo6i/l07pEowVwxbGUtTg+KQq+jADaawTKwngK
 na7MDWnnsXHnk8cBxISsFtQivM7oQIldjiBKTxIzoyGYzdGkJYQPsyjvJVwVqaTpKYSy
 3HTlU3XFByQMkKX5z94pt0DrFWTsypVjwepVR01MGZrJN1GK5sn6qBvNywyRJooyPRXJ
 EP4Wc0Q9dlUnGi5AVdBjqVyb43m/IScm1LIkhYKrJ6aVD5wdAYXsyDZf/ZtkZl1A96zz
 zeMre/6VoO3Lj+oVq7pRYmkxpMFf3JOJ1cmRP65udMYbYpghZCXv+sDknl5ethWvjpa4
 UYgw==
X-Gm-Message-State: AOAM533ZDm64wYsy/OWSNsjNr+LE1dIidtpoJwU7oEMN9H+lTG25bmhN
 JZksDKBFd7rI/Cq+yZRChGkH8UfE5VYhFBpRBXM0ng==
X-Google-Smtp-Source: ABdhPJwiy74g2c7kF0NS7uPNOnsRAF8s5Y5f7+cKAPtgQNz1AEoFUaW98nan5gbSyhTJcBfkLLqmB+92QMySAc51Aic=
X-Received: by 2002:a05:6902:1543:b0:649:3124:b114 with SMTP id
 r3-20020a056902154300b006493124b114mr14805815ybu.39.1651594928697; Tue, 03
 May 2022 09:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-18-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:21:57 +0100
Message-ID: <CAFEAcA8GDKyqD9z+Yt7WXJ2o3_F8L8SXHGnZp_huyqThoG=sLA@mail.gmail.com>
Subject: Re: [PATCH v4 17/45] target/arm: Perform override check early in
 add_cpreg_to_hashtable
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 1 May 2022 at 07:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Perform the override check early, so that it is still done
> even when we decide to discard an unreachable cpreg.
>
> Use assert not printf+abort.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)

The reason I put the printf in here originally was that I
felt the conditionality with which we define cpregs was
complicated enough that conflicting cpreg definitions might
be found not by the developer writing new code but perhaps
by users in the field who used rarer CPU types or oddball
feature enable combinations, and I wanted the reports to
provide enough detail to identify the conflicting registers
without having to repro running under a debugger to print out
the values of oldreg and r2.

Still, I suppose it's N years later and we haven't in fact
particularly had that kind of bug report, so it's not strictly
necessary.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


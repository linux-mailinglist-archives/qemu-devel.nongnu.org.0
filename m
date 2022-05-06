Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E5E51D75E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 14:15:57 +0200 (CEST)
Received: from localhost ([::1]:39252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmwsG-0002fN-Mm
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 08:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmwqn-0001o4-ST
 for qemu-devel@nongnu.org; Fri, 06 May 2022 08:14:25 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:36743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmwqm-0004s5-A1
 for qemu-devel@nongnu.org; Fri, 06 May 2022 08:14:25 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id f38so12548478ybi.3
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 05:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B+3m9aEsDBxN+GrXXAOBLITIOD5C9ajhUzKWVmjHXZg=;
 b=mCYHnq25cvYWZRADzDnXFkdFt1YwJmr12T1uiDtSNvx/2SZ/Da5G9+Fee6ZXdvdaGM
 GF3AbmWhfWlPGQPcgw2whOrNuP5yCUcje7GICO/vA3zs6tV+2xKGP3/6L9cWsxQ/e0/R
 M8yOYKQBUhHnlEZWuxaIqSrcXdkGHPYPVJEYooQaygutBvt6xbWquyJgwtraGwHYaLdr
 CQ9dU8GSN+31famjo1V2ZGvS5uFwH0/bfiwSDTvVqe+zZ9UoImJpHATZzdYZbuSG/HVN
 BV54qqP3X4V9NXCQc33oiOgGdYhmspd3kUtL1Zvp3iWsCJ05xK0uR8QFAPlK6YfJjGfl
 MHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B+3m9aEsDBxN+GrXXAOBLITIOD5C9ajhUzKWVmjHXZg=;
 b=2myQLnWrBlXJHFBxrpHnzxYXKJFdYZn/FKXirBwjIjBhHWJz/Wbu3mk10E5Qge5kSh
 to1yuPtWpPKzVfD8YPPm1xDxqska4Ruics2oAtXy6Xf/N0CV+HkA8Y/9htf/rMEieAp1
 ABPE9oT2iEn4oUrIskjPAO7P9blpJA451CC1Lrvv7Jkt2ifBLDPV1b/QZlv6oiaqQvCX
 qXJlvfynlV9IybsgChVFY4sLdqQfd0kPPmquxIMMnRaMSQOncgazB5pk0d7hKmXrG2pL
 6vPCjTFbHNv5r7jEEQq7p2KjlYCgf1yGXSSOGEbInn421I8e45UI2DEpgrxLriGqo867
 BXKQ==
X-Gm-Message-State: AOAM531Hl/rS05UWghGsikdlSUXvZP7r3jvYqKhTwgO0llpzsesVbe89
 OxZQujk1K2ReF6prWCjehv/MWZ7c2BiTYqrTuQgKjM1x7oI=
X-Google-Smtp-Source: ABdhPJx7gpdJ0Hl+hJ7tddJLiQrOfe7WZlGvYQx9a4N1t8+/7u+Ht9V0zgGlIN2WpqkLGEEps+VUTqpjvq8OMG8RKMg=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr2129991ybq.67.1651839263196; Fri, 06 May
 2022 05:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220505113740.75565-1-quic_llindhol@quicinc.com>
In-Reply-To: <20220505113740.75565-1-quic_llindhol@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 May 2022 13:14:12 +0100
Message-ID: <CAFEAcA9zSFhoMNzhWWbLzYW8E64Ju3JYDRivZ4ZLN+CBb-AE5g@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS/.mailmap: update email for Leif Lindholm
To: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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

On Thu, 5 May 2022 at 12:37, Leif Lindholm <quic_llindhol@quicinc.com> wrote:
>
> NUVIA was acquired by Qualcomm in March 2021, but kept functioning on
> separate infrastructure for a transitional period. We've now switched
> over to contributing as Qualcomm Innocation Center (quicinc), so update

"Innovation" :-)

> my email address to reflect this.
>
> Signed-off-by: Leif Lindholm <quic_llindhol@quicinc.com>
> Cc: Leif Lindholm <leif@nuviainc.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---

Applied to target-arm.next with the typo fixed, thanks.

-- PMM


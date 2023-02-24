Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134306A1CDA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 14:16:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVXvc-0006y8-GW; Fri, 24 Feb 2023 08:16:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVXvW-0006tc-1i
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:15:57 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVXvU-0002Ea-9z
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:15:53 -0500
Received: by mail-pg1-x530.google.com with SMTP id h31so7573653pgl.6
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 05:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l6wWlWJyITAr3q8SHutWfu5AyXV7lXgt7QOMfy0GyN8=;
 b=vLP95UMKZh3J0fEwUT0aGQ8TlfallxnY6HsbSFgyijbRJN1rZfMSW+4c2qthjp7XPp
 YPRIBlVR8r2Lhh+sdJe5bhjcPoMWHWqcP7KkP+QAIP/koMfqFF0NUh4WiWwfFrPLvpN4
 /xNPVp15/EFHFO0vyLHkZyZ4kE4AWyNHMysZ9wnHr9L9b26xc4pwVyqSCQhYU/SGJHdv
 jOeDXGLETJQ2NeIwR+FsnM62v3yDo0l+9tbvKJ3sfSMrSY0CHosdWe+WRPohPg19eU5q
 TXlO2yCcTVWw3mHJn/y5wZVioUujXJsmcb5/8iyiDRLIIrPg0QzFs6Lh045JMp1wOknS
 e/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l6wWlWJyITAr3q8SHutWfu5AyXV7lXgt7QOMfy0GyN8=;
 b=Ngpn+0URdAcFlZbAcMHxbZLRKVAsBNLbVQzolN+O/9DNbIkTt2spmYeFDrUO6yOElm
 QY2ne8GmqsiZqm9mBK79/L5DYVmbzuVM4s7U7s6KqvH8FuRQykNu6tK+ccn9BH/z1oNf
 PrR03I4ZnlLxjbuYX9vCXa/SUdqR4X9BEDLRIWm85HApkZOjEcteqQgCKpq/fsve5rkB
 87crw6uRYXKFasSjJ3YZqb6BQEv4SE8VVT6PQWIIfdGjyIXdUCO4WE/LvXpbh6mRYx8I
 WRMH6s78RR7/LKEc18LxcGwRQDHnVuhpmAw2VbMKszdpsg+Iri+YlmX22TfALIqc6lQC
 92oQ==
X-Gm-Message-State: AO0yUKW2dTj6kx5Q2WOAvujiEsZoLEdxockg8TJ4RWT4xe3FMImGj7m2
 ++kCKxw2BsOWJ5eTzADBSaW1alCJWaWdQn5INY/g2w==
X-Google-Smtp-Source: AK7set/nCc4sOHiCSFaEaszpRAg1dw73k3mS1SxgEp6kO3K9v90xDSR9qcf5gjK/vRv6YHBFjYldFDrkCARz1MGaQD8=
X-Received: by 2002:a65:6947:0:b0:502:ecb9:4f23 with SMTP id
 w7-20020a656947000000b00502ecb94f23mr1735813pgq.5.1677244550877; Fri, 24 Feb
 2023 05:15:50 -0800 (PST)
MIME-Version: 1.0
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-3-richard.henderson@linaro.org>
In-Reply-To: <20230222023336.915045-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 13:15:39 +0000
Message-ID: <CAFEAcA8AHp3y8AShauxJh+YnqCrg-o5b03zd-E3JCsWmsZ_bSA@mail.gmail.com>
Subject: Re: [PATCH v3 02/25] target/arm: Stub arm_hcr_el2_eff for m-profile
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x530.google.com
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

On Wed, 22 Feb 2023 at 02:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> M-profile doesn't have HCR_EL2.  While we could test features
> before each call, zero is a generally safe return value to
> disable the code in the caller.  This test is required to
> avoid an assert in arm_is_secure_below_el3.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


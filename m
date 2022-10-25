Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF43B60CB66
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 13:58:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onIX1-0001MM-3P; Tue, 25 Oct 2022 07:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onIWx-0001Je-I0
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 07:55:39 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onIWv-0001aK-1x
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 07:55:38 -0400
Received: by mail-pj1-x1036.google.com with SMTP id h14so10657512pjv.4
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 04:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SE8Tw9mMY4292iv11tQjmF5XYTBuieKTjKReF3CTMs0=;
 b=v9XPvkfJpBFnPEd+VZ5KpwaWK0Aty54T8LzArYioH49h7KFz39ygE5poLzecuCWhiM
 BalPoX6VH687p9vUGdOUDl7GFyW3DUuYRLSlUEr+osOM9rMeOme2A/Yh2o3DvIz2SJbv
 zsWtdYYRb2nNGHEyuqhUOljwJHVJnG8ndA0U454i0ITKCaODOyC5yQshfJ6gxHUn7III
 TBkiv4Z4saduqLmxiIO6QfZWoIKZz7Pk+aMEXtJNjJiFswVfZBfb1yq/yUZTfqsT4D7B
 u+euq49cNbI6SZ6QfDT/zbE1+Pccm82xV3N9oUB3cKNWrHoQWg8k6sy8ThkE1tC/ynYJ
 ry9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SE8Tw9mMY4292iv11tQjmF5XYTBuieKTjKReF3CTMs0=;
 b=s2/Ghq8AmFOXCG3Er9Pg7yYjIEzkO/ZgXiQDYXJ59gaayFOAUYtbDYjitk/97YHBBW
 /jrCIEvKM/3HCW5TQFUhX5JJfaUKMHECwHRZ2dXudYqT3S2dLYCJVyU5AiJHTDCqF8nU
 Q1jyYzjQAhQKJClYO1/BjUUWi+EfWzDsa51D2ZwDb2xEsQNnB1pwQgzDGrGhN1xf0HNY
 TePyqFyZ51fxWVeKxsQqS6hHV2EuyZlY+6hmqtiXvbMDAZXFrOjeWiBanNNUv2g1viXs
 V8MNWjuRBukCQYGLkTFmByZUewAnsma0Z/inT/+DSsNps5HTGK17VSJGZj7EMuazsuz0
 5tKA==
X-Gm-Message-State: ACrzQf0QYs776IOYpJzTUzLhv2+NqRF3VLvNEFZTiBdML+XViekOKVgq
 LbesrtDNaZjqKKeLzNN+Ja+hJxaQwardRd0Rslgz+k5GLRc=
X-Google-Smtp-Source: AMsMyM7is/OA4QfT93IpYLq1ZF/3rjMupR+jbR+hvJRfJgmUghKWuIZcA2hy1x4onkcfhwKCYbplGco5zl3asNZPsnM=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr38408534plb.60.1666698934116; Tue, 25
 Oct 2022 04:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221013171817.1447562-1-peter.maydell@linaro.org>
 <6fa916a8-7415-3398-d213-71bd506d82bb@maciej.szmigiero.name>
 <b7f64ff2-cf8d-6200-3a8d-eace44c9e07a@maciej.szmigiero.name>
In-Reply-To: <b7f64ff2-cf8d-6200-3a8d-eace44c9e07a@maciej.szmigiero.name>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Oct 2022 12:55:22 +0100
Message-ID: <CAFEAcA8Owp6i8Hg96b8UnrKERAEXFh+mvo8rkffzCTR_yQ8=Ww@mail.gmail.com>
Subject: Re: [PATCH] hw/hyperv/hyperv.c: Use device_cold_reset() instead of
 device_legacy_reset()
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 17 Oct 2022 at 15:03, Maciej S. Szmigiero
<mail@maciej.szmigiero.name> wrote:
>
> On 13.10.2022 21:39, Maciej S. Szmigiero wrote:
> > On 13.10.2022 19:18, Peter Maydell wrote:
> >> The semantic difference between the deprecated device_legacy_reset()
> >> function and the newer device_cold_reset() function is that the new
> >> function resets both the device itself and any qbuses it owns,
> >> whereas the legacy function resets just the device itself and nothing
> >> else.  In hyperv_synic_reset() we reset a SynICState, which has no
> >> qbuses, so for this purpose the two functions behave identically and
> >> we can stop using the deprecated one.
> >>
> >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >> ---
> >> NB: tested only with 'make check' and 'make check-avocado', which
> >> may well not exercise this.
> >>
> >
> > In general the patch LGTM, but I will runtime-test it on Monday
> > just to be sure.
> >
>
> Tested and works fine on QEMU with SynIC reset fix [1] applied, so:
> Reviewed-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

Thanks for testing; I'll take this through target-arm.next since
I'm doing a pullreq anyway, unless somebody would prefer otherwise.

-- PMM


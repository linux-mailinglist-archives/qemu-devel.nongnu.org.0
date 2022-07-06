Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EED5683B7
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:39:55 +0200 (CEST)
Received: from localhost ([::1]:33080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91Vi-000745-CB
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o90qP-0001KG-Dq
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:57:13 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:42848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o90qM-0006PA-IU
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:57:12 -0400
Received: by mail-yb1-xb35.google.com with SMTP id g4so26241132ybg.9
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n2fkH8OyffA4Q8RWIqEvbLe6Ybos+ZBQnqPxE5aNpSM=;
 b=aK0yPw3mR0y6qDrkMreXD1vInezmmSEWOHbvQ4Ba6YPWOLEIrA+v/tjzxaAQxm0ROc
 4UdK/bdF7gzfubmJgeNSndFGLQVVMv5N3V+vzT490PB7OetRZrEvTdREGTgR6rFU5GDb
 sQ3QEfekeGsKf6ry4sk83M/m3w6rgBYw/LqBwYe5g3omt0GqMgZeGPHuiiBsDTsZqhml
 rNn6nzkVbHMFk14ZHi9QlBPHBezr39XTtk62EPceFAEu2PgKgB9k8ImGQIhjxVsEM6sE
 mFNXHl1bmLplXjtFk7RMzDojNKU9ibnU7W11erfYvDf/J40V81a+ctiq57RGf3uOlL6p
 JXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n2fkH8OyffA4Q8RWIqEvbLe6Ybos+ZBQnqPxE5aNpSM=;
 b=oh2Or/b0wdNb1SypU9oj4qR+NS+pfy0QgJpWP85qJaZWQx6jlg2trPzgCovctpcGgD
 jzL10kFrEsWowbiEF67hhUuEey5rAHJVyxm9I6s1FUa0yJUPOJ2Vx80E9bP5UXgXs5Nd
 tPZF7Zc1ZZ9Z3SO9+SrP+qEJkjVeJMrl4MSi34p5T+2nTSy6Jzqe+a9eTzBV1whG8B++
 wtvkxXshpazAPRdnyFzPLqNr6FmGKs24PKIDX4dMF8Mf5NgZd3OZ8z5FNHIOALbO6B/u
 J91TNHDdel6M69q6nRlxMUP78menhUAIjw+HEX0LjwYFtbOEaWwGKJGqSOBPGqmNEjYc
 WMNw==
X-Gm-Message-State: AJIora9FuU8kV2xgPdv1kpzU5t22ycsA/Yx9BIwFb3C0iHqN4rjcWIaq
 Sy+a3uLpfjTXl6dgJONNALGQRT1HPCuKXbmh3GB5PQ==
X-Google-Smtp-Source: AGRyM1vR4hIMWzoqOi2C3pe5YXeyWdUCEG8F3Dw3cD7Hf9xa8ehorGAF3103skgLrGiBakBvlGN4v2syIijkgYYM064=
X-Received: by 2002:a25:6b48:0:b0:66e:3703:7df2 with SMTP id
 o8-20020a256b48000000b0066e37037df2mr20908800ybm.193.1657097828944; Wed, 06
 Jul 2022 01:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220705153708.186418-1-vsementsov@yandex-team.ru>
 <e5fa4843-31e1-9ce2-fd13-ffa1b6ee6f1e@linaro.org>
 <a48bfafe-c8a0-4b8d-1a4f-0872e800dd1c@redhat.com>
In-Reply-To: <a48bfafe-c8a0-4b8d-1a4f-0872e800dd1c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Jul 2022 09:56:30 +0100
Message-ID: <CAFEAcA8=WRC+qgoJF7k38qoMx+ioYRW3o2isyK2vkCdp_gD9oA@mail.gmail.com>
Subject: Re: [PATCH] iotests: fix copy-before-write for macOS and FreeBSD
To: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, 
 hreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 6 Jul 2022 at 08:39, Thomas Huth <thuth@redhat.com> wrote:
> Many of the iotests rely on output text matching. It's very fragile, always
> has been and always will be (unless we rewrite the whole test suite to not
> use output text matching anymore).

Maybe you could have a pre-pass over the "expected results" files
that substituted in the strerror text for the host it was running on.
That's probably a reasonably doable amount of work compared to
a complete testsuite rewrite.

-- PMM


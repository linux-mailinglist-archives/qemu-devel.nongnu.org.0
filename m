Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B7B3A6D08
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 19:21:24 +0200 (CEST)
Received: from localhost ([::1]:34800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsqH5-00044R-9s
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 13:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsqFF-0003Nb-W3
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 13:19:30 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:33741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsqFA-0003uk-H1
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 13:19:29 -0400
Received: by mail-ed1-x52b.google.com with SMTP id f5so42526867eds.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 10:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WdJkfQmPcYd5RxfDJfI+qKh9sn2mGlv8e1MgEfWqbUQ=;
 b=FPLYVHzG1pZl4yVl5WaYLBwXBab/YZatfYFBu8wS4U3KXT1rjju/XXn4lj7z+luhdq
 QlRqHd9OtiZxZxczoVuf9Q7gkPhhzN356iG3FfBei6+5LFmghiB3ShHC3hR7lybOAdFU
 /xuPvJSdftLQ7z8VFiT7m9sjUx9fLkm5y7b+sFWpP8flKCi3VO2jmoWw6IsQ6gQPQlRt
 Ij1nKJDyo0hkNJssdt2VXyleZ9MZLQegNi9ca0rZPSNmneemIddWKQXd5kGhvvrDoItn
 Q5HOhO+2hbBHWk6aEcl9XIVOGPZ1mcfpgTj6HwJP+A7ig7Y/ZteNBti6fmb+vpNRFWPa
 qnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WdJkfQmPcYd5RxfDJfI+qKh9sn2mGlv8e1MgEfWqbUQ=;
 b=Exyx/c+cMG7nZWTEyQp2vJA4/3GStI+ZkqxVPaNiAP1LWQ6yVZfqirVUmlJ6i8ER2p
 B7BJBrTvQlmI7yyHVL2sxNPRP8cfSgZFzN0RS2Ts0nyxOKXJ0ak5i81Pv80vfmaIGwjQ
 r8BVcdhT6Ij+jxyJViE5kNv6UZPXzjjGJo5VGvrUUZMSlfE/hYxRR9fUUJBg76qew+YE
 F3Fv9OxJ1pFOl9pXOvTlACaiVOav+pNrN7WZPEa7G/uZUSrKq+MnShar333QDCW2/3/A
 xlMelVPzwD6+TvCt+JPl1PVUSXWXxV7sRTaAqxzlqcNs4fq/K55QA2Ezg93KzTs1YgFe
 oQRA==
X-Gm-Message-State: AOAM533OVC944gjHwMK9FZMIlXmd+cesh7Y7c9y3420R4d+ByhM06Vjc
 dS72FlIQDjuX5jsFMDqTAM1jGT30jL7mrjfhC3H1sA==
X-Google-Smtp-Source: ABdhPJyhxz+I80ZSUK79NhErnOQNv8dezkolS39veyAFCxW+m0+UJ2Or3UPzjYrWIJMkLLJerJ8OZjFzd3tTNqrcubw=
X-Received: by 2002:aa7:d755:: with SMTP id a21mr18526677eds.146.1623691163115; 
 Mon, 14 Jun 2021 10:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <0a102843-bb93-93b8-f502-dd0cb2a6c636@linaro.org>
 <9b0849bd-20d0-9f72-01bb-ffb60cad575b@amsat.org>
In-Reply-To: <9b0849bd-20d0-9f72-01bb-ffb60cad575b@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jun 2021 18:18:48 +0100
Message-ID: <CAFEAcA9Sr_1zT2uTBUhwGVrU92f7-Mtsu0Fir53qyyR5S_0V-g@mail.gmail.com>
Subject: Re: [gitlab] Renamed issue labels for target architecture
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Jun 2021 at 17:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> Wait, are you seeing labels are a notification mechanism or a way
> to sort the issues?

I would like to use them as a sorting mechanism, which is what
I was using tags for in the old LP system. That is, sometimes
(particularly as releases approach) I want to go through and
fish out all the 'arm' issues and see if any of them are worth
tackling.

thanks
-- PMM


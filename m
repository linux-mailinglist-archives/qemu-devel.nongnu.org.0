Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 872A54EE24B
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 22:04:36 +0200 (CEST)
Received: from localhost ([::1]:49984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na123-0008TH-4J
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 16:04:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1na106-0006M9-W6
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 16:02:35 -0400
Received: from [2607:f8b0:4864:20::112a] (port=35192
 helo=mail-yw1-x112a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1na104-0006pm-VD
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 16:02:34 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2ea1b9b3813so10874467b3.2
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 13:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kGlh0wQ3+xi8Exz0Thhb3Tsap+mzTo3k1AduMNPx7FA=;
 b=LDhKG6+c491a++wGw3soLhp/9N6qw4r2wbcf7omjdTF8qR2KmlbEmhgVYEJsa+wx93
 j32uqKum9oiEeLEHmAC1hdPsd1rSw0fbFKDnyYeDLPcaC3Z6N2marCJRjJ9meDpzYhY5
 IR7oBjbsY6TJN/vPD/7UCwKrMN5UYEY4B/08Zr0oSlKmmgfTm0ucehvqlvFf7A89kddD
 Yd9Gk3LSrmmu9tU4Osx96IcCpdFb7OKWm0Sc9xKjyV8MTPTeznI5nCVlrAXroM3WqsH7
 xiuAKFVeczRFtJ6tnepJtetv6qYV6G7lo9u08fcc+W4iL7oyHCsy931Ydq1/954Iups2
 MC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kGlh0wQ3+xi8Exz0Thhb3Tsap+mzTo3k1AduMNPx7FA=;
 b=PTnvSDN0Ay0YMC8F1UY5bJVVbTJHBR3pQF5O/sEgJk3VJtaNn43FXsQ6F9wcXY2RV7
 wNh7csfEx0Oz12aWXwcXaqMbmgoVsoJF6vzEAovvghbge7Aypb5iUpxmb2aqH3PQv7yi
 LRlEeJtJDhA6fLSKGJBHbUaU6UU4z38SrcfqLbTqVUb30jd0nZIC36r+5XZ2QHqp+RUe
 bi5LIm2AOR4x/LpZKRtYsiQXY7ruB1m06Rtma84XecD2CQ7gzYkIZXTiq4At5xyLgjEP
 mwJ9N+lxEnxZ6dEp4yqXSO7DGM4ymq78ATOxcmOgBQ+M6TJ0uyMwMKupokP1eHPOO9Y7
 /7AQ==
X-Gm-Message-State: AOAM532V/UAPU4eov2w8rxgbJyHxMgUTzGu2F2lI0MuN+uNY+tTNutO1
 9Zn4FgBYG+EljDkilaWYth1nrMOLchExjIy3MtJ0/iPR9Nvmtg==
X-Google-Smtp-Source: ABdhPJzoE09fMb5+zJ4tAEgrTh+eVIjMrgzRW/nZ8325tl0SP6ZsNp0xJemLBcc93faJ08pgNlj2GrI86BEdA3G5Go0=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr6687180ywf.347.1648756951923; Thu, 31
 Mar 2022 13:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220331170754.398913-1-richard.henderson@linaro.org>
In-Reply-To: <20220331170754.398913-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2022 21:02:20 +0100
Message-ID: <CAFEAcA8GiQf=KAPvTJT+EK8n2qNiGbs0adonXo5iqgfDQvi=2Q@mail.gmail.com>
Subject: Re: [PULL 0/1] Last minute tcg/aarch64 fix for 7.0
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 31 Mar 2022 at 18:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit cace6c6f3aca7b88afc42995f90bbefb37a0ed57:
>
>   Merge tag 'pull-qapi-2022-03-31' of git://repo.or.cz/qemu/armbru into staging (2022-03-31 11:56:52 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220331
>
> for you to fetch changes up to 7ceee3a19b31818e6f7c8e429e25b219aefa8dd6:
>
>   tcg/aarch64: Use 'ull' suffix to force 64-bit constant (2022-03-31 11:03:59 -0600)
>
> ----------------------------------------------------------------
> Fix tcg/aarch64 buglet for Windows on ARM host (#947).
>
> ----------------------------------------------------------------
> Richard Henderson (1):
>       tcg/aarch64: Use 'ull' suffix to force 64-bit constant
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM


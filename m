Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EEA565507
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 14:19:30 +0200 (CEST)
Received: from localhost ([::1]:49562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8L33-0005eG-8h
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 08:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8KzI-0002Yz-4p
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:15:38 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:41911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8KzG-0007f8-Jm
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:15:35 -0400
Received: by mail-yb1-xb34.google.com with SMTP id b85so3315586yba.8
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fmAlzI3fpwGw/rbloIAhQht5p7waOfpw6SU5gSSlJZI=;
 b=j0c1LufL2dARAfBGFHEY/smtmZvF3wDLqlN5P1sPNvUus5Gu/GonNrwb3PYHKwFKDX
 DbB2UA9EsfgidtSrZaXvSfVqX6FhjAw2tneEggAjAtkM4lAQK/7W5GJU+PzjsQNB61QI
 ojflIZORwok6N9G2GpooTnwc0PoZw+u5LsgCXv0awaxJCB8Yq3DbNmlkGnA8GBey7p6r
 5Rn134xG2AMpe/XOztKYA3cxYTkLHhz4XJkGO0mbR/9ZuhMS2Xg7XCihtSofQuONSaAq
 Vr+7D00askOYi15Mo3qdVZ1cXJFtfTtCE8Y+sxbaswUBd+6/VXtvV9buz7sJEe79F48q
 gQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fmAlzI3fpwGw/rbloIAhQht5p7waOfpw6SU5gSSlJZI=;
 b=AsQYI07c+E0jwxCj7l+nhm+ICMzlkGYYNyAjvAMwtM+5Fulpe4ilFU8y5x3xjjQgbk
 GmWRITcSGrkkUw9RxbpNPHG2tvBDkMI4Uz8Sy72C3EyLBzcrThFzKgXpoVNTkHJUvhVt
 zuKZNpnwrUkZ4cKP0cXHcUhEuIrwqVhuu2nm8d8lCy/0RKraaBgerF7jHqMaqggF2MIt
 wxA/RTYRlLJ4YNcfqDzkqQfzviH/q9YFlJprqOLwYj56QTdXMaB0IxAmsoeQyuz2ucRT
 Mu5Z1a10WDst0lwyKw/6Nd0z3yF5Xzst7hDhympRV7XIfYhtf849AqNDjGEzh/0li4dV
 Pidw==
X-Gm-Message-State: AJIora9x4J0Y1134y5q1qHUuR5xYBjFTeOo36x7a4W4k9Lu+K37lkGRz
 QxkvSx+reSgrh96HzC5sjZ0lg5fteH7MDAcopIqmNz3A9B0=
X-Google-Smtp-Source: AGRyM1s17mf9PQ74ZsgxOplMpi+MZl3lPmkfXkREWpiCKVGQkBxKJ0Bb2YXlwJ4Xy8j1ITsgMX1iT6U1Qv5z+sRrJqE=
X-Received: by 2002:a5b:e87:0:b0:66d:4669:9871 with SMTP id
 z7-20020a5b0e87000000b0066d46699871mr30912101ybr.288.1656936933206; Mon, 04
 Jul 2022 05:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-40-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-40-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 13:15:22 +0100
Message-ID: <CAFEAcA_3XVr3quk=0t9RbtK-G-60dvJyfrfuh4Q0=380QBKqVg@mail.gmail.com>
Subject: Re: [PATCH v4 39/45] linux-user/aarch64: Move sve record checks into
 restore
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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

On Tue, 28 Jun 2022 at 06:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move the checks out of the parsing loop and into the
> restore function.  This more closely mirrors the code
> structure in the kernel, and is slightly clearer.
>
> Reject rather than silently skip incorrect VL and SVE record sizes.

", bringing our checks in to line with those the kernel does."

>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


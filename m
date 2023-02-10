Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C82D26922E6
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:03:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQVr1-0006GO-I2; Fri, 10 Feb 2023 11:02:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQVqv-0006BM-2w
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:02:21 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQVqs-0001n0-9H
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:02:20 -0500
Received: by mail-pf1-x42d.google.com with SMTP id d4so506687pfo.4
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TORpY+CV4pZM0oxj7Ob80QOc34Qbno2BF1gpgA/A9PU=;
 b=R3fea7sOdlptBe5Rph6s8IGQgZqW/mUm37+zJ4DCKC73JnWfrEKuZCWcYrxnZFpxpu
 etCzs1gASdLxNmW8s4pVp2RQMJws84eO4DGja6UlrAlqIhWMKzZ/JKayaXYT1lmFbdxb
 FkUlN53xK5V2L4AZK7SzxsaI2/E0vcOaGRhQhQJTsA+Xb7j292SH29CLGTNbU19Juno2
 2KWz7jfvGPoZyIdgTN5ONc5ELyewCkuGWmdUco4NtHzmGoL38Ip0typjnQBr5HUeDVgK
 l2IFG/vppPDdSyhfVTqAxYL81w8dxvC15S49cEangYC0LLkbNyHXKZ5TmoG4MPX3w19I
 nLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TORpY+CV4pZM0oxj7Ob80QOc34Qbno2BF1gpgA/A9PU=;
 b=qbYfoGjb/i15rl9ib6l9lKpSUvBKRAwWjtKoB9IkDPt6NrkdMqr7k/OJSZLJoC6Bqz
 lvViRoRmClhTQMTFbDk979oIuXpFXLcxFiiDOnQIqf+SQsq6+m0L8jjd5tmUrAFnMn86
 Yln98VVQaTRBcvaYgLIF/dbpnapy2g/cvnqodvJ33BXkrGkHwWIJR308jaR+ePA0Odvy
 ZLRWtdP9NRv/VEp2d9V0P96GVsoE4iZekvbZW+Sk3PyaHRhIBedt7Ii6aKicUxxBqdW2
 Wk11xRpMHTT1EPsDWgOo0UqSHlYWGleK+N8lTJev2WbwavAKt7Dg2aS0ojO1CqMYIk8m
 fRfg==
X-Gm-Message-State: AO0yUKXikzENERsyrusXoedj/eEQ6fBNFaU2R+iCkBbHxPACmILOqkeG
 7VK+XPXx9EYqYgbN0iNN2gbbVHpxhAXqbpJUHDY7/g==
X-Google-Smtp-Source: AK7set/U32jTF0RgFaTiY06aSsGrCH19g/hOYgFTof02bxiroD1/EI/WvM4TrCxPI7HHr4dIoGCr6ZLNgb/RL63pjqc=
X-Received: by 2002:a62:53c6:0:b0:58d:a84a:190b with SMTP id
 h189-20020a6253c6000000b0058da84a190bmr3420526pfb.48.1676044936361; Fri, 10
 Feb 2023 08:02:16 -0800 (PST)
MIME-Version: 1.0
References: <20230206223502.25122-1-philmd@linaro.org>
In-Reply-To: <20230206223502.25122-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 16:02:05 +0000
Message-ID: <CAFEAcA_o_aoKpSeR-YFj8xPsdHR6GUgvBtYF-iTO0+qnYi7H+A@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] target/arm: Housekeeping around NVIC
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 6 Feb 2023 at 22:35, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Missing review: 1-3, 5, 9-10
>
> Few cleanups while using link properties between CPU/NVIC:
> - Simplify ID_PFR1 on useremu
> - Move NVIC helpers to "hw/intc/armv7m_nvic.h"
>
> Since v1: addressed Richard's reviews
> - Do not restrict v7-M MMU helpers to TCG sysemu since they can be
>   used for user-emu. Hardcode ARMMMUIdx_MUser
> - Convert CPUARMState::eabi to boolean
> - Split 'Restrict nvic to sysemu and store as NVICState' in 3 patches
> - Dropped following (RFC) patches:
>   - neg_prio_requested / unrealized property problem
>   - use object_property_add_const_link()



Applied to target-arm.next, thanks.

-- PMM


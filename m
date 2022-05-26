Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C65534BB0
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 10:24:17 +0200 (CEST)
Received: from localhost ([::1]:58684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu8n2-0001zA-9s
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 04:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nu8js-0000su-Cd
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:21:00 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:46236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nu8jq-0008Jx-LC
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:20:59 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-300beab2b76so7453937b3.13
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 01:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tK5BG+ppJLp5NM4DNMgmd78+UzNSy3uJCzoU4bqGI+Q=;
 b=RTEK+ajrfSYnG3DeA1ZaKmMVhkTskhzmau7kpT+R2tN9G6oOvQS6m8WatExuEefCm9
 nURbQbKd7qnyIL9aOHjrjPJmygw2jkrtS5hCJeP06sjL4vPyY2gMQFyM40ALyzm9iVxg
 XnUc02+QObX5Rxl/95qdQ4Ynu8Hs9OsExxhvGGe8rm1gpmT3JZxSjqpv7oi31wi2DHWc
 Udm7TOMl1eMIZJf90u+5M6cWq5APhIx8xgcOeo6noIntjw955S/kLs8uZc9mKYKsa/cl
 JUxS7QANQvLi0qkE0DXhulwhTJJZ/DisbG4yC4yxqUFROj5MHm3ff4IYZBdO8GMVBQ3d
 Sp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tK5BG+ppJLp5NM4DNMgmd78+UzNSy3uJCzoU4bqGI+Q=;
 b=dJv8yLTMemYCwB9Mz0nOTM6TXDqHmjTOwHOrKgAX917YsDyJNbzQ/699YiqhVzzIJa
 0+M08vNzU/wVqWDFnHk8qC5rKIEXadHjFjGXQY2qfWXRr1qcy3cq2RHnrb1kOfeOGvi3
 yuSaTFKA4hrCgleVT1GpkKMv5Lhw/6YWbtnMVS4AP5zgGldSeW3EKhZOhHjmJkCJ0EJk
 L2n9lwBHLm0FcXqvZMMA91Mo/zEYv0cHzFHh2kuWTtmOCR0oQ58nd2pQfKoJ6rgf8lpr
 hwzctoWzSPTHb4gIqXL9soHUWovL2z31L65lq1PAkJ9PcBm7zKsEvgqcj9URH53Rb619
 7FLA==
X-Gm-Message-State: AOAM53096iVxSHEtKaOdWhY4hdTMuRTQ5yV9keTb4qbWdROFkruBUfks
 h9Icb97idBmvRkwieeQ9nhIQh0oLzE6G/0cLm8C5wp3j+jQ=
X-Google-Smtp-Source: ABdhPJxs5wtjcxWOVAk2xDo3agWTHjMjK36RcrKbsQ4Rbx2M9kj6cEZBU9cX/46HOL4Ezv6ZlX/epNgzojZjKrbwXTs=
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr20096287ywb.10.1653553257078; Thu, 26
 May 2022 01:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <AADD58D2-C3BE-40DF-8EE5-3A901F4F8F04@livius.net>
In-Reply-To: <AADD58D2-C3BE-40DF-8EE5-3A901F4F8F04@livius.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 May 2022 09:20:46 +0100
Message-ID: <CAFEAcA-n4GMq1_SCdTDp6sQmHzyyzTk5hav4QqOY3-j3Sr86Jg@mail.gmail.com>
Subject: Re: AArch64 semihosting?
To: Liviu Ionescu <ilg@livius.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Thu, 26 May 2022 at 09:14, Liviu Ionescu <ilg@livius.net> wrote:
>
> I'm trying to set-up an environment for running unit-tests on AArch64, an=
d I'm constantly getting crashes:
>
> ```
> ilg@wksi ~ % /Users/ilg/Library/xPacks/@xpack-dev-tools/qemu-arm/6.2.0-1.=
1/.content/bin/qemu-system-aarch64  "--machine" "virt" "--cpu" "cortex-a57"=
 "--kernel" "/Users/ilg/My Files/WKS Projects/micro-os-plus.github/work/aar=
ch64-boot-libgloss/Debug/aarch64-boot-libgloss.elf" "--nographic" "-d" "uni=
mp,guest_errors" "--semihosting-config" "enable=3Don,target=3Dnative" "--se=
mihosting-config" "arg=3Dsample-test,arg=3Done,arg=3Dtwo" -s
>
> zsh: segmentation fault   "--machine" "virt" "--cpu" "cortex-a57" "--kern=
el"  "--nographic" "-d"
> ilg@wksi ~ %
> ```
>
> The application was built with newlib libgloss and all it does is a serie=
s of printfs to display Hello World and the argv array.

I'm not aware of any problems with aarch64 semihosting.
If QEMU crashes that's definitely a bug -- can you provide us with
a reproduce case (eg the binary you used here)?

> Some time ago I reworked the semihosting implementation in OpenOCD, and
> there I used a common semihosting implementation for all Arm and RISC-V
> devices; everything worked fine, so a common approach is realistic.

Yes; QEMU also shares code for those two architectures' semihosting
implementation.

thanks
-- PMM


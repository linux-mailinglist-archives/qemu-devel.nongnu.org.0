Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBE4667C31
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:06:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG10H-00072u-37; Thu, 12 Jan 2023 12:04:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pG106-0006yG-9K
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:04:26 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pG104-0004PK-As
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:04:25 -0500
Received: by mail-pf1-x42b.google.com with SMTP id a184so14248916pfa.9
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 09:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gxc2EjV6NLWugYG9IS6pNMRiP9xSHlvQ3XCohk/TIYY=;
 b=XUrQX3/j2tTEj++/074OtKB2+WJM2Kwfy9E00rTJ0H003Aiv95Ao4+7aFaY+zw2p7V
 wg/fH2OF+B3vi1w9OI6hC0Dk6LGj1MQV1xQ2rzSpKHHBaUWI0Go/XvLbaJgUrntH7CG/
 4NOHvUUfy1N2e5YHAMu8psy+XZ/DPL8p9SUcQmvaKFIjSH7FOj4lzHLLvsjwX0bWOEwA
 wiCHcTheZ2auFaC8mottVJt+gHHhO0jBxW5uimSS3Lo5SnQ4gowPl+MmFwleLK8H8CBR
 bL3N9RwHwPmoyaqL5csOeGG1ikpgt6oTpg/Fk7YNJ6c7fpzU3ovIhoW3ArDG3SrKyYJ8
 5lqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gxc2EjV6NLWugYG9IS6pNMRiP9xSHlvQ3XCohk/TIYY=;
 b=hDmRau8YMkvFFxmyOcTugqVL5OKCNLN0KpqkJsDWB3PvmCnA0zzqD8cHuHxKYfB1d2
 C1ukw5og/atuXIuTA0CNule6YYKJTHZcyFhwliJYP3zAVlsk03Vu7+k7kMtI6XcF73Qv
 IXdo9AARyMTzCzwD1vo+5u/jyFs3ehtjgYoaVQtoWeeyj5CE4pnpzXvia/li9QMGtc/A
 r4Q6AtwfOub4YYdKH0R6NekUJNnZuYXgECyGBoPhKGD21wgWpXBfsEmvNU7CWHmRZL6i
 kd80R/llMW2hK4Atinpd1gtQqF32TTyrUf0qBSOzGaaXdYBjzL6B0kCx9nxGKX8SfSCa
 4xig==
X-Gm-Message-State: AFqh2koFiR4rgl6lEXOOqIcBuTzJjJqL5oAheMhlvZ+O3LK0s7pCCccZ
 dhRj7CdRp7P02CnwIc7gR370wRmFtiE9ly8+KJn0rg==
X-Google-Smtp-Source: AMrXdXsRuwGDR8wBar9NVTkt8ZLYDwvG6+kL/JZXo7c02p48kVDW0x9RpHCY+QGQorbdUvLEnCZ1MOiXcdr/nWW5cvQ=
X-Received: by 2002:a63:9d47:0:b0:4af:9f91:54d1 with SMTP id
 i68-20020a639d47000000b004af9f9154d1mr1215404pgd.192.1673543062411; Thu, 12
 Jan 2023 09:04:22 -0800 (PST)
MIME-Version: 1.0
References: <20230109115316.2235-1-philmd@linaro.org>
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 17:04:10 +0000
Message-ID: <CAFEAcA_8g5CVBbRzNOpiiBw-o951tfDC_=0TcpCnxhk86=3EPg@mail.gmail.com>
Subject: Re: [PATCH 00/13] hw/arm: Cleanups before pflash refactor
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
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

On Mon, 9 Jan 2023 at 11:53, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Various trivial cleanups:
> - Remove unnecessary sysmem argument from pxa2xx_init()
> - Use IEC binary prefix definitions
> - Remove unreachable code calling pflash_cfi01_register()
>   (another use in PPC sam460ex will be removed separately).
>



Applied to target-arm.next, thanks.

-- PMM


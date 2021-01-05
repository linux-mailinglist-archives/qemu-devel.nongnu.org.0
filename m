Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 322F32EA739
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 10:26:10 +0100 (CET)
Received: from localhost ([::1]:60030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwibQ-0008Nh-Td
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 04:26:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kwiYP-0007CH-7O
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 04:23:01 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kwiYL-0008Nu-8O
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 04:23:00 -0500
Received: by mail-wm1-x329.google.com with SMTP id c124so2327474wma.5
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 01:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=BLgGujq8rqc7XcBFJuzNFY3EMhBseweZFBP6CpXMw4Y=;
 b=f6zxBgLM6gzV63gV4jzaK8mLLb50x9PB9Ac5v3046ZpyXHoj7ZbhbZs2jOmaleT7DI
 nOZvWQdAZI52qlNs4d9y15XCX7raVxLYxzLA2453Mra859R+9SpD8q2DfvntLTSZi1uT
 bRlNzxId7MR0Qc6gkvLBv9XndAl6WGJRP8VaKazaPredgCFEKzFH8XGbIip21dCaGGuC
 Sz/r+jTYm2ChFzkhm61Sps20gg1H7fb/aCGfEdFxbB3EkPv/cN10NX0BqYu89LFK3gNs
 LW3UXlpMGRDFJ5HP88xi3bO9NSpNWS17U1rIm/oOHaA12heotM6NmSRqKZEqKMIH4nIV
 J6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=BLgGujq8rqc7XcBFJuzNFY3EMhBseweZFBP6CpXMw4Y=;
 b=UvTtG75Z5bSMU6m215x8ujOCuQfnZuhO5bANc5gEObdeJPHA5yJVaYet4CyCmkuwwI
 782cFc+ggzEoOUZGfjn8ErB/B311X3UkO1hvgToTbpGMja3mSiW8upK2nlmtQI5mhNOe
 k9inVzFynsnh3Z7FMCeS7VJEh3fHq9+gy84a+TdgAqKMdwRgBP789P273L6lOxbB3SIU
 AzFR6Ux0JeEljxZuE5XId0c5J+YM4hzDsGoYH9CSOwsxbGheKddEyM4yG71UT4DRP/Ut
 IMloXAFHxoTdRP59sb48XD6sHdifxyvMlc0VsrrY1rRAqrpM9FDwLWrY13TN5o/0PeFq
 DzQA==
X-Gm-Message-State: AOAM531r5wJ/A0v8EhnDDio67MmoqPDmt7XYCXJ0EJf38arOD8q3r9HB
 J9fnDni4E0Gp5P7vcXXOc+34FA==
X-Google-Smtp-Source: ABdhPJwwT/YWJkqHr9XACTrhC+zHYTbTE0HzYlwApDjgl7uzpTK2EoAUcY8qUMTMcZPFFJ7YxLo8qw==
X-Received: by 2002:a1c:6144:: with SMTP id v65mr2552933wmb.125.1609838575593; 
 Tue, 05 Jan 2021 01:22:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i18sm97400899wrp.74.2021.01.05.01.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 01:22:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1EB201FF7E;
 Tue,  5 Jan 2021 09:22:53 +0000 (GMT)
References: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
 <1608704767-9317-3-git-send-email-bmeng.cn@gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2 2/4] hw/msic: imx6_ccm: Correct register value for
 silicon type
Date: Tue, 05 Jan 2021 09:22:47 +0000
In-reply-to: <1608704767-9317-3-git-send-email-bmeng.cn@gmail.com>
Message-ID: <87r1mz3fgy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Bin Meng <bmeng.cn@gmail.com> writes:

> From: Bin Meng <bin.meng@windriver.com>
>
> Currently when U-Boot boots, it prints "??" for i.MX processor:
>
>   CPU:   Freescale i.MX?? rev1.0 at 792 MHz
>
> The register that was used to determine the silicon type is
> undocumented in the latest IMX6DQRM (Rev. 6, 05/2020), but we
> can refer to get_cpu_rev() in arch/arm/mach-imx/mx6/soc.c in
> the U-Boot source codes that USB_ANALOG_DIGPROG is used.
>
> Update its reset value to indicate i.MX6Q.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


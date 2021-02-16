Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142E031C97F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:16:17 +0100 (CET)
Received: from localhost ([::1]:38208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lByL2-00067j-4R
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:16:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lByJu-0005cF-Lo
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:15:06 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lByJs-0001Ba-0l
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:15:06 -0500
Received: by mail-wm1-x32d.google.com with SMTP id x4so14061392wmi.3
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 03:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=dHFseCNwab2bfparxR6t31k0kDcV/qCcGicg1Cc4dM4=;
 b=G3dWi1qnw0l0Rs1tQKu7ex+RpQaVq+jmYmF6/eRjWvAAdbzngul1GnVLSdRGLrp4SX
 kHzoJeZsvpZiPpAT70OAdP7HnhRf0r2THAB9iO/RxrcqUccjEarDywMfXt+O5g1G8nbn
 dYp4HbiOcH4IIDDwYtFgko1XAEkZbgDZeWG9q9cHmfA0P1sGbz5Iow4e+Xqs4F+eT5l2
 ytr5ovLgCCVnWr0ab+KkhATjuGdzArKt1eRg+5wujvS0j91dAo/vGMfzlhWPWHW8NaHJ
 vRXUPS2nCG9cMtGiucZU/kfAWIu2S6FgvIqeQlumdy2oPfeSL+PS9lHyVhQ2pHsKgUgl
 rUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=dHFseCNwab2bfparxR6t31k0kDcV/qCcGicg1Cc4dM4=;
 b=VNNu8QWDU9eczNZ0Mxnmo5IwjDQGYSLdULXMuR2DEeMG/dVvhG05QG4FOS/alQAwbo
 xyFXYeE9xaze1U/pq9To3z+0VgfFcQziwzAhAAksMhcCxiL3qIqlz/BDr3VsyTKfcSBl
 UxbGTaaniF73MzC5ht7Zu2dG/pXzAkNmA6WhgqIJ0IBTJbE7q098zEJPF/OJywTJGSWq
 hgqnGebFKj/m+npViesxw1ZRSS4BhgmyV6xL7cNcgcQN5xoEHITcM8evhIMqtj8YXEyu
 HgT76omcycpLcleJ0b/jB4Wc7px+DTunchfwhyPJ3pH8goVyFN4lHSqSvVWtY1hIokBt
 f/hQ==
X-Gm-Message-State: AOAM533adHOiUvKxKfmxen8UC1dqBCkP/Cdzvf/AZmw+lOQ21IRSXqVy
 er8xao74VttRpKMmGJ74YMIX3g==
X-Google-Smtp-Source: ABdhPJyxbgKk0isGfZV+Dw4MFBpsOR/5SplFSya6uGBpy80h76956XsCGpRAWtY12+YSpmHd9U1pWA==
X-Received: by 2002:a7b:c010:: with SMTP id c16mr2939192wmb.134.1613474102256; 
 Tue, 16 Feb 2021 03:15:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i15sm2810751wmq.26.2021.02.16.03.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 03:15:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 567D71FF7E;
 Tue, 16 Feb 2021 11:15:00 +0000 (GMT)
References: <20210125105818.2707067-1-f4bug@amsat.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] target/mips: fetch code with translator_ld
Date: Tue, 16 Feb 2021 11:14:55 +0000
In-reply-to: <20210125105818.2707067-1-f4bug@amsat.org>
Message-ID: <87o8gktgaz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Emilio G . Cota" <cota@braap.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Similarly to commits ae82adc8e29..7f93879e444, use the
> translator_ld*() API introduced in commit 409c1a0bf0f
> to fetch the code on the MIPS target.
>
> Reviewed-by: Jiaxun Yang  <jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


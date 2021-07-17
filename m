Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC2F3CC50C
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 19:49:21 +0200 (CEST)
Received: from localhost ([::1]:38506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4oRE-00030b-PF
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 13:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4oP7-0000GW-5r
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:47:09 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4oP5-0005XD-Lm
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:47:08 -0400
Received: by mail-wr1-x429.google.com with SMTP id v5so15901578wrt.3
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 10:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=lk12c6IZVlnA6HH4PDT18etZZo48E2wQg7HFT0iY8/E=;
 b=n6JJgSxwkk7XEud13xz1ocMneGpTK4WDjKggmhWh3nM7VZrvOvElSnP/8ic1aPCjHB
 uZCpXSmMkRjMpLgxLdhSOH6iHkQttbiKG8FhT00+cKLFT5lHGPDuFmHuadD121bjDYaE
 1JzxG/hOYwJvHxxrpuX0kFiuEFMVTSghjdwAQF8m38I6ZX6t6P8V6LtwL1O1QdcpwsYx
 EK4ZNKXIQG4hmve5szoNiAGc7gVxaor3Kz/Vae74mb/LoZZhzMnhitzS6smW5jRUlaEy
 0ozzQ+RIynVSroDldk8cn+IppY79lIlFuRyTyrcGMjphIW71q2Z/kn/9/Z5k9EUTg+MX
 OkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=lk12c6IZVlnA6HH4PDT18etZZo48E2wQg7HFT0iY8/E=;
 b=RwWYbf1T4RKLkA+6MRvhQTC2wkjMPmNLnwTnLtC8p3cfos7FA/FimUXw8Hc1GpsAwv
 2qS4WGnx4sLQj1Gumc2c5UQw1KV4LBdpVQ/frB1axMEaZYFe6EMRkn9hHoWpkWrAmv+w
 DPdXIzEIMWrwM497ILp/uW5uOBZ6AdDpQ0pXYTuPQJGIGvKp02f4VAtU4EqhdbIWqaQj
 S335HrVjVkRKDa4OpqNf07DVsGAR4RvXXXwHUheBN7Xj465BU1uBs8ib1eJSGAGyPS/k
 mU/+XbZ0rCMv3Dt601Ipc0XXLYA1gPOXgHYJpw1/BTbZn1z1VDfRr6IpINK4wXAgSB9B
 sJLA==
X-Gm-Message-State: AOAM532bt5X0ISpLu+TUAO9BCdQDk2LhVraCy3PMnMpC/kvz3Fma0bv3
 5J4tOXWr8HhoTxntHQjvKEZpeA==
X-Google-Smtp-Source: ABdhPJwveseybWIKlXKdr9A4Q50pwrwKYYQ5QUXou3gRcn4LPwSjyFObv18mvCVEBquDfbDfbNj4Tw==
X-Received: by 2002:adf:ef11:: with SMTP id e17mr20182495wro.71.1626544026184; 
 Sat, 17 Jul 2021 10:47:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k7sm13186897wms.48.2021.07.17.10.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 10:47:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9BB6F1FF7E;
 Sat, 17 Jul 2021 18:47:04 +0100 (BST)
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-7-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 06/10] accel/tcg: Use CF_NO_GOTO_{TB,PTR} in
 cpu_exec_step_atomic
Date: Sat, 17 Jul 2021 18:47:00 +0100
In-reply-to: <20210712154004.1410832-7-richard.henderson@linaro.org>
Message-ID: <877dho3k9z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Request that the one TB returns immediately, so that
> we release the exclusive lock as soon as possible.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


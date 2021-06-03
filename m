Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C905399DAE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:23:58 +0200 (CEST)
Received: from localhost ([::1]:44366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loja1-0005Ex-CN
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lojYj-0003o7-Ix
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:22:37 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lojYh-0005EH-PT
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:22:37 -0400
Received: by mail-wr1-x430.google.com with SMTP id i94so58460wri.4
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 02:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=yquc+AXc/4pcuWkYQ5BXhCzU1DL+6QxBJ8j4s/pPSL0=;
 b=ZFGt60l61/M9MV/yx3w1Js1QU4gBRxUREoeiBtvpcgFGuXGgOqGOm2yRpgcnGOHiaG
 6G6+ju6aX3Ilx5gTk6XiS8RZN7qbE0ilpjLeakB6a2YpbibfrWpyQHy/h1SRfEvfIv6Y
 DGKCvqF1+nr36LYywEWXikt1HaHm2vuVxzTPP8hlieAhxBX6qKjGo/EuUABBbBtiRwTB
 IZwuItXAN/ubMaoaS626NvRsmbdzqKOOD7L7w32DMr9nyQ2oOZD59M7mKkKgsWE4LXPI
 k8xa+k74K1idQZgPc1/HccOReWr0AX+Q7sBtrW5Rz0baf63xZ/LgrIsD+LqhD9rNT1OU
 HaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=yquc+AXc/4pcuWkYQ5BXhCzU1DL+6QxBJ8j4s/pPSL0=;
 b=tdNaQH7k9lu8gEgzxfIFx/gitGSzLs/IrqONc2DawL4XqKZtej3A2lYrxxxWSDCf/4
 UOpDJlt5sgMZuTROelYM16PSnINAKTJJeRtpgtOp2+bdrEOO2Q7EetFJNHxh1+H8mLIS
 MmxzXyQze1LMmf8kVX5JVu1TH7u0nVMEnAnZOQgUFQhob0pvW0RhW/WHuM4re/5ThiOq
 NhIF8w4ZFa8Zf0pdChP4zV8XonQfaGCY93X998+/7rBVBJ2g4Kb78RonJ1fhAlctu16W
 W/sflEmt/VoeY84UWmHH6Le9lxI+MoiXKzYgBsFZPrMZ/nTScrOsB972k1PyJ0u2hOJU
 J/XQ==
X-Gm-Message-State: AOAM531D5IvX0RCwbmKQXLnyQO5wK2NpGBkHB50lPA+9wCpQLiRydtAt
 0sDsPGFCQXMnzt6JsQurZuKj8A==
X-Google-Smtp-Source: ABdhPJy63RiZjmDxMYf4fK1cJf9XovOxc8FnR3hhMSjnq8P/bZVhA1t8yXzVIs3JZERinV5Qoxnlnw==
X-Received: by 2002:a5d:6284:: with SMTP id k4mr23658175wru.312.1622712154353; 
 Thu, 03 Jun 2021 02:22:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 92sm2857555wrp.88.2021.06.03.02.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 02:22:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 29B121FF7E;
 Thu,  3 Jun 2021 10:22:32 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-9-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 08/28] softfloat: Split out parts_uncanon_normal
Date: Thu, 03 Jun 2021 10:22:27 +0100
In-reply-to: <20210525150706.294968-9-richard.henderson@linaro.org>
Message-ID: <87lf7r9uav.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We will need to treat the non-normal cases of floatx80 specially,
> so split out the normal case that we can reuse.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


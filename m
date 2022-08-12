Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F53590F62
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 12:23:21 +0200 (CEST)
Received: from localhost ([::1]:46154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMRp2-00021N-OH
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 06:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMRnT-0000Vt-D6
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 06:21:43 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:36527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMRnR-0005OZ-Q9
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 06:21:43 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-31e7ca45091so5758107b3.3
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=9ajT5T91DJU6yQAET/XmN0QwtvVk+eRLbBY0xk2u+ns=;
 b=jcnVIDAkbGi3eAOzPaAC8nbQ/pH7N3Q1VWv7VtL+hi6kX8vlq+ZWUnLspbqZ6D49/5
 i2xOKp7Hbpbl4a4StOKgjEWh/63IfQi9Sz5OzzufM0GQ3gkD5uzpjhrzX6xM4y031n1y
 bmuoVp00CdFnL1S+XH6tfoI1E75tTnVJsvvpGCeJxIyd/ZjEnnC3XO1wINcjJfKXtjw0
 5No2lL2xVsJOeKqUhNpwT/IAmyVQSdP9bMUK3NbnAYkPwD+4E5+McuV9nBPlP5gxe8Ap
 zFpeG/RH4i6DvwZ5uSEQbZBabcGd1EbJ9mFentYKBy9BwZRS52ANFVHn467CH1bY76Lh
 TOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=9ajT5T91DJU6yQAET/XmN0QwtvVk+eRLbBY0xk2u+ns=;
 b=Ed0wuSJ0zHjGhyTBSslDWl0JUNYIiRBDRKXuqiI1EqFFQultH1bSn5ClYKS6Km1t+J
 7Wh7wxfLNaI35q2PzPx1ZALOp3XG9reLG/Ovc7zTXrZaTvYfQwReOlzkOm4b9IoNMwt+
 IIL4GY/PLBEmzQ708Sc6y3iQTus02XNpBv6knUTfMvtoCXdFlDPJmhFIK5YSMPLl602c
 Fjn7D2x+o6MVGkmryCXtSMGBJ459MphaYTbtkm1GKjMyGPvgVJGTWZVmiEtFWdtGQ0CE
 GIuNXkY++0ixQj8X8PKadki/hlafoZUWxI1Rn8vr7u+1G8Oy5EFL4A2IHQayuGd98+eH
 bMFg==
X-Gm-Message-State: ACgBeo2zkuS46uCIn1HICJYdhYYcOxfGhq0UO/VqJ0U5lh+UrafPTDee
 7Ik8UblPWxMan2ROPwuJw6K2RbcN24i/a4R2yERvwA==
X-Google-Smtp-Source: AA6agR4FF6vdMED5rFWqHgpyhJfzg07gdV231qt5rOMWvfZT3yLPBacKYwit3dj7FxjNR4aWijxqGqKp773Dd5BzKKs=
X-Received: by 2002:a81:13c5:0:b0:32a:8e40:d469 with SMTP id
 188-20020a8113c5000000b0032a8e40d469mr3346142ywt.64.1660299700467; Fri, 12
 Aug 2022 03:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220812075642.1200578-1-sw@weilnetz.de>
In-Reply-To: <20220812075642.1200578-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 11:21:29 +0100
Message-ID: <CAFEAcA_bsKODn=fh1wipOouqPy3A6On-9aO-vyj4BxSbm3d+NQ@mail.gmail.com>
Subject: Re: [PATCH for-7.1?] Fix some typos in documentation (most of them
 found by codespell)
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, Hongren Zheng <i@zenithal.me>,
 libvir-list@redhat.com, 
 "Canokeys . org" <contact@canokeys.org>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Fri, 12 Aug 2022 at 08:59, Stefan Weil via <qemu-devel@nongnu.org> wrote:
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  docs/about/deprecated.rst       |  2 +-
>  docs/specs/acpi_erst.rst        |  4 ++--
>  docs/system/devices/canokey.rst |  8 ++++----
>  docs/system/devices/cxl.rst     | 12 ++++++------
>  4 files changed, 13 insertions(+), 13 deletions(-)
>

Docs patches are safe for rc3. I have to do a target-arm
pullreq anyway for rc3, so I'll take this via that, unless
anybody objects.

thanks
-- PMM


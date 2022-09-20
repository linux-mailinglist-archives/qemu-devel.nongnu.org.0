Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A075BEAF4
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 18:16:06 +0200 (CEST)
Received: from localhost ([::1]:37080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oafun-0001W1-0f
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 12:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oacxW-0004qu-9W
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 09:06:42 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:34583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oacxU-0000AG-Os
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 09:06:42 -0400
Received: by mail-ed1-x535.google.com with SMTP id z2so3770016edi.1
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 06:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=xLhurAWq5p7Y2LI72r7TFyiP1tvKRCdDx7nEVnCYaZ4=;
 b=NP4XY9MjV2SlxhhpGU95yY777j5lDpVQS8loN/1YNHs0Uqr9Xbgv5v+1w8Y0wgjAuR
 f0rtaIoageBiOx7L2pFTOZECcNhreN8jp4KutTz3JdOnCCni9QmqWx+MnxrUYkun9OqN
 CSSjN3Rv6rbh56gN+g9ajKtcxWqb0o45q5SFjHhbXisgTZIGo+eRPX8U8MLnfrrYg7li
 Y59yvvo2lqj5Pd21hWAs2qFL0cGbZsnoFmdDKGtlLlM1MCMn7PabbtbYvJhblCpz+VlD
 dOLkvwWEaDecMoDBNHEYWpCcLZfBZ0dnmaQekemPX3LczzItSarm/MRbizLwgloaxBW9
 FMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xLhurAWq5p7Y2LI72r7TFyiP1tvKRCdDx7nEVnCYaZ4=;
 b=IHPR7NpQDNPvvX23KKMgiJp4AfLsC1QZZwSEJEJHZL/EP9fk/tqJHc68gBd651FkNy
 YXtMzvq8RYohX/8oY+ImzZodUTdLd5QzQ3Qx4YZzuueokkm9f1On2OPZiRBwGLlTeEUh
 mm79z7IICX9K+CDEEwfXW0i/yrw9k7CFqV10WVBwUEvYnEQXoDA+wssHe2XrEfeTI40H
 O+yyKAfcklQP90kbv2SmrGU4e3Zw8SMHFaI6u1F5MNPj6CbuTGBayfyW7meotA/ERuhq
 mn44ojkPgDdEHadFzJNGOdILIf/E95xQbTX6XmfIHKxlnHeikgV2b6/xUMfYA7xveZNE
 +upg==
X-Gm-Message-State: ACrzQf0Zh1N5Qztv6XEkqGYtNgEeg6Xd8fQZorYMxw7aiKA2qLWQQ3Sd
 d4vEyPYPKV0L24ZI9p9BetSAkXAwsTzV8H+3M4Qw/Q==
X-Google-Smtp-Source: AMsMyM4Ydn9ci2vn6nWDU51/DAlgfIfvh2i+OEDWNx/kqN+vOsF/6Uqbv2guEes8+IWCR9tAx5o1XwPSTP0lIgazGfs=
X-Received: by 2002:a05:6402:35c5:b0:450:4b7d:9c49 with SMTP id
 z5-20020a05640235c500b004504b7d9c49mr20348636edc.149.1663679197964; Tue, 20
 Sep 2022 06:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220914115217.117532-1-richard.henderson@linaro.org>
 <YyYqejml9wzwnZQx@fedora>
In-Reply-To: <YyYqejml9wzwnZQx@fedora>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 14:06:26 +0100
Message-ID: <CAFEAcA-WyOy-BoijQqTiezx-e5NRFndQ3uLEzTE9MF1cC8AKBg@mail.gmail.com>
Subject: Re: [PULL 00/20] target-arm.next patch queue
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Sept 2022 at 21:22, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Applied, thanks.
>
> Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

I've updated the changelog for this one too.

thanks
-- PMM


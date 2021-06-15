Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F4E3A8283
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 16:18:43 +0200 (CEST)
Received: from localhost ([::1]:35346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9tq-00078c-Js
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 10:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt9ie-0003s7-77
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:07:08 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:40920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt9ib-0002Ij-4L
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:07:07 -0400
Received: by mail-ej1-x62f.google.com with SMTP id my49so22818879ejc.7
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 07:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iGKwXYDOrUJZbFIaPks0Bbjn9N1nJOlm+daK1f6jgg0=;
 b=IWTGt6nXjnIpIEb1vHhfU7E81ogi9Hg18xTIwKUiQllYHSL8cnTOum4ldfz7KgJ9KO
 iPn4QMSSiK1e8S1EjIzWv5D9ezXCHzaJpMQZeP09JPGka3fE9aH2q7ov6UX8zd7RIdgB
 V6IrBSsJFiCiYQSnGcLg7R4QQBrBJ9cmDQOcYMFj3rvkqtpN5PA2O5h6ARGv9fn9yog7
 RV2vUJReAJOgIVlzhKoPQx/dXjmUOwtJltEv2Fi7LImnC6byOxPyFumi4v/J0paBXHzC
 mm60W2dauIYckLQcjOxzmUSVlIzDB9lbq2k2DXUKcJTF/L2tF761HBqsohaoUQNlC3CP
 reow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iGKwXYDOrUJZbFIaPks0Bbjn9N1nJOlm+daK1f6jgg0=;
 b=BcI2OY6jDjmq/IpGzCVl1DXtkq9PdAbbDW33wlKiE9WaGsd0CV4DdWKLTt5XMUqPgD
 Y0op467veoqU8inSx6UrZtYWg5y5ZeIIm1/Cjzj/cHa8/JTIidZpQFYYMei6qietT+42
 yyxgQOubXq5euqtZVbnR8XEXRtbkvtTHv5Q1dKXn2p325+bI9IjLzi5W8k4/GVv2aBdk
 B+sjViJtASrivoVFx5O7G88+u4HrOQYx89DLNw5mt53lVE2gWkOAlwdbc9XBH7hYyieO
 dx6b6Ge+irChvaoF6SKZDdIbQ49HVL3L9gQqP1uUOhcAPExe9imLi+yNHxDKJWZiqZ9r
 hDpw==
X-Gm-Message-State: AOAM530QuQZ0uZNiFdJkZmhVn2gjrywzcu/NH63kDSE5VoU4EhTXYM9a
 X7TQt4cydsqZB0Juc/yoOYa8j3qh6faUcPlu5Tp03A==
X-Google-Smtp-Source: ABdhPJy5Eh7o/uweIJGwNG0Vk3fMiDFotoZ/HL+/ig+RN8Cny1BgiKvuJp3nonDaSWaJxLx1hUXOMaeNi4e9muUSx9M=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr20773832ejy.407.1623766023326; 
 Tue, 15 Jun 2021 07:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210608202522.2677850-1-venture@google.com>
In-Reply-To: <20210608202522.2677850-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 15:06:28 +0100
Message-ID: <CAFEAcA_P6vtoqttG1bdegmh560xNkzjcBQrdBK77BNv9di+H=A@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] With the pca954x i2c mux available, enable it on
 aspeed and nuvoton BMC boards.
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Jun 2021 at 21:25, Patrick Venture <venture@google.com> wrote:
>
> v2:
> - Dropped sonorapass patch.
>
> Patrick Venture (3):
>   hw/arm: gsj add i2c comments
>   hw/arm: gsj add pca9548
>   hw/arm: quanta-q71l add pca954x muxes



Applied to target-arm.next, thanks.

-- PMM


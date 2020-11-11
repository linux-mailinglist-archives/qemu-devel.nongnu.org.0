Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B672AF983
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 21:08:19 +0100 (CET)
Received: from localhost ([::1]:49846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcwPi-00008H-Oe
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 15:08:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcwMW-0005eR-LE
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 15:05:00 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:44712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcwMU-0000YM-9c
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 15:05:00 -0500
Received: by mail-ed1-x541.google.com with SMTP id l5so3599613edq.11
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 12:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j6zW7sYbClA161CzruKopE/Ybv3TG45xOqCSbEpl0dk=;
 b=dkhj58/U8nBd+93+QaJgB9itKnEyX58kWh1LzVkC765VuErNM7GCo6lPotb1xEHczB
 pqtJO+JXJLFdaAbVPxQ+isRMIvxpdpn6TT2CfcFquVSnB5CV+h7pXiMiRtmnmrkI4CDP
 89bWXFWk+EXaCpLDTnIlpJFQYAHGlhaokrAH0xZNQdYyvFyPiIAZrblU4i38JXLrLyVE
 IgzuiAVVA5Uc6jTJRvzRZfEqu/nHrAGHrcv972hOsoKLPBIO11fibwvD+E14tP5yFzQt
 JAHHNlenCGQXZ/OPeIBMgdzG7H0y1TSRRKVzXfMJ7FAe82ewFoZmir8aLeESBs7Xzy8M
 +uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j6zW7sYbClA161CzruKopE/Ybv3TG45xOqCSbEpl0dk=;
 b=qtO3l2adXfj6+eQLQHURWrXOTHA9CnK39sqdGXo51fy6QFbME6FkTTqDpU+7tKxUL9
 bBLRsoyXyVDczPRVRVniII+Jrg3xeJ4VScOciS3zgFhsn2Nvw0nLGT8/7DNF1RjjUVEc
 R8g50JLjTAGXaPJtiXm687z8gKLWcyDOCGAkNAnU+9JKJsZ3k/CPuEh1jicxChoV1wmI
 KzW68cbV6khkawsoe2yCYUjj/jsmobtU8lSb1wxnCbIngCgQhuxkjGN7IvTivq7UCh6o
 gbOY64RA05BQVSaICprqaDpeReEGRWA1OBKxKoywRd61ARRF2mGkphztsZ+8z36VyKDS
 a+vA==
X-Gm-Message-State: AOAM533732ZyVsA6eloc9N+BcxfJ1rOs51sOjqpkiPbs/FMFNCoMFTnR
 TfJQtJ0wEWzv4ErI3j2jYLDuIeq/H4gc0EF1A9Y+lA==
X-Google-Smtp-Source: ABdhPJyLiY32xzfCU81UY7KnIdSSvmqNHM/w+fr6XGx4bsfAzcQ2HxPiUOvL0k/qjjMy6C1X4c2wiZqncuyCFttAzvo=
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr1344919edt.204.1605125096843; 
 Wed, 11 Nov 2020 12:04:56 -0800 (PST)
MIME-Version: 1.0
References: <20201111183823.283752-1-ehabkost@redhat.com>
 <20201111183823.283752-8-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-8-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Nov 2020 20:04:45 +0000
Message-ID: <CAFEAcA9qhpzW6i8OadfB2mR5T09Ok2npgLS38s_DxAuv437rYA@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] arm/cpu64: Register "aarch64" as class property
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: John Snow <jsnow@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Nov 2020 at 18:38, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Class properties make QOM introspection simpler and easier, as
> they don't require an object to be instantiated.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  target/arm/cpu64.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


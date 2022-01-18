Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8817D492CDE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 18:59:30 +0100 (CET)
Received: from localhost ([::1]:53960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9slV-0001Fh-MW
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 12:59:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9sTF-0007wx-6Y
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:40:38 -0500
Received: from [2a00:1450:4864:20::330] (port=46038
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9sTB-0000K6-CE
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:40:36 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso6799439wms.4
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 09:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YTrJupFFKvCxzIpXAXjawoB5zSFPKeiycCVIU5OLx7U=;
 b=g1BIBNwtEmKzftBk2a0Koy+sGlsawGKVt5zjZAoAHWBnAoQCmel7WuL4Pw27fS/14j
 baop4tFhL4HWK5yWvWYt/4iOzXx2BOQU4fh4J3APEyjthYznJ68sX4mTRB4XlmwfgLKu
 Nq59B9hppq+x7/C+556ScmWfo4aT1Xe9L7IdwRmNzqEpGbMccEpM5ZWu7A5WFoecowak
 LFAwNBTbDngW/ADqKaqQ2ZX/QO0LJRiLn+Z9S6b0PZh2rGheZax5edtwBWybXXyQJKNa
 /fE0YKP6rGPNshSg8TkP0BKso6dRF9SYxfVBAsWbwD3RtvZjnPcIqc3inI55B7hpdnFx
 /ZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YTrJupFFKvCxzIpXAXjawoB5zSFPKeiycCVIU5OLx7U=;
 b=KorGzcbej8yjvghyxhLytOBsdaMGv9tsNmtw9defG1IEuokBdtcnvyPW6CgS80OfHe
 ktZXYC3p6BpQQIhndKZHHKTYR/aYi1xE+c77qCDoImw7IJliHhmSoLfR370/HzvgyHgw
 S2NmjKUPND8aQGGHTOBSItt4zJA5Vnq6PL8/m1kSjdCnFiuvcluRcN2KQDX+AT0QmoSI
 BEU7wpC4R4Yz45W2BseBhvQ956zJjTrygbNsQ9GRHSTwO3XqdBQiIq64hDSVB+1wPRNG
 ISij7D0ywjj+/aOEXIhJ9DWtnAI0/PxTGDwno+6AZ4ncdlJPuql1Jr8oLnGhMWztqOos
 H/nQ==
X-Gm-Message-State: AOAM531oktYr9q4/2lq7WwVwYyx3EBUgzZDGKZxkWZkyx6feHrIlusO8
 GGleNGmehAkfxoKgcQHdD5zzzvHJg69h0vgj3UNWIA==
X-Google-Smtp-Source: ABdhPJznDZSmZs+at5xHylQlciAQbzswDVwb2s+hm6ySxAnelttGcC+Uv7iUAQe86+jySuZ4wovsnU2nfp06HCUmgcQ=
X-Received: by 2002:a05:600c:3544:: with SMTP id
 i4mr6058532wmq.21.1642527631182; 
 Tue, 18 Jan 2022 09:40:31 -0800 (PST)
MIME-Version: 1.0
References: <20220111084546.4145785-1-troy_lee@aspeedtech.com>
In-Reply-To: <20220111084546.4145785-1-troy_lee@aspeedtech.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jan 2022 17:40:20 +0000
Message-ID: <CAFEAcA_kP3TWdoC1S-7JJyqtL=s2hQFw6nzFf3PABOnQYcgnuw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Aspeed I3C device model
To: Troy Lee <troy_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: leetroy@gmail.com, qemu-devel@nongnu.org, hailin.wu@aspeedtech.com,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 Jan 2022 at 08:48, Troy Lee <troy_lee@aspeedtech.com> wrote:
>
> This series of patch introduce a dummy implemenation of aspeed i3c
> model, and it provide just enough information for guest machine.
> However, the driver probing is still failed, but it will not cause
> kernel panic.
>
> v3:
> - Remove unused AspeedI3CClass
> - Refine memory region
> - Refine register reset
> - Remove unrelated changes to SPI2 address
> - Remove i3c controller irq line
>
> v2:
> - Split i3c model into i3c and i3c_device
> - Create 6x i3c devices
> - Using register fields macro
> - Rebase to mainline QEMU
>
> Troy Lee (2):
>   Introduce a dummy AST2600 I3C model.
>   This patch includes i3c instance in ast2600 soc.

Applied to target-arm.next, thanks. I have tidied up the commit messages
a bit (removing the v2/v3 changes information, for instance).

I would echo C=C3=A9dric's suggestion that you send a patch that
updates the documentation to note that this device is
now partially implemented.

-- PMM


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3EC5746CC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 10:33:59 +0200 (CEST)
Received: from localhost ([::1]:37886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBuIH-0005eu-KE
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 04:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oBuFJ-00041o-GM
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 04:30:53 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:42614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oBuFH-0007Yy-Pi
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 04:30:53 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id c131so1278379ybf.9
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 01:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KLlpnijxBD1rbIS3n8ST4TSVNLCOxMNxG61SrycO168=;
 b=gImXRLqgww3GJUqA2U1oKRUk6pHAUU31xQFZJzGgEapPTbAdyZ5p67nU142cAlaDi0
 TO6fyZBAduqkXokuH+wf+JuFzfjqET7FFvyZpF7Yw+7ONDualMiSpWBgR1OSWxDkmN6f
 afAti6aRWEXq3AAKHpQc9J235BsuFpINkZVp//MRklsskbmnwOCdpD1RMRiOBvKMa/fs
 CPKc2/wqz/c75dJ4mUPXFSfkEUy2+UEb+QBUFC7XPELtHGOVppUgRtmqG9/IMp9WfwRy
 3JTeqHdulho4/+8TNhCgOsRpXnawHr6gx22ESHvWXfIVHiDf5+yk+C0R8UPgUANthfu1
 HFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KLlpnijxBD1rbIS3n8ST4TSVNLCOxMNxG61SrycO168=;
 b=kYzSTZboaZiWbIiQpsSJf6of1ESNZOKwD4hpFk64pGBcnhZ1s/4pliFaFl3xe9AfHX
 +LjGuAQvqN1b1m9DthYwRF7SQjBtZ9xsQXsMcff5vsZIZCdODV//yUiroNMCrljn+aZs
 snelhkvVzRvSHtcfamooalS8NRE7XWKo+itdfNo5B0wLTavw+oHRRwec+RC0i2DMPqG/
 dkTnmOnYPk0FRy8P0aYnW5ERNQm+/9vToaT9oUK4nt3LdslQl2NrvYYW4v4npzQ8kqt3
 8ZABVxafb4ms5BE9s+web3lDOEUPxWBbS1rKgGS3Du190TBGW0sWSDwS2bjhj8bd4EhI
 NXPg==
X-Gm-Message-State: AJIora8fV+SXa5p1d4nlBumNX89xn2bphXyvW2P64tNexYOXSJ6h1Y7c
 wFHfjFMzJFt/N14JT1jYAXAJkRtDzUMjHvj2SO+Lhg==
X-Google-Smtp-Source: AGRyM1uKmUp89oS38iiYOhueSriHIR61ekyUTcBNvAEIB5Rj7qpwexIvnCwqsrzvmgmIv8bRg6EEJYQcpKhxdljMRaw=
X-Received: by 2002:a25:d7d6:0:b0:66e:47b3:35be with SMTP id
 o205-20020a25d7d6000000b0066e47b335bemr7512896ybg.140.1657787450181; Thu, 14
 Jul 2022 01:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220712205347.58372-1-f4bug@amsat.org>
In-Reply-To: <20220712205347.58372-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 09:30:11 +0100
Message-ID: <CAFEAcA9Pu4iKPBx3XhW7W5NCS1faLaQ2aRvaUsqOD_atFd78_w@mail.gmail.com>
Subject: Re: [PULL 00/12] MIPS patches for 2022-07-12
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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

On Tue, 12 Jul 2022 at 21:56, Philippe Mathieu-Daud=C3=A9 via
<qemu-devel@nongnu.org> wrote:
>
> The following changes since commit 8e3d85d36b77f11ad7bded3a2d48c1f0cc334f=
82:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into stagin=
g (2022-07-12 14:12:15 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/mips-20220712
>
> for you to fetch changes up to b10ccec10096a27bb3b99a7291d5a3d5c826a1f3:
>
>   target/mips: Remove GET_TARGET_STRING and FREE_TARGET_STRING (2022-07-1=
2 22:32:22 +0200)
>
> ----------------------------------------------------------------
> MIPS patches queue
>
> - Cavium Octeon MIPS extension and CPU model (Pavel Dovgalyuk)
> - Semihosting cleanup (Richard Henderson)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM


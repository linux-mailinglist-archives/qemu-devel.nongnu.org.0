Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE996B2506
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 14:14:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paG5d-0008Uv-A2; Thu, 09 Mar 2023 08:13:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paG5b-0008UU-Ka
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:13:47 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paG5Z-0000BB-Uf
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:13:47 -0500
Received: by mail-pg1-x52d.google.com with SMTP id 16so981913pge.11
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 05:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678367624;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JD25W6kloLoRRXrrjc9f5l4455YESWrPzNRK6uwxRpw=;
 b=DvZRlWmL4WQDi8PdSmWift61Yl2GVvVCJTFJOUR40eryOJ5hi+lNFTyI/X5H4VBPz0
 pcyaMejQ0uusWID+zeFqdvjoDMjciEauo8VqplT68AR11Ne/x56QCCKysjhVn+PdCnwX
 pgf/Jp2zJ/ZhK5Nw6mvdaGrG377xWI/BJvtn7lyPHgYLK8V8mg9LsD0yNriVzK93Y7w8
 uHy+TFmi3Qwiif5VBD7nzGBurOM+CuyRWAZ0LZKptLhYBI7kXByrfBSS9Htn7KZ4JHEb
 CMlZEioZVfS38zspCwncoZLeAfAL85koPzOTwF1DXB+X9JfYIOAmgJhVtTD7+2VCHI15
 0Mwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678367624;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JD25W6kloLoRRXrrjc9f5l4455YESWrPzNRK6uwxRpw=;
 b=c0cIqRsIVXkPY+dvcDhGnPjThu5wxy5F1NurYqWjBC79510M9wY87CmXByf4DDRWIr
 /sQpSsCu/GbIRl2cgnib8BPl+E7zo4biav0HYTp5BirSM0gd+rTdiiY3ds66Hvl4uGKo
 SiQWKHfrKB6dxWmtsS0ldC5u85NWTy1Bw6uVE4FTWwrIvurZvwsLjTQk6NdRoFfMr8BK
 cI4kuZLh4tzaIT7pSvpAXbIEd0N2CdSo0x5aTBDMeU8S5uRVOgO4FE5kjnXDL6cPWKfL
 LngLuZ2J1xDdkW3XXUnFDjf6oZIjtYcsPvlsYuS2IR6OuX5TT9SdYJd/42mqubXgSKfO
 Mk1w==
X-Gm-Message-State: AO0yUKV+kieYb/vb0ThkQt6zi0ydAJ9cngegLGw7Gr0thUppu5WCC1bw
 Rx4C/NFEF/MTBo1t2WkrZ5Yr8mhfRhECEWX9ZWh+pg==
X-Google-Smtp-Source: AK7set/tXn998pBiarSu78O/mDCC1bDzfyd8AMydqsB9ezQEc/sL0yU48swC7hpbloSRIgP0fD43+ifPDPOa2ORyYU8=
X-Received: by 2002:a63:f906:0:b0:503:7bb8:d17f with SMTP id
 h6-20020a63f906000000b005037bb8d17fmr7369122pgi.6.1678367624591; Thu, 09 Mar
 2023 05:13:44 -0800 (PST)
MIME-Version: 1.0
References: <20230307234711.55375-1-philmd@linaro.org>
In-Reply-To: <20230307234711.55375-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Mar 2023 13:13:33 +0000
Message-ID: <CAFEAcA-9XRvEO=F3ns8ZrOmLdpU7fv14saO7ut-HSkDxQDJHYA@mail.gmail.com>
Subject: Re: [PULL 00/20] MIPS patches for 2023-03-07
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 7 Mar 2023 at 23:48, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8=
bd:
>
>   Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-d=
abbelt/qemu into staging (2023-03-07 12:53:00 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/mips-misc-20230308
>
> for you to fetch changes up to cb9291e550c58825d6d7a6c9dc877705bd635376:
>
>   log: Remove unneeded new line (2023-03-08 00:37:48 +0100)
>
> ----------------------------------------------------------------
> MIPS (and few misc) patches
>
> - MIPS
>   - Remove obsolete "mips" board from target-mips.rst
>   - Fix JALS32/J32/SWM32 instructions for microMIPS
>   - Fix CP0.Config7.WII handling on pre-R6 cores
>
> - HW
>   - Revert "Remove intermediate IRQ forwarder" commits
>   - Implement legacy LTIM Edge/Level Bank Select in Intel 8259 INTC
>   - Improve PCI IRQ routing in VT82C686 / Pegasos II
>   - Basic implementation of VIA AC97 audio playback
>   - Implement 'resume on connection status change' in USB OHCI
>
> - UI
>   - Override windowDidResignKey
>
> - memory
>   - Dump HPA and access type in HMP 'info ramblock'
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM


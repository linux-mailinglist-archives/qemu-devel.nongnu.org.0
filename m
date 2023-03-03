Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CA86A9886
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 14:36:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY5Zb-0003aR-0A; Fri, 03 Mar 2023 08:35:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY5ZW-0003S7-C8
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 08:35:42 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY5ZT-0007rN-PX
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 08:35:41 -0500
Received: by mail-pl1-x630.google.com with SMTP id y11so2696089plg.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 05:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677850538;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Zwtwj6j8HKS8lkf2swUhHuKNjLy5UMWNi/uXv3KqhfI=;
 b=yLZiJxyWVQ47nY8caWnsVQGMP/Xi43mZx2F0c9ZUtGcewZVuhDSgyoEHDP4rBLOrDX
 OV9xf6PSCTAaitwO604EPo/mN6eXGEEjc8ucWL97CZ5G0Sx9dl9hTkjDfuoHP+ykg+UF
 lGlM8QXosz45ZQh7C2gahK/S4vvaaBgnzxnUFIgYZLX9glCQE5yGrJ4oV6YLgVQT3RVQ
 Wyxlx4m/QvU/IAypE0yxgFkC70D3jM9jXZvTAUhJhBxLCulTf489bgYS2Sm6qatAYM5U
 euQ89/DbwICydVXRw0OabnUU8ev61r/wqRft/Tdm7woufPove8/+YhubUNc7KpLeHqjP
 8AXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677850538;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zwtwj6j8HKS8lkf2swUhHuKNjLy5UMWNi/uXv3KqhfI=;
 b=jMvLB/6rO2/nCStdM83EO0SoxRheZTOuXnep0nBMwAcgqfoe85A1lxgkIzoiBNwu8c
 ZggEo8Pbo6v3uR/LbqOBNAkxcN0WI6YUaJA/kgWOqPjetTuCOCufKb0YUxQXn8YNhzKK
 7QZW2rDB720F5hB9iuHZGlLwtJ8A9KT250j0ItkSMFmdeEoZwaXJl1QpbAD0esD2N5tu
 OsNoUw6Cs7/8TagGp2I1HspYtcgNBrn5gZhEEH1aa5SjZSgsWvteJGzqJ7q6eRUqmRXD
 /fvya+rxMda/mzluZ6YwNFl+4zm+gXwxBoazaFw8/FHXWaUDFuiXIvhbSmbjJGscQn5y
 zzLQ==
X-Gm-Message-State: AO0yUKVObg5IwgECFjfwo1s6+R6eJHEe8WDYdh03PkmIb8FYWyfjabGf
 4vckUG4EcVRWOZgKx0NR0iW/tqu2GPJHozPVzvGkXg==
X-Google-Smtp-Source: AK7set9Fwa+UM8LHfJc/U0mpIh2avQD/PFbmvyHYmlf8QL101myt72JslRVNj2DZrACH8xH2vWNZxeivnEmRkfyL48c=
X-Received: by 2002:a17:902:efce:b0:19b:5233:51d8 with SMTP id
 ja14-20020a170902efce00b0019b523351d8mr740248plb.13.1677850538327; Fri, 03
 Mar 2023 05:35:38 -0800 (PST)
MIME-Version: 1.0
References: <20230303083740.12817-1-palmer@rivosinc.com>
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 13:35:27 +0000
Message-ID: <CAFEAcA9vXQg2bwo=bno1MNcb=biDWC+y2cJ3aEEycmm1-e1D5A@mail.gmail.com>
Subject: Re: [PULL 00/59] Fifth RISC-V PR for QEMU 8.0
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
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

On Fri, 3 Mar 2023 at 08:41, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> merged tag 'buildsys-qom-qdev-ui-20230227'
> The following changes since commit 627634031092e1514f363fd8659a579398de0f0e:
>
>   Merge tag 'buildsys-qom-qdev-ui-20230227' of https://github.com/philmd/qemu into staging (2023-02-28 15:09:18 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/palmer-dabbelt/qemu.git tags/pull-riscv-to-apply-20230303
>
> for you to fetch changes up to 37151032989ecf6e7ce8b65bc7bcb400d0318b2c:
>
>   Merge patch series "target/riscv: some vector_helper.c cleanups" (2023-03-01 18:09:48 -0800)
>
> ----------------------------------------------------------------
> Fifth RISC-V PR for QEMU 8.0
>
> * Experimantal support for writable misa.
> * Support for Svadu extension.
> * Support for the Zicond extension.
> * Fixes to gdbstub, CSR accesses, dependencies between the various
>   floating-point exceptions, and XTheadMemPair.
> * Many cleanups.
>
> ----------------------------------------------------------------
> There's a lot of cleanups here, a handful of which ended up stepping on
> each other and were necessary for various features.  I tried to keep
> each individual patch set intact, but that led to some merge conflicts
> and a bit of a clunky history -- I'm not sure what the right answer is
> there, happy to re-spin this to be more linear if that's problem for
> folks.
>
> Unfortunately the OpenSBI bump is still failing CI, it turns out I
> missed the second stage.  I was intending on having a sixth PR anyway as
> I'd really like to get the ACPI patches in for 8.0 so we can start
> testing everywhere else.  There's also a patch set from Daniel that's
> ready to go but depends on some recently merged TCG patches, so I
> figured it'd be better to just send what's ready now rather than trying
> to make the history more complicated.
>
> This all passes my local tests ("make check" and a bunch of Linux
> configs), but "push-ci-now" is still tripping up on OpenSBI as that's
> due to some network resources changing.  With any luck I'll have some
> time to sort things out this weekend (though always happy to have some
> help if anyone wants to throw in some time).
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM


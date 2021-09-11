Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C863F4076A2
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 15:03:33 +0200 (CEST)
Received: from localhost ([::1]:33376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP2fM-0005zN-Bz
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 09:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mP2cM-0004LE-T6
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 09:00:27 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mP2cK-0002EX-Tg
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 09:00:26 -0400
Received: by mail-wr1-x435.google.com with SMTP id n5so6744624wro.12
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 06:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8D67mGMzFNyLUENuPdZkqq3ebiaLGP+/oLYXUv8UVho=;
 b=dp+Zfx+nlFQYtz3vGlOO4RbLDQewg4aocbpJO5U7fiJWfhs2rtcjUnS1qIuJE2jd1Z
 HEv3JFWLF90QQBrSgd6mnKzLGKoZkRszS6uNK4kCJ8ykscZA7Z3bYKab7eBbg57wXewl
 alQA0HaEJnljsnhuThcqe8ceBnhpoXsjNtirTvyY1jKvexnKX6xEqK0SErNymiYM9nc+
 fLmMWb11WgYdLEZupOMkPJQfY9nAZOSDdq4iQcCyq6lZOgm8SxO1HlcqQWQpKY043yPE
 hK32JyG71EV0/iJ+M/KcejjIzvPIvhm9wGLYKDqvM2n7s5KhLG2tO3wjtkNT8EQUKB+f
 7Xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8D67mGMzFNyLUENuPdZkqq3ebiaLGP+/oLYXUv8UVho=;
 b=Y3sBKVACSQmVsxXPqq8NhrU9NhIBoemyBabuW4wPMDzttm2igd4arBdXfT30mpmBPj
 k3KVbR2zKD4zea+FRk9X0ALnsLowH/X6qN8eEOWiMJ6JAXti00MomHLL7rFyJhckG0Kb
 csHupr+LiL4lauYJ5ghfNCiTa+YEZbX5rgbL8fNUoxgBnjhY8vZsSPOBR2eqL3MiCTC4
 +rlgbYIBzLjDP8ZRHJl+NV+vvb6A2XXo6XeT8JaovsPGHXvqwjTJYsc69LmcFdP6tPNf
 yGhWtmScms6qnVm32WyJyb0y0hBvzHF/oiFzVXWzzJ0jt/z17sncL2U1KY8Q76LSNs54
 Q41Q==
X-Gm-Message-State: AOAM532kuec+UmUuQDOLR85BjHQirCPQ3Rqa4/Q39MklvOVbXw45Txdf
 uLAhGXmysz4IBE130JcbxTYeUWKpdJjjrvDfWgfvXA==
X-Google-Smtp-Source: ABdhPJwbJonIniAaMklg8Jd05e/adBJhTcEaQZqApP9Bi4Nia8BOXvANgCr5qYujtI8m9JQag3rJuTtQFtvGPziz0AM=
X-Received: by 2002:adf:f185:: with SMTP id h5mr3088436wro.302.1631365221737; 
 Sat, 11 Sep 2021 06:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210908100426.264356-1-pbonzini@redhat.com>
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 11 Sep 2021 13:59:31 +0100
Message-ID: <CAFEAcA_qgYHaheTsLDsHSicRJQ3Pv8Y_7mS8jhLy7NgPpPNyQw@mail.gmail.com>
Subject: Re: [PULL v4 00/43] (Mostly) x86 changes for 2021-09-06
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 8 Sept 2021 at 11:07, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit f9128631fbeb40a55f7bc145397981c963d409=
09:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-r=
equest' into staging (2021-09-07 13:24:43 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 3b942628231462c56c883a6273cf137d2a382f8f:
>
>   ebpf: only include in system emulators (2021-09-08 08:07:04 +0200)
>
> ----------------------------------------------------------------
> * SGX support (Sean, Yang)
> * vGIF and vVMLOAD/VMSAVE support (Lara)
> * Fix LA57 support in TCG (Daniel)
> * Avoid pointless warnings for static user-only compilation (Thomas)
> * Fix --disable-system compilation if libbpf is found
> * target-i386.rst restructuring
>
> ----------------------------------------------------------------

I gave this a retry and it now fails to compile (all hosts):

../../hw/i386/sgx-stub.c: In function =E2=80=98pc_machine_init_sgx_epc=E2=
=80=99:
../../hw/i386/sgx-stub.c:7:12: error: =E2=80=98sgx_epc=E2=80=99 undeclared =
(first use
in this function)
    7 |     memset(sgx_epc, 0, sizeof(SGXEPCState));
      |            ^~~~~~~
../../hw/i386/sgx-stub.c:7:12: note: each undeclared identifier is
reported only once for each function it appears in


-- PMM


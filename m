Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE09380232
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 04:55:56 +0200 (CEST)
Received: from localhost ([::1]:36170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhNzX-0007tA-IX
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 22:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhNxk-0006f7-7Q
 for qemu-devel@nongnu.org; Thu, 13 May 2021 22:54:04 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:46718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhNxi-0005ST-Hu
 for qemu-devel@nongnu.org; Thu, 13 May 2021 22:54:03 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id y2so37129813ybq.13
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 19:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3QBLHC/VesGR9m8DSudZGD4wUq/vdq1fN13uf0FLxyY=;
 b=mx1I91KiV57JhcBFpJWVU1LaThE08OMgjqIkPDMHqnei+BLtXnhAUoFmNBPiH7I55z
 PWN6Xr1K5ZeWYmPWJxca3qIkS5BI1WWaQvPOcBfSoF7a69vFzfFon7kvH4ZmuY08EvWY
 H5odJItJyJmJDM/mHpMan7U1WwztFR0DGFG9/2Wt6pH+FsgVGOKWaIzR+FjoCPfs//eH
 gaJVJtI47SEM3rDPkUpVdJSNeqRfO7KmDooRul9NKmCzxlusOMUeK7dmngcEc3cD2Th5
 OUJzYK7f01J3ntiZmZIGFF8ABk+npmRksY9TkJ65aRf423MY7J0NaufrnPu8GC6y5mlS
 8OOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3QBLHC/VesGR9m8DSudZGD4wUq/vdq1fN13uf0FLxyY=;
 b=jk/uRAZayaH2rvrx2DG8MwVyHAE5vydpz5r3E7eVeW6Ym19XUKWnRVXn/17Ck0aGhp
 lwEs0oSw1i/g12jSf2LmSqBjeRIRhm8SHkH73VeUKLGZ/srPtqprcJuJm176GA7RYFuo
 izlrNGAA7HVMOdl1iQOdjluMwrp9BAXTE3YfvXqJp9wpzlFv5eT6I5jLZ7sSw8NEO4zV
 prnAMCk1uRQBH3FUMd45K66+1mujLb/Vlw0AVOXdg3XeeMG6LQM/018uXIcqeEIG20Bs
 /Q8vbnyOTjSA1Zd7NTA9pFfpy3t8wM2lTykF3px9gRBJbdJL2gPRCArp2DUPgFH6Kwg6
 q0AQ==
X-Gm-Message-State: AOAM532WQZizn7moMBh3Y+RkfcWDBzuTTasx64Mdm9dNKbUxRXB5VX3+
 Yz6/Td+44tDQgpUwoWUrbiPFAo8LsizOYq/YWaE=
X-Google-Smtp-Source: ABdhPJzO0LfWseYl1Z9Tufepf3ooxqSV7XGApZ9b57pdvRlB2qWMNqRW6CH2Nj0BCPiNLfZ3eXb+f0gx7/DgxOWvlME=
X-Received: by 2002:a25:be09:: with SMTP id h9mr63700221ybk.239.1620960841471; 
 Thu, 13 May 2021 19:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210513163858.3928976-1-philmd@redhat.com>
 <20210513163858.3928976-10-philmd@redhat.com>
In-Reply-To: <20210513163858.3928976-10-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 14 May 2021 10:53:50 +0800
Message-ID: <CAEUhbmW-Aw63TPG6_MQC9X8xjjvK-F=oHWOZWv30yMtj8yaotw@mail.gmail.com>
Subject: Re: [PATCH 09/10] default-configs/devices: Remove implicy SEMIHOSTING
 config
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 12:58 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Cmmit 56b5170c87e ("semihosting: Move ARM semihosting code to
> shared directories"), added the ARM_COMPATIBLE_SEMIHOSTING symbol
> which selects SEMIHOSTING.
>
> Since the ARM/RISC-V targets select ARM_COMPATIBLE_SEMIHOSTING,
> they don't need to select SEMIHOSTING manually. Simplify.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  default-configs/devices/arm-softmmu.mak     | 1 -
>  default-configs/devices/riscv32-softmmu.mak | 1 -
>  default-configs/devices/riscv64-softmmu.mak | 1 -
>  3 files changed, 3 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>


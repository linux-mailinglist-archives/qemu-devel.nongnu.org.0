Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E293986BE
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 12:43:44 +0200 (CEST)
Received: from localhost ([::1]:41422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loOLf-000088-Gl
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 06:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loOKN-00077f-Qy
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:42:25 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loOKM-00019C-0Q
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:42:23 -0400
Received: by mail-ej1-x62b.google.com with SMTP id e18so3137953eje.5
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 03:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F9xeZyDlaNbQBKoNYq1yfPg0RJQSH9uwKWlNh/cOuQI=;
 b=M2gjBVXh5lasraqq0BsQ4G78bKe20f0c6pEvmjbWXVZhAMSDp3nOpAu2vpp34G6FTy
 i3riAAQVK8PvokfQ1j12x/zl/wGdr9dh32ZaLZj6Uhz8YtGLX1GJ8/Z1AFbNHOeCsQnv
 /WGqH2TTERIiMTv5dV8sV7GBxRoA1nc+brC7R+IvBWD8ptR9ESAk3OT1VOrzaFalC8qS
 cXcyeupLunrVtK07MJRGSWg9FpQuy/TLp/56pDyEciWa5zJIATmMUcWw6bgmAJD7Qezq
 Ah76nnmqjz59S40+wd5a+A+2lBW+N6d8juEziS9U/HxJsEQ1KD2llPS0e8Omp5Z51Veo
 Nz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F9xeZyDlaNbQBKoNYq1yfPg0RJQSH9uwKWlNh/cOuQI=;
 b=pIGhWxBHVGzMO8vzGtQfOIaLQ09YdDn0m/or0ywNpvCfFcnZb+OEoSJuO1QHy1CAEI
 q5I5VnxbE408qIfOrWPIkiB2ULORN5pSFy6T0P2VcdxJeJfUNqRL4lgcpQhk2MiF5cGT
 sIvi5DcY26aMwzlxfkAvutZAzV4Z/96Iye/uFylKxwGmd5QFcEaZPNEvEmQSlO7cX111
 vt/oky+AcvoacAegzS1BiD9AwJ2ljAnqGQTrH3ChW7fHLsHKcAffr2K5wl0uhYjl6CiR
 IFcaEOEfehSt2AuqHYPIoykFBOgdAeUXHXdNcs5TTEhQtq4cZklPXs2NIw2UoI+9TNyF
 6GSA==
X-Gm-Message-State: AOAM532OwZdLAfAY6CYIjlQY1zHTlAseaSQV6J+kp/+gv9b0cN09u59V
 ZBnEhRTCtj1eJrcCuepV2hFfRW1JAfkiwHa5k+ekSA==
X-Google-Smtp-Source: ABdhPJwqqsBAlCkJW9AoP+aM+QD2bdgo5h8ZY5KNukCwPJVOMbjjBWe9dVlIGeRMaMH8zVOqjwle6NEwHizVPHempGU=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr33770157ejb.56.1622630539324; 
 Wed, 02 Jun 2021 03:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210601181014.2568861-1-ehabkost@redhat.com>
In-Reply-To: <20210601181014.2568861-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Jun 2021 11:41:47 +0100
Message-ID: <CAFEAcA-vCgYtEuZqZvFS7zazL5JVpiWYJ5kqORw3B9E-Ap1D8Q@mail.gmail.com>
Subject: Re: [PULL 00/24] x86 queue, 2021-06-01
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Jun 2021 at 19:10, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> The following changes since commit 52848929b70dcf92a68aedcfd90207be81ba32=
74:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210528-pull-req=
uest' into staging (2021-05-30 20:10:30 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/ehabkost/qemu.git tags/x86-next-pull-request
>
> for you to fetch changes up to d47b85502b92fe8015d38904cde54eb4d3364326:
>
>   sev: add missing firmware error conditions (2021-06-01 09:32:48 -0400)
>
> ----------------------------------------------------------------
> x86 queue, 2021-06-01
>
> Features:
> * Add CPU model versions supporting 'xsaves' (Vitaly Kuznetsov)
> * Support AVX512 ZMM regs dump (Robert Hoo)
>
> Bug fixes:
> * Use better matching family/model/stepping for generic CPUs
>   (Daniel P. Berrang=C3=A9)
>
> Cleanups:
> * Hyper-V feature initialization cleanup (Vitaly Kuznetsov)
> * SEV firmware error list touchups (Connor Kuehl)
> * Constify CPUCaches and X86CPUDefinition (Philippe Mathieu-Daud=C3=A9)
> * Document when features can be added to kvm_default_props
>   (Eduardo Habkost)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

